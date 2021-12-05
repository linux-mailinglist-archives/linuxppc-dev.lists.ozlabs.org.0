Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015C468B11
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 14:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6SGZ5hZDz30RN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 00:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=59.36.128.82; helo=smtpbg604.qq.com;
 envelope-from=wangxiang@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 69 seconds by postgrey-1.36 at boromir;
 Mon, 06 Dec 2021 00:11:34 AEDT
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6Rlp1DXWz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 00:11:31 +1100 (AEDT)
X-QQ-mid: bizesmtp43t1638709778t9ucelgj
Received: from wangx.lan (unknown [218.88.126.113])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 05 Dec 2021 21:09:36 +0800 (CST)
X-QQ-SSF: 0100000000600050B000B00A0000000
X-QQ-FEAT: LNU+aC6pWiX0Ea2evqaKvOBfzY29XxGCsTq33aafLBeBBVEFXO02z1pxw8XC1
 Y26habIse4EFBQ5ev50A8izqZkKjiyXEcRZC0k/9kcC4AZ2sjjcqNCrnMIwax8pBYTehvNi
 UWUDpZiIFT06K7cMy7qhyR9BwknnWogbWqoTkKCYPm4G59SUevZS91yUf+PZdp/ZbimBgA7
 2W+gDCnu2WATQoKl4VWuGMg9ejoqRiCtqYGjzKWFmjIxGD9TWpV9jXwzIxdOtwGh6DDfNU+
 FZj/TQvgpg4orIeJeQmBbXuiFeTpHpCbEnVRNRhsAMwikx0YqvRSs4MccA2Z+7Zo4F/m5Fi
 xmOBi7qR66OBLYwhbFYmNDJk/B9nw==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh:add const to of_device_id
Date: Sun,  5 Dec 2021 21:09:25 +0800
Message-Id: <20211205130925.28389-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
X-Mailman-Approved-At: Mon, 06 Dec 2021 00:34:26 +1100
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

struct of_device_id should normally be const

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/macintosh/mediabay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index eab7e83c11c4..b17660c022eb 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -703,7 +703,7 @@ static const struct mb_ops keylargo_mb_ops = {
  * Therefore we do it all by polling the media bay once each tick.
  */
 
-static struct of_device_id media_bay_match[] =
+static const struct of_device_id media_bay_match[] =
 {
 	{
 	.name		= "media-bay",
-- 
2.20.1

