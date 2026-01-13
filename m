Return-Path: <linuxppc-dev+bounces-15633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F299D18E24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8BM1kVBz2xl0;
	Tue, 13 Jan 2026 23:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308379;
	cv=none; b=irrVzwgyPcQSXs1/8VLuNd4d5wUMEU4EQFeS478EGPqtyGlyBPFnGWYUoXhQLugI0h8Tq7c2tByMd7QUZqvCyJWLfmX1jZfA8ZWOwaSsGKlXuaArW0mllUhEGymG0j6PA0pxZoHIOR6iN4T7uWd4CzdkZAwLIqZbI2U3zTvKL+ZpoFAJRShAyiHdUwOJuLI5vXyyeieOYXaGzVQvqf56g+n1O1t4VIBuPFV/dXg2Bqw3r6K4G8E1GS76e3xtEbsLzya71TkqV84rdY/KGnVIxLUiLfjSioObq1GVd2It4RppW/dtVSTDC/jwBO9TbNz+bK6vEX8ybG96UzHvhAcOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308379; c=relaxed/relaxed;
	bh=GyRAhSaZ4epEpbs+Twm2p7XHa7uIdaYB2IqW6ouVFzg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IjKEMCBxGdQ4vwM1bzFEmrgqHnq/6LbRb25N798VDxEVMd46cI5XEql83Wb7JMwPlclw1kKF7wDKBhjLlXCTr1kDDPePeXN/KSDoZgzwFaHnyTszxn8Pds4k3r1VnNYLk2PW6jGucXHKN47NQQWli6XY6egHMLHRVJut7cRbwZBRP7HP9ti0Swil8bQW9jPNHJjlCIdy2g6RDrvcfsPwuh63CIL8XNLq46HmaxmKkpbFFr1R9tncdI5qeZa8pBhac1ZJP88fgdf/+mEkMkgzGffF5tJrUEFqBxIBDln2zb3kVnUrNnYxYAoI7KA+ZxQAesP12k847zV5Qe9GhyT4fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ZQWIPlce; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ZQWIPlce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8BL1kBVz2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307859;
	bh=CJ5Q7TSQRlxCuT33gA75lGir8dMVKJfaz26OTMgWzdc=;
	h=From:Subject:Date:To:Cc:From;
	b=ZQWIPlcepm2Oog0ploYQaatAMDf0b2LrzjJvxjdIjU54z+awOHjarHBeak2dxsQLV
	 p08MuX1cVxECrrtXDiJriKCLFGEIIeLwWsVDG4sh9E7fAlm8RuIToAxfMqu6WDwQiB
	 UuwFMTRpImmq06nZiZnVxAa+fYpUcKGMa8gpwxh0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v4 00/17] module: Introduce hash-based integrity checking
Date: Tue, 13 Jan 2026 13:28:44 +0100
Message-Id: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XM0QqCMBTG8VeJXbc4OyrTrnqP6GJuxzYoDY9aI
 b57U4jA6vL/wfcbBVMbiMV+M4qWhsChqWOk242w3tRnksHFFgiYKsRMXhvXX0h6w55YapOB0da
 iSUDEz62lKjwW73iK7QN3Tftc+EHN6z9pUBKk0wosaZNUTh3uFJjZ+t7vaurEzA34JjJQCGsCI
 1EapfKUUJe6+kkkHyLFYk0kkQCgArPcUVXQFzFN0ws/Z7XDNQEAAA==
X-Change-ID: 20241225-module-hashes-7a50a7cc2a30
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Coiby Xu <coxu@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=5026;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CJ5Q7TSQRlxCuT33gA75lGir8dMVKJfaz26OTMgWzdc=;
 b=51fSbd36QVyontiAepgfd7G1fuKzySrt4lkuiedyCi5HRGu1oD8FF9/eiZHLEUKtBqB7p3DU6
 Kt8URjpOmckAsY0U7yuDQ4oVeNOTs9r3HhlrbmBtvk9f4Shv6H2iOIe
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current signature-based module integrity checking has some drawbacks
in combination with reproducible builds. Either the module signing key
is generated at build time, which makes the build unreproducible, or a
static signing key is used, which precludes rebuilds by third parties
and makes the whole build and packaging process much more complicated.

The goal is to reach bit-for-bit reproducibility. Excluding certain
parts of the build output from the reproducibility analysis would be
error-prone and force each downstream consumer to introduce new tooling.

Introduce a new mechanism to ensure only well-known modules are loaded
by embedding a merkle tree root of all modules built as part of the full
kernel build into vmlinux.

Interest has been proclaimed by NixOS, Arch Linux, Proxmox, SUSE and the
general reproducible builds community.

Compatibility with IMA modsig is not provided yet. It is still unclear
to me if it should be hooked up transparently without any changes to the
policy or it should require new policy options.

Further improvements:
* Use MODULE_SIG_HASH for configuration
* UAPI for discovery?

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v4:
- Use as Merkle tree over a linera list of hashes.
- Provide compatibilith with INSTALL_MOD_STRIP
- Rework commit messages.
- Use vmlinux.unstripped over plain "vmlinux".
- Link to v3: https://lore.kernel.org/r/20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net

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
Coiby Xu (1):
      module: Only declare set_module_sig_enforced when CONFIG_MODULE_SIG=y

Thomas Weißschuh (16):
      powerpc/ima: Drop unnecessary check for CONFIG_MODULE_SIG
      ima: efi: Drop unnecessary check for CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
      module: Make mod_verify_sig() static
      module: Switch load_info::len to size_t
      kbuild: add stamp file for vmlinux BTF data
      kbuild: generate module BTF based on vmlinux.unstripped
      module: Deduplicate signature extraction
      module: Make module loading policy usable without MODULE_SIG
      module: Move integrity checks into dedicated function
      module: Move lockdown check into generic module loader
      module: Move signature splitting up
      module: Report signature type to users
      lockdown: Make the relationship to MODULE_SIG a dependency
      module: Introduce hash-based integrity checking
      kbuild: move handling of module stripping to Makefile.lib
      kbuild: make CONFIG_MODULE_HASHES compatible with module stripping

 .gitignore                                   |   2 +
 Documentation/kbuild/reproducible-builds.rst |   5 +-
 Makefile                                     |   8 +-
 arch/powerpc/kernel/ima_arch.c               |   3 +-
 include/asm-generic/vmlinux.lds.h            |  11 +
 include/linux/module.h                       |  20 +-
 include/linux/module_hashes.h                |  25 ++
 include/linux/module_signature.h             |   5 +-
 kernel/module/Kconfig                        |  29 +-
 kernel/module/Makefile                       |   1 +
 kernel/module/hashes.c                       |  92 ++++++
 kernel/module/hashes_root.c                  |   6 +
 kernel/module/internal.h                     |  13 +-
 kernel/module/main.c                         |  68 +++-
 kernel/module/signing.c                      |  83 +----
 kernel/module_signature.c                    |  49 ++-
 scripts/.gitignore                           |   1 +
 scripts/Makefile                             |   3 +
 scripts/Makefile.lib                         |  32 ++
 scripts/Makefile.modfinal                    |  28 +-
 scripts/Makefile.modinst                     |  46 +--
 scripts/Makefile.vmlinux                     |   6 +
 scripts/link-vmlinux.sh                      |  20 +-
 scripts/modules-merkle-tree.c                | 467 +++++++++++++++++++++++++++
 security/integrity/ima/ima_efi.c             |   6 +-
 security/integrity/ima/ima_modsig.c          |  28 +-
 security/lockdown/Kconfig                    |   2 +-
 27 files changed, 884 insertions(+), 175 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20241225-module-hashes-7a50a7cc2a30

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


