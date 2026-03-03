Return-Path: <linuxppc-dev+bounces-17586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOOEOO3+pmk7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:31:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19251F2AC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQKXp0c9Yz3bnv;
	Wed, 04 Mar 2026 02:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772551913;
	cv=none; b=SWgkiv+sfHQWoeD6brQsejSYFFgHwdnCUXkpxgluPZWaXiW0NpEDoI0FqGv7GrWyrIAma0OzFARzanJFF1YNwlZY7YHRaVusRNqDo++RaQRdQrPsO79IIujA/Ffqv8LDLCt5GYUUxz67ZECmXtqaLqNauiD4pjjZ3wyHq8dq9/yL4BkqYTLmBoBhQllrTr4f0Wa85zdIE2pgK0F2kqhzmCYS3h5dKAfwNdD5jvzPvxi5Y6aKZyPc1VmOD5FkM0pWEfahEUqSaNQll0GAGCKclYX+8sqoZsecaV6sUjOkxAPL2uDK/v+Jzh9v539wL0M2zPbR6pAjVo9oQAI5F3bovA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772551913; c=relaxed/relaxed;
	bh=MmXPtIDaX454qLbUHBFn/Xgjr2Fk4zMhxWm6WTzCCyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nsfE/D4RmPNTgdnMHklwYAubOc0Xt9rW6BMztDtxb0oNLXRWpPJfalzzSdF+tPhTZTvaSYQhxHoJcujU1HwsKyDjxrjnJkr7zPn4Gb58m6cLMtZ1hd2X7nYCXHUsC5pwFYKpp2MwJfKFtMjhtS1KFSQeUAH5Vbe+2SMMJplx1AE2eV49Q8I2s1yUyqTuB42RHvb3oPQTSnlh6rlnnckKdg8NImX77XklE8uA+4z0o8jGuRnQOkSHfrb50gnaU/w1D5fMbeGCC9nlj4xtCflZ0fwVkzNKj+/KxnqSIPuuT9XgWE3GuuSXl0RLFVvjAMiNfQshq3SvJZ9axaPpmvDFNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cgKZXdw5; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cgKZXdw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQKXn2XY7z30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:31:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B6943FE1;
	Tue,  3 Mar 2026 15:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CB83C116C6;
	Tue,  3 Mar 2026 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772551911;
	bh=Q+S8UuCgn0Sp7uEWTpiDGuU3jtPHKP8BUl9sQbGfmTI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cgKZXdw5O7S5d8F95Xg3GU2U1kroCyDYwlDWd9h/k2jHSMZz51aGwU44m+QSq7pxV
	 JXuZbEZPBvvRMa+17JUsCp6zPDiBx1MvZhypelv4ihTJf6YiGOVIRqylPKCMFusBsF
	 26cbm3mYB/GfESmPdPX9Wiy69WPUZa3A/KY14XlJhJle7vtXNkkikjERhTntpuzb75
	 TUFn+BUd3uQ0z9sp9NZe8X7fw7RaDig8Eqa7/0cho7q9Q0Lg0I5tKKy+RPaY/v5qCg
	 87YCzcSepsThkabaMQN2GQc/LqPRYpjGdmTEXb+w3iKmuwUm3GWhcvBjoIKWjDUEJi
	 iydG0wlZmvGRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5200DEDA68C;
	Tue,  3 Mar 2026 15:31:51 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 03 Mar 2026 16:31:42 +0100
Subject: [PATCH] powerpc: 83xx: km83xx: Fix keymile vendor prefix
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
Message-Id: <20260303-keymile-v1-1-463a11e71702@posteo.net>
X-B4-Tracking: v=1; b=H4sIAN3+pmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNj3ezUytzMnFRdM6M0CwsjSyPjpDQzJaDqgqLUtMwKsEnRsbW1APO
 hQ5NZAAAA
X-Change-ID: 20260103-keymile-62f882923bf6
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Holger Brunck <holger.brunck@keymile.com>, Heiko Schocher <hs@denx.de>, 
 Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772551910; l=1138;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Rm4lk8+WysP9Sf46IHCnA/JZCuWDkU+j8PEcMpxO19k=;
 b=lXaauy67JDFSz/HeSMxLJ0Dww8xpDizCxKm4SOSBrzxXfhqGne+M5ux2AVVaHL2gQW8ivULGM
 yryxC8kKe8IDUDEcGnu3AjZBCTT3w5wB3z1EH7138eI8viayFAs6uRD
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
X-Rspamd-Queue-Id: F19251F2AC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17586-lists,linuxppc-dev=lfdr.de,j.ne.posteo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:holger.brunck@keymile.com,m:hs@denx.de,m:galak@kernel.crashing.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:j.ne@posteo.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,keymile.com,denx.de,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[j.ne@posteo.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:replyto,posteo.net:email,posteo.net:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

From: "J. Neuschäfer" <j.ne@posteo.net>

When kmeter.c was refactored into km83xx.c in 2011, the "keymile" vendor
prefix was changed to upper-case "Keymile". The devicetree at
arch/powerpc/boot/dts/kmeter1.dts never underwent the same change,
suggesting that this was simply a mistake.

Fixes: 93e2b95c81042d ("powerpc/83xx: rename and update kmeter1")
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/platforms/83xx/km83xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 2b5d187d9b62d5..9ef8fb39dd1b18 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -155,8 +155,8 @@ machine_device_initcall(mpc83xx_km, mpc83xx_declare_of_platform_devices);
 
 /* list of the supported boards */
 static char *board[] __initdata = {
-	"Keymile,KMETER1",
-	"Keymile,kmpbec8321",
+	"keymile,KMETER1",
+	"keymile,kmpbec8321",
 	NULL
 };
 

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260103-keymile-62f882923bf6

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



