Return-Path: <linuxppc-dev+bounces-3883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8159EA568
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfl00jBz2yk6;
	Tue, 10 Dec 2024 13:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798494;
	cv=none; b=WHMhkffG1JnJZ/NtdS52PXbliXgEGmpAYFCd1EdWx30SU+mR771UR5ixILgbktFsqIegPsK5Qyqs3FCSKWu8UPbJCLI/1j4RewFEA6rSkVp534eggIBp4YbKZpBNRIdZY09jyceHy1aWFxNmTAMeRM3jo9/buEPRwXg6jOtUohYSmWYqeNFrLXqoehS8yb1P3j9y20aQ6JZFX2i24D630AN0ossGlupZ1+04UUmrtvvi8U2ljI7HBsGe/+mFP5nWoM4nZb+GC4rDbflL7V7b/rPBYOkTaMWk91Xh56MGPj5hO7irKMeMSj3OXqkfbshiJEioiZ5/Wa1N1RWXT4Rx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798494; c=relaxed/relaxed;
	bh=68DM57EM10Oy1Phx/X5P68W7yQkXIjbCrTpN7G3wDA4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=To1/r5vlEHS4xCN1hQviFj9P8BbcLq8ler63PMAsDYiqoMR7SdHH7Fd/mu9g7WK76YuRejqzqPzsY112CH5rySRs4QCSdPHFb8cZuTNcrSgCo4Mq2AYWRQwzT2SoZWBP1hzBbi3v1UKyDdBnnuexN7EmKpRDZqY39YXZp8qznki+hIAU+TSPz09CBbndTWexcxm5IyvTdcALlm7TJv9Dv3FUhNxHedksYjXonZHV3cSNCRpUljaDSJsBXP8PHeQEiNzyNmkX3MT6Fa1+vZ0xw+M3j5gUB3LQgl/gV+misV0sTLwnXBqVdyexFWG7r0b6nfKWBaVFNd9tWW3My2+fvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0g6Bz5Gw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3wqpxzwskde81r2v9y9z4xyx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0g6Bz5Gw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3wqpxzwskde81r2v9y9z4xyx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfj6Zwjz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:33 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-72739b83336so1192578b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798491; x=1734403291; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=68DM57EM10Oy1Phx/X5P68W7yQkXIjbCrTpN7G3wDA4=;
        b=0g6Bz5Gw7rQ11YSgwOjNVG613encXHzOw6Yf3Z/5bc0Yk+U0MdZ67XiWhNDts6nvUk
         Cq34bjs1txS7VapZGf2kyKH4TTIDcc04VLVnqLhZelyHyrLgW3hkfAck3OkwozHYR3rw
         KbHF2bVcuaFj25PeIEJnmI715+eQaosz5P3P+9LFFRhTMzNLTPHWARl8O/FIVqWqmPR+
         FdUxFqQo3INcTekuavosgc6i3kOMiHdI/we+DDXLw68Wgg7us/gnUeTZVQj98pnmAKpl
         vqvyhaUAt/fkp+hedZyPPbwpeVU+K3IgAD4YeQEnrMsRdAkGnA7iI3aGWnWFIch0cuJr
         bsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798491; x=1734403291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68DM57EM10Oy1Phx/X5P68W7yQkXIjbCrTpN7G3wDA4=;
        b=t6JRaUXwEWwWNY/rVeEKfMpYi7rRzj6msMqOayoSoGQ9GndR0InNOHK5DX//iW2I+i
         LuU1IDXki86FOpAooHDyG/HBBmWmzBR270bm/3qQDLlusArNnmO5E7hry28IPEaOSsvu
         H+hZ7ePJYDtYpjnW0284TJrsyxq9jiDHKaEPeTyL0tSvt2ghzQqtayW3TDyTNotk+URS
         xTH2osBDXzSuKOKkfYGRLqG8ZFC/ibpTYN3ImKJNDRw2JgxuRMk0A2dGkHiD2aOId6T+
         2JTEs4TF6iUfQVHjO0PXTisN1A95E+t3ZVA35ZdumOQZ34lj6bLIP7NA8OqkTYtE4cJY
         Go+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9JSJkaeX4beBqDTr+kLmNUM9FZtfgw8sfaNEEzvLdbZArjfeOsAVop8mAhH29KQT5e1Gck6j0zmEI2Hg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4iLWYn5y29LzC6Z8PZktrXYidp6U43W+1jvyN9Pp+79fZMHGr
	p4ckSJ/PFBtOoK+DuuNXegbc40iogXo05SXCjmb3+SoqG48iwD0NNsePSZNsfLIGosbCpKiWeCO
	i6zj5IccuH9LN0DUpVmGNJA==
X-Google-Smtp-Source: AGHT+IEtrC2iviCeXWAtkatWkkbrcoIFQnKfltvUj9wZA43T/YasMAjSbDISIyM+Y3e/Wy24hv9IDhoi1rtLFpgStA==
X-Received: from pfbcn3.prod.google.com ([2002:a05:6a00:3403:b0:725:db2d:370e])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:12c5:b0:1e0:d867:c875 with SMTP id adf61e73a8af0-1e1b1b5c646mr3881670637.36.1733798490862;
 Mon, 09 Dec 2024 18:41:30 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:06 -0800
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
Message-ID: <20241210024119.2488608-5-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 04/17] mm: alpha: Introduce arch_mmap_hint()
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

Introduce alpha arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/alpha/include/asm/pgtable.h |  1 +
 arch/alpha/kernel/osf_sys.c      | 29 ++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 635f0a5f5bbd..372885a01abd 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -362,5 +362,6 @@ extern void paging_init(void);
 
 /* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ALPHA_PGTABLE_H */
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 86185021f75a..68e61dece537 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1225,6 +1225,27 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 	return vm_unmapped_area(&info);
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long limit;
+
+	if (!addr)
+		return 0;
+
+	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
+	if (current->personality & ADDR_LIMIT_32BIT)
+		limit = 0x80000000;
+	else
+		limit = TASK_SIZE;
+
+	if (limit - len < addr)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
@@ -1254,11 +1275,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	   merely specific addresses, but regions of memory -- perhaps
 	   this feature should be incorporated into all ports?  */
 
-	if (addr) {
-		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len, limit);
-		if (addr != (unsigned long) -ENOMEM)
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return hint;
 
 	/* Next, try allocating at TASK_UNMAPPED_BASE.  */
 	addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
-- 
2.47.0.338.g60cca15819-goog


