Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8C832C16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 16:05:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=glTwoKh6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=glTwoKh6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGjbZ2ffCz3vrs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 02:05:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=glTwoKh6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=glTwoKh6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGjMC3sjgz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 01:54:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDvYJxBJvZegSwo4Kk9zAYMdDY4WlX7FhACBVJ8AwnU=;
	b=glTwoKh6UQIx7ulLHvzWmPsB7DFjRg1r6qcFqqWFcyeGfPveGkdrRBfJkfZwNBT7mP096b
	EsEsDajuIC7wS0ascF7OHX8ULufDb9IPLT0Sd4ebm/NY0UO7hirqDqGl1hTl2F+si6UZos
	POD+1aVJ+BytImAWaZea0v5AlA07stU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDvYJxBJvZegSwo4Kk9zAYMdDY4WlX7FhACBVJ8AwnU=;
	b=glTwoKh6UQIx7ulLHvzWmPsB7DFjRg1r6qcFqqWFcyeGfPveGkdrRBfJkfZwNBT7mP096b
	EsEsDajuIC7wS0ascF7OHX8ULufDb9IPLT0Sd4ebm/NY0UO7hirqDqGl1hTl2F+si6UZos
	POD+1aVJ+BytImAWaZea0v5AlA07stU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-osoDulHkOveZzpDk9NGWvg-1; Fri, 19 Jan 2024 09:54:38 -0500
X-MC-Unique: osoDulHkOveZzpDk9NGWvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C54868A02;
	Fri, 19 Jan 2024 14:54:37 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBA8251D5;
	Fri, 19 Jan 2024 14:54:30 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/14] loongarch, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:41 +0800
Message-ID: <20240119145241.769622-15-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on loongarch with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery, and
use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/loongarch/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index d183a745fb85..61f88dd97947 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -258,11 +258,13 @@ static void __init arch_reserve_vmcore(void)
 
 static void __init arch_parse_crashkernel(void)
 {
-#ifdef CONFIG_KEXEC
 	int ret;
 	unsigned long long total_mem;
 	unsigned long long crash_base, crash_size;
 
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
+		return;
+
 	total_mem = memblock_phys_mem_size();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
@@ -283,7 +285,6 @@ static void __init arch_parse_crashkernel(void)
 
 	crashk_res.start = crash_base;
 	crashk_res.end	 = crash_base + crash_size - 1;
-#endif
 }
 
 static void __init fdt_setup(void)
@@ -468,7 +469,7 @@ static void __init resource_init(void)
 		request_resource(res, &bss_resource);
 	}
 
-#ifdef CONFIG_KEXEC
+#ifdef CONFIG_CRASH_RESERVE
 	if (crashk_res.start < crashk_res.end) {
 		insert_resource(&iomem_resource, &crashk_res);
 		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-- 
2.41.0

