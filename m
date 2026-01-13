Return-Path: <linuxppc-dev+bounces-15643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39971D18E5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:47:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8C36BgGz2yx7;
	Tue, 13 Jan 2026 23:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308415;
	cv=none; b=L9q8BaNswMErWQHqKXIeYPbIV8sZq78zXZ+BFr9WAzGjT4v0bw5Vb4exEaquA427QpmAs57y2CyrVtKl6inhMkNBz2RurC+pu7/v2b5aV/g1BnBiXQFOvncnEBEvtJinE61AkEVL6JDquES9Z6wAUIGHLUS85/kBX6wO0pRB4A7JeSlZ+wV/T61OqbtDMVb463AjiEKni98Hjsidy2u88qTGMv1zicdp9YgPG2vwYm+2KJipZsjWSDiJ5fOUIXGYLuAjivx3j1/9O2QlNTMzP3I6QNUx8j73ox+/OA9qqNELu37Ve5z+/JAlAWqC2GurHcpQ/H9ER0EwMHgBAlzfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308415; c=relaxed/relaxed;
	bh=/aC6ag1nNDmMQKdtCr4Cj4PI15G0rdprL/1nbvHgeSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9gdkyu+dIWORnk7tkrL6A0k95Hj1WCNbJA2SZHkTJ1aIayxY9P378oUSOVbT8KYhpdt8oT7uFWBJvefWW+3WtTA8m3jrC6bhiv7BU/6ek/J2OASNLGALW0fofVoMW9PJhk2tGdugQUstrmnuz8ShUU5ittlNdg1618zvAHbejauoALengCNcG+0EcoIxpnxh5C0ZoRDRZEgTFSZyZEFlgWEpwd/PYk3bL1AkMWuPEVOlpBdOlrGXTCj2uRmRUoypJqUvr/GSyyNQNzIaeNTR8w/nizStESOHTZqsqRXlaLLWqvXXfzGTZMUrnnGMA41BLXe1hikYBxswm3w0nOL4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=mSKhjy2c; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=mSKhjy2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8C30pnnz2yv0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307860;
	bh=jMY1zKU+259Wp+a3wq7CZ+K7/FJMp48oaCmjQIniFCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mSKhjy2cG0SoILQv6Sr5rIyz5sWn5E0wLY3SYbLLDS9EqPxMJhvK5dceTJALZmcP6
	 IJkkOs4Z59ynVOtBwrDVgxIv2mk6V5U9lnCDBdvLQ8fszOFsxgyMUabiC78EePjOKs
	 izVG9zxTIbRTSmJkQHf/uqmX6k7wqCIvs2VkWc/k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:28:49 +0100
Subject: [PATCH v4 05/17] module: Switch load_info::len to size_t
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
Message-Id: <20260113-module-hashes-v4-5-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=1455;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jMY1zKU+259Wp+a3wq7CZ+K7/FJMp48oaCmjQIniFCk=;
 b=DVDR4kzvvUtq8+nWgk5cczzRSYZuy7YfCXuw3SJMcR55420EdKvv7LI9IbT3Q+CEQVjFib1SB
 YS60h4NLSKWBX+FrCbwVXvEXOnGXehLwzKKNc6JZZOu+013x24N04AZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Switching the types will make some later changes cleaner.
size_t is also the semantically correct type for this field.

As both 'size_t' and 'unsigned int' are always the same size, this
should be risk-free.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/module/internal.h | 2 +-
 kernel/module/main.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index e68fbcd60c35..037fbb3b7168 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -66,7 +66,7 @@ struct load_info {
 	/* pointer to module in temporary copy, freed at end of load_module() */
 	struct module *mod;
 	Elf_Ehdr *hdr;
-	unsigned long len;
+	size_t len;
 	Elf_Shdr *sechdrs;
 	char *secstrings, *strtab;
 	unsigned long symoffs, stroffs, init_typeoffs, core_typeoffs;
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 710ee30b3bea..a88f95a13e06 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1838,7 +1838,7 @@ static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 static int elf_validity_ehdr(const struct load_info *info)
 {
 	if (info->len < sizeof(*(info->hdr))) {
-		pr_err("Invalid ELF header len %lu\n", info->len);
+		pr_err("Invalid ELF header len %zu\n", info->len);
 		return -ENOEXEC;
 	}
 	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {

-- 
2.52.0


