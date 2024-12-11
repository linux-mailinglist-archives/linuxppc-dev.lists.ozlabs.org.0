Return-Path: <linuxppc-dev+bounces-4007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9B9EDB29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGX0Dl6z2y92;
	Thu, 12 Dec 2024 10:28:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959683;
	cv=none; b=TXU9d5050z652U+Ey5H1RDuZWVMF+peUQE4uBUwAvf2FcUKumL6SBbm5/gKgFP4v0A82s1hPQlUSl3LGlDKo0/3/RQ2/e7mv1tTe/aVI3YJpiMMQUJkVmvLJ85IURI9QGFhB4RNVLgUhBvmBQzoBoiVLFP3ZxAcAYGYBhq01oQYb+ncHrZB+y3Uad9JthxwtUzOyxykzayg6K8eEhrNHLSbXs7zZ+PnfsY8YUWIQfZQU0c9vyg8SFExUdBwsqbqqpkKBbdHaGDsbCEzlw1OTQWYpiC2z5256rvVRGnRubsSZbAtiD2K3G+eoeIJ34N9qf2tjuugSyGS7ydOi1D4ZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959683; c=relaxed/relaxed;
	bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eM6vxGcnK2m83X8mduETFlpp0o9EZuoicWhT/t5ptCfoRbxGd+5e+VDNzVgbIF5jAba4D8VPP/CSSBpKm4QagWrcaVnUO3u8VHcpGtLYNYyWrG8LNNEFEDSoaPpoU2enI1vsX4PGD8qA+lCBNARr2OAI/HniqFlyXeqQAgCHwquyFZOn+FI4T2o42Zpxva+XfhcVRfTRfeOr29dCRWNsP2HRV56LNCMuklJ0sXBulYjHSEhgFZymU4jeH8lMv3F64DYOSQUXZRX7bpQ2S32K1R1e+MAbnbkj34yak1DIC6xj4wWQTYA1vBcXpZxII/3SKSOseHS99/EyjaIoF0NYQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gDO2viLO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3_x9azwskdogukvocrcsxqrqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gDO2viLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3_x9azwskdogukvocrcsxqrqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGV55BTz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:02 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea8c2b257bso43424a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959680; x=1734564480; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=gDO2viLOxd9rDxL2GiHoLe4watT21d3/TPiHu7dtTGuQzB6F6LsxvHM26cwyjD8Bpo
         rarK0TIOGtu8wMi+8zftOLvfVufHrWGpX8NJEh7J60uwl322dt1Edd4fJPzDOFtIfH3a
         88yqJtIc2dfSyKjpdOnfjcv6yJwvxnNs47UCrXJaNXmf2+b5cCfOexr0VEBhy/e/TY1X
         Ss3bH/4CZVAWMi2VN42p4fJz3mkjBRveda4hMH6qdeNke1e8tHEsw2CGuMQ6UHbrSCKy
         pua9xVwNFNWQMTjNP9U4zyW9KIGLhncQVJ5/7B351MIMY3saI3BP0qr6+adO+0t3Ejiy
         d3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959680; x=1734564480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=FyZ8B9qe3lAsHtdTW1nNnAaEDVBpjPuylT21LNASm8OhHO20Tq4xX+r8XSEQkLjBGp
         s1YyaAl8wWEjAz5nTloeNUEZkhZwxQlsDZhWun37h15jpuXr0fMr9eyc1l4pDHoIn7Fc
         6kFeevRX/HEyQx8Oks6F0zDJT+VSOoc6OmfkR8VJ4IZCjZ6xOqugjqHUZsB1kCPsYam1
         vHw/a6Dbs239wCBFgcHklr2dWIJzjT+oRQM4C2SyfK6NmyHcNWSpZvCzQZ9WXL32y2E+
         Hp6eZlJDB7gmynnuTHZln9bRf+m/KBtFwLF/moPu+F6jWu7KgmoLf7dvXJTADae6E9Ra
         pYJg==
X-Forwarded-Encrypted: i=1; AJvYcCWzSfgU3DWd1QcD4m8t5cAMIqCSz5F/3gtVzgRos1gPHNuqcmbTjx4VMhMOpmeH16q9zVxrmJBOaFxh96w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAAWy+PINvrjVpwce6f5suZbcNRBff65ZoI3uUrAebDYxhF3fG
	dXdk8OPPXGQe4+AUY1f4yXVSkSW5E0zzYxDWgcJrjKkIR3RZew95r4ON9WxWIfs5rTU0lwmbVvW
	8+yNO48L/BHSyhr9DmmfDzA==
X-Google-Smtp-Source: AGHT+IFtd/N2pCFnI2u1d5m96JgTZmL7tbAt9a9u3MHy4m9H51vxoRQ9F2QC80/CNULE+uh+FoVAQHYq51Gg3PfRrg==
X-Received: from pjf11.prod.google.com ([2002:a17:90b:3f0b:b0:2ea:29de:af10])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2790:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f12802a503mr6866191a91.25.1733959679820;
 Wed, 11 Dec 2024 15:27:59 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:39 -0800
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
Message-ID: <20241211232754.1583023-2-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
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

Consolidate the hint searches from both directions (topdown and
bottomup) into generic_mmap_hint().

No functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 include/linux/sched/mm.h |  4 +++
 mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
 2 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..edeec19d1708 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   unsigned long flags,
 					   vm_flags_t vm_flags);
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..382b4eac5406 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
+/*
+ * Look up unmapped area at the requested hint addr
+ *
+ * NOTE: MAP_FIXED is also handled here since it's a special case of
+ * enforcing the hint address.
+ *
+ * Returns:
+ *    ERR_VALUE: If the requested mapping is not valid
+ *    0: If there isn't a sufficiently large hole at the hint addr.
+ *    addr: If sufficient VA space is available at the hint address;
+ *          or MAP_FIXED was specified.
+ */
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
+
+	/* requested length too big for entire address space */
+	if (len > mmap_end - mmap_min_addr)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (!addr)
+		return 0;
+
+	addr = PAGE_ALIGN(addr);
+	vma = find_vma_prev(mm, addr, &prev);
+	if (mmap_end - len >= addr && addr >= mmap_min_addr &&
+	    (!vma || addr + len <= vm_start_gap(vma)) &&
+	    (!prev || addr >= vm_end_gap(prev)))
+		return addr;
+
+	/* Fallback to VA space search */
+	return 0;
+}
+
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
@@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
@@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
 				  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	/* requested length too big for entire address space */
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)) &&
-				(!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


