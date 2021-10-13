Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FDD42CD9F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 00:13:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV6Ht1NP5z3c7f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:13:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=Ker72RLk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
 envelope-from=agust@denx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=Ker72RLk; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV6GT1dwVz2yPG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 09:12:33 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A991D835F5;
 Thu, 14 Oct 2021 00:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634162733;
 bh=6nMPFPuHyhN5ls8iUQT3OcQ653qjKPBIRYt3/m7YKaA=;
 h=From:To:Cc:Subject:Date:From;
 b=Ker72RLk8hNyrRSai7W0AWAcX/HaNGc+z8B79ZUl7/IumYS1OEitXv4mJuVnSDy0X
 C1afdiVchnRha75SBPOspZdh/O68e8ace0uj3KWl2aNAffQGtSlzSpGtXENXmPp3Ym
 bZy1inQMOEw4Sh1yhfYhZJr6OGV8A5jR02sJAsgUHBPj3X9DSPPId5Tdi+m1d6Q/Wr
 O8ChaXQFpA5/QzJXFrsGt9LrirvBbJoMCpdzIsyhz+m/Xh9HmAUfDPLq3MLHIpPxZ4
 /hvDcnzRUY7sQF5s7dZCge/YHDhmbtjAmCEnV65wfrWwsGfehUrEIdi8gvawigtEmH
 Sn7+SBHFKU/sA==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] Update mpc5200 dts files to fix warnings
Date: Thu, 14 Oct 2021 00:05:28 +0200
Message-Id: <20211013220532.24759-1-agust@denx.de>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes localbus, memory and pci node build warnings.
It was tested with current linux-next on digsy_mtc and tqm5200
boards.

Anatolij Gustschin (4):
  powerpc/5200: dts: add missing pci ranges
  powerpc/5200: dts: fix pci ranges warnings
  powerpc/5200: dts: fix memory node unit name
  powerpc/5200: dts: fix localbus node warnings

 arch/powerpc/boot/dts/a3m071.dts    | 12 ++++-----
 arch/powerpc/boot/dts/a4m072.dts    | 26 ++++++++++----------
 arch/powerpc/boot/dts/charon.dts    | 22 ++++++++---------
 arch/powerpc/boot/dts/cm5200.dts    |  7 ++++--
 arch/powerpc/boot/dts/digsy_mtc.dts | 24 +++++++++---------
 arch/powerpc/boot/dts/lite5200.dts  | 12 ++++-----
 arch/powerpc/boot/dts/lite5200b.dts | 14 ++++++-----
 arch/powerpc/boot/dts/media5200.dts | 28 +++++++++++----------
 arch/powerpc/boot/dts/motionpro.dts | 32 +++++++++++++-----------
 arch/powerpc/boot/dts/mpc5200b.dtsi |  8 +++---
 arch/powerpc/boot/dts/mucmc52.dts   | 38 +++++++++++++++--------------
 arch/powerpc/boot/dts/o2d.dts       | 12 +++++----
 arch/powerpc/boot/dts/o2d.dtsi      | 14 ++++++-----
 arch/powerpc/boot/dts/o2d300.dts    | 10 +++++---
 arch/powerpc/boot/dts/o2dnt2.dts    | 12 +++++----
 arch/powerpc/boot/dts/o2i.dts       |  4 +--
 arch/powerpc/boot/dts/o2mnt.dts     |  4 +--
 arch/powerpc/boot/dts/o3dnt.dts     | 12 +++++----
 arch/powerpc/boot/dts/pcm030.dts    |  8 +++---
 arch/powerpc/boot/dts/pcm032.dts    | 34 ++++++++++++++------------
 arch/powerpc/boot/dts/tqm5200.dts   | 12 ++++-----
 arch/powerpc/boot/dts/uc101.dts     | 14 ++++++-----
 22 files changed, 195 insertions(+), 164 deletions(-)

-- 
2.17.1

