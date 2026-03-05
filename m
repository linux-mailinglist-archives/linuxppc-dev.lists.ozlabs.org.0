Return-Path: <linuxppc-dev+bounces-17769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IomBdBJqWlZ3wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 10:16:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8D20E22A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 10:15:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRP631ZgFz3c5j;
	Thu, 05 Mar 2026 20:15:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772702155;
	cv=none; b=LHDFkCgr6NdLrfjctq2817zEHzWzd79ZzLixiFGxvq1fHvFMbh3tKh9fo6hAjxRKvaReFUrb4zCLRAL7SEuTkau/R2g/+C6nCpskskpU0sLujXJdws7D+fe54skZ5KecDIwJSNtWRGEk6VcQGr3mr4Y4JluGrC6o4gEnDQ6BZRAvuAAfpSXKLWbPkuV/rxWTkV00lnuzNu3ju++lLnfETB8u2kzRtmMiA4pHmi/mkSJR3Ksf3WDVkWV4pnn04/lycPl2hAROGEdQ11nLYmvgk/ei2Vr1IHbpjF4QwF5ZHmQTfAXm5kc8+5SQtVW7phRBYkeUX05M7PrGFREN8lL0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772702155; c=relaxed/relaxed;
	bh=ud2gr6BLPKOPr+SCJ5T+42LA5qjQwOMXcIpkBTCjiQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U8MJ4FwF/9mdt/xqsUue5YTvekqGJwac38mmhSpQKhgHjEwyIVPK7e+lKXrjRai5kPM40Buz5PKo/5wzi92Lt0spEmkp/UyaxhX4zaotsnfe90d6TmMhzsK8vcfSQ4+Khzfr1jWkNZLbEmkUoBsZ9/WVEQaYWcfLsbr40UAFEtbdhfoaVwYhTNr6Qu9IE0u7ptmFJRzPL/W972r+sqZgZ5OVVLHU/Y8gDKkuQCOYBQOA83fs6wBTgMQIs0N87+TvWThBRDW4v2IH4YCL4TG25m3JSGW33gbHssm9wHw93d6AnkEAlisnj0KTnOFgdLBFU0jxhaPiJTunuyy5WPFNsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASFapruX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ASFapruX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRP616F8rz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 20:15:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99AEA4406F;
	Thu,  5 Mar 2026 09:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69BA5C19425;
	Thu,  5 Mar 2026 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772702151;
	bh=Kkuar2uSCXf6mbK+sbNpa7dI3oKtv26ZQo2UxABLQaY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ASFapruX4gJ13gBP5hDyHP6GZw2L3MzA8PqCE6Qw8Bm/ALjAndB9wJCx/o6Eq9EgH
	 umzdj1O58HLsXf5EnAcwYzypFOSqW7wb8+5oXgssLw4OUASlQ8K4kastHpYL7kh7ik
	 2G7HAhoGXxTSb9DpK+/eaCzzfNG5upOZiAgky9zyUL94IzVZla4EqUiUh4vemVxYjr
	 kg7zbxIB79chs6zLgQbsR8lcYzirroV/OnxhP5CTfp36aLarr1E3WeZ/RwgJBnEbOW
	 ScTa5Vt86PNBTkZlkW++CS4vaY/4NX+hJ7niT6YUUDiCUfd0dqYVNMn0fRKalfYy9f
	 FOj6y/vzVQyjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADCAEEF319;
	Thu,  5 Mar 2026 09:15:51 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 05 Mar 2026 10:15:38 +0100
Subject: [PATCH v2] powerpc: dts: Build devicetrees of enabled platforms
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
Message-Id: <20260305-mpc83xx-dtb-v2-1-cdb751458445@posteo.net>
X-B4-Tracking: v=1; b=H4sIALlJqWkC/1XMyw7CIBCF4VdpZi2GGdQUV30P00Uvg2VhaYAQT
 MO7i40bl/9JzrdDYG85wL3ZwXOywbq1Bp0amJZhfbKwc20gSTeJEsVrm1qVs5jjKEjNuh1QSyY
 F9bF5NjYf2qOvvdgQnX8feMLv+nNQ/zkJBYorkWkvSFqOpttciOzOK0foSykf07eXY6cAAAA=
X-Change-ID: 20260101-mpc83xx-dtb-23d98a190e23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772702150; l=9718;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=5WxZOnJ2RnhvLzP27DbvhYw+ZWyImRomywuyAQF0f/k=;
 b=h2Q+JEKbP0h0D0X2Q1BEfMgXJrHRh/eBrLicOOR2XFBOByA20z+ZDJueBhj/ZfPRA6cKQEMsR
 WsDcbZu8SQvDIPLtYSrKI762GE9OSqUwE7H5xu/lJ9yso59gsxd1BtU
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
X-Rspamd-Queue-Id: 4BC8D20E22A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17769-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
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
Changes in v2:
- Use "dtb-$(FOO) += foo.dtb" format on every line, avoid backslashes
  (suggested by Geert Uytterhoeven)
- Link to v1: https://lore.kernel.org/r/20260119-mpc83xx-dtb-v1-1-522f841290bf@posteo.net
---
 arch/powerpc/boot/dts/Makefile     | 111 +++++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/Makefile |  79 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 0cd0d8558b475c..7fce8c819d3d72 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -3,3 +3,114 @@
 subdir-y += fsl
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+# PPC44x platforms
+dtb-$(CONFIG_PPC44x_SIMPLE) += arches.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += bamboo.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += bluestone.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += glacier.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += eiger.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += katmai.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += rainier.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += redwood.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += sequoia.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += taishan.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += yosemite.dtb
+dtb-$(CONFIG_PPC44x_SIMPLE) += icon.dtb
+dtb-$(CONFIG_EBONY) += ebony.dtb
+dtb-$(CONFIG_SAM440EP) += sam440ep.dtb
+dtb-$(CONFIG_WARP) += warp.dtb
+dtb-$(CONFIG_ISS4xx) += iss4xx.dtb
+dtb-$(CONFIG_ISS4xx) += iss4xx-mpic.dtb
+dtb-$(CONFIG_CANYONLANDS) += canyonlands.dtb
+dtb-$(CONFIG_CURRITUCK) += currituck.dtb
+dtb-$(CONFIG_AKEBONO) += akebono.dtb
+dtb-$(CONFIG_FSP2) += fsp2.dtb
+
+# Embedded 6xx platforms
+dtb-$(CONFIG_LINKSTATION) += kuroboxHG.dtb
+dtb-$(CONFIG_LINKSTATION) += kuroboxHD.dtb
+dtb-$(CONFIG_STORCENTER) += storcenter.dtb
+dtb-$(CONFIG_PPC_HOLLY) += holly.dtb
+dtb-$(CONFIG_GAMECUBE) += gamecube.dtb
+dtb-$(CONFIG_WII) += wii.dtb
+dtb-$(CONFIG_MVME5100) += mvme5100.dtb
+
+# MPC8xx platforms
+dtb-$(CONFIG_MPC885ADS) += mpc885ads.dtb
+dtb-$(CONFIG_MPC86XADS) += mpc866ads.dtb
+dtb-$(CONFIG_PPC_EP88XC) += ep88xc.dtb
+dtb-$(CONFIG_PPC_ADDER875) += adder875-redboot.dtb
+dtb-$(CONFIG_PPC_ADDER875) += adder875-uboot.dtb
+dtb-$(CONFIG_TQM8XX) += tqm8xx.dtb
+
+# MPC512x platforms
+dtb-$(CONFIG_MPC5121_ADS) += mpc5121ads.dtb
+dtb-$(CONFIG_MPC512x_GENERIC) += mpc5125twr.dtb
+dtb-$(CONFIG_MPC512x_GENERIC) += ac14xx.dts
+dtb-$(CONFIG_PDM360NG) += pdm360ng.dtb
+
+# MPC5200 platforms
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += a3m071.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += a4m072.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += charon.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += cm5200.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += digsy_mtc.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += motionpro.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += mucmc52.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o2d.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o2d300.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o2dnt2.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o2i.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o2mnt.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += o3dnt.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += pcm030.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += pcm032.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += tqm5200.dtb
+dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += uc101.dtb
+dtb-$(CONFIG_PPC_LITE5200) += lite5200.dtb
+dtb-$(CONFIG_PPC_LITE5200) += lite5200b.dtb
+dtb-$(CONFIG_PPC_MEDIA5200) += media5200.dtb
+
+# MPC82xx platforms
+dtb-$(CONFIG_EP8248E) += ep8248e.dtb
+dtb-$(CONFIG_MGCOGE) += mgcoge.dtb
+
+# MPC83xx platforms
+dtb-$(CONFIG_MPC830x_RDB) += mpc8308rdb.dtb
+dtb-$(CONFIG_MPC830x_RDB) += mpc8308_p1m.dtb
+dtb-$(CONFIG_MPC831x_RDB) += mpc8313erdb.dtb
+dtb-$(CONFIG_MPC831x_RDB) += mpc8315erdb.dtb
+dtb-$(CONFIG_MPC832x_RDB) += mpc832x_rdb.dtb
+dtb-$(CONFIG_MPC834x_ITX) += mpc8349emitx.dtb
+dtb-$(CONFIG_MPC834x_ITX) += mpc8349emitxgp.dtb
+dtb-$(CONFIG_ASP834x) += asp834x-redboot.dtb
+dtb-$(CONFIG_MPC836x_RDK) += mpc836x_rdk.dtb
+dtb-$(CONFIG_KMETER1) += kmeter1.dtb
+dtb-$(CONFIG_MPC837x_RDB) += mpc8377_rdb.dtb
+dtb-$(CONFIG_MPC837x_RDB) += mpc8378_rdb.dtb
+dtb-$(CONFIG_MPC837x_RDB) += mpc8379_rdb.dtb
+dtb-$(CONFIG_MPC837x_RDB) += mpc8377_wlan.dtb
+
+# MPC85xx platforms
+dtb-$(CONFIG_STX_GP3) += stx_gp3_8560.dtb
+dtb-$(CONFIG_STX_GP3) += stxssa8555.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8540.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8541.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8548.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8548-bigflash.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8555.dtb
+dtb-$(CONFIG_TQM85xx) += tqm8560.dtb
+dtb-$(CONFIG_SOCRATES) += socrates.dtb
+dtb-$(CONFIG_KSI8560) += ksi8560.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xcalibur1501.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xpedite5200.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xpedite5200_xmon.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xpedite5301.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xpedite5330.dtb
+dtb-$(CONFIG_XES_MPC85xx) += xpedite5370.dtb
+
+# Misc. platforms
+dtb-$(CONFIG_PPC_MICROWATT) += microwatt.dtb
+dtb-$(CONFIG_AMIGAONE) += amigaone.dtb
+dtb-$(CONFIG_PPC_PS3) += ps3.dtb
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d3ecdf14bc42e7..9fd0badd89f198 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -1,3 +1,82 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+# MPC85xx platforms
+dtb-$(CONFIG_BSC9131_RDB) += bsc9131rdb.dtb
+dtb-$(CONFIG_BSC9132_QDS) += bsc9132qds.dtb
+dtb-$(CONFIG_C293_PCIE) += c293pcie.dtb
+dtb-$(CONFIG_MPC8536_DS) += mpc8536ds.dtb
+dtb-$(CONFIG_MPC8536_DS) += mpc8536ds_36b.dtb
+dtb-$(CONFIG_MPC85xx_DS) += mpc8544ds.dtb
+dtb-$(CONFIG_MPC85xx_DS) += mpc8572ds_camp_core0.dtb
+dtb-$(CONFIG_MPC85xx_DS) += mpc8572ds_camp_core1.dtb
+dtb-$(CONFIG_MPC85xx_DS) += mpc8572ds_36b.dtb
+dtb-$(CONFIG_MPC85xx_DS) += mpc8572ds.dtb
+dtb-$(CONFIG_MPC85xx_MDS) += mpc8568mds.dtb
+dtb-$(CONFIG_MPC85xx_MDS) += mpc8569mds.dtb
+dtb-$(CONFIG_MPC85xx_MDS) += p1021mds.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020mbg-pc_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020mbg-pc_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_camp_core0.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pc_camp_core1.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020rdb-pd.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020utm-pc_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1020utm-pc_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1021rdb-pc_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1021rdb-pc_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1024rdb_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1024rdb_36b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1025rdb_32b.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += p1025rdb_36b.dtb
+dtb-$(CONFIG_P1010_RDB) += p1010rdb-pa_36b.dtb
+dtb-$(CONFIG_P1010_RDB) += p1010rdb-pa.dtb
+dtb-$(CONFIG_P1010_RDB) += p1010rdb-pb_36b.dtb
+dtb-$(CONFIG_P1010_RDB) += p1010rdb-pb.dtb
+dtb-$(CONFIG_P1022_DS) += p1022ds_32b.dtb
+dtb-$(CONFIG_P1022_DS) += p1022ds_36b.dtb
+dtb-$(CONFIG_P1022_RDK) += p1022rdk.dtb
+dtb-$(CONFIG_P1023_RDB) += p1023rdb.dtb
+dtb-$(CONFIG_PPC_P2020) += p2020ds.dtb
+dtb-$(CONFIG_PPC_P2020) += turris1x.dtb
+dtb-$(CONFIG_TWR_P102x) += p1025twr.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += b4420qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += b4860qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += cyrus_p5020.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += kmcent2.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += kmcoge4.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += oca4080.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += p2041rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += p3041ds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += p4080ds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += p5020ds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += p5040ds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1023rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1024qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1024rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1040d4rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1040qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1040rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1040rdb-rev-a.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1042d4rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1042qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1042rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t1042rdb_pi.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t2080qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t2080rdb.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t2081qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t4240qds.dtb
+dtb-$(CONFIG_CORENET_GENERIC) += t4240rdb.dtb
+dtb-$(CONFIG_PPA8548) += ppa8548.dtb
+dtb-$(CONFIG_GE_IMP3A) += ge_imp3a.dtb
+dtb-$(CONFIG_MVME2500) += mvme2500.dtb
+
+# MPC86xx platforms
+dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
+dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
+dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
+dtb-$(CONFIG_MVME7100) += mvme7100.dtb

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260101-mpc83xx-dtb-23d98a190e23

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



