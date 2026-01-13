Return-Path: <linuxppc-dev+bounces-15637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92309D18E38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:46:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8BV2vtfz2ydn;
	Tue, 13 Jan 2026 23:46:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308386;
	cv=none; b=IKbw2XnkjCzaR9H46KmFzBfG3VcovoQlFlp7oSHXKBtG4pOgOe83x/CXbH2L8RxdjI2jX5OE4qqV4IukR6HSzGw/+n5zgiaYzgkuyQiHYr8AlmGlDklmMPKlQJZoQ3nmUXWb2i6rerCYcwy4f4iopAs/T1MZHTcCS2PFnYv6bZHi48Z/Obzx14XPhO8OHRWkNx2y7WXMciLsJr3jbTRlGhxuLCvZlicRz8NkCBBuNPkBuULa9F/Pp+ygodE/up/OiomDp4HmdtHXIhtfXt5k6LdIUclfL0YLeiAMO6xD6T9cYbVIoU277mac5aY9NmizG57TJoS1dFwTsTdq6ggg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308386; c=relaxed/relaxed;
	bh=xKWMyxqQoXw9U/ZjygYKipHCZdKBAsJ0p+MhegwGSb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHStSOIt4MyQoZY3TZWRugQ5xA2TxvJjx9gIrzkXPoQ9Hb26CqpALLuOHFSlR8vd5b44w4FQHdjTkrhMdQidlwbgQWIYUcPrpAnxWfxZlsT2++ij2HPIF2MUCq1YgQn8DHrsbXD09nJvsYxHC9ET7UEkgLlYYYI2dmnblnWw4ObB0WuWYQEwnndjVD3vXGrWXeXY1dcxymmxBoXuBRYzx9eLU3UlmTSo0pN7pijKUpdEq67iKGi+zy0MeUh5m4kNBL3zb02pD9wwJj3fO8SvVILout7RFJjQXnaNUwg2gdM3WKp+hYsP5cQER5MiZO4Vc0BUcZC+h2DTXs8+uAjRtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=m5ECJ6X/; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=m5ECJ6X/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8BT4xDJz2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=cH9hJBEevnJ49scFzUyUrs+duB8iThavsLBCgzxemds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m5ECJ6X/QaGYYVd8gwsKPP3oGytpVyG0r3Uure3LqKvDfD7fS93swFK2vKC7qzTnO
	 zFYbmk4LuDfRARPYZL9g9jAh2pluAJo1Spu3BdNBCB4MygUV9lYuGjf6mh3vf9gxTp
	 x7hqYzB44ciHVigcRi1d+0nk8Ev05d0JMTMoOKLo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:47 +0100
Subject: [PATCH v4 03/17] ima: efi: Drop unnecessary check for
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
Message-Id: <20260113-module-hashes-v4-3-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=1076;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cH9hJBEevnJ49scFzUyUrs+duB8iThavsLBCgzxemds=;
 b=CON7x2gCVyCQfJTzLvPSJLu+RVHaHl90Rmo7S6bsrPvzOetmH8vys3eBJrk7ccHlghC7itUU1
 0QyuXSdksdyD+ykU1MTXaHxR9OmHct0jSB8PawQ2bRSqkoOkmuG6Y9X
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When configuration settings are disabled the guarded functions are
defined as empty stubs, so the check is unnecessary.
The specific configuration option for set_module_sig_enforced() is
about to change and removing the checks avoids some later churn.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
2.52.0


