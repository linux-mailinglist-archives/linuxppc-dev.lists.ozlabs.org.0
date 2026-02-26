Return-Path: <linuxppc-dev+bounces-17235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BGyM0X0n2kyfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:20:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2A1A1C6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2t91zGHz2yrW;
	Thu, 26 Feb 2026 18:20:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772090433;
	cv=none; b=Xk7zWbmVuPmiVtjkvXQerf1BhI8E7DoZEv6WoEX3m+pmkirgYAK9K7qRF4+/IGBtsv/nKQbU+vuh2aaTJHmrIQ20jhD7KgcL2NxEX19qXgWyJEUcm4Xub9iPjytcBKwEGoz9kJ8MyRMMYVkZd5iWS70OhKEFyT0hluoAkJT5Q0WG4Z4zSWRsMPdRKNrB4qAbaZeu1q3hoE594xiOqDtzL9e4uQ01V8WWs3gT0BJhQ09qLQnsfhz3x7LKc1G+3h6gQXUAukuCyUrxvHmT1liwyTRoQhoEYP8TNQF6PqoThlmHUd9XaGaRsFAz7CyEyGP2HlweaQRnYzeAiwa+uxDmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772090433; c=relaxed/relaxed;
	bh=QC+1BgJmLhkk1Hm+HkACcZg3As2D0rDobBsUyFX/J6Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C1G5YaD8lR5KsXE7crLY/ONkz04BadKbjGEPSQgYxv1i+DJSQdpFIuz41dgJKb8l2dCpivx8hWc6cOkXTEg1AKfXepuXRq3rEWQFhW+fDmdS8r0s/ApumsAcJTUfqEqt609fVpTCCTgqH/5xlit0TRrAas+opPlK7nZX7MO/U8QrgO2Cfyy2HqXaMRu4Ng1ZLr71rph6OoPnff2TAjHz/aNoEFxzhXA5Oo9mhvu5e87TF2Ivqi+Ei309NWA9nqFh0I5BGrDydyVG6ShDJV4D0ZaaCbFq34XPA6HlTNgZyx+i5r934ggPH3xI163C9ShcNR3jsFQXZsbzNPAIoAnrhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R6xSeAbN; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R6xSeAbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2t819Kdz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 18:20:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772090423;
	bh=+xNhFMCr+AwJ4R2ewthyRXsYeAS6MRC+DvkGWiz2Xy4=;
	h=From:Subject:Date:To:Cc:From;
	b=R6xSeAbNDvMGPqDU/utIhb/xu3nrrNnDjkWNlPyAeHVnpu6/xjE3pJJp/5RdXJ0uh
	 0D1nEPT/c9CPZOpLaU+O638k1ZA67qY3tpeXETdU1a1p0jcqd1vc4bq14cxFVIOi5h
	 jMbu0SfjRphv5Oj0K35ErXJuKmFna+F5rBR8wqBU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
Date: Thu, 26 Feb 2026 08:20:11 +0100
Message-Id: <20260226-ima-ifdef-v1-0-8b9613edbbdb@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNT3czcRN3MtJTUNF1LcwtLM4NkgzQDg1QloPqCotS0zAqwWdGxtbU
 ADAsehFsAAAA=
X-Change-ID: 20260225-ima-ifdef-978960c0f00e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772090423; l=912;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+xNhFMCr+AwJ4R2ewthyRXsYeAS6MRC+DvkGWiz2Xy4=;
 b=EXmDSldrQjH9k7r0b85aygGNholtTe9az0eoaO840iqEpDnHsz3NlQbbpTApT7423xZ3w9rGu
 uRSsU+wItAJBD1UaM5biNqLgvm3cHWR5LUeC4k6Vl70QwDNFXQQ0QmZ
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17235-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1BC2A1A1C6D
X-Rspamd-Action: no action

When configuration settings are disabled the guarded functions are
defined as empty stubs, so the check is unnecessary.

This was originally part of my CONFIG_MODULE_HASHES[0] series,
but as I am dropping IMA compatibility for now, these patches
can go in independently.

[0] https://lore.kernel.org/lkml/20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      ima: efi: Drop unnecessary check for CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
      powerpc/ima: Drop unnecessary check for CONFIG_MODULE_SIG

 arch/powerpc/kernel/ima_arch.c   | 3 +--
 security/integrity/ima/ima_efi.c | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260225-ima-ifdef-978960c0f00e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


