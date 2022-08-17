Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E1597448
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 18:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7DKJ5R2Cz3cdb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 02:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ccHNnbQF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ccHNnbQF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7DJg13DMz3bTZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 02:40:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 781EB60DDC;
	Wed, 17 Aug 2022 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2407EC433B5;
	Wed, 17 Aug 2022 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660754400;
	bh=KkrryIdY2Ve2bs/hZ2Z+dNgS3oYZRsAd1ewH2lCViO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ccHNnbQFFsiz0tKZO71G5O4EaOl5jPLSluev94WXkiV1n/59tcsJQupsH/KTSIRJx
	 bnwZBufeC0bKvFx08encF69lxLVAytblB3TNtZK7gvAxNApy+MF1UJPbxkgiJOeQqJ
	 wCN0sGAYyhkIs4xSTl3ysjQt1eR1DWf903lOSNohBl36qv06RN0eAThuJmIE5cxwMz
	 riHFym1D7iKGLDCllrDhKlwbS6ymbAAm/mFjOA03Kx5Veh0cS6vgi70bY+OggHk73X
	 h0MRrHQ0p6C5Acj31iSLe9QwuXwRAdvmUQCPVzWoRkFs2ft6xwn2JNchlypP2lMOE3
	 LpoZi9djjVPdA==
Received: by pali.im (Postfix)
	id C67F42799; Wed, 17 Aug 2022 18:39:57 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH 2/2] powerpc/pci: Enable PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT by default
Date: Wed, 17 Aug 2022 18:39:27 +0200
Message-Id: <20220817163927.24453-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220817163927.24453-1-pali@kernel.org>
References: <20220817163927.24453-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It makes sense to enable CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT by default
(when possible by dependencies) to take advantages of all 256 PCI buses on
each PCI domain, like it is already on all other kernel architectures.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index df2696c406ad..0905e4807815 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -387,6 +387,7 @@ config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
 	depends on PPC32
 	depends on !PPC_PCI_OF_BUS_MAP_FILL
 	bool "Assign PCI bus numbers from zero individually for each PCI domain"
+	default y
 	help
 	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
 	  So system could have only 256 PCI buses independently of available
-- 
2.20.1

