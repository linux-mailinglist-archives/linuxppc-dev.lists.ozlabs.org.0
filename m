Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D572C33C0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:45:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HsBP3P3MzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:45:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oD9NwKTJ"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hs984KBxzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:44:44 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id c26so19078629edt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 16:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUy17fN7770FCrI/QNupqS+ou4at1wV04TcSjndKp2g=;
 b=oD9NwKTJf5z2zrDzsi8009pHmlRtw9kWEpI1bZ5z1Tj9w5XKm++lvrwDcBtM2GoOYR
 tAfx0fsmedFy5tadWiGYRb+d5oK+l1T6ue/4JMyzKO+l59ihgiA9Bi4FRsgYNRR4YqZA
 MGhldpQR2s0y1ahkROxL4LPO6pNwrsQ5zSyjLY8jLjrpIE/h2xoXaCSF1uK058Fdby+1
 cRTVrlbB5Fxc+5SssC/A/x5r/XJFzpWYMsIuH6tsPgr1g7ISxP7Z0fUkSukxwE4PyQvJ
 vYrPtbAGZ8kbyQAvWXlVsUUnqcUfOBEQSIyb4k9yc2Q6xV8Yqs0I3G88yxl5jgPWucbK
 iXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUy17fN7770FCrI/QNupqS+ou4at1wV04TcSjndKp2g=;
 b=Jhj6Ij2yod1W9Q07/SxYk2OcdbFefEfKHO2zgpXc7a7qpEXHUbznxUi/XTGdnBNvOz
 xF3//XBY8N0FtjR9/zv7IXe7v+j+wsc5/mD2ysi4Oo2XGb7yXhHChLWz1yVqVRaaQ/Qa
 4Ps5Xvy2FLUxfZ6tueF2qE6TUwt0fhWxN7o40xEM4FB4fIxYTPW9GLaMffHDomSdKUFQ
 C0Zpz+RFYEFo64mJJUpdb6DedijQtg0ApQ7d14f7DLmNQzanUR1M5fMZyTsgU94tbaa1
 MdRe1rcmXC/GvpexeVye7lFTKBRal8b1TM0wK/xbUHLSDiZ5wmaZr3cyuxLAY4C9FI4T
 BVnQ==
X-Gm-Message-State: APjAAAXJUq/j23BT/LFQNSQrt7sXroP/ABzRXsbAB8Yhv74DG6JXBJs6
 zcdhMcf+d71v0dqfJdvTD8Q=
X-Google-Smtp-Source: APXvYqweCDTicOF+93cu952noxE9ZtNmcV/VMB+JSgKYoYKuLBG2FVMsTqn3lsN1cj2084kluUPO1w==
X-Received: by 2002:a50:9413:: with SMTP id p19mr9742843eda.224.1559605480020; 
 Mon, 03 Jun 2019 16:44:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id gu4sm137011ejb.52.2019.06.03.16.44.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 16:44:39 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v3] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
Date: Mon,  3 Jun 2019 16:44:06 -0700
Message-Id: <20190603234405.29600-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc3
In-Reply-To: <20190603221941.65432-1-natechancellor@gmail.com>
References: <20190603221941.65432-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang warns:

drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
        case IBMVSCSI_HOST_ACTION_NONE:
             ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
here
        if (rc) {
            ^~

Initialize rc in the IBMVSCSI_HOST_ACTION_UNBLOCK case statement then
shuffle IBMVSCSI_HOST_ACTION_NONE down to the default case statement and
make it return early so that rc is never used uninitialized in this
function.

Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
Link: https://github.com/ClangBuiltLinux/linux/issues/502
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Initialize rc in the case statements, rather than at the top of the
  function, as suggested by Michael.
  
v2 -> v3:

* default and IBMVSCSI_HOST_ACTION_NONE now return early from the
  function, as requested by Tyrel.

 drivers/scsi/ibmvscsi/ibmvscsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 65053daef5f7..7f66a7783209 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2109,8 +2109,8 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 
 	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	switch (hostdata->action) {
-	case IBMVSCSI_HOST_ACTION_NONE:
 	case IBMVSCSI_HOST_ACTION_UNBLOCK:
+		rc = 0;
 		break;
 	case IBMVSCSI_HOST_ACTION_RESET:
 		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
@@ -2128,8 +2128,10 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 		if (!rc)
 			rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
 		break;
+	case IBMVSCSI_HOST_ACTION_NONE:
 	default:
-		break;
+		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
+		return;
 	}
 
 	hostdata->action = IBMVSCSI_HOST_ACTION_NONE;
-- 
2.22.0.rc3

