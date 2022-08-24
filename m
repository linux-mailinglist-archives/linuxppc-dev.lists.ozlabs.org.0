Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C059F519
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 10:22:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCJxj0c8jz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 18:22:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YjWlbqTL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail.zeus03.de (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YjWlbqTL;
	dkim-atps=neutral
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCJwP2FCgz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:21:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=k1; bh=QZSYy9ZOyYNn4Sbj+9d4hyd/rRC
	F0R9pMJ4odvD5koQ=; b=YjWlbqTLtYbUvEIgtlAow9FBUx0ubdew9ifp0+2omMx
	FhVJfSolrADooA0wev9GAqSeQvf0h1vL9Qw0sk6rhYMzYf8MEkeFpg5xZJ8w17Oc
	9zrhSfi3HRJ4MNe0KSQV6cuA7P9KPPtoejQ4CLkAHtfzSsk9WSW30CEEv2LvW2aQ
	=
Received: (qmail 2131763 invoked from network); 24 Aug 2022 10:21:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2022 10:21:31 +0200
X-UD-Smtp-Session: l3s3148p1@jehDXvjm1OcgAwDPXxw3AFlguiwjsjwa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 0/2] spi: remove "spidev" nodes from DTs
Date: Wed, 24 Aug 2022 10:21:27 +0200
Message-Id: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There were two DTs left specifying "spidev" directly. Remove them.

Wolfram Sang (2):
  ARM: dts: stm32: argon: remove spidev node
  powerpc/82xx: remove spidev node from mgcoge

 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 6 ------
 arch/powerpc/boot/dts/mgcoge.dts                 | 7 -------
 2 files changed, 13 deletions(-)

-- 
2.35.1

