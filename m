Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E37410BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 14:07:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PCaFIRrN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrgLR1ZdDz3bn8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 22:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PCaFIRrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.198; helo=m12.mail.163.com; envelope-from=make_ruc2021@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 967 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 18:31:47 AEST
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrZYv16B5z306B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 18:31:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TZ63D
	hoeDCYyBIbyvSorhwvX2zStbpYvqashuoDCgeQ=; b=PCaFIRrNDL2QDhpv5cWAJ
	by/lH8bxQpMCrCbUpNXBwCr66VEGPn4PoHvA3G+XOaQgpfjFDNIbzieBYPibZpl8
	lMA+28ZcPCOvGFe7jhar7j3n+5KuMn5hHimQH3AkHCzIIUFtprEbKXprSphB5GR3
	eMbYipNr3P8JlL2jNnUhqk=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wCntAEV7JtkwE1oBA--.64150S4;
	Wed, 28 Jun 2023 16:15:27 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: leoyang.li@nxp.com
Subject: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9 udc
Date: Wed, 28 Jun 2023 16:15:11 +0800
Message-Id: <20230628081511.186850-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCntAEV7JtkwE1oBA--.64150S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1rtFyrCw43Kw4DGryUKFg_yoWfJrb_u3
	WUWrs7Wr17Ww129r17Za1Svr9293WkZ3Wkua4vqr9rAa45G3WfJryDXFs5Ca17uF43WFn5
	A3yDJ3sIkw1SqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU822MUUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFR+cC2B9nNSTkQAAsK
X-Mailman-Approved-At: Wed, 28 Jun 2023 22:05:10 +1000
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
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ma Ke <make_ruc2021@163.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We should verify the bound of the array to assure that host
may not manipulate the index to point past endpoint array.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/usb/gadget/udc/fsl_qe_udc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 3b1cc8fa30c8..f4e5cbd193b7 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -1959,6 +1959,8 @@ static void ch9getstatus(struct qe_udc *udc, u8 request_type, u16 value,
 	} else if ((request_type & USB_RECIP_MASK) == USB_RECIP_ENDPOINT) {
 		/* Get endpoint status */
 		int pipe = index & USB_ENDPOINT_NUMBER_MASK;
+		if (pipe >= USB_MAX_ENDPOINTS)
+			goto stall;
 		struct qe_ep *target_ep = &udc->eps[pipe];
 		u16 usep;
 
-- 
2.37.2

