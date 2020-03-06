Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB517B5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:50:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YZtW39ckzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 15:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f42; helo=mail-qv1-xf42.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=SrHNzrCA; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YZrt6W24zDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:49:02 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id p3so415608qvq.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 20:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3A82Tm6v/IKdXzlz1x166tlvvtPigj+LiMK7gr2ad8=;
 b=SrHNzrCAmssYq4JPdHbvjy/uNh0otDPdaeUYLhK6N1FZtMOVeNPL2MCNVMLeAT/j3B
 luVLvPkjt4oeynQQYFLozpy3gg58sLqjVeuuPewwHP6+aRyAoFFK4bxm5ph8Ks3uYtjX
 p7MK1f0wFfrVwZGhiWr3Ab7BGcdMaoGRzozL2Kk+vRRLEQJvPs3gT4b4Hg7OnzjATPDB
 +4XsgJeDkSCnf+y55h7aBEztRDdbBs/w9o6H4dFl47YNIGbg9omRnk1O2QHNEALknYQ1
 draaEos8IIoGzuXT978acsZO4m8hdtAcRnxx5NMDqqIUV9j3IiEA/xnFwJU/GY3Tr9tn
 ULkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3A82Tm6v/IKdXzlz1x166tlvvtPigj+LiMK7gr2ad8=;
 b=UHv1HR0nVdAz35q6BeJjxFMuVt4z9MGnsCNq0B/fYTob7wwV9VwGaTYFo2c8AXD1Iy
 2eLE0jTY9bpz+heFVHDoVIUwVSLRr+kyexJr/4AFeF0QmGq0NVOA6g5Mz58+Nn9LMdbs
 IXKAoJtQXuEr3/fkoTHSjngLNQqIeRq7DBo7nDN0gJv1+w3FHWQ7xd+K5/BTtKQraKVZ
 JX8hTjhP5TGjrcl8Cji09suDcV6eOoak85PEEiWbDDMkyVoO3nu5KJv24m3rH74O0WDT
 ZjhebNvXaocJlhVdTO6cKD9K2aTo/xjIHsDBKQToYKaJjQiFA+zp1SDTx7Fi9NeYiOF1
 9idA==
X-Gm-Message-State: ANhLgQ3qCLv7H0TsEDxPQrWbV+dbk1e8jSvYI5tmaGmJua7sICP3hcYb
 sCOZD9Xw4rMr+Y+IWX+RMqbGmQ==
X-Google-Smtp-Source: ADFU+vvQgccczFThDKKrhdBq0sChFDblkmCyADzO4o8oCg8ZtNgK7xG/FRwurPZwlHpIbW/Z4/bbZg==
X-Received: by 2002:a05:6214:907:: with SMTP id
 dj7mr1361299qvb.245.1583470138296; 
 Thu, 05 Mar 2020 20:48:58 -0800 (PST)
Received: from ovpn-121-18.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id f189sm11207988qke.90.2020.03.05.20.48.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Mar 2020 20:48:57 -0800 (PST)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/64s/pgtable: fix an undefined behaviour
Date: Thu,  5 Mar 2020 23:48:52 -0500
Message-Id: <20200306044852.3236-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
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
Cc: Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org, rashmicy@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting a power9 server with hash MMU could trigger an undefined
behaviour because pud_offset(p4d, 0) will do,

0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)

Fix it by converting pud_index() and friends to static inline
functions.

UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
shift exponent 34 is too large for 32-bit type 'int'
CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
Call Trace:
dump_stack+0xf4/0x164 (unreliable)
ubsan_epilogue+0x18/0x78
__ubsan_handle_shift_out_of_bounds+0x160/0x21c
walk_pagetables+0x2cc/0x700
walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
(inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
ptdump_check_wx+0x8c/0xf0
mark_rodata_ro+0x48/0x80
kernel_init+0x74/0x194
ret_from_kernel_thread+0x5c/0x74

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Qian Cai <cai@lca.pw>
---

v3: convert pud_index() etc to static inline functions.
v2: convert pud_offset() etc to static inline functions.

 arch/powerpc/include/asm/book3s/64/pgtable.h | 23 ++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..bd432c6706b9 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -998,10 +998,25 @@ extern struct page *pgd_page(pgd_t pgd);
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
 #define pgd_page_vaddr(pgd)	__va(pgd_val(pgd) & ~PGD_MASKED_BITS)
 
-#define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
-#define pud_index(address) (((address) >> (PUD_SHIFT)) & (PTRS_PER_PUD - 1))
-#define pmd_index(address) (((address) >> (PMD_SHIFT)) & (PTRS_PER_PMD - 1))
-#define pte_index(address) (((address) >> (PAGE_SHIFT)) & (PTRS_PER_PTE - 1))
+static inline unsigned long pgd_index(unsigned long address)
+{
+	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
+}
+
+static inline unsigned long pud_index(unsigned long address)
+{
+	return (address >> PUD_SHIFT) & (PTRS_PER_PUD - 1);
+}
+
+static inline unsigned long pmd_index(unsigned long address)
+{
+	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
+}
+
+static inline unsigned long pte_index(unsigned long address)
+{
+	return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
+}
 
 /*
  * Find an entry in a page-table-directory.  We combine the address region
-- 
2.21.0 (Apple Git-122.2)

