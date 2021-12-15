Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FD476BB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4g90kLNz3dwC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c2JxQOI2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c2JxQOI2; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgK36C7Bz2ypV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:27 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id l8so22293223qtk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cF9xJJ2aRpPk1BscWDeTgrg2WrIfs79hMkvusGNbWYA=;
 b=c2JxQOI2xwH8ijObgEM/CThCpTN2WDSolUk5uycch4RpG3BYAyoFF2ogK+VlqeSYXg
 n/82gEwItLzvtbvyHunPV55rvyVq1nhdb0EuOiLWS5mEhoNQiiyKFEQQJNWup3Laq+88
 Sm9ST052lQxd7FjRG4n68ccrKSY7nk8y9GBvb36EE+ccjqLgZsnxlR3/yHqivY3TApwY
 cSR4dDmrV/UhUd6xcIOpJ2Z94QjZ6uqgsWm57jroQmZ6OANiD2EWHui604wytOjEwDyR
 Rj7LnwXsyTOv0y8rEVLh47VHOZUAOBwNkwbpFer9f00NpFIkoIW/MgFpVi+oECZRaacP
 SfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cF9xJJ2aRpPk1BscWDeTgrg2WrIfs79hMkvusGNbWYA=;
 b=1yV9XjdfTdMd9UFCR+q7YKj6ekV3Imc4AEDexLLbs7SMDmp0QcozYY+IszqVDW5SYP
 y/HcfpozaP5G+zRKg+TNXaiYDE21ldfh/NVSZCUFzMSwe3XPdOVY8w409YaE4tGE8b+4
 5nSsSFo0kUjmL5pO2dMUNTzefC7RcFPV1D4l7jpIX+6NL7KWbmezRGbBwUwQgq/X70OM
 8+Tf+Ld9QoN8Mi03StQABmKj6lIwitiaHDDtNYmqTvMlIPrrxTM3j1h0E3thygmb+5nZ
 VbS2gOTw4WkLZumoi+Mu/bHA/tNUdT1tU8UWY+sQtSVZvsgtfhb4v+Go/ooF+YbkFSgm
 vIEw==
X-Gm-Message-State: AOAM530d3oR0ghEAr+RQuaH44nS2f2dQ17ScitCtL2rXooG9JQhutWlR
 uLbCLjTtZu2Y+KB1xqwiRUfLqbBzW0A=
X-Google-Smtp-Source: ABdhPJw5I44i/NFByWbyBA3a0Q9+E9JzLBSPjJ2l0QTFQGdjtQE46eoDCVKEmm7ei+2JYqSfhrOd5g==
X-Received: by 2002:ac8:5c4b:: with SMTP id j11mr12813920qtj.495.1639584804772; 
 Wed, 15 Dec 2021 08:13:24 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:24 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/20] powerpc/chrp: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:31 -0500
Message-Id: <20211215161243.16396-9-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function `Enable_SRAM` defined in 'arch/powerpc/platforms/chrp' is
deserving of an `__init` macro attribute. This function is only called by
other initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/chrp/pegasos_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/chrp/pegasos_eth.c b/arch/powerpc/platforms/chrp/pegasos_eth.c
index 485cf5ef73d4..5c4f1a9ca154 100644
--- a/arch/powerpc/platforms/chrp/pegasos_eth.c
+++ b/arch/powerpc/platforms/chrp/pegasos_eth.c
@@ -113,7 +113,7 @@ static struct platform_device *mv643xx_eth_pd_devs[] __initdata = {
 
 static void __iomem *mv643xx_reg_base;
 
-static int Enable_SRAM(void)
+static int __init Enable_SRAM(void)
 {
 	u32 ALong;
 
-- 
2.25.1

