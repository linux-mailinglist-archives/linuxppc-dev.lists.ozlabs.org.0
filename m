Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C36F1ED0E8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:35:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cVJl4zrbzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 23:35:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jroedel@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVGR5MqgzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:33:03 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 636FDAE92;
 Wed,  3 Jun 2020 13:33:03 +0000 (UTC)
Date: Wed, 3 Jun 2020 15:32:57 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
Message-ID: <20200603133257.GL6857@suse.de>
References: <1591181457.9020.13.camel@abdul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591181457.9020.13.camel@abdul>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>, akpm@linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hch <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> @Joerg, Could you please have a look?

Can you please try the attached patch?

diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
index 58046ddc08d0..afbab31fbd7e 100644
--- a/include/asm-generic/5level-fixup.h
+++ b/include/asm-generic/5level-fixup.h
@@ -17,6 +17,11 @@
 	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
 		NULL : pud_offset(p4d, address))
 
+#define pud_alloc_track(mm, p4d, address, mask)					\
+	((unlikely(pgd_none(*(p4d))) &&						\
+	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
+	  NULL : pud_offset(p4d, address))
+
 #define p4d_alloc(mm, pgd, address)		(pgd)
 #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
 #define p4d_offset(pgd, start)			(pgd)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7e07f4f490cb..d46bf03b804f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 		NULL : pud_offset(p4d, address);
 }
 
-static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
+static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
-
 {
-	if (unlikely(pgd_none(*pgd))) {
-		if (__p4d_alloc(mm, pgd, address))
+	if (unlikely(p4d_none(*p4d))) {
+		if (__pud_alloc(mm, p4d, address))
 			return NULL;
-		*mod_mask |= PGTBL_PGD_MODIFIED;
+		*mod_mask |= PGTBL_P4D_MODIFIED;
 	}
 
-	return p4d_offset(pgd, address);
+	return pud_offset(p4d, address);
 }
 
-#endif /* !__ARCH_HAS_5LEVEL_HACK */
-
-static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
+static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
+
 {
-	if (unlikely(p4d_none(*p4d))) {
-		if (__pud_alloc(mm, p4d, address))
+	if (unlikely(pgd_none(*pgd))) {
+		if (__p4d_alloc(mm, pgd, address))
 			return NULL;
-		*mod_mask |= PGTBL_P4D_MODIFIED;
+		*mod_mask |= PGTBL_PGD_MODIFIED;
 	}
 
-	return pud_offset(p4d, address);
+	return p4d_offset(pgd, address);
 }
 
+#endif /* !__ARCH_HAS_5LEVEL_HACK */
+
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
