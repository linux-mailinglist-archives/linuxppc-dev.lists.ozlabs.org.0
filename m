Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94331324958
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmJ3q4K8Vz3d79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WCDbQFd5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WCDbQFd5; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmJ3R50w1z2ydK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:21:23 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id u11so2408717plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EYTTdL0l29ip772sRR1opbvwK6fLQZtC1HipsSNAAs=;
 b=WCDbQFd5yAc49Zr3R6ri1tovhQpl+pi6ikxr1r0gRdDouA9CoP8VxGSBvxwWGMUST/
 Ts0yNceq+qdEK6kwp32sgs2SfRIxNEG/qPkwUaTyVaMQNaFVTowP4Cdq/QvLw1icoo7C
 C2gOci1RFYzqcQsTSZS/E/SxDoPCxYE5cjADzYxHQW7fSCTZxZtcxPO70WcTm6e+Lqmj
 WpU4apnWOsP3/fwiDTYe/kc0dsM8Lr/qAY36DxsD9+Flos1R9xjAGzdNwZNCJ1zOtGnd
 wJyzICdryGXHTz4a+giOUj71fgLe4FGHZ3DSgXq9Wr2Cdk17dHArCPMVIGTkSxxUoNZr
 m5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EYTTdL0l29ip772sRR1opbvwK6fLQZtC1HipsSNAAs=;
 b=pl3kjLMqmFQ6PsLE8FuQmQ0iMejaJ4cV+7cLw5YtuNlVL1q6wGKwPtyUlWxlmtPhJ+
 JIUF7v19q+SXO86arx23cnwGP+95AQYoR/nCkfw6RPbh1ASWyFmfQpr4TJ63Ij5+aLMy
 umcZ9VJ9CbphrOMyC219adC+gbpzhd08l2CmfDjrRajEY0CSi2bpKM51fI5UEyL9SM9D
 rbTGxCJbjI33UHAOX5Y71Fw4Z8oFLGkUcF7kJbdrpXSPtWVhySNW83yaI/+nYvIJ14h0
 6UXvWzIzMhfRx06QGRwkv7fW6H31xgFKhPd0aKgGtZAycFjija2Vt/HfKGMeKIc6mPen
 y56A==
X-Gm-Message-State: AOAM533fnPPBHuLTw0nTG2sJAvFtjhZCCV6yBoZrMJVW3siyuuOwVtuW
 TsdDRMi5U/O07vJZBh2qaUruFU4+h7Q=
X-Google-Smtp-Source: ABdhPJwNdvC3g+GAKmwyWMa2NVlTvupsvpx/Bnam5ksxcM7R68FNOqpQH0N3D05NJ1+Lg/d60wHKxQ==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr802319pjb.2.1614223281529; 
 Wed, 24 Feb 2021 19:21:21 -0800 (PST)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id b62sm4097993pga.8.2021.02.24.19.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:21:21 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powernv/memtrace: Allow mmaping trace buffers
Date: Thu, 25 Feb 2021 14:21:06 +1100
Message-Id: <20210225032108.1458352-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let the memory removed from the linear mapping to be used for the trace
buffers be mmaped. This is a useful way of providing cache-inhibited
memory for the alignment_handler selftest.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 5fc9408bb0b3..8a1df39305e9 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -45,10 +45,26 @@ static ssize_t memtrace_read(struct file *filp, char __user *ubuf,
 	return simple_read_from_buffer(ubuf, count, ppos, ent->mem, ent->size);
 }
 
+int memtrace_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct memtrace_entry *ent = filp->private_data;
+
+	if (ent->size < vma->vm_end - vma->vm_start)
+		return -EINVAL;
+
+	if (vma->vm_pgoff << PAGE_SHIFT >= ent->size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	return remap_pfn_range(vma, vma->vm_start, PHYS_PFN(ent->start) + vma->vm_pgoff,
+			       vma->vm_end - vma->vm_start, vma->vm_page_prot);
+}
+
 static const struct file_operations memtrace_fops = {
 	.llseek = default_llseek,
 	.read	= memtrace_read,
 	.open	= simple_open,
+	.mmap   = memtrace_mmap,
 };
 
 static void memtrace_clear_range(unsigned long start_pfn,
@@ -158,7 +174,7 @@ static int memtrace_init_debugfs(void)
 		dir = debugfs_create_dir(ent->name, memtrace_debugfs_dir);
 
 		ent->dir = dir;
-		debugfs_create_file("trace", 0400, dir, ent, &memtrace_fops);
+		debugfs_create_file_unsafe("trace", 0600, dir, ent, &memtrace_fops);
 		debugfs_create_x64("start", 0400, dir, &ent->start);
 		debugfs_create_x64("size", 0400, dir, &ent->size);
 	}
-- 
2.25.1

