Return-Path: <linuxppc-dev+bounces-4010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993499EDB3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGb71lgz30V3;
	Thu, 12 Dec 2024 10:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959687;
	cv=none; b=fAn7YjEvE+uV0H3voQ+YM6AEYA10CVeSj9ghSKnLsN9CgMfkM89jcz0PZ0Nyqx5l9vcRTssskz/aprrjON97sYqy3+TlGK/ODiXYeVADs8fWjV8P37sWVEBSpTTnIdKE9rvpiA8AkaIzSYqrC8kQlYI01I1dCfwR7LdioaDhiuzNtb0Vpo3iyEctzH6SLRpI9QNYwU/2SP4cLHwoKfuAc6pNxYzyU33tEc6DYPJSpTTJVCVZd9JC+dVhmvTVblt9U5F/cxbrNrA9gv3pWUelf01A5J6VV2G1UN66dtVaiiPH7ByUxZLtwOmWIY9+6hCCdY3DkMhUQ2qy8LsgZr71bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959687; c=relaxed/relaxed;
	bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tugntkij1f8GdQ9rkBnoz+5k/foyeCZMEBgns12EK9rWm76/Ww9hJnNothk2bfkgde0X7malNN3P/BgzXQBRblS1gdDNa1yG0zhhR63aLYYMwjOorv6P8s8lWf1FFi9QPlvDrETcYDGn1W6Tj9n/AhmCqdygPbuzO307KJkPHYPOsaLv8VEAkBm8nNetPi1wzb8jvyZJ8nz5+s/s7OxzTDCQUZHoTaA+v0rIlmDGADVPF+dujNYwKHdmcbqYybtWy7QJcLC1w07pMStlmpsYLwMH/YliGss6R6/iX+gLspr38LFO1M9F/qc0naG/AvDFq2jCDoIqQ0DGU1z8S73Q7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1zYvsFPG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3bsbazwskdo4aqbuixiydwxweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1zYvsFPG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3bsbazwskdo4aqbuixiydwxweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGb2JM1z30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:07 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725e8775611so21741b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959686; x=1734564486; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=1zYvsFPGPw2+dghPDI4RXM16cNt3wBfhjWWEa3EvaQjEP1xsG+tgBpSoT0T6IT7qDZ
         RbbRTQ3+PakW32vqEgK8enzk3SEbsjGnqq14sZHZmQSKZejTTrZMrDp3SkZEQEU043rt
         pwVynQshcv0BrFrC8jY6A+IX9FBPSoX7mau3KoLROeSrQAnooDbETNDFWULyKnCsWb0y
         ydCzUWzcaEw1aS/a5F9vMjlIXlnLEyarcQ15DY99P2dIvGPjXZNtGanEMmrhXKHGAOcm
         d7QyhPMwc1ImAoLfEL7Mu23626mo7vPbjN6w8rdogrxJgl9TW/jJACz7boClydv9uEqG
         hwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959686; x=1734564486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=XgNdNH09/KLzUcWpnWx4iRHNttceeFP8wN16pm6krhsrPdO6Z/HYLZ+M3efHiubdnq
         Hu2y4z1ZQJfooknm0QrcVoT5T3t9ZIyijYGD6cJNgtZPWO3iHeDYSg10EtGipbJz07iW
         rVFbdg7u1UwN59b7I5kz6ABwhWp5RVleTBaxvq+lbvRSWcvaeUlLgQFKmJmC+B9oZt67
         JlxRuF0jbk/A6dM72wRK6YvpWAUOECiXdTIcxrJSwVNKvZVG2c1bZIENKwmJKLaE+bpY
         wGi071pPGSEq9ETBo1sUxT/xdmEBpw1chRQvzVUkHlVxxe7aRk8S/KAEdxnBNJdzPvTU
         MJNg==
X-Forwarded-Encrypted: i=1; AJvYcCVpV9dFgojbEsA3ZoVqrPwKledYr81xDuLoXZJ97ZP/qzPJC/2MdmW5druWSumlu4Byr44S4Dfd5tFWchk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIGHWJuIFXWNBUDwcOIVgRQsGLfc6Ql077O2wI9rPyZf2OdeI5
	W0FFBugvxKmkA9G06MAXeeQZjuvIsPEXH4Bl8D5JrtI4tmH4XTXvpZSBw955HLTsV/prIhOqH1h
	M9++lDXLAhZHH3E1RqjPE1A==
X-Google-Smtp-Source: AGHT+IGKKVpJDJ1y2ylGaA50Z43wv3+APAJV0fjiCw5ytHmnD6GxlKgAyJQZQRFGHnrCD199ncZRE2+HH1UPCzOgAg==
X-Received: from pgbfy22.prod.google.com ([2002:a05:6a02:2a96:b0:7fd:4739:79be])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:328c:b0:1e0:c56f:7db4 with SMTP id adf61e73a8af0-1e1cea71c6cmr1602899637.2.1733959685721;
 Wed, 11 Dec 2024 15:28:05 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:42 -0800
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
Message-ID: <20241211232754.1583023-5-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 04/16] mm: alpha: Introduce arch_mmap_hint()
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

Introduce alpha arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Consolidate error handling in arch_mmap_hint().

 arch/alpha/include/asm/pgtable.h |  1 +
 arch/alpha/kernel/osf_sys.c      | 31 ++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

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
index 86185021f75a..308f832732dc 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1225,10 +1225,9 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 	return vm_unmapped_area(&info);
 }
 
-unsigned long
-arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		       unsigned long len, unsigned long pgoff,
-		       unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
 	unsigned long limit;
 
@@ -1241,8 +1240,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > limit)
 		return -ENOMEM;
 
-	if (flags & MAP_FIXED)
-		return addr;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long
+arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		       unsigned long len, unsigned long pgoff,
+		       unsigned long flags, vm_flags_t vm_flags)
+{
+	unsigned long limit;
 
 	/* First, see if the given suggestion fits.
 
@@ -1253,12 +1259,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	   That said, I can see the use in being able to suggest not
 	   merely specific addresses, but regions of memory -- perhaps
 	   this feature should be incorporated into all ports?  */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-	if (addr) {
-		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len, limit);
-		if (addr != (unsigned long) -ENOMEM)
-			return addr;
-	}
+	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
+	if (current->personality & ADDR_LIMIT_32BIT)
+		limit = 0x80000000;
+	else
+		limit = TASK_SIZE;
 
 	/* Next, try allocating at TASK_UNMAPPED_BASE.  */
 	addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
-- 
2.47.0.338.g60cca15819-goog


