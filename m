Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF981ADD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 04:55:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swc5x4nt6z3ccf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 14:55:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=liyouhong@kylinos.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 367 seconds by postgrey-1.37 at boromir; Thu, 21 Dec 2023 13:42:29 AEDT
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwZTd3WXRz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 13:42:28 +1100 (AEDT)
X-UUID: c2713873dbb3464a955e73b98afabf69-20231221
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:90a79e35-9fc6-466c-ab94-6681d1db0fed,IP:25,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:28
X-CID-INFO: VERSION:1.1.33,REQID:90a79e35-9fc6-466c-ab94-6681d1db0fed,IP:25,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_HamU,ACTION
	:release,TS:28
X-CID-META: VersionHash:364b77b,CLOUDID:cdde512e-1ab8-4133-9780-81938111c800,B
	ulkID:231221103511OABB4G6M,BulkQuantity:0,Recheck:0,SF:66|38|24|16|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_USA,TF_CID_SPAM_FSD
X-UUID: c2713873dbb3464a955e73b98afabf69-20231221
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <liyouhong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1028198504; Thu, 21 Dec 2023 10:35:10 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 6805B16001CD7;
	Thu, 21 Dec 2023 10:35:10 +0800 (CST)
X-ns-mid: postfix-6583A45E-29320911
Received: from localhost.localdomain (unknown [172.20.185.164])
	by node4.com.cn (NSMail) with ESMTPA id 6C42C16001CD7;
	Thu, 21 Dec 2023 02:35:09 +0000 (UTC)
From: YouHong Li <liyouhong@kylinos.cn>
To: balbi@kernel.org,
	leoyang.li@nxp.com
Subject: [PATCH] drivers/usb/gadget/udc: Fix spelling typo in comments(reqest->request)
Date: Thu, 21 Dec 2023 10:34:25 +0800
Message-Id: <20231221023425.1316397-1-liyouhong@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 Dec 2023 14:55:11 +1100
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
Cc: liyouhong <liyouhong@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: liyouhong <liyouhong@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: liyouhong <liyouhong@kylinos.cn>

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/u=
dc/fsl_udc_core.c
index ee5705d336e3..97932278e381 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -1360,7 +1360,7 @@ static void ch9getstatus(struct fsl_udc *udc, u8 re=
quest_type, u16 value,
 	udc->ep0_dir =3D USB_DIR_IN;
 	/* Borrow the per device status_req */
 	req =3D udc->status_req;
-	/* Fill in the reqest structure */
+	/* Fill in the request structure */
 	*((u16 *) req->req.buf) =3D cpu_to_le16(tmp);
=20
 	req->ep =3D ep;
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/ud=
c/mv_udc_core.c
index d888dcda2bc8..78308b64955d 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -1451,7 +1451,7 @@ udc_prime_status(struct mv_udc *udc, u8 direction, =
u16 status, bool empty)
=20
 	req =3D udc->status_req;
=20
-	/* fill in the reqest structure */
+	/* fill in the request structure */
 	if (empty =3D=3D false) {
 		*((u16 *) req->req.buf) =3D cpu_to_le16(status);
 		req->req.length =3D 2;
--=20
2.34.1

