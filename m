Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AA59A633
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:18:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8WkB5K82z3f22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 05:18:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BT30kbtw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BT30kbtw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Why05Qbz2xkS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:17:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7CF60ECD;
	Fri, 19 Aug 2022 19:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6356C433D6;
	Fri, 19 Aug 2022 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660936620;
	bh=o2xdg2Rv7BFF7s0EqoFYePZNdZZxEEpjrxSZiJdS454=;
	h=From:To:Cc:Subject:Date:From;
	b=BT30kbtwqKYX/hXb+AIqTNCjLdPWg82/lzDYYjxClWZzn9WmenyRGsHjghTYqoPNz
	 WaH7bZYWNedvwGKYJHuTPLTAJ8oAlbv1yjXbyInsNU4ZPSc3el3HkbWKADtEigEOU5
	 vVB7JnF6xsTOXsXooBUdYgJeKtUclQLnVhE32MLBm4Rf9gZMPFF2WRlRdi9UHiH2eh
	 sYdyf1PfpB/sGVB8B7zIGhAo3YKK5FKueJRJJP24FK48o/z+DVgSnkFosfaagHHNWV
	 xrI4gw0BzDsRWXi9xUwXuzGP1sX0yDSv5iGuBLqQ9QDXMo5oY8wJo+9bxQvyULLvhT
	 h6AojjkBNNeCQ==
Received: by pali.im (Postfix)
	id DDAA3761; Fri, 19 Aug 2022 21:16:56 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: [PATCH 0/7] powerpc/85xx: p2020: Create one unified machine description
Date: Fri, 19 Aug 2022 21:15:50 +0200
Message-Id: <20220819191557.28116-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
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

This patch series unifies all P2020 boards and machine descriptions into
one generic unified P2020 machine description. With this generic machine
description, kernel can boot on any P2020-based board with correct DTS
file.

Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
Kernel during booting correctly detects P2020 and prints:
[    0.000000] Using Freescale P2020 machine description

Pali Rohár (7):
  powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
  powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
  powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
  powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
  powerpc/85xx: p2020: Define just one machine description
  powerpc/85xx: p2020: Enable boards by new config option CONFIG_P2020
  powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string

 arch/powerpc/boot/dts/turris1x.dts            |   2 +-
 arch/powerpc/platforms/85xx/Kconfig           |  22 ++-
 arch/powerpc/platforms/85xx/Makefile          |   1 +
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  25 +--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  46 +-----
 .../platforms/85xx/{mpc85xx_ds.c => p2020.c}  | 144 +++++++-----------
 6 files changed, 75 insertions(+), 165 deletions(-)
 copy arch/powerpc/platforms/85xx/{mpc85xx_ds.c => p2020.c} (53%)

-- 
2.20.1

