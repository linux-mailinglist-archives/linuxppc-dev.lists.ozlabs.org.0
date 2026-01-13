Return-Path: <linuxppc-dev+bounces-15646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0130D18EC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8Jh4t0Mz2ySB;
	Tue, 13 Jan 2026 23:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308708;
	cv=none; b=fgOxYFsTa4eMIOkYktXbekX8pzH4Kn6D8bXPW5RsHY5hEGT7VEj36JPQatr+jw3DiCdB/aZi6bDyofX50cS3AuDQLqewwAxtaJAW8HITdMPsI5v3HKGsxsL88rmUS/A2ZNXBxIp7zS/S+BwdUZYCAdGXS8Hoyh7YvxxwwGIic2t1zXVBKrwxjyO+p8yqRiw9/PEmB3DTk9NXMr8dF3bQXW/2GWx4w9ZDR9eZEufpeCl4rUc+dU/OPm7bc/L5Hk4EOzvarRxhnX3+xYR0N0qzmRQcEGZx7krz9cnq5D/kNTJTtJ4jpYjM7StIYSOQXpQuM/4Lyf1fFqLUJnN54R1qvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308708; c=relaxed/relaxed;
	bh=V7U5y8vUaJA0QCZSjAbN2Iyzb8hbj08GOYWeTDivizI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpnoL0LpKtRJwhtLduKQ28o+F6dNh2Sribx4J+MQhSy/eNA0biUsHjHfD+fKP1M2PeFAHHGQ3u2vGLELMpwlTuXidWwfR2m77qqPMrSSjSK8k8Vujqs68k7KfYxhVl6nOpoYHBy9YmLUPN37b/T+RNmqlYrrMIpDdkytvw7HnDvsaVs76mP/Kj3xzZ6B3Nw8lR+E9Rjto7jMI94dy+IAqc1xnn+eakNQ5Ntz4MtKtTq0Xp+0bcfL6ykgLiO8qcgvZ8159kFrufX+EgsE+pXzEfNC+Zpn+7SG4l9Pf1vstwU+lVIX0zFne/tx6NZDePzwsO64XGLT8pqamVGH4xI9Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R9PUdq/6; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R9PUdq/6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8Jg6Wrbz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:51:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307859;
	bh=C8ZnR8aqoKvJkB4QCMCRFoAe/2le+A5GtPBqy+Qa43c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R9PUdq/6C+yJVnO0ybvezWnXHMQKPKihc6b7mgRo1Ui/aV55w+gpn8aorgG2O0rN1
	 vtIBjPzynlpD6eesPKHWZ1oMERg8xbGy6qq+7yhu1l/iaJpRglA2TfWK7jquq3STNn
	 ovi55oV7d0liWgCuciPaYvSpgyHVHyg8xLH8qSqs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:46 +0100
Subject: [PATCH v4 02/17] powerpc/ima: Drop unnecessary check for
 CONFIG_MODULE_SIG
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
Message-Id: <20260113-module-hashes-v4-2-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
 Xiu Jianfeng <xiujianfeng@huawei.com>, Nicolas Schier <nsc@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=965;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=C8ZnR8aqoKvJkB4QCMCRFoAe/2le+A5GtPBqy+Qa43c=;
 b=fOyWYKhWQ+jNMEiBfpyKRDrc+eKQtmdIHJd/6KYHr3QI2V48g5JUNn51K2jsWWbdtlvyanJM1
 DKPnRJ2YqXVDVwecDFNjFeR+uDRGpALqpNP0f/cmiRLFo1HmKIbz5Hm
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When CONFIG_MODULE_SIG is disabled set_module_sig_enforced() is defined
as an empty stub, so the check is unnecessary.
The specific configuration option for set_module_sig_enforced() is
about to change and removing the check avoids some later churn.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/kernel/ima_arch.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index b7029beed847..690263bf4265 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -63,8 +63,7 @@ static const char *const secure_and_trusted_rules[] = {
 const char *const *arch_get_ima_policy(void)
 {
 	if (is_ppc_secureboot_enabled()) {
-		if (IS_ENABLED(CONFIG_MODULE_SIG))
-			set_module_sig_enforced();
+		set_module_sig_enforced();
 
 		if (is_ppc_trustedboot_enabled())
 			return secure_and_trusted_rules;

-- 
2.52.0


