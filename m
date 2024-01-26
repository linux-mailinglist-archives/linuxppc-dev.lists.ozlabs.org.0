Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D383D265
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:14:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLh8x6hQHz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 13:14:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLh8V6Fvwz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 13:14:18 +1100 (AEDT)
X-UUID: e0a20f20402d4c17a485494f5c93a1bb-20240126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c94aca0a-e81e-4bd6-9cd9-7f4a57b094fb,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.1.35,REQID:c94aca0a-e81e-4bd6-9cd9-7f4a57b094fb,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:5d391d7,CLOUDID:10f9ab8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:240126101308KTMUY66O,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|66|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: e0a20f20402d4c17a485494f5c93a1bb-20240126
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 455094102; Fri, 26 Jan 2024 10:13:06 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 129D0E000EB9;
	Fri, 26 Jan 2024 10:13:06 +0800 (CST)
X-ns-mid: postfix-65B31531-871453518
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id AB957E000EB9;
	Fri, 26 Jan 2024 10:12:59 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: jk@ozlabs.org,
	arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v2] powerpc/cell: Code cleanup for spufs_mfc_flush
Date: Fri, 26 Jan 2024 10:12:58 +0800
Message-Id: <20240126021258.574916-1-chentao@kylinos.cn>
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

This part was commented from commit a33a7d7309d7
("[PATCH] spufs: implement mfc access for PPE-side DMA")
in about 18 years before.

If there are no plans to enable this part code in the future,
we can remove this dead code.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Changes in v2:
    - Remove unnecessary label 'out'
    - Add Suggested-by label in commit msg
---
 arch/powerpc/platforms/cell/spufs/file.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/plat=
forms/cell/spufs/file.c
index 02a8158c469d..7f4e0db8eb08 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -1704,23 +1704,11 @@ static int spufs_mfc_flush(struct file *file, fl_=
owner_t id)
=20
 	ret =3D spu_acquire(ctx);
 	if (ret)
-		goto out;
-#if 0
-/* this currently hangs */
-	ret =3D spufs_wait(ctx->mfc_wq,
-			 ctx->ops->set_mfc_query(ctx, ctx->tagwait, 2));
-	if (ret)
-		goto out;
-	ret =3D spufs_wait(ctx->mfc_wq,
-			 ctx->ops->read_mfc_tagstatus(ctx) =3D=3D ctx->tagwait);
-	if (ret)
-		goto out;
-#else
-	ret =3D 0;
-#endif
+		return ret;
+
 	spu_release(ctx);
-out:
-	return ret;
+
+	return 0;
 }
=20
 static int spufs_mfc_fsync(struct file *file, loff_t start, loff_t end, =
int datasync)
--=20
2.39.2

