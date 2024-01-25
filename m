Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7283BECB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 11:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLHCb5k1Gz3cYx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 21:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLHC80Ny0z2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 21:30:11 +1100 (AEDT)
X-UUID: 0f8b16b06b254827ab24561f4300281f-20240125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d351d60f-d08e-48cc-8450-7bce4e5d0dad,IP:20,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-INFO: VERSION:1.1.35,REQID:d351d60f-d08e-48cc-8450-7bce4e5d0dad,IP:20,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:df05a68e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:240125174642EFIYU8ZJ,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 0f8b16b06b254827ab24561f4300281f-20240125
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1965344753; Thu, 25 Jan 2024 17:46:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 62C7FE000EBA;
	Thu, 25 Jan 2024 17:46:41 +0800 (CST)
X-ns-mid: postfix-65B22E01-303995797
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id D0B63E000EBA;
	Thu, 25 Jan 2024 17:46:38 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] powerpc/mm/hash: Code cleanup
Date: Thu, 25 Jan 2024 17:46:36 +0800
Message-Id: <20240125094636.539372-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This part was commented in about 17 years before.
If there are no plans to enable this part code in the future,
we can remove this dead code.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/64/mmu-hash.h
index 1c4eebbc69c9..d39ec7134a78 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -731,26 +731,6 @@ struct hash_mm_context {
 #endif /* CONFIG_PPC_SUBPAGE_PROT */
 };
=20
-#if 0
-/*
- * The code below is equivalent to this function for arguments
- * < 2^VSID_BITS, which is all this should ever be called
- * with.  However gcc is not clever enough to compute the
- * modulus (2^n-1) without a second multiply.
- */
-#define vsid_scramble(protovsid, size) \
-	((((protovsid) * VSID_MULTIPLIER_##size) % VSID_MODULUS_##size))
-
-/* simplified form avoiding mod operation */
-#define vsid_scramble(protovsid, size) \
-	({								 \
-		unsigned long x;					 \
-		x =3D (protovsid) * VSID_MULTIPLIER_##size;		 \
-		x =3D (x >> VSID_BITS_##size) + (x & VSID_MODULUS_##size); \
-		(x + ((x+1) >> VSID_BITS_##size)) & VSID_MODULUS_##size; \
-	})
-
-#else /* 1 */
 static inline unsigned long vsid_scramble(unsigned long protovsid,
 				  unsigned long vsid_multiplier, int vsid_bits)
 {
@@ -764,8 +744,6 @@ static inline unsigned long vsid_scramble(unsigned lo=
ng protovsid,
 	return (vsid + ((vsid + 1) >> vsid_bits)) & vsid_modulus;
 }
=20
-#endif /* 1 */
-
 /* Returns the segment size indicator for a user address */
 static inline int user_segment_size(unsigned long addr)
 {
--=20
2.39.2

