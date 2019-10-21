Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21418DE970
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 12:28:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xXsG4hqHzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 21:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=yinbo.zhu@nxp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xXjj74CjzDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 21:21:24 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5344B2000C1;
 Mon, 21 Oct 2019 12:21:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 54E86200A4E;
 Mon, 21 Oct 2019 12:21:16 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E0BBD402E5;
 Mon, 21 Oct 2019 18:21:09 +0800 (SGT)
From: Yinbo Zhu <yinbo.zhu@nxp.com>
To: Li Yang <leoyang.li@nxp.com>,
	Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v1] usb: fsl: Remove unused variable
Date: Mon, 21 Oct 2019 18:21:52 +0800
Message-Id: <20191021102153.16435-2-yinbo.zhu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021102153.16435-1-yinbo.zhu@nxp.com>
References: <20191021102153.16435-1-yinbo.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nikhil Badola <nikhil.badola@freescale.com>, linux-usb@vger.kernel.org,
 xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 yinbo.zhu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nikhil Badola <nikhil.badola@freescale.com>

Remove unused variable td_complete

Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
Reviewed-by: Ran Wang <ran.wang_1@nxp.com>
Reviewed-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 9a05863b2876..381fdff12d4e 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -1595,14 +1595,13 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 		struct fsl_req *curr_req)
 {
 	struct ep_td_struct *curr_td;
-	int	td_complete, actual, remaining_length, j, tmp;
+	int	actual, remaining_length, j, tmp;
 	int	status = 0;
 	int	errors = 0;
 	struct  ep_queue_head *curr_qh = &udc->ep_qh[pipe];
 	int direction = pipe % 2;
 
 	curr_td = curr_req->head;
-	td_complete = 0;
 	actual = curr_req->req.length;
 
 	for (j = 0; j < curr_req->dtd_count; j++) {
@@ -1647,11 +1646,9 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 				status = -EPROTO;
 				break;
 			} else {
-				td_complete++;
 				break;
 			}
 		} else {
-			td_complete++;
 			VDBG("dTD transmitted successful");
 		}
 
-- 
2.17.1

