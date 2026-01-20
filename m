Return-Path: <linuxppc-dev+bounces-16069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id miVCLxChb2nrCgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 16:36:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7D46326
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 16:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRvH3YlSz3blq;
	Tue, 20 Jan 2026 23:48:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768913291;
	cv=none; b=SIL/+eeAvRafkSOLAQIeAcG3XFZ9rOKZ822YoBounKGcJo9HSbUxJZ7PMw1zvvx3j7945rscT8OLsG5alJpKUGArf3h0Q0vT7WP5T8c8NxAktrZyZ9MV43WmuKJHytKMvBYABNPKapTBrHmkn8uRyzLeO89JuaQsfPs8FmnR0OyRwvnSFIczdSR55KfE/qFRyVgjaS3nlS7MmpUKm1/O9fWBpxSaS0o0VM8zXjPBR7u24fUIHicpBfx/OxFbzBKIL4aJNcDhZ3vrUGqXR+NkKNgZSQ7Swc6qssxmA3r88E/oRvy1XnkSOWWU3OvnAkWsdKJREOldNHvcTbHx/P3Y8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768913291; c=relaxed/relaxed;
	bh=DDDdlehoich04SeGf8Y3lJVPNJQB/+1Ym75bK+LAd1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gANFaqW1K8FB7dDTMJV79T/1AsPHOuMRvTslO/tTKBlR8QEQ3z+UfabptJ7Md8jBeRTMgEhLpmPRRnTGgWOyPuDKQHw6DL1smxC6jSK779nOIq1oCyXvBQM6fHFlmLOTDxqrXWTyznAkkLxHjrKJbYvn2LvsV9GyBD+bBRMHq4Biub6BYIG6Xq8MQ1jdo5H3r7C0HRz6/jD1uLdJrdsDt8X5cQL7qtWjux8X90o2V45CvwnJnu+XqV6yC3LLd6+cYkItrqEHhpVsELZYSae3GoU1lol2Gl2D8fnGNla0zB3CgB3fxH8gw9VrTpFfld+okGVLfuxwVzkvh2CgNyJWYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oo5m/pyp; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oo5m/pyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRvG4Q1pz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 23:48:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E42A6011E;
	Tue, 20 Jan 2026 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A92C16AAE;
	Tue, 20 Jan 2026 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913287;
	bh=1g8sv2pz/zRHP6piZAjoWu9g+IStHsCN2fmcFy1r/Iw=;
	h=From:Date:Subject:To:Cc:From;
	b=Oo5m/pypQDCsjb0l86t6yHSbb8DCsV8ylZr2UEKzPkCDUfWXVNmwlFPSkpgqVea8e
	 vBfWHuc5qi7//AQEN7RlJl3xz98M/BGM+4vayF/il/dh8gR34hRnWCCYevF19wvzXa
	 jkQ+kqEUjBrGlu82BP2NT7Gu69OgRPwd2p9qYUuzFU6xGsTOdqUeHGluifMCf2GA7y
	 EtwK+GAd3ahMGECVn9JCzk+Bg0o/Mcp5HlmoGnXnDPMkJzbO1MWRyuBEEy94IREJei
	 y2yQSwYk2iB98AH0il3H+DfWSYQeJYXw+bZf8cj6sqYdBrAmOPB6DT/izpSqWN6+Jt
	 l9sTmDSftiU3g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 13:48:04 +0100
Subject: [PATCH v2] powerpc/g5: Enable all windfarms by default
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
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-powermac-g5-config-v2-1-cd8f1c8bfbae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBBFr9LM2jGAUosr72G6IHRKJyo0YKqm4
 e5iD+DyveS/v0KmxJTh3KyQaOHMMVRQuwbcZIMn5KEyKKG0VELjHF+UHtah1+hiGNlja6TqyBw
 G3R2hDudEI7+36LWvPHF+xvTZPhb5s39zi0SJXSuMtebkpBOXG6VA931MHvpSyheCDD4stQAAA
 A==
X-Change-ID: 20251205-powermac-g5-config-69128e93d584
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16069-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DBE7D46326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The G5 defconfig is clearly intended for the G5 Powermac
series, and that should enable all the available
windfarm drivers, or the machine will overheat a short
while after booting and shut itself down, which is
annoying.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Rebased on v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20251205-powermac-g5-config-v1-1-8609aa97c1c0@kernel.org
---
 arch/powerpc/configs/g5_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 428f17b45513..2fe8ca266b5f 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -85,6 +85,8 @@ CONFIG_PMAC_SMU=y
 CONFIG_MAC_EMUMOUSEBTN=y
 CONFIG_WINDFARM=y
 CONFIG_WINDFARM_PM81=y
+CONFIG_WINDFARM_PM72=y
+CONFIG_WINDFARM_RM31=y
 CONFIG_WINDFARM_PM91=y
 CONFIG_WINDFARM_PM112=y
 CONFIG_WINDFARM_PM121=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251205-powermac-g5-config-69128e93d584

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


