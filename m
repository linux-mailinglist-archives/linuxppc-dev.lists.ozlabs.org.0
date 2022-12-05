Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6C642D7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqJH2vtWz3bgr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:49:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=ye.xingchen@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 437 seconds by postgrey-1.36 at boromir; Mon, 05 Dec 2022 22:52:27 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQhk30gjkz308w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 22:52:25 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NQhYb1pcQz1FhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 19:45:07 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4NQhY872gmz9vj0S
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 19:44:44 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4NQhXP4145z9tyD7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 19:44:05 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NQhXJ09gXz8RTZL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 19:44:00 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NQhX55pftz4y0v9;
	Mon,  5 Dec 2022 19:43:49 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl2.zte.com.cn with SMTP id 2B5Bhifj079670;
	Mon, 5 Dec 2022 19:43:45 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Mon, 5 Dec 2022 19:43:47 +0800 (CST)
Date: Mon, 5 Dec 2022 19:43:47 +0800 (CST)
X-Zmail-TransId: 2af9638dd973592eef03
X-Mailer: Zmail v1.0
Message-ID: <202212051943476482106@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <broonie@kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBBU29DOiBpbXgtYXVkbXV4OiB1c2Ugc3lzZnNfZW1pdCgpIHRvIGluc3RlYWQgb2Ygc2NucHJpbnRmKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B5Bhifj079670
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 638DD9C2.000 by FangMail milter!
X-FangMail-Envelope: 1670240707/4NQhYb1pcQz1FhT/638DD9C2.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638DD9C2.000/4NQhYb1pcQz1FhT
X-Mailman-Approved-At: Tue, 06 Dec 2022 03:48:37 +1100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, xiubo.lee@gmail.com, shengjiu.wang@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/fsl/imx-audmux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 50b71e5d4589..582f1e2431ee 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -75,8 +75,7 @@ static ssize_t audmux_read_file(struct file *file, char __user *user_buf,
 	if (!buf)
 		return -ENOMEM;

-	ret = scnprintf(buf, PAGE_SIZE, "PDCR: %08x\nPTCR: %08x\n",
-		       pdcr, ptcr);
+	ret = sysfs_emit(buf, "PDCR: %08x\nPTCR: %08x\n", pdcr, ptcr);

 	if (ptcr & IMX_AUDMUX_V2_PTCR_TFSDIR)
 		ret += scnprintf(buf + ret, PAGE_SIZE - ret,
-- 
2.25.1
