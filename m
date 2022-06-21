Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F8558B6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbHD3yQ2z3c8c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=175.27.65.52; helo=smtpbg.qq.com; envelope-from=jiangjian@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 154 seconds by postgrey-1.36 at boromir; Tue, 21 Jun 2022 20:26:58 AEST
Received: from smtpbg.qq.com (smtpbg123.qq.com [175.27.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS2kV67HGz3blT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 20:26:58 +1000 (AEST)
X-QQ-mid: bizesmtp72t1655806980tsdrbdum
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jun 2022 18:22:56 +0800 (CST)
X-QQ-SSF: 0100000000700030B000B00A0000000
X-QQ-FEAT: nWwLie5Ka5lB/u0LCrQrgJeQdsW8NP4RQxcdy0y8Udl7q0tr+9AbePEJhmRFI
	bpPpoSOi2yBxTrPH2CBFtFVM3fEnvzJu20ebWGDm3yQxfa5ZfSn6uQyp/ipNZJpagpG7G+f
	DlU7qXGvvlYtcIsafpU3U5g8kJF04h4fST+yqfKK9zqEew1FUtlCkCMrWEAVXDq8NHtnyTF
	HqOiV5ff+axaMIvNpe3eZS/z6Ec5R/V+Tnk+2STg1AJCxzbcKAgpHjAE8+Ch5Zah1gSNVD6
	yLc8cymt8x1agNDi6Hn3LqH85MX5ORfJMSPlUCEb6iR17X6FVLL5qKguehzB2GWkbG5Gpqp
	IgioDTpuYm5GxCKZ5mLuSTZPgQ6Ew==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Subject: [PATCH] crypto: nx - drop unexpected word "the"
Date: Tue, 21 Jun 2022 18:22:54 +0800
Message-Id: <20220621102254.86591-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam8
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: linux-kernel@vger.kernel.org, jiangjian@cdjrlc.com, paulus@samba.org, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is an unexpected word "the" in the comments that need to be dropped

>- * The DDE is setup with the the DDE count, byte count, and address of
>+ * The DDE is setup with the DDE count, byte count, and address of

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/crypto/nx/nx-common-powernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index f418817c0f43..f34c75a862f2 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -75,7 +75,7 @@ static int (*nx842_powernv_exec)(const unsigned char *in,
 /**
  * setup_indirect_dde - Setup an indirect DDE
  *
- * The DDE is setup with the the DDE count, byte count, and address of
+ * The DDE is setup with the DDE count, byte count, and address of
  * first direct DDE in the list.
  */
 static void setup_indirect_dde(struct data_descriptor_entry *dde,
-- 
2.17.1

