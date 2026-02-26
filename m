Return-Path: <linuxppc-dev+bounces-17234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCeYEEX0n2nIfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:20:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4E1A1C6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2t8743kz2yLG;
	Thu, 26 Feb 2026 18:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772090432;
	cv=none; b=gFXnw37o85JctlLor8N9ZniV7G8WLagcC2OfuwD87xz+EODxvanmOJY/fg2kyJSGEsnHfbiMEDebioQ//KwdUnmkfbqiuxc8AQc9tGaNvbvd0m0Y0Ipud4r9e7VHQVUOMrpy0CPCC8cnRArYDAf9cxLy/eqick0feZAMPNPyNf3uxfIOqgAUjE7TVBvVo4A9UrpchkAl7P69ei64vBiKMwBSPK1ljrqHakewVKNoDCEabzfEKQtCnt80JInVck1Hs3Intl0Ba+0sYAYmFUnYoWYqZ0iGW951pL5dbY2GpQY9cjVwG5kP6i1hqV3/u1wrB/6yRbL+r4F80nBgG1Y7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772090432; c=relaxed/relaxed;
	bh=cZHAXx/W3VseODjj0gBW7px+iZGdj5Ily8iw1Xk8O5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJfUNl2hdSgZITaBnWsWDsDgVmGElMqkCwnz81VaDd5T3OBM91+5f5Ntdg7xuYyusXz70bHZifJFHR5R+zrs5FAEXAOAZi5hWUwDXT243ONKMSJQx1ptI2+dM5KxxpAHYGkWF/u3206E30vq7akjdxBbPPSLoHQ2/plCf/wwdCaxmlik5+7auUxEKSbQela+Mu3Suk9Sdv63yOBxgPjunOr+qVUmJn/IQwIKxtS1queBVACRXTmneMfRgjP211OmauwaIcSCPLAxDWG1CVKg8/Rn5dd/37JPx8Ou8TJds7vQeF4uEq/jdHZVduZ2EyvDDQ8rM3BjRgkcTCIIlP7vfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=jT8yfCz3; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=jT8yfCz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2t63YkDz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 18:20:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772090423;
	bh=LFqBpkOHHrz0+82+lCKyk++cLTVpgpMp3m07f0lNCgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jT8yfCz3TIppnkqYmB8/TpSvxEhN4jrG2cAyDul0n15YBJ8ggCQjwtQPbiOOLJyG5
	 z2bxbSx07vjL/gfWaSw/nLHKjCYxrM7c8vXm9bNjbMWZwr5Uexaz49LnvE/I14mg/Z
	 jNC1mgH9K2B321H2bxFGFcA1h7hhGe45PNcWwXR4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 26 Feb 2026 08:20:12 +0100
Subject: [PATCH 1/2] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
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
Message-Id: <20260226-ima-ifdef-v1-1-8b9613edbbdb@weissschuh.net>
References: <20260226-ima-ifdef-v1-0-8b9613edbbdb@weissschuh.net>
In-Reply-To: <20260226-ima-ifdef-v1-0-8b9613edbbdb@weissschuh.net>
To: Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Aaron Tomlin <atomlin@atomlin.com>, Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772090423; l=1084;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LFqBpkOHHrz0+82+lCKyk++cLTVpgpMp3m07f0lNCgQ=;
 b=nAGuJZ+hD7tATfpRDB+PXn1L2Sppj9pwxenqRNLuGBmFSNYr51V69W6Utwz9lEKLgATOQDLvH
 kfewoqnvE0QCWYsxgMnFHPoexywWkeZBnHkIf3srxtygU9BxU3+Ur4Z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17234-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux@weissschuh.net,m:atomlin@atomlin.com,m:nsc@kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linux.ibm.com,huawei.com,gmail.com,oracle.com,paul-moore.com,namei.org,hallyn.com,ellerman.id.au,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atomlin.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 76B4E1A1C6B
X-Rspamd-Action: no action

When configuration settings are disabled the guarded functions are
defined as empty stubs, so the check is unnecessary.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 security/integrity/ima/ima_efi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/ima_efi.c
index 138029bfcce1..a35dd166ad47 100644
--- a/security/integrity/ima/ima_efi.c
+++ b/security/integrity/ima/ima_efi.c
@@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] = {
 const char * const *arch_get_ima_policy(void)
 {
 	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
-		if (IS_ENABLED(CONFIG_MODULE_SIG))
-			set_module_sig_enforced();
-		if (IS_ENABLED(CONFIG_KEXEC_SIG))
-			set_kexec_sig_enforced();
+		set_module_sig_enforced();
+		set_kexec_sig_enforced();
 		return sb_arch_rules;
 	}
 	return NULL;

-- 
2.53.0


