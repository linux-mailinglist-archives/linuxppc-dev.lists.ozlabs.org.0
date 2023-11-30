Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E37FE765
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:46:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gG1yt5Q/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JV6eKMXe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SggZM5ZVcz3vcL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gG1yt5Q/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JV6eKMXe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggRF6Q5vz3cSQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:40:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701312038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8a+ellwCh/3V8BzkRuEVvsJ+8hxsTW4N92KLuW+8EyQ=;
	b=gG1yt5Q/x86eLMfj9jgHOotgn9e68G/DAKtzf+qQ1kN8HSQduKMyZBAaBagF3t5rPQrNM/
	oWI9H46Ky96dyEV7n2zvKKlD5byStcxeyjQGljuoNLp+6J48c9bao37kF8C6569x8NcTNp
	KlpPBVL+qQe2/IToc1oSnpQMWfyPfQM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701312039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8a+ellwCh/3V8BzkRuEVvsJ+8hxsTW4N92KLuW+8EyQ=;
	b=JV6eKMXeG2BPA7eV2KY9W42KN1GhsoWVPbRUAk1kBHfCehpG710uRhm/ZyxbCe9CMKG5sS
	FFIN3GBE2x03bwEJ9XSnCW8QMFA6r8dmwpFfD4go4qfmrUgpmfYYc9nLx2Y+aWNZgWMJWw
	3W1huWwiTQCeKni+z0nrWeOe7j6VBW0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-xuchx3FxNBWjFxjNJEU3Uw-1; Wed, 29 Nov 2023 21:40:35 -0500
X-MC-Unique: xuchx3FxNBWjFxjNJEU3Uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D01185A783;
	Thu, 30 Nov 2023 02:40:34 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 963822026D4C;
	Thu, 30 Nov 2023 02:40:30 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] kexec_file, parisc: print out debugging message if required
Date: Thu, 30 Nov 2023 10:39:55 +0800
Message-ID: <20231130023955.5257-8-bhe@redhat.com>
In-Reply-To: <20231130023955.5257-1-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
loading related codes.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/parisc/kernel/kexec_file.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/kexec_file.c b/arch/parisc/kernel/kexec_file.c
index 8c534204f0fd..3fc82130b6c3 100644
--- a/arch/parisc/kernel/kexec_file.c
+++ b/arch/parisc/kernel/kexec_file.c
@@ -38,8 +38,8 @@ static void *elf_load(struct kimage *image, char *kernel_buf,
 	for (i = 0; i < image->nr_segments; i++)
 		image->segment[i].mem = __pa(image->segment[i].mem);
 
-	pr_debug("Loaded the kernel at 0x%lx, entry at 0x%lx\n",
-		 kernel_load_addr, image->start);
+	kexec_dprintk("Loaded the kernel at 0x%lx, entry at 0x%lx\n",
+		      kernel_load_addr, image->start);
 
 	if (initrd != NULL) {
 		kbuf.buffer = initrd;
@@ -51,7 +51,7 @@ static void *elf_load(struct kimage *image, char *kernel_buf,
 		if (ret)
 			goto out;
 
-		pr_debug("Loaded initrd at 0x%lx\n", kbuf.mem);
+		kexec_dprintk("Loaded initrd at 0x%lx\n", kbuf.mem);
 		image->arch.initrd_start = kbuf.mem;
 		image->arch.initrd_end = kbuf.mem + initrd_len;
 	}
@@ -68,7 +68,7 @@ static void *elf_load(struct kimage *image, char *kernel_buf,
 		if (ret)
 			goto out;
 
-		pr_debug("Loaded cmdline at 0x%lx\n", kbuf.mem);
+		kexec_dprintk("Loaded cmdline at 0x%lx\n", kbuf.mem);
 		image->arch.cmdline = kbuf.mem;
 	}
 out:
-- 
2.41.0

