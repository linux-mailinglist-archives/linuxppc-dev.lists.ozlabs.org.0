Return-Path: <linuxppc-dev+bounces-17624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEKoIOowp2mbfgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:05:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4C1F59FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:05:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQQGs5KqVz3bp0;
	Wed, 04 Mar 2026 06:05:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772564709;
	cv=none; b=mPxhs9zwDBe6Xv1JmtygT/FMRiBJXO3X9+MG78oegKkKQ6palmIobOvQX5xQd8gmtbefC1Gwctg2QLdriDr5qTNTzromTgWV9LoTi9gOmPJSZZK6qRRH3UHKiIZmOFBAd/lVpYuyvU2fY4CyxcTQwn/+PnI2FFIxlnBD4GV4Xbzd8CbZWetga63exboUs+wxou9ZD8l3hw16aFC/34wBlvf7gua5/NelYZaqOU6dsLdGaUzX5ioBoKxYRWMINxFJchYboYu+5iRjr8A28eI0PYdp/wV4yoa0MBwuVePkEhRHsjKfuqgK57DQuUayMpsN58PTa5h14d38il3zm5KYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772564709; c=relaxed/relaxed;
	bh=B4BwMR4oD6CjLgpJw/2L0XIBssousKZKCcfS5hnzO3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JUSqgcHrMq84TTL2BfMRHr7YAVgiXG0z/HoI4VTGF22gsJ0mYo4n5rGaP0GEkgaStycWF+HrU2/RQl8ex2Sof0Qzl8eaaDqNtQnpcFgPC5HJYI7YJ0vnJz6WJPxkHCUODt2oCu/gnxFrxfCgpaWeAfR5yWtKKatIXBtFAt0Gxllnyiwlzh1sZSst8y+JaNnoLZ3iqeLAR0w2C5Gjqc5BGBT/tN0NReGYG3NHXmPNmwz8QN4an1nbUmyyAmZQWuzh66t0b+PdAVZ6VYQm7WUXpcT4Y5hGIKXLM+Du6+6rUu+Fux4vtwMEE2prUoVO6zAQBq1aaihcQL9yow6ai+BIdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDnLgV/e; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDnLgV/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQQGr2p0xz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:05:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FCBA600AD;
	Tue,  3 Mar 2026 19:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 487AFC116C6;
	Tue,  3 Mar 2026 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772564705;
	bh=I3C57r6azO48yZzyNuNe6/kxRiFpeGaZXr+2V6WEkW0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pDnLgV/eazlr7UIzXY5QmohbXFxsQJxtz7+ZZPC38mYnSoGp8GFSzzuJ2qaBqHzcz
	 7C94DJji/wKEVqXfvrzBroc3S3nXCrjAcwfqle970eHfTu5lz8noGePIGu38uW8etC
	 6HzqB+bAK8HkOn90Xls2p33QM/BAIMRroKre/oCxFuNTpPAxRoALpdobcsusWgV6D8
	 dG3LuKiyWeOuAH+kUYDh9iWhCmZQXdTttq6fC+B1yHs1fkaSRck9DwScBs/KHQjPQU
	 zGsP4VARUR1UQ8/uI6nrdJvJvHIscpeuNjmSmZJ76ySdambQHviyujZG9xhfBq2Yxz
	 aFDuPDQQffUoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D380EDEBE6;
	Tue,  3 Mar 2026 19:05:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 20:05:00 +0100
Subject: [PATCH RESEND] powerpc: DTS: mpc8313erdb: Add
 timer@*/clock-frequency properties
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
Message-Id: <20260303-timer-clock-v1-1-68336d3161f3@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772564704; l=1719;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=wToNi3p+7oH/fZkL7rybDw1OVJ8Mht3DHd2zANSoxwc=;
 b=1Y5vaGMTDSwDyTMDt6bOuEi0MTG9ayKBdBMjYkAgwux3aVe+bMocyRNbMftjIT1i5M06PHR/u
 RYochVODplxD1OWG3jKHme3675+QXAlXsjdItXL+fq+xU5SFOARPLdr
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 80D4C1F59FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17624-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:j.ne@posteo.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,0.0.2.88:email,0.0.1.244:email]
X-Rspamd-Action: no action

From: "J. Neuschäfer" <j.ne@posteo.net>

The recent formalization of the fsl,gtm schema has shown that
mpc8313erdb.dts doesn't provide the clock-frequency property on timer
nodes. A few different expectations collide here:

 - Both the binding and the driver for the Freescale global timer module
   (GTM) have always required clock-frequency, since their addition in
   2008 (v2.6.26-rc5-236-g83ff9dcf375c41).
 - mpc8313erdb.dts never had the timer@*/clock-frequency property, since
   the timer nodes were added in 2008 (v2.6.26-3343-g574366128db29e)

I suspect the way this worked was that the bootloader filled these
values when booting on an MPC8313 board.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505300136.HOpO5P6y-lkp@intel.com/
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8313erdb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8313erdb.dts b/arch/powerpc/boot/dts/mpc8313erdb.dts
index 09508b4c8c7309..0bddc3be9e62f8 100644
--- a/arch/powerpc/boot/dts/mpc8313erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8313erdb.dts
@@ -308,6 +308,7 @@ gtm1: timer@500 {
 			reg = <0x500 0x100>;
 			interrupts = <90 8 78 8 84 8 72 8>;
 			interrupt-parent = <&ipic>;
+			clock-frequency = <0>; /* filled by bootloader */
 		};
 
 		timer@600 {
@@ -315,6 +316,7 @@ timer@600 {
 			reg = <0x600 0x100>;
 			interrupts = <91 8 79 8 85 8 73 8>;
 			interrupt-parent = <&ipic>;
+			clock-frequency = <0>; /* filled by bootloader */
 		};
 	};
 

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250625-timer-clock-e03fa9e835c8

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



