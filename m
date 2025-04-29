Return-Path: <linuxppc-dev+bounces-8150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C92AA0D20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn11H2xV1z3bkP;
	Tue, 29 Apr 2025 23:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932307;
	cv=none; b=it601ql13xSEIMbW5Llg01JCC3gXvBxi0T/+/K7+BL5L2sLHL99nw/c0/+PuxKG01XqqtEqz4K2SIFGWJZaK2IoDZt6Vd0IXOX+EHzrjY/LMjDa9Nea1qPRktv4c9sX63rIgKNRhWklPWdNPjW3OYhBQ8Q6DVbPNr9AvcBEvHLGxgd81iHq2qZa7mn8zi3qQutx6jtRcjy5EJRc5tN2ba8jGGh7gBrmNhrs/xpHbiaKjLw6bnU5YXK+kZ2kYhcpoWFtQ2PRc4fCvGoJwH2wq34VYKff82t+KHVh5RRpao2CglOfsKZueXa9C6r72bSGGIagcE0lHZpzDitkCFqszAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932307; c=relaxed/relaxed;
	bh=ZwP8opfhLhEDXfCw8iwCOon3Dwh++i2gC0kSmibL1ww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0sM2+RumutBkN+4ma+/4rt/ty3XASVg4Zg4Mh3MoRY6gs33Gvi3GCuhR7cEqNCT/+70B39+VFeom40PMOm+PD4PiDkYyLhbkN/Hc8Ye83ve6XSYHv0HFo+bxZuSNDJR63Pv4zvNLD1MYEPWrC3YCzN9OiVGCG7FUk9L3T3Jfb/HR4RkqEcjeNSRkTJOJq3pBGANKTZo/fS0iVDbE7G5HT0dgmHP69I3GT+051p0Kn+v3Wk4Zh4JKV9WyN4fcc3Lgk+XfyZduv25IB5a8gqsI9N59a7rGia+Mm+F1yoSgssiDamrQS+C4lEm6c/AEw0SvD8UPEVk4gGLcQ4RRrGF3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IRRJNLk+; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IRRJNLk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn11G0qx8z3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:11:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=Y+xLjK61Kdyaf5qG4FimETVDBBB3izTwQkrP8AuirI4=;
	h=From:Subject:Date:To:Cc:From;
	b=IRRJNLk+e7inQgG0GdySHCzALbfOkLdvGf9nPAyO84CiqXQO1UO0uUl/tT200tV6h
	 t9zLXBXeJ6gdAnQbVxAEgBRjbrPzmpUaaDXzdsTg/s3ZAvFTqsHtb66hBTk8xURkCa
	 s3CiPKXGBG51UzVaWwtvmbgx9fG90CgWNMI1hDFk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Date: Tue, 29 Apr 2025 15:04:27 +0200
Message-Id: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAFvOEGgC/3XMQQrCMBCF4auUrI1kpi0RV96juEiTqQloK5k2K
 qV3Ny24UVz+D943C6YYiMWxmEWkFDgMfY5yVwjrTX8hGVxugQorQKzlbXDTlaQ37ImlNrUy2lo
 0pRL5c4/UhefmNefcPvA4xNfGJ1jXf1ICqaTToCxpU3YOTg8KzGz95Pc9jWLlEn6IWgGqbwIz0
 RqAQ0WoW939EMuyvAGqrA4I8gAAAA==
X-Change-ID: 20241225-module-hashes-7a50a7cc2a30
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=4167;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Y+xLjK61Kdyaf5qG4FimETVDBBB3izTwQkrP8AuirI4=;
 b=EPx/fKWbgM9Vin3BDBMnBLPm+4MHXpOt4igmfsC24uEu/uUVs9r+4rDAXbDMhihK1CxXjLsGa
 zLa8agdSfc0DAmg+2uNWPgMQwlyk4enmeazWuA4PLxnd5pszMLDhjHD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current signature-based module integrity checking has some drawbacks
in combination with reproducible builds:
Either the module signing key is generated at build time, which makes
the build unreproducible, or a static key is used, which precludes
rebuilds by third parties and makes the whole build and packaging
process much more complicated.
Introduce a new mechanism to ensure only well-known modules are loaded
by embedding a list of hashes of all modules built as part of the full
kernel build into vmlinux.

Interest has been proclaimed by NixOS, Arch Linux, Proxmox, SUSE and the
general reproducible builds community.

To properly test the reproducibility in combination with CONFIG_INFO_BTF
another patch or pahole v1.29 is needed:
"[PATCH bpf-next] kbuild, bpf: Enable reproducible BTF generation" [0]

Questions for current patch:
* Naming
* Can the number of built-in modules be retrieved while building
  kernel/module/hashes.o? This would remove the need for the
  preallocation step in link-vmlinux.sh.
* How should this interaction with IMA?

Further improvements:
* Use a LSM/IMA Keyring to store and validate hashes
* Use MODULE_SIG_HASH for configuration
* UAPI for discovery?
* Currently has a permanent memory overhead

[0] https://lore.kernel.org/lkml/20241211-pahole-reproducible-v1-1-22feae19bad9@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Rebase on v6.15-rc1
- Use openssl to calculate hash
- Avoid warning if no modules are built
- Simplify module_integrity_check() a bit
- Make incompatibility with INSTALL_MOD_STRIP explicit
- Update docs
- Add IMA cleanups
- Link to v2: https://lore.kernel.org/r/20250120-module-hashes-v2-0-ba1184e27b7f@weissschuh.net

Changes in v2:
- Drop RFC state
- Mention interested parties in cover letter
- Expand Kconfig description
- Add compatibility with CONFIG_MODULE_SIG
- Parallelize module-hashes.sh
- Update Documentation/kbuild/reproducible-builds.rst
- Link to v1: https://lore.kernel.org/r/20241225-module-hashes-v1-0-d710ce7a3fd1@weissschuh.net

---
Thomas Weißschuh (9):
      powerpc/ima: Drop unnecessary check for CONFIG_MODULE_SIG
      ima: efi: Drop unnecessary check for CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
      kbuild: add stamp file for vmlinux BTF data
      kbuild: generate module BTF based on vmlinux.unstripped
      module: Make module loading policy usable without MODULE_SIG
      module: Move integrity checks into dedicated function
      module: Move lockdown check into generic module loader
      lockdown: Make the relationship to MODULE_SIG a dependency
      module: Introduce hash-based integrity checking

 .gitignore                                   |  1 +
 Documentation/kbuild/reproducible-builds.rst |  5 ++-
 Makefile                                     |  8 +++-
 arch/powerpc/kernel/ima_arch.c               |  3 +-
 include/asm-generic/vmlinux.lds.h            | 11 ++++++
 include/linux/module.h                       |  8 ++--
 include/linux/module_hashes.h                | 17 +++++++++
 kernel/module/Kconfig                        | 21 ++++++++++-
 kernel/module/Makefile                       |  1 +
 kernel/module/hashes.c                       | 56 ++++++++++++++++++++++++++++
 kernel/module/internal.h                     |  8 +---
 kernel/module/main.c                         | 51 ++++++++++++++++++++++---
 kernel/module/signing.c                      | 24 +-----------
 scripts/Makefile.modfinal                    | 18 ++++++---
 scripts/Makefile.modinst                     |  4 ++
 scripts/Makefile.vmlinux                     |  5 +++
 scripts/link-vmlinux.sh                      | 31 ++++++++++++++-
 scripts/module-hashes.sh                     | 26 +++++++++++++
 security/integrity/ima/ima_efi.c             |  6 +--
 security/lockdown/Kconfig                    |  2 +-
 20 files changed, 250 insertions(+), 56 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241225-module-hashes-7a50a7cc2a30

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


