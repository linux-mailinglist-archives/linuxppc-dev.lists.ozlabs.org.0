Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C616F843
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:59:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S69v4d91zDqwP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=KtVIqkj8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lB7vyfEX; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5mq6Z5RzDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:41:31 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 312D762B;
 Wed, 26 Feb 2020 01:36:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fIQUcfHh7QuR4
 38tK6lJLzDWB37n7jovUl45LUEKMUk=; b=KtVIqkj8BE8Oq1Gvs3Ggl43PRo0R4
 aoNpVoFyzoBlvwmSKTDntsNs50VtS0nx7BgTbT8OxNAoOHy7+pJzViU4lLUeTbSK
 /LBzVne5VH1Z7ticCINY2tONc0Iy0R8BkFAkUdq4MQclvQvqrKOitFc5MI9LAK/N
 vFAB9SShrgM3i6QMN7mYJcgz99FhWzZXhyKmk62jM2gQ99rgntUV+OGaubYTWNub
 6GcKN8JtrTTm5NUWL1VPFIddmcAPnERoAVlCKogYrymffyJeS+dNQ7hROXk2C54G
 qT5eqcJDemaAstjneLCfCKc/pBiJC+GEViG6ksfU6+AABeVkSiAkcFZ9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fIQUcfHh7QuR438tK6lJLzDWB37n7jovUl45LUEKMUk=; b=lB7vyfEX
 emymQP8r7kmsSRduPIojaa9ggvXPfJVDSmndSP/Nq2CFNaTJchQjFtXrvn7yd9lW
 wdshVGcdtwI1V6dMKzsZ7XTG+UdPJ/Yi1QyEGclOKvTMEWmBCvqf84j8WCjuDZto
 P+nvQnd0d5g/oq5loEA5Eda2dDX+ge/fhV7y4R83cqjiYBLhVUkM427vbvu8mbFh
 /JHdQ/hQtAWUCIC7SKaOsz4/IUtvZnFmvmzS6Gfgon4sWsOuRSGNY7FJQaUzPV+7
 BbbXwSZPET98IxGe3JskN+mw7ow35NJOapnsQWFF2nOFbpjKReVt2SiV5OASKNoC
 zgsX3dbkBBhOuw==
X-ME-Sender: <xms:7BFWXpB6UwXXciAZ_frGUvDNQJDIEIyipFblvhBKb-Pp_lcRhcTBVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihii
 vgepgeenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrd
 gttg
X-ME-Proxy: <xmx:7BFWXqyX5lWVOkPWQcPTyaPaUZpWFmY9CVKO52cNp10CFLg2QnMUew>
 <xmx:7BFWXuCfzaIx7gUcSuQaYFv0f0A3fMdzlu-8sYQxytmJlF8ngIvuSw>
 <xmx:7BFWXvbNERzdi04bzvbUfXtt5mNPBHYByTUjub3czi2VCUiDTca_XQ>
 <xmx:7BFWXrLELRoj-OKJU6XO711na3aC1X3by3xkEPS94KEotpYCxKOfu8q_gpY>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2093E3060F09;
 Wed, 26 Feb 2020 01:36:24 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/8] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
Date: Wed, 26 Feb 2020 17:35:48 +1100
Message-Id: <20200226063551.65363-6-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226063551.65363-1-ruscur@russell.cc>
References: <20200226063551.65363-1-ruscur@russell.cc>
MIME-Version: 1.0
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, Joel Stanley <joel@joel.id.au>,
 npiggin@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
enabled, and if you want memory protection for kernel text you'd want it
for modules too, so enable STRICT_MODULE_RWX there.

Acked-by: Joel Stanley <joel@joel.id.au>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 1b6bdad36b13..66d20dbe67b7 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -51,6 +51,7 @@ CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_PPC_MEM_KEYS is not set
 CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_STRICT_MODULE_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG_FORCE=y
-- 
2.25.1

