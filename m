Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547D7CB868
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 04:30:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCwjD314;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCwjD314;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8dHK1HZnz3vYT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 13:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCwjD314;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iCwjD314;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8dFf1lk4z3c47
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 13:28:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697509715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwvv8Ug5LWet0NjqBwU0T2Z/P57OXSB0kNMnVbkLTNM=;
	b=iCwjD314I8MUWoN+82IlRu+3Nrapcrz/V55p1EUrZ11RGU/0IJlGUU9gSA3GJFX9k2wNGd
	nV0gPlXlf94i65p3/s0kYJFWJGq8pzmD+lZYI1l40jdCessZd70qdpDRBz+6yw0BB36AQA
	6//rtsdf5xdmYZKBiHoCYrJ3uDqgTUQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697509715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bwvv8Ug5LWet0NjqBwU0T2Z/P57OXSB0kNMnVbkLTNM=;
	b=iCwjD314I8MUWoN+82IlRu+3Nrapcrz/V55p1EUrZ11RGU/0IJlGUU9gSA3GJFX9k2wNGd
	nV0gPlXlf94i65p3/s0kYJFWJGq8pzmD+lZYI1l40jdCessZd70qdpDRBz+6yw0BB36AQA
	6//rtsdf5xdmYZKBiHoCYrJ3uDqgTUQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-82nT8_LsNCS-kYbFxQ-pwQ-1; Mon, 16 Oct 2023 22:28:31 -0400
X-MC-Unique: 82nT8_LsNCS-kYbFxQ-pwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 401101C068C0;
	Tue, 17 Oct 2023 02:28:31 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB5C1C060AE;
	Tue, 17 Oct 2023 02:28:23 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv9 1/2] powerpc/setup : Enable boot_cpu_hwid for PPC32
Date: Tue, 17 Oct 2023 10:28:05 +0800
Message-Id: <20231017022806.4523-2-piliu@redhat.com>
In-Reply-To: <20231017022806.4523-1-piliu@redhat.com>
References: <20231017022806.4523-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to identify the boot cpu, its intserv[] should be recorded and
checked in smp_setup_cpu_maps().

smp_setup_cpu_maps() is shared between PPC64 and PPC32. Since PPC64 has
already used boot_cpu_hwid to carry that information, enabling this
variable on PPC32 so later it can also be used to carry that information
for PPC32 in the coming patch.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/smp.h     | 2 +-
 arch/powerpc/kernel/prom.c         | 3 +--
 arch/powerpc/kernel/setup-common.c | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index aaaa576d0e15..5db9178cc800 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -26,7 +26,7 @@
 #include <asm/percpu.h>
 
 extern int boot_cpuid;
-extern int boot_cpu_hwid; /* PPC64 only */
+extern int boot_cpu_hwid;
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
 extern bool coregroup_enabled;
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..ec82f5bda908 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -372,8 +372,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
 
-	if (IS_ENABLED(CONFIG_PPC64))
-		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
+	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
 
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 2f1026fba00d..707f0490639d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -87,9 +87,7 @@ EXPORT_SYMBOL(machine_id);
 int boot_cpuid = -1;
 EXPORT_SYMBOL_GPL(boot_cpuid);
 
-#ifdef CONFIG_PPC64
 int boot_cpu_hwid = -1;
-#endif
 
 /*
  * These are used in binfmt_elf.c to put aux entries on the stack
-- 
2.31.1

