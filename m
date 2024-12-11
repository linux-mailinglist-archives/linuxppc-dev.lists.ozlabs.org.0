Return-Path: <linuxppc-dev+bounces-4022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D589EDB7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sH41Nh7z2xrb;
	Thu, 12 Dec 2024 10:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959712;
	cv=none; b=Tb9F8/jJbZXzv+M0xTePCAPR62nFU0r0GSig+/MZOOsRKbW/gZjCFhjlEbXWRHrqTMKnwAaE+m6DGQ4Y6YnnfFFsdkcSukFm4t8uBD+YdKGTIHBDkc0G2KQ4SxzScUNg1vX7VSTzmhw1alYzbmwFDEu4EjGH4NSihRMRuc3WHBZpQvEy1kB+NYYx8nueA4eTlJT2bUZ7dxBfcU68YmENj2k1bGNeaseJDafy3C7zxyDTkWpuFBQOBZeifMxIpL1ySVUdkOq4V/GsYJdyO9BAE39jHP6HAMPeZa6n19Qhz49Jl2VjNqympcqngyYyGtc8ibtnCdnX5Bhqe/E5F3EiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959712; c=relaxed/relaxed;
	bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILLqdY1QZRsL2cyAq27AQEvYbl5NnfHd7PusAtitJhkGxQZxue38x2EGduJloom+q1FxrHGOrSP+huZ12mcwNz6xfKfZDkH0345L+9GCRjGix0J+J206Y7WxPJzIg84Q06af4Ae388pW1vc1LHCFPifxy26Sy6l5CkXl9YC5rhm06zpjRwhPxXORDVi01gyqEGJr29bla3ABASsP3SbpVAxF3qTeWMw55fr3mxXHJbBuVtM3azxYc1/8l6RvjKwaKZ1gDvabZgWtt5JT3Bzg7A2i/Izdl/1HULUEUyXR0vBQux7t0OcyPbnRZvDfJ2GkY5CimWZgy/IrqcsM38jvFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P840lK1x; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3gcbazwskdamndohvkvlqjkjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P840lK1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3gcbazwskdamndohvkvlqjkjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sH31lbfz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:31 +1100 (AEDT)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-29e5f045c93so13204fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959704; x=1734564504; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=P840lK1xaj8iE+u8jwhNlJ9HWqZIHQQ/YcIF3AC3iednBcTPCvcc/1p8D7jO+d+SWk
         /13dCzosWrZMd7WdTah4Hnkj0Fwab9iW0h3cZW3sj0IYVXahxdai1wlyHfnWGS5kQXTI
         UnWJb3A5KVGSc4YqiuANlb0aXjx9CsIwfNv/n5gksjCjEhB7y2TmtG3yK6/xjRvuZCUA
         wP7VYvc3zfd32e9h/eBsNEYJVl521+mD3ZXT0M6BXtQ5S60fV3HZDgshVAiiTbkdlbPl
         zWzae8Ic7oBtFA6SbdlNYGFra1+AKGawydYg+6r1Xfe4IDkKFQFWv7V2QnzT26ED/aCP
         VY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959704; x=1734564504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=MyndME2majCJ1E1TRL8dnaHp9UuUlFaCJ80rayxMppxUv6qiyjBUc1x6s0jJr4kyPG
         2C9zXZHZAzXYqB3Lo3NPKDfbQgFMR4l6Nr7sMlEKKYyeJ3dAdxmjVwmMW11vGBdbyUhS
         hT+kYmlZRANiwXJ8CCup38cGqwUE7FrwpeeJRfz638i8uF4xEftAsQhTZh7qg19N4Ww5
         Tj7QOZ2+wna7LuHY/Gfp4mAH+wkDJYPoHC1ZjAW6c+yRNlV8s846wn5crGpHMc1N+g+V
         1e3ZGnj1Cm24caeh5AqFxAFYQWqy7KPoCR95RGyZDpoD2kOc7h/YhrKjfseJNmjANI2K
         33bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlwi3LrihvKQ0HLQipPpjd7n6V33GJb9L7XyqBtjbwp2JCSL7VlMdgiOL+Hy+HSV2sYHR8fGgINtHIBJM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzj4/aRmjvtBSb/2XpgW5o9RQhyI4CNVUqrtugQSwouUEprI+nQ
	wZYAJcRs3fNJjoQ6/DytChFUHXNRNs2F7w4v/jEeTg3RbOr6XzYu+QoxzrLbk+ZAMGng9syVjCE
	kxlGYrdiELj/T384M2DMLpQ==
X-Google-Smtp-Source: AGHT+IGQDLulfLF8RwhcJUV0HutTvJeMfbYLu8JUEjKppHvTG+7VWlPJjZzjhgEci5/4OsV71lgRhbIjtjk4C1ysLQ==
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:296:1589:4069])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:224d:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2a38236803dmr971354fac.7.1733959704488;
 Wed, 11 Dec 2024 15:28:24 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:52 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 14/16] mm: xtensa: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/xtensa/kernel/syscall.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..6bbe10c2a633 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,12 +54,12 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_area_struct *vmm;
-	struct vma_iterator vmi;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -71,16 +71,27 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
-
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
 	else
 		addr = PAGE_ALIGN(addr);
 
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
+{
+	struct vm_area_struct *vmm;
+	struct vma_iterator vmi;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
+
 	vma_iter_init(&vmi, current->mm, addr);
 	for_each_vma(vmi, vmm) {
 		/* At this point:  (addr < vmm->vm_end). */
-- 
2.47.0.338.g60cca15819-goog


