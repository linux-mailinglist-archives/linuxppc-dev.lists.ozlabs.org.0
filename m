Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA218655B3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Dec 2022 22:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NfcLZ5fX6z3bfy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Dec 2022 08:16:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=idHcWzvA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=idHcWzvA;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NfcKb4hPQz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Dec 2022 08:16:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4E8BCCE018A;
	Sat, 24 Dec 2022 21:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54926C433D2;
	Sat, 24 Dec 2022 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671916555;
	bh=kR/Ls8oU711kk7Apo0h6/pv5vyQu/KJ/RCK7hENF8CA=;
	h=From:To:Cc:Subject:Date:From;
	b=idHcWzvA+nF4aRpEchMBZJqvNuF60qGs8GMpj4ATQaEo82nH9kwH1BeLKqcmJywz/
	 pajDgOFp/lbNhfPtt6SppgcnjDxvs4uMtq9pcWJhGbnJWogg32lKKOzAYdt4RXNOFC
	 IHJ6GStiJOCylvh1LdbEMP6JSUXfVgDhr8kJnLxwT354KOFwZEQQ4lSwMzNoyR02e0
	 KIQHzrpHoOI9Bk06ERWkux1IH3TwjfPUsdEVbnk/LdP7bU7Scc+fd0ZXj6Vv23n38k
	 rnDA/1KYpkrFsy3ySosVlyF+RboXzXFqRVKKar+oYD4I3MLLz5Mt/8D9w01AneF/4H
	 gWtXsTcCRI8Wg==
Received: by pali.im (Postfix)
	id 67B71720; Sat, 24 Dec 2022 22:15:52 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine description
Date: Sat, 24 Dec 2022 22:14:17 +0100
Message-Id: <20221224211425.14983-1-pali@kernel.org>
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

Changes in v2:
* Added patch "p2020: Move i8259 code into own function" (separated from the next one)
* Renamed CONFIG_P2020 to CONFIG_PPC_P2020
* Fixed descriptions

Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/

Pali Rohár (8):
  powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
  powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
  powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
  powerpc/85xx: p2020: Move i8259 code into own function
  powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
  powerpc/85xx: p2020: Define just one machine description
  powerpc/85xx: p2020: Enable boards by new config option
    CONFIG_PPC_P2020
  powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string

 arch/powerpc/boot/dts/turris1x.dts        |   2 +-
 arch/powerpc/platforms/85xx/Kconfig       |  22 ++-
 arch/powerpc/platforms/85xx/Makefile      |   1 +
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  |  25 +--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  46 +-----
 arch/powerpc/platforms/85xx/p2020.c       | 193 ++++++++++++++++++++++
 6 files changed, 215 insertions(+), 74 deletions(-)
 create mode 100644 arch/powerpc/platforms/85xx/p2020.c

-- 
2.20.1

