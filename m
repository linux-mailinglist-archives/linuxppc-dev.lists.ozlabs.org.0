Return-Path: <linuxppc-dev+bounces-17332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFAkAeY2oWnRrAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:17:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE81B3184
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:17:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMdQT4TGjz3bkq;
	Fri, 27 Feb 2026 17:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772173025;
	cv=none; b=jNbSfixG2BBPmP1HuWzYCsYBnN+LfP/JT5z+D0yErfjneoqCYtg8wKcvgIVkNXP9KDMYAhlG4obb25pjWZZtGQg9+TPUMp6d2LDQ+HErBm4KErw2ya+qQRRNWXQSijnR/dRWAXpxek8nIWWVO93mIeuXY3yNeQAwuRbzXiK1z/VfnGHJdwT/rrJl0Ex61gs2kim2VMmAsQ4izPLf4fKVRbxFts0U9PGqcKq2HtcjbS+9rNPrOPdmdj4FnPcwfZ+QEx38Lwmy3dol/+cOQhTiOMHo5jDUwAYJXZaLhGRfm0b96/5W3x6L9wqG1u6fuvJOvEHaFaLYvjErsQ6Ni6+9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772173025; c=relaxed/relaxed;
	bh=scUOVzAnRBW38ibEW6xQpgzOJyOZg1ewr63AX7NvRVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFnG+LnRCNzYF3dyVHzlWWKAU+F3DozbWnnsZJX2F+nQ1THkv1pztG2vdSh+qnXc2C6faB77Z985DUxsgyYsBQi/M1F80M7tgIIA5e75S1WaS0JrpEPgmkwNxxqo51+j4PP/z4NnQ2ngtFX13I0WnRhFel1om5Bnbs33JVgovUT/jZCQYkDxqITVpbGoQc8SPFFvvPAzQJUP78Euso8vPm8LMBIKZ0ZByWNBq6y3d9jmcZ13uZ2G11Gq6VZnFfwCeLbEmuPDrhbWOpcFIP0T9X5SzA4j8VEhK0GIPl1hkEkBm0knhi2Nm7I7WfXUts786e1DPVReVqgkIKNUj/0GBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lz6y0rvg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lz6y0rvg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMdQR4RZbz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:17:02 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aaf43014d0so13554645ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772173020; x=1772777820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scUOVzAnRBW38ibEW6xQpgzOJyOZg1ewr63AX7NvRVM=;
        b=lz6y0rvgRZqY2wRvHSdlNpKsH/pLTi2M35OVG+jbNYvexkXsZTM8G1jOV7IC+5djGo
         iN8+G6GxA4tBUboigLnbruQ/HsZZlEtI+NcETHzW4uChtdiiygW/7CuxKDx7U7niyccx
         GC9bx6RDoJ0KdxhmzNs1USyfHhPyqlFVh+W/hMwfVDPk5u5cdyaW6+NYRaX42/8Vb1r0
         1MkZj25NeaeFBPPAWaMHMig/IPdC6NhjUpWzwhl2HRhdUFA5AkvkeJXr4ixjckj8wOLb
         T6FyiLt6BUxqTgJR8Mk7ilWF8R+e2ocF6ESPR9X7STci2kRHKNCZb6CFNqRlQV5Xmobp
         VTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173020; x=1772777820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scUOVzAnRBW38ibEW6xQpgzOJyOZg1ewr63AX7NvRVM=;
        b=SkyVoMDijo2eiBTlbTy4cb4DlYQAkjlp1eHcpvUptO5EsW70V1wpOexd4evj7rrmd7
         u68XyjPiQtdLg9JOK683BommxXL4EFk9ftE4z/+t5n8bdi0QHTbAAy3yc/sj8z0APKQl
         sgFztpqMMJDnmvy2xaHLaKkUqkFQCNNBCgMOxZ1MPvlBjfRmFciixCBptlbUEwtGXOzy
         724Xv+z50clLFBrAVVpt45MO9+/k+UhI/z66vLeiGzIV27eQ9abVevFynFfsNLHRMO7m
         IJD5uj6RDxcrCyRUt1S0BySKYRRFQMWvCob6h4/OkRi17NleoQ5+46haNLXADOQYY7Nt
         nO3A==
X-Gm-Message-State: AOJu0Yw0Ynlnu9vta4NRgDr6Q1oo+kGTDEjeJq4En7Ttxy+YSORc5d2F
	5voFdzcvtsKnB+N6BvHvV5QBSVVzo6lucF6V5WzmhJshGDb3K6dXwu5Wjkqz4tf1
X-Gm-Gg: ATEYQzwNQ7VylBXhq0ETddyL4YcUlk8h0mwooA/4rTZV9AGPN72CHJqT6SKwZC9Z9cD
	vIorBO9WXlHUbKKu201puQdc8rjX9LMuh8RgOYjlUJz3ztXzezwmBZhFh1PudoPz2UPDuB8jX8p
	muI2jWp+esNhmCmTP/QIiPdJZFiKyKV79uOnlFPUnd7pBkoxXqmDvm5cxsEKQUTJsfx0qsm6s1G
	3jG+iAslJNRgMWwfEeaaoJfy+8UlPLh7ylIStz2AEDiZedmvN15Pg8hmIuLg41IcT06iH2uQ6f1
	0VkXJ4Zo85GSx6urfLw9ObUqwm3z+LzSV+I6E5vdiCiQZUilpTmRyOmpa3Mpuv8Nt1Ta9Z3Pusv
	LlWrNEvE3EEOSDTHwwxNg6+YlOBA8cKJEUcmjgs/WiyvuDZit3WZpHSOHjDUAXaL7Iq3pceWkA5
	oUfhzH30D9/tPjeb6uoSmB1a201bbJ
X-Received: by 2002:a17:903:1a06:b0:2aa:f0ec:3701 with SMTP id d9443c01a7336-2ae2e3e9a31mr15207155ad.2.1772173019761;
        Thu, 26 Feb 2026 22:16:59 -0800 (PST)
Received: from dw-tp ([203.81.243.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6d1913sm57837485ad.77.2026.02.26.22.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:58 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	kvm@vger.kernel.org,
	Alex Williamson <alex@shazbot.org>,
	Peter Xu <peterx@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 2/2] powerpc/64s: Add support for huge pfnmaps
Date: Fri, 27 Feb 2026 11:46:37 +0530
Message-ID: <d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com>
References: <0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-17332-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,shazbot.org,redhat.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 24AE81B3184
X-Rspamd-Action: no action

This uses _RPAGE_SW2 bit for the PMD and PUDs similar to PTEs.
This also adds support for {pte,pmd,pud}_pgprot helpers needed for
follow_pfnmap APIs.

This allows us to extend the PFN mappings, e.g. PCI MMIO bars where
it can grow as large as 8GB or even bigger, to map at PMD / PUD level.
VFIO PCI core driver already supports fault handling at PMD / PUD level
for more efficient BAR mappings.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---

@linux-mm:
Is there any official test which I could use to verify this functionality.

For now I used basic ivshmem setup + vfio using Qemu and validated using some
basic test to see that we are seeing these prints.

[ 4351.435050] vfio_pci_mmap_huge_fault: 3 callbacks suppressed
[ 4351.435234] vfio-pci 0001:00:00.0: vfio_pci_mmap_huge_fault(,order = 5) BAR 2 page offset 0x0: 0x100
[ 4351.457005] vfio-pci 0001:00:00.0: vfio_pci_mmap_huge_fault(,order = 5) BAR 2 page offset 0x40: 0x100
[ 4351.463684] vfio-pci 0001:00:00.0: vfio_pci_mmap_huge_fault(,order = 5) BAR 2 page offset 0x20: 0x100

 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h | 23 ++++++++++++++++++++
 arch/powerpc/include/asm/pgtable.h           | 12 ++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad7a2fe63a2a..cf9283757e5d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -172,6 +172,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_HUGE_PFNMAP	if PPC_BOOK3S_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if !HUGETLB_PAGE
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
 	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 1a91762b455d..639cbf34f752 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1289,6 +1289,29 @@ static inline pud_t pud_mkhuge(pud_t pud)
 	return pud;
 }

+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+static inline bool pmd_special(pmd_t pmd)
+{
+	return pte_special(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_mkspecial(pmd_t pmd)
+{
+	return pte_pmd(pte_mkspecial(pmd_pte(pmd)));
+}
+#endif
+
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+static inline bool pud_special(pud_t pud)
+{
+	return pte_special(pud_pte(pud));
+}
+
+static inline pud_t pud_mkspecial(pud_t pud)
+{
+	return pte_pud(pte_mkspecial(pud_pte(pud)));
+}
+#endif

 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 extern int pmdp_set_access_flags(struct vm_area_struct *vma,
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index dcd3a88caaf6..2d27cb1c2334 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -63,6 +63,18 @@ static inline pgprot_t pte_pgprot(pte_t pte)
 	return __pgprot(pte_flags);
 }

+#define pmd_pgprot pmd_pgprot
+static inline pgprot_t pmd_pgprot(pmd_t pmd)
+{
+	return pte_pgprot(pmd_pte(pmd));
+}
+
+#define pud_pgprot pud_pgprot
+static inline pgprot_t pud_pgprot(pud_t pud)
+{
+	return pte_pgprot(pud_pte(pud));
+}
+
 static inline pgprot_t pgprot_nx(pgprot_t prot)
 {
 	return pte_pgprot(pte_exprotect(__pte(pgprot_val(prot))));
--
2.53.0


