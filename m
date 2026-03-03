Return-Path: <linuxppc-dev+bounces-17593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEWuHKcEp2k7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:56:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E01F30EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQL4z3TZ3z3bnr;
	Wed, 04 Mar 2026 02:56:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772553379;
	cv=none; b=K9BCwOeo5BewEszGSiPIfEDMpqUmIRDUrgsQFxig+UhWCpvtp3MmAnPVdS3iatc90hs8DRQKHeVIlvYKF/CjkVeLJ2oWHyHMeyCDWXOdMDGulD57ps4d4ge6bT+VnCKsPDeUbgD7MRKfCLr8CPR6Vu8ph1xmFtSQ6VKxdnFZh+iMymOJiF4BLIo4iyxvyyxeNdwuPno+DEbCtQlOnZT+DTGL/b5SomfW5z9+mVTJcxu7rSd58WM9DA4V8wkRNkQ/yiT20f4cz2vW9pKTfwJ4jLQ2zzGQ7xPaBDBVaQiKiBwgFHbbWMRYw69RCnrm2pbYc9WM+e+uxao2qbev2Ttf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772553379; c=relaxed/relaxed;
	bh=4h5+3bKTN11IOZSBV1mqZbsTTr/Iuc2p6rpFpzCxLqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JnzRPLSH4AqY6kwoyc/fwJQedRBTlf/Mb8LqkjAqk8ptfCegIii7LWkrHAx1JL8y7epT1nT/3VtSVn4F6idQGicq9SsjJ77HQwZq9JLUNyJyTQ2RT1r447yyYPbnmSLyWn4rrTzYIU2ztjO5cULhzfIWZ3htdhAy3HIu7zLwlcGuD0Dd87NzNKF+GlCpoSp9gDUB+Y/MabBngsIU1R9H5Rh23J7QyDqsxyVNFNGych4hRyfadkjVtkTl38FhHvIYJPMnifac3izOh63dhysexSvLsPSdFVGC10eod/b4SlAyXTFQh+ZP+Su5x+KrX0SDDFiyLKQ6h7/JdmO2w3gaXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZS1wsIh; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZS1wsIh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQL4x5Ls7z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:56:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF0C044306;
	Tue,  3 Mar 2026 15:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88A57C116C6;
	Tue,  3 Mar 2026 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553375;
	bh=fUkVEt37qe1gURrE3d9KXx2gPIEAZ+XnPWTBFAz1GO4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PZS1wsIhn3SUMoipJF7dKNENftic2nTZ+kpfaCs0EyBhBMeKS0hw7vX3KusyZSwNq
	 aMQFznjfhVs7bhrPSYOftyGuft0xlkSVrsfAA9czcLEJqQTR4ppY/3IafRMHEPLkTt
	 L9u0sYXgxKoXYFK0ZHkMpCKH7DPH4HAei+phgllNuX7rIZ2FuMxZ2IBO/n9mKaH+0h
	 rk0HJ+xgJ5wBraFgTQ199J0UvlCSfGdtTeHN3z5HUx5pSl/DkKT3IEG+vZkuWAnfn4
	 zpbuDohaFIxk+tBDDzSqaP+JNW9skBiwFQMUajBC19KyQiaEzJ1cl+xWfVsJ9DwMJ1
	 LvmYYazmt30Wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9F6EDA690;
	Tue,  3 Mar 2026 15:56:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:55:12 +0100
Subject: [PATCH RESEND] powerpc: dts: Build devicetrees of enabled
 platforms
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-mpc83xx-dtb-v1-1-592d27492019@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772553374; l=7146;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=CkVxARSB1O5d1mScjoKsc+hQuvvb6x7rvigR+ALb7dM=;
 b=WXQidq5liZ9Y9AvQv/xSN+9zsMQu3ZLjQWfBAlKLHyG/PTB0NhzaP1YtEBQUCA93D7sPR8W5B
 z8KQTKEb8NBDib8uy95HNfmx+ym00cNv+Q8J6Q461HDZ7/kR/+CtMBt
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7E6E01F30EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17593-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:replyto,posteo.net:email,posteo.net:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

From: "J. Neuschäfer" <j.ne@posteo.net>

Follow the same approach as other architectures such as Arm or RISC-V,
and build devicetrees based on platforms selected in Kconfig. This makes
it unnecessary to use CONFIG_OF_ALL_DTBS on PowerPC in order to build
DTB files.

This makes it easier to use other build and test infrastructure such as
`make dtbs_check`, and is a first step towards generating FIT images
that include all the relevant DTBs with `make image.fit`.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
A similar patch was previously posted as:

  [PATCH 09/19] powerpc: boot: Build devicetrees when CONFIG_MPC831x=y
  https://lore.kernel.org/lkml/20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net/
---
 arch/powerpc/boot/dts/Makefile     | 155 +++++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/Makefile | 100 ++++++++++++++++++++++++
 2 files changed, 255 insertions(+)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 0cd0d8558b475c..2fd1e24b7aee6c 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -3,3 +3,158 @@
 subdir-y += fsl
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+# PPC44x platforms
+dtb-$(CONFIG_PPC44x_SIMPLE) += \
+	arches.dtb \
+	bamboo.dtb \
+	bluestone.dtb \
+	glacier.dtb \
+	eiger.dtb \
+	katmai.dtb \
+	rainier.dtb \
+	redwood.dtb \
+	sequoia.dtb \
+	taishan.dtb \
+	yosemite.dtb \
+	icon.dtb
+dtb-$(CONFIG_EBONY) += \
+	ebony.dtb
+dtb-$(CONFIG_SAM440EP) += \
+	sam440ep.dtb
+dtb-$(CONFIG_WARP) += \
+	warp.dtb
+dtb-$(CONFIG_ISS4xx) += \
+	iss4xx.dtb \
+	iss4xx-mpic.dtb
+dtb-$(CONFIG_CANYONLANDS) += \
+	canyonlands.dtb
+dtb-$(CONFIG_CURRITUCK) += \
+	currituck.dtb
+dtb-$(CONFIG_AKEBONO) += \
+	akebono.dtb
+dtb-$(CONFIG_FSP2) += \
+	fsp2.dtb
+
+# Embedded 6xx platforms
+dtb-$(CONFIG_LINKSTATION) += \
+	kuroboxHG.dtb \
+	kuroboxHD.dtb
+dtb-$(CONFIG_STORCENTER) += \
+	storcenter.dtb
+dtb-$(CONFIG_PPC_HOLLY) += \
+	holly.dtb
+dtb-$(CONFIG_GAMECUBE) += \
+	gamecube.dtb
+dtb-$(CONFIG_WII) += \
+	wii.dtb
+dtb-$(CONFIG_MVME5100) += \
+	mvme5100.dtb
+
+# MPC8xx platforms
+dtb-$(CONFIG_MPC885ADS) += \
+	mpc885ads.dtb
+dtb-$(CONFIG_MPC86XADS) += \
+	mpc866ads.dtb
+dtb-$(CONFIG_PPC_EP88XC) += \
+	ep88xc.dtb
+dtb-$(CONFIG_PPC_ADDER875) += \
+	adder875-redboot.dtb \
+	adder875-uboot.dtb
+dtb-$(CONFIG_TQM8XX) += \
+	tqm8xx.dtb
+
+# MPC512x platforms
+dtb-$(CONFIG_MPC5121_ADS) += \
+	mpc5121ads.dtb
+dtb-$(CONFIG_MPC512x_GENERIC) += \
+	mpc5125twr.dtb \
+	ac14xx.dts
+dtb-$(CONFIG_PDM360NG) += \
+	pdm360ng.dtb
+
+# MPC5200 platforms
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += \
+	a3m071.dtb \
+	a4m072.dtb \
+	charon.dtb \
+	cm5200.dtb \
+	digsy_mtc.dtb \
+	motionpro.dtb \
+	mucmc52.dtb \
+	o2d.dtb \
+	o2d300.dtb \
+	o2dnt2.dtb \
+	o2i.dtb \
+	o2mnt.dtb \
+	o3dnt.dtb \
+	pcm030.dtb \
+	pcm032.dtb \
+	tqm5200.dtb \
+	uc101.dtb
+dtb-$(CONFIG_PPC_LITE5200) += \
+	lite5200.dtb \
+	lite5200b.dtb
+dtb-$(CONFIG_PPC_MEDIA5200) += \
+	media5200.dtb
+
+# MPC82xx platforms
+dtb-$(CONFIG_EP8248E) += \
+	ep8248e.dtb
+dtb-$(CONFIG_MGCOGE) += \
+	mgcoge.dtb
+
+# MPC83xx platforms
+dtb-$(CONFIG_MPC830x_RDB) += \
+	mpc8308rdb.dtb \
+	mpc8308_p1m.dtb
+dtb-$(CONFIG_MPC831x_RDB) += \
+	mpc8313erdb.dtb \
+	mpc8315erdb.dtb
+dtb-$(CONFIG_MPC832x_RDB) += \
+	mpc832x_rdb.dtb
+dtb-$(CONFIG_MPC834x_ITX) += \
+	mpc8349emitx.dtb \
+	mpc8349emitxgp.dtb
+dtb-$(CONFIG_ASP834x) += \
+	asp834x-redboot.dtb
+dtb-$(CONFIG_MPC836x_RDK) += \
+	mpc836x_rdk.dtb
+dtb-$(CONFIG_KMETER1) += \
+	kmeter1.dtb
+dtb-$(CONFIG_MPC837x_RDB) += \
+	mpc8377_rdb.dtb \
+	mpc8378_rdb.dtb \
+	mpc8379_rdb.dtb \
+	mpc8377_wlan.dtb
+
+# MPC85xx platforms
+dtb-$(CONFIG_STX_GP3) += \
+	stx_gp3_8560.dtb \
+	stxssa8555.dtb
+dtb-$(CONFIG_TQM85xx) += \
+	tqm8540.dtb \
+	tqm8541.dtb \
+	tqm8548.dtb \
+	tqm8548-bigflash.dtb \
+	tqm8555.dtb \
+	tqm8560.dtb
+dtb-$(CONFIG_SOCRATES) += \
+	socrates.dtb
+dtb-$(CONFIG_KSI8560) += \
+	ksi8560.dtb
+dtb-$(CONFIG_XES_MPC85xx) += \
+	xcalibur1501.dtb \
+	xpedite5200.dtb \
+	xpedite5200_xmon.dtb \
+	xpedite5301.dtb \
+	xpedite5330.dtb \
+	xpedite5370.dtb
+
+# Misc. platforms
+dtb-$(CONFIG_PPC_MICROWATT) += \
+	microwatt.dtb
+dtb-$(CONFIG_AMIGAONE) += \
+	amigaone.dtb
+dtb-$(CONFIG_PPC_PS3) += \
+	ps3.dtb
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d3ecdf14bc42e7..cc96315d4b7e33 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -1,3 +1,103 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+# MPC85xx platforms
+dtb-$(CONFIG_BSC9131_RDB) += \
+	bsc9131rdb.dtb
+dtb-$(CONFIG_BSC9132_QDS) += \
+	bsc9132qds.dtb
+dtb-$(CONFIG_C293_PCIE) += \
+	c293pcie.dtb
+dtb-$(CONFIG_MPC8536_DS) += \
+	mpc8536ds.dtb \
+	mpc8536ds_36b.dtb
+dtb-$(CONFIG_MPC85xx_DS) += \
+	mpc8544ds.dtb \
+	mpc8572ds_camp_core0.dtb \
+	mpc8572ds_camp_core1.dtb \
+	mpc8572ds_36b.dtb \
+	mpc8572ds.dtb
+dtb-$(CONFIG_MPC85xx_MDS) += \
+	mpc8568mds.dtb \
+	mpc8569mds.dtb \
+	p1021mds.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += \
+	p1020mbg-pc_32b.dtb \
+	p1020mbg-pc_36b.dtb \
+	p1020rdb_36b.dtb \
+	p1020rdb.dtb \
+	p1020rdb-pc_32b.dtb \
+	p1020rdb-pc_36b.dtb \
+	p1020rdb-pc_camp_core0.dtb \
+	p1020rdb-pc_camp_core1.dtb \
+	p1020rdb-pd.dtb \
+	p1020utm-pc_32b.dtb \
+	p1020utm-pc_36b.dtb \
+	p1021rdb-pc_32b.dtb \
+	p1021rdb-pc_36b.dtb \
+	p1024rdb_32b.dtb \
+	p1024rdb_36b.dtb \
+	p1025rdb_32b.dtb \
+	p1025rdb_36b.dtb
+dtb-$(CONFIG_P1010_RDB) += \
+	p1010rdb-pa_36b.dtb \
+	p1010rdb-pa.dtb \
+	p1010rdb-pb_36b.dtb \
+	p1010rdb-pb.dtb
+dtb-$(CONFIG_P1022_DS) += \
+	p1022ds_32b.dtb \
+	p1022ds_36b.dtb
+dtb-$(CONFIG_P1022_RDK) += \
+	p1022rdk.dtb
+dtb-$(CONFIG_P1023_RDB) += \
+	p1023rdb.dtb
+dtb-$(CONFIG_PPC_P2020) += \
+	p2020ds.dtb \
+	turris1x.dtb
+dtb-$(CONFIG_TWR_P102x) += \
+	p1025twr.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += \
+	b4420qds.dtb \
+	b4860qds.dtb \
+	cyrus_p5020.dtb \
+	kmcent2.dtb \
+	kmcoge4.dtb \
+	oca4080.dtb \
+	p2041rdb.dtb \
+	p3041ds.dtb \
+	p4080ds.dtb \
+	p5020ds.dtb \
+	p5040ds.dtb \
+	t1023rdb.dtb \
+	t1024qds.dtb \
+	t1024rdb.dtb \
+	t1040d4rdb.dtb \
+	t1040qds.dtb \
+	t1040rdb.dtb \
+	t1040rdb-rev-a.dtb \
+	t1042d4rdb.dtb \
+	t1042qds.dtb \
+	t1042rdb.dtb \
+	t1042rdb_pi.dtb \
+	t2080qds.dtb \
+	t2080rdb.dtb \
+	t2081qds.dtb \
+	t4240qds.dtb \
+	t4240rdb.dtb
+dtb-$(CONFIG_PPA8548) += \
+	ppa8548.dtb
+dtb-$(CONFIG_GE_IMP3A) += \
+	ge_imp3a.dtb
+dtb-$(CONFIG_MVME2500) += \
+	mvme2500.dtb
+
+# MPC86xx platforms
+dtb-$(CONFIG_GEF_SBC310) += \
+	gef_sbc310.dtb
+dtb-$(CONFIG_GEF_SBC610) += \
+	gef_sbc610.dtb
+dtb-$(CONFIG_GEF_PPC9A) += \
+	gef_ppc9a.dtb
+dtb-$(CONFIG_MVME7100) += \
+	mvme7100.dtb

---
base-commit: 883ca7b2ea487e5547e4728703fd04fad34f2bb9
change-id: 20260101-mpc83xx-dtb-23d98a190e23

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



