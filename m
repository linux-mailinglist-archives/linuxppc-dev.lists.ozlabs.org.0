Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988747AD26E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 09:55:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9qfW6Cx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9qfW6Cx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvFYN3Dhhz3clS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 17:55:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9qfW6Cx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J9qfW6Cx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvFWc6mlzz3c76
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 17:54:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695628457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAkkQD5nCaP6IW7i6iH/5QI9wnjlWvpSyEhtUH4p0lQ=;
	b=J9qfW6CxYdwP2R3PuGgY/qskG42lsbDJEAoKXiQMJQDkjcBlL3Yysw7HapCLsW21Q0PmMh
	TYxtFlFbYUXy3pS1VjdcVauXHgOFTo4lMpXQYWJD2jYj/NpgryXkbhdHCA5T+Xw3+SX+j4
	Z5x1D52Jnn3u9DFdhIIFRq+VyCmS6uY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695628457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAkkQD5nCaP6IW7i6iH/5QI9wnjlWvpSyEhtUH4p0lQ=;
	b=J9qfW6CxYdwP2R3PuGgY/qskG42lsbDJEAoKXiQMJQDkjcBlL3Yysw7HapCLsW21Q0PmMh
	TYxtFlFbYUXy3pS1VjdcVauXHgOFTo4lMpXQYWJD2jYj/NpgryXkbhdHCA5T+Xw3+SX+j4
	Z5x1D52Jnn3u9DFdhIIFRq+VyCmS6uY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-2QzYfjKZPMSEZjgGBs0Tvw-1; Mon, 25 Sep 2023 03:54:14 -0400
X-MC-Unique: 2QzYfjKZPMSEZjgGBs0Tvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A01E1811E86;
	Mon, 25 Sep 2023 07:54:13 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6598940C6EA8;
	Mon, 25 Sep 2023 07:54:08 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv7 1/4] powerpc/setup : Enable boot_cpu_hwid for PPC32
Date: Mon, 25 Sep 2023 15:53:45 +0800
Message-Id: <20230925075348.16654-2-piliu@redhat.com>
In-Reply-To: <20230925075348.16654-1-piliu@redhat.com>
References: <20230925075348.16654-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, kernel test robot <lkp@intel.com>, Nicholas Piggin <npiggin@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
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
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309130232.N2REwHBv-lkp@intel.com/
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
index d2a446216444..1b19a9815672 100644
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

