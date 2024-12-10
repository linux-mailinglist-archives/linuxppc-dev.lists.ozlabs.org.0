Return-Path: <linuxppc-dev+bounces-3884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689779EA570
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:42:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfl5fYpz2xst;
	Tue, 10 Dec 2024 13:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798495;
	cv=none; b=BLa+mkB9TBWN5mC0FK3ztoZBU9spuUjGnwSW76OXYtVL3m4iWoO861E+OXuaBZ2DqanYJclz0z5TBdUASfctTfAaha4B69FNBvQPeN91ySv9Xx51uO5gr2P1P9d0CcVVSy0EUJEp+pB40zMbWTENdFn3uwewt4Qvds8WRevEEQq+Toe/0Yftm6LW8j7W3LkeDGPm0M/69mP13kjrRcDBZs2lwWmmTHk4FkyLizDMIxZymQ2VhqyiG0FJwRwBgffgexL0re2cteMrYYs4sMogiHCsxioNdhIDbgmt0Y1OTxnMBtqak/lMuZp/m7DxTKj+3keiO48caCNVX6gkY3kLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798495; c=relaxed/relaxed;
	bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L6Apss22SkOGvDE8aC+DcKSaZkL6qeOLXFmOg+P6rCMxCtLR8y5htzJEOyGY8lipzJdnG4sUI/zNQzBIAjDIvZyfW1jWHCn2akJ7siIv5lGoDGqaPZs+ZnpPTmSYmZK113kH4SjKLEOn8OzyUIETNTstpmj+OzDgHXxxPZikrW5vJjwzPzol+ov7AvT8uRzNUkoWqiwJnczINZ2/5euUXdaTr4TpYJ6wHH0G0D68s6gYVGqm+DznlEknV86q+/6ZD8yQP89czXPivJdEOnk6dJ5Ui+zQrS+LM7YCiTjP2fQtIL5kLa3wqgdLjvfFoq7xRnzRjb6uX0JMGiP6VBusEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2BbEJTph; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3xkpxzwskdfe3t4xb0b16z0z77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2BbEJTph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3xkpxzwskdfe3t4xb0b16z0z77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfk42BKz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:34 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so3104176a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798493; x=1734403293; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=2BbEJTphU3I7llPtb4ygv4UWsoyDGBuiQBnAP7P5WhSMpG463/WPb2DFWDpenkrHJ/
         Cg6HQo9AhyrG1qOOXxsK3E10TCEtmaQ4+ewFADDoD0winm6PlkVQHyx0M6+v318OLPu1
         vMRmtJCdg1rSSXDt9fvEKLGjXNqnRg/nlunfu8za6BpOSLdZz9TRC8/Ajb0PaTDN1opV
         0u4ckd72cabOuOjnCNeiLXGTPYLpwfBGki/bON4e2QuzjW2x2EZLuSFp8uyXQLvWLXYr
         2Q/m26FH39Usn8t8pPz5jwhgCOMKgyDq0kE8u+lw2gQMJoe5KWw+fjdPLY13ABBYQiS3
         rtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798493; x=1734403293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=Dubx6e291uZnEvJpgDrTiN3KbrTuI9CL5spwdt4pbCoP5SZdufR/9Pu51zU/Sd9HnT
         xSoXE3li/zHoffl6bbxu1A8qS2JIUAi//VRzcCfVJUNahFLmjVJYtCIY4lsnMb5/S1n6
         VvLqyUg63gemErjwqikvNwGkVeWcJ56Eb4gMFZMY8tyj9jClH5F6aKJtnqDfBm7LOPeN
         MWJCmQOMcDkK8oXiR7htDp1A3itRWwRQZFGbHXnfVLYnDgkZMO0TRUYxWYfMNir2hfpr
         SurvSbqWkrK5ByHiPdJdROdJB8XEXUNse69ncwQkJVxXkiqS6uhyZgll3648k4C4dB3e
         BUmA==
X-Forwarded-Encrypted: i=1; AJvYcCUABRUPynLbM9jj+AQDrCJM2Pv0oetQQcWJuqXcw8RuPTAGBMnz597ByahnfqDOZ2wHvhkLplaavg4BOsE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9Wn9QDAF8XP0uisHioZHu9aaxNs3RM2EQdRijJN19JCPFOrvo
	ENleY67DtqPAwrPBAPEZg2Rz3zrN5dgB3xzbJ6xYJJRqUNJzK9fPAVsk0cL4zhQbOqzeHyVG4f6
	Q95Dq5vwMWIUkB/sONYivYg==
X-Google-Smtp-Source: AGHT+IHwTbEIW/FAeU1sg3ure6LNMbce1+qfNwJ7QwjwcLyYjZmtwQZSOt2eORyWNRKplpOxNs0RywA1YRSDvXTeEQ==
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:2ea:5c73:542c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c0f:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2efcf1700c3mr4344722a91.3.1733798492790;
 Mon, 09 Dec 2024 18:41:32 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:07 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
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
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 05/17] mm: arc: Use generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

Use generic_mmap_hint() in arch arch_get_unmapped_area().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/arc/mm/mmap.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..6b1fcea06779 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	/*
@@ -43,14 +42,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


