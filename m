Return-Path: <linuxppc-dev+bounces-15628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA78D18CA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:38:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr81n2b0sz2xjb;
	Tue, 13 Jan 2026 23:38:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768307933;
	cv=none; b=Thb9qCEh/xkqkL+9oS0c8RI7Q6cUDHBHfiS12C3d2oZrteJ5XZ9njhnfNUM7VFyXa9/R4zVTECzM0bRi9PyWjFRMo69D5AePDeM6NC7hh8t3raGFvUpn3Q5WipnnDdUXWwmar6ltcJQfdgRI+DPmrJnjM9ofLmvEpr1agc0NTgdsc0T6e78kP+gd2yNB0gB+dDhIfXUGbbLCNSXU55dMTeuf2yZfkmE0DCCxulKK/0gBJL2k+VmS/LoKO+u+BAX99MKdTW9iWEU6gUR8CvHM90wX3n1C6lliC0RiuIkMrpns49gzsQ0p9uTMyV0k3uCWJ3PztJnMHIkx61c1VDyHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768307933; c=relaxed/relaxed;
	bh=M8Uuhk6Zc1zAv+Ymxa7AKJE41n6AAfs7ydHAG9bUfvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPk1j77jpN03fJgJpP88/OxYq4FChopZOwRB2TNZLgHQsYYzptHohBXb9lzbKw3RE0jxN+cVelohPAxzlefuk3Q4snKUCXXqtEH+ThKTLq1WNs/E9wgc+gpsVy2edE/rZHu0IO3LL3Ujh/d6XsoJAGdUeHs+C4gxx3mt+cb8lKxJXo0bcAUnJo/6ziV8Q34C+iCHWf8bb9/HtUz8Sv5qUFSU9YFbkl5eg+fCwzZTsj206nBjEg1rkh7A+T9FpK9dRr/pCJGA3rqnOiWzg8KjTwR2TrtWvqDTRkoqcYigOppLMuMxuChF4sD5OjOB90Cm6hPtY7pSeqS0tBVV3JEmhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=AgYCI5R9; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=AgYCI5R9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 13 Jan 2026 23:38:50 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr81k6KzNz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307861;
	bh=NC/OO27F4y33AwnsUK1UgiJc9IBnwzGy7eK0nVFHjZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AgYCI5R9LpSoJyTXMvTIAgayIlcVm6fKXJaMRcPNzD6ZChkkhpsmCspHhyvT/wRt0
	 r2A2sYDAv+HV4VO9S6NhvDe82s4Iq1jpUM2q/EUwPywnwUH/HUqYIeveQ6kcj/QULj
	 pwxGDBSlpXCztDFg/YCdbKX9Kcxw35OQdzp+Tn/c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:58 +0100
Subject: [PATCH v4 14/17] lockdown: Make the relationship to MODULE_SIG a
 dependency
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
Message-Id: <20260113-module-hashes-v4-14-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=818;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=NC/OO27F4y33AwnsUK1UgiJc9IBnwzGy7eK0nVFHjZg=;
 b=whnyma/h0t/rLvPiiVgW2QazugD64J2qmm54nGxJEUn52D2Uhg93xQhjG9IWw62Wsy/Kck9gG
 NGxmuX36RlYD9QmNa4U/SZm822fXAG+a85BnQRjLyq6/k6I3VNwuzEA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The new hash-based module integrity checking will also be able to
satisfy the requirements of lockdown.
Such an alternative is not representable with "select", so use
"depends on" instead.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 security/lockdown/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/lockdown/Kconfig b/security/lockdown/Kconfig
index e84ddf484010..155959205b8e 100644
--- a/security/lockdown/Kconfig
+++ b/security/lockdown/Kconfig
@@ -1,7 +1,7 @@
 config SECURITY_LOCKDOWN_LSM
 	bool "Basic module for enforcing kernel lockdown"
 	depends on SECURITY
-	select MODULE_SIG if MODULES
+	depends on !MODULES || MODULE_SIG
 	help
 	  Build support for an LSM that enforces a coarse kernel lockdown
 	  behaviour.

-- 
2.52.0


