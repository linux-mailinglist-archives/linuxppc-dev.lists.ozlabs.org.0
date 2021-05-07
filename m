Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FE375E00
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 02:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbs8V4M3fz309S
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 10:41:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=sSLtkZJU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=sSLtkZJU; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbs7T3v4Mz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 10:40:53 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BBEFE806B6;
 Fri,  7 May 2021 12:40:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1620348048;
 bh=NBfj0fou0eb1FfgUBAqlkdxQ4abm0MgkKikiT7Vjsjs=;
 h=From:To:Cc:Subject:Date;
 b=sSLtkZJUo6ZPEtmCRaiR269hB9xNZEsYLDLEV40ITi2IS+a3bnypK1YwbUzFjGMqc
 cvamHHWvoMNPCUwkSxh4piGKFmNomj8jWRc/qSdzd25GXVA2aVwm1gdnOyu8/qz+PB
 exPpkvt677QEoI7wsqoXcAJIesCc7uBxEYzpD6kAW+PEWmO+bREG35z+rHD+BSTySt
 LgnUwvzqQe4VqWbyiVAflD9/0wBH57psvgHQVE9r5/jCE0Kp9XtwKFczBn5aDMXoRJ
 tte3KYCPQqIZKhy9M4bRSPENHR324mvjpBkwBR2t7tCIovf2J53bjdhJdJeO/WWz3E
 EFbp/UZbQTq8A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B60948c900000>; Fri, 07 May 2021 12:40:48 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by pat.atlnz.lc (Postfix) with ESMTP id 992E713ECA5;
 Fri,  7 May 2021 12:40:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 928D9283A61; Fri,  7 May 2021 12:40:48 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: wsa@kernel.org, andriy.shevchenko@linux.intel.com,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Subject: [PATCH v2 0/3] P2040/P2041 i2c recovery erratum
Date: Fri,  7 May 2021 12:40:44 +1200
Message-Id: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0
 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=LMdnaIF9TloyW3KOcEsA:9
X-SEG-SpamProfiler-Score: 0
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
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The P2040/P2041 has an erratum where the i2c recovery scheme
documented in the reference manual (and currently implemented
in the i2c-mpc.c driver) does not work. The errata document
provides an alternative that does work. This series implements
that alternative and uses a property in the devicetree to
decide when the alternative mechanism is needed.

Chris Packham (3):
  dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
  powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c
    controllers
  i2c: mpc: implement erratum A-004447 workaround

 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  7 ++
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi   | 16 ++++
 drivers/i2c/busses/i2c-mpc.c                  | 84 ++++++++++++++++++-
 3 files changed, 105 insertions(+), 2 deletions(-)

--=20
2.31.1

