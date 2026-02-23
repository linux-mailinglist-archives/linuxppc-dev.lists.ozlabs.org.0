Return-Path: <linuxppc-dev+bounces-17077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFurCRTKnGlHKQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 22:43:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5412917DAFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 22:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKZ9Q56Vdz2yFm;
	Tue, 24 Feb 2026 08:43:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771883018;
	cv=none; b=no9fUNajxnk5yy46ZvdxFaBkCssN30aQ8D/md0vSxvgwHvPfvNm2JNCq9coNdIwSLXh0Di/NLJhCTR77HmPdAGktupd5ZoQ6Wa9Izi267NfxDevOAn7WsrZMcbdjg+6OqyGNxaQ37msVFU908nrOItVGh//0jhmfGOLEMTJIf8nfXGJDDH5MjQCOlMSYBNbUWK8RLZEZh/SfShtnXXabZ4nBw+861kpdtbq8J4V3GRv/WdpywyC1DSyJrakEensYwkpSq43xZe6wWxA3AowOIoYbHPNT+QkrIbAFbFxEx5gm+z9bR28pbdn5fFnKEqKYlEwaM5iRpGUTVKcJ78SRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771883018; c=relaxed/relaxed;
	bh=+5pP9D+JDKvFevUvp/5tE23Xw8pV2NVv2Nud4AXQ+5s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzisT2eJW0QaephE6zhQLBMfVQorXl1OOMRqyuOSxIv1O1B6teX/MTFWlmNguL6htigY0A5NxQqHd2Y9lTfKl31TZLO9kD1lR19sCGY3rZDEAyujjLczaLMJitOoZuPSONREvPx4Lg0r993ODfOGNxZmzYctFs6fQR6/wwf106LslAekH2pm9fnN5xo9mpYAKGyGKTXS5bAsX1J2324yUUUCJXG4RpftcGcdH7YSM3l175ByKVtqDxcOMq6PJY2Aw8UDdNCflFS0uwC+B/Tk/5cKYWadnYzfm4rynEG/hp6uzt6XbGJ5FpNa/ZmkQ3xKMrkMyIYmFkqTZbQPhHCQlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=DtNafl26; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=DtNafl26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKZ9P5Tjrz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 08:43:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771883011;
	bh=f/RGyyEjxiTV1HAvGsXVhUhx0QauEA+D4aTLJ9rlFUY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=DtNafl26QWwqrEhxfMVJt7qi0VOQ+517xajhYFHcF+PGQBS3hyDAm0AZBdaYhEIV0
	 BPTveOVyjJh7AzZ2ede0B0Zo9hAemmvCqhanqT/ftLkbYfKvroulfGOCMEty+YjZ/s
	 N4rhaBsvNOn/4HeDhUervVSBgCJam9Inr6UpFbdI=
Date: Mon, 23 Feb 2026 22:43:30 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Xiu Jianfeng <xiujianfeng@huawei.com>, 
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>, 
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
Message-ID: <06054e9a-2b7a-4063-98b8-7d6c539e543f@t-8ch.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
 <aZol1Rsa2tX-WNaZ@derry.ads.avm.de>
 <0d70db8d-702b-46ec-a010-298fe6515aab@t-8ch.de>
 <aZyfcDCWOBJJztQ2@levanger>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZyfcDCWOBJJztQ2@levanger>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17077-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kernel.org,m:dmitrykasatkin@gmail
 .com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,suse.com,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[breakpoint.cc:email,weissschuh.net:email,weissschuh.net:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5412917DAFA
X-Rspamd-Action: no action

On 2026-02-23 19:41:52+0100, Nicolas Schier wrote:
> On Mon, Feb 23, 2026 at 08:53:29AM +0100, Thomas Weißschuh wrote:
> > On 2026-02-21 22:38:29+0100, Nicolas Schier wrote:
> > > On Tue, Jan 13, 2026 at 01:28:59PM +0100, Thomas Weißschuh wrote:
> > > > The current signature-based module integrity checking has some drawbacks
> > > > in combination with reproducible builds. Either the module signing key
> > > > is generated at build time, which makes the build unreproducible, or a
> > > > static signing key is used, which precludes rebuilds by third parties
> > > > and makes the whole build and packaging process much more complicated.
> > > > 
> > > > The goal is to reach bit-for-bit reproducibility. Excluding certain
> > > > parts of the build output from the reproducibility analysis would be
> > > > error-prone and force each downstream consumer to introduce new tooling.
> > > > 
> > > > Introduce a new mechanism to ensure only well-known modules are loaded
> > > > by embedding a merkle tree root of all modules built as part of the full
> > > > kernel build into vmlinux.
> > > > 
> > > > Non-builtin modules can be validated as before through signatures.
> > > > 
> > > > Normally the .ko module files depend on a fully built vmlinux to be
> > > > available for modpost validation and BTF generation. With
> > > > CONFIG_MODULE_HASHES, vmlinux now depends on the modules
> > > > to build a merkle tree. This introduces a dependency cycle which is
> > > > impossible to satisfy. Work around this by building the modules during
> > > > link-vmlinux.sh, after vmlinux is complete enough for modpost and BTF
> > > > but before the final module hashes are
> > > > 
> > > > The PKCS7 format which is used for regular module signatures can not
> > > > represent Merkle proofs, so a new kind of module signature is
> > > > introduced. As this signature type is only ever used for builtin
> > > > modules, no compatibility issues can arise.
> > > > 
> > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > ---
> > > >  .gitignore                                   |   1 +
> > > >  Documentation/kbuild/reproducible-builds.rst |   5 +-
> > > >  Makefile                                     |   8 +-
> > > >  include/asm-generic/vmlinux.lds.h            |  11 +
> > > >  include/linux/module_hashes.h                |  25 ++
> > > >  include/linux/module_signature.h             |   1 +
> > > >  kernel/module/Kconfig                        |  21 +-
> > > >  kernel/module/Makefile                       |   1 +
> > > >  kernel/module/hashes.c                       |  92 ++++++
> > > >  kernel/module/hashes_root.c                  |   6 +
> > > >  kernel/module/internal.h                     |   1 +
> > > >  kernel/module/main.c                         |   4 +-
> > > >  scripts/.gitignore                           |   1 +
> > > >  scripts/Makefile                             |   3 +
> > > >  scripts/Makefile.modfinal                    |  11 +
> > > >  scripts/Makefile.modinst                     |  13 +
> > > >  scripts/Makefile.vmlinux                     |   5 +
> > > >  scripts/link-vmlinux.sh                      |  14 +-
> > > >  scripts/modules-merkle-tree.c                | 467 +++++++++++++++++++++++++++
> > > >  security/lockdown/Kconfig                    |   2 +-
> > > >  20 files changed, 685 insertions(+), 7 deletions(-)
> > > > 
> > > [...]
> > > 
> > > > diff --git a/kernel/module/hashes_root.c b/kernel/module/hashes_root.c
> > > > new file mode 100644
> > > > index 000000000000..1abfcd3aa679
> > > > --- /dev/null
> > > > +++ b/kernel/module/hashes_root.c
> > > > @@ -0,0 +1,6 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +
> > > > +#include <linux/module_hashes.h>
> > > > +
> > > > +/* Blank dummy data. Will be overridden by link-vmlinux.sh */
> > > > +const struct module_hashes_root module_hashes_root __module_hashes_section = {};
> > > > diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> > > > index e2d49122c2a1..e22837d3ac76 100644
> > > > --- a/kernel/module/internal.h
> > > > +++ b/kernel/module/internal.h
> > > > @@ -338,6 +338,7 @@ void module_mark_ro_after_init(const Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
> > > >  			       const char *secstrings);
> > > >  
> > > >  int module_sig_check(struct load_info *info, const u8 *sig, size_t sig_len);
> > > > +int module_hash_check(struct load_info *info, const u8 *sig, size_t sig_len);
> > > >  
> > > >  #ifdef CONFIG_DEBUG_KMEMLEAK
> > > >  void kmemleak_load_module(const struct module *mod, const struct load_info *info);
> > > > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > > > index 2a28a0ece809..fa30b6387936 100644
> > > > --- a/kernel/module/main.c
> > > > +++ b/kernel/module/main.c
> > > > @@ -3362,8 +3362,10 @@ static int module_integrity_check(struct load_info *info, int flags)
> > > >  
> > > >  	if (IS_ENABLED(CONFIG_MODULE_SIG) && sig_type == PKEY_ID_PKCS7) {
> > > >  		err = module_sig_check(info, sig, sig_len);
> > > > +	} else if (IS_ENABLED(CONFIG_MODULE_HASHES) && sig_type == PKEY_ID_MERKLE) {
> > > > +		err = module_hash_check(info, sig, sig_len);
> > > >  	} else {
> > > > -		pr_err("module: not signed with expected PKCS#7 message\n");
> > > > +		pr_err("module: not signed with signature mechanism\n");
> > > >  		err = -ENOPKG;
> > > 
> > > To prevent others from running into the same issue:
> > > 
> > > My first test got stuck here, as I tested with virtme-ng, which symlinks
> > > modules from build tree to /lib/modules/$(uname -r)/..., resulting in
> > > 
> > >     [   15.956855] module: not signed with signature mechanism
> > >     modprobe: ERROR: could not insert 'efivarfs': Package not installed
> > > 
> > > As the modules_install step was missing, modules were not being signed.
> > 
> > Currently the signing is deferred to installation time to keep in sync
> > with regular module signing and to keep the logic simpler by not having
> > to gracefully handle previously-signed files.
> > But this could be changed.
> 
> I did not want to suggest changing the behaviour, that would make things
> more complicated to prevent needless rebuilds.  I just wanted to mention
> it here to prevent others from burning time.

Understood.

> > > [...]
> > > > diff --git a/scripts/modules-merkle-tree.c b/scripts/modules-merkle-tree.c
> > > > new file mode 100644
> > > > index 000000000000..a6ec0e21213b
> > > > --- /dev/null
> > > > +++ b/scripts/modules-merkle-tree.c
> > > > @@ -0,0 +1,467 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * Compute hashes for modules files and build a merkle tree.
> > > > + *
> > > > + * Copyright (C) 2025 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> > > > + * Copyright (C) 2025 Thomas Weißschuh <linux@weissschuh.net>
> > > > + *
> > > > + */
> > > > +#define _GNU_SOURCE 1
> > > > +#include <arpa/inet.h>
> > > > +#include <err.h>
> > > > +#include <unistd.h>
> > > > +#include <fcntl.h>
> > > > +#include <stdarg.h>
> > > > +#include <stdio.h>
> > > > +#include <string.h>
> > > > +#include <stdbool.h>
> > > > +#include <stdlib.h>
> > > > +
> > > > +#include <sys/stat.h>
> > > > +#include <sys/mman.h>
> > > > +
> > > > +#include <openssl/evp.h>
> > > > +#include <openssl/err.h>
> > > > +
> > > > +#include "ssl-common.h"
> > > > +
> > > > +static int hash_size;
> > > > +static EVP_MD_CTX *ctx;
> > > > +
> > > > +struct module_signature {
> > > > +	uint8_t		algo;		/* Public-key crypto algorithm [0] */
> > > > +	uint8_t		hash;		/* Digest algorithm [0] */
> > > > +	uint8_t		id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
> > > > +	uint8_t		signer_len;	/* Length of signer's name [0] */
> > > > +	uint8_t		key_id_len;	/* Length of key identifier [0] */
> > > > +	uint8_t		__pad[3];
> > > > +	uint32_t	sig_len;	/* Length of signature data */
> > > > +};
> > > > +
> > > > +#define PKEY_ID_MERKLE 3
> > > > +
> > > > +static const char magic_number[] = "~Module signature appended~\n";
> > > 
> > > This here will be the forth definition of struct module_signature,
> > > increasing the risk of unwanted diversion.  I second Petr's suggestion
> > > to reuse a _common_ definition instead.
> > 
> > Ack.
> > 
> > > (Here, even include/linux/module_signature.h could be included itself.)
> > 
> > I'd like to avoid including internal headers from other components.
> > We could move it to an UAPI header. Various other subsystems use those
> > for not-really-UAPI but still ABI definitions.
> 
> Yeah, ack.

What exactly is the 'ack' for?
* Avoiding to include internal headers?
* Moving the definition to UAPI headers?

(...)

> > > Can you verify if I get the mechanics roughly correct?
> > > 
> > >   * Modules are merkle tree leaves.  Modules are built and logically
> > >     paired by the order from modules.order; a single left-over module is
> > >     paired with itself.
> > > 
> > >   * Hashes of paired modules are hashed again (branch node hash);
> > >     hashes of pairs of branch nodes' hashes are hashed again;
> > >     repeat until we reach the single merkle tree root hash
> > > 
> > >   * The final merkle tree root hash (and the count of tree levels) is
> > >     included in vmlinux
> > 
> > The merkle tree code was written by Sebastian so he will have the best
> > knowledge about it. But this is also my understanding.
> 
> I'd like to see some (rough) description in Documentation or in a commit
> message at least, otherwise future me will have to ask that again.

Ack in general. I'd prefer to document it in a source code comment,
though. That feels like the best fit to me.


Thomas

