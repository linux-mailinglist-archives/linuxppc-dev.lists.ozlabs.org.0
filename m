Return-Path: <linuxppc-dev+bounces-17020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DMgI4sHnGmO/AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 08:53:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38647172DA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 08:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKClm3fyNz2yFc;
	Mon, 23 Feb 2026 18:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771833220;
	cv=none; b=CHi4aUZPIYoUJE/AKht4aOfGoPkpzPkpLpLz5+G46Z61BKh4YlTNkCHvd8WHglWRniwTcl+cTtmyTaYiUhq5W2g6ML5l0kxm3g/6gNYl3UFcTB0zA+XGD7yuqH1j/0JXLGXiwJx7TisCX+PwDetZi/ggAgyBbj6h4a2zoTrWyZqfXIPTghdNDsPO21eAsDhw675k5nBgmaSTtwzjo0Prq8HTFDUaYshnu60z3ciV9xf5rAHAYZ+YT4qw5vi2lXkjdvhktf+cN+FtAHuL2XkbH+GL4NsTFln0o6SIRZL2Fu7+/XtwyHlkClgh83wH56ZTmhPwtJwJvlEE54eZtCHJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771833220; c=relaxed/relaxed;
	bh=V9lREaOyq6EobGrRcurxT3XKwYVlFVVG1tae/8MebOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6wVzFRt+mKuEWwxS4tDxOTf7Q+3BcqIZj8Pg4i868PfMVkiA18C+ThF5QUru0nOj41Vl6uN7ktqanbvuVJoWnJEMIxdhzsXrxZMsev+XUxx+tSjHlv/CPJalBUT3BKCIRvRnU07v4BsWXQPNh7eZcp1OLhixDQD58ZDADBDNIVpuxR7CeArcrLitcahrDCi+N/LxPpEpdXEYa64yknHmI5YITyIW2ew4W7m9iDWFW7J8farPwX3I6PpXudJMhii+unQTqqZYIpsrdYoR9BLgvbU6h1HIhcCWjFiayd4YnzK/E7EP7SF+mu7yCDfbrOCov+CuGU0ZgfAYJqmZ4Uqlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UBLlbx6r; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UBLlbx6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKClj1RYGz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 18:53:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771833210;
	bh=nYV9JeJzQ3cvBQGeC5/lhY69NNQylLWUFgiVvFPfShg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBLlbx6rGRzhB0lc8jmUhiwdOSlc22ZND7JHZWW4sRNkp+NBvBnncnMPS1yVQbgOV
	 DymrASfqtlntMVz/GvTCjMNRdBah/OWyHZRmpdBJ/j56Uf6K1XZArBL2sV3NTKngvN
	 Lufi5ad54jpSd2BodXC8KOcnZyRYF4fvDZt5qkc4=
Date: Mon, 23 Feb 2026 08:53:29 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
	Xiu Jianfeng <xiujianfeng@huawei.com>, Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
	kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
	=?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
Message-ID: <0d70db8d-702b-46ec-a010-298fe6515aab@t-8ch.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
 <aZol1Rsa2tX-WNaZ@derry.ads.avm.de>
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
In-Reply-To: <aZol1Rsa2tX-WNaZ@derry.ads.avm.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17020-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,suse.com,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kernel.org,m:dmitrykasatkin@gmail
 .com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[t-8ch.de:mid,weissschuh.net:email,weissschuh.net:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 38647172DA1
X-Rspamd-Action: no action

On 2026-02-21 22:38:29+0100, Nicolas Schier wrote:
> On Tue, Jan 13, 2026 at 01:28:59PM +0100, Thomas Weißschuh wrote:
> > The current signature-based module integrity checking has some drawbacks
> > in combination with reproducible builds. Either the module signing key
> > is generated at build time, which makes the build unreproducible, or a
> > static signing key is used, which precludes rebuilds by third parties
> > and makes the whole build and packaging process much more complicated.
> > 
> > The goal is to reach bit-for-bit reproducibility. Excluding certain
> > parts of the build output from the reproducibility analysis would be
> > error-prone and force each downstream consumer to introduce new tooling.
> > 
> > Introduce a new mechanism to ensure only well-known modules are loaded
> > by embedding a merkle tree root of all modules built as part of the full
> > kernel build into vmlinux.
> > 
> > Non-builtin modules can be validated as before through signatures.
> > 
> > Normally the .ko module files depend on a fully built vmlinux to be
> > available for modpost validation and BTF generation. With
> > CONFIG_MODULE_HASHES, vmlinux now depends on the modules
> > to build a merkle tree. This introduces a dependency cycle which is
> > impossible to satisfy. Work around this by building the modules during
> > link-vmlinux.sh, after vmlinux is complete enough for modpost and BTF
> > but before the final module hashes are
> > 
> > The PKCS7 format which is used for regular module signatures can not
> > represent Merkle proofs, so a new kind of module signature is
> > introduced. As this signature type is only ever used for builtin
> > modules, no compatibility issues can arise.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  .gitignore                                   |   1 +
> >  Documentation/kbuild/reproducible-builds.rst |   5 +-
> >  Makefile                                     |   8 +-
> >  include/asm-generic/vmlinux.lds.h            |  11 +
> >  include/linux/module_hashes.h                |  25 ++
> >  include/linux/module_signature.h             |   1 +
> >  kernel/module/Kconfig                        |  21 +-
> >  kernel/module/Makefile                       |   1 +
> >  kernel/module/hashes.c                       |  92 ++++++
> >  kernel/module/hashes_root.c                  |   6 +
> >  kernel/module/internal.h                     |   1 +
> >  kernel/module/main.c                         |   4 +-
> >  scripts/.gitignore                           |   1 +
> >  scripts/Makefile                             |   3 +
> >  scripts/Makefile.modfinal                    |  11 +
> >  scripts/Makefile.modinst                     |  13 +
> >  scripts/Makefile.vmlinux                     |   5 +
> >  scripts/link-vmlinux.sh                      |  14 +-
> >  scripts/modules-merkle-tree.c                | 467 +++++++++++++++++++++++++++
> >  security/lockdown/Kconfig                    |   2 +-
> >  20 files changed, 685 insertions(+), 7 deletions(-)
> > 
> [...]
> 
> > diff --git a/kernel/module/hashes_root.c b/kernel/module/hashes_root.c
> > new file mode 100644
> > index 000000000000..1abfcd3aa679
> > --- /dev/null
> > +++ b/kernel/module/hashes_root.c
> > @@ -0,0 +1,6 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/module_hashes.h>
> > +
> > +/* Blank dummy data. Will be overridden by link-vmlinux.sh */
> > +const struct module_hashes_root module_hashes_root __module_hashes_section = {};
> > diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> > index e2d49122c2a1..e22837d3ac76 100644
> > --- a/kernel/module/internal.h
> > +++ b/kernel/module/internal.h
> > @@ -338,6 +338,7 @@ void module_mark_ro_after_init(const Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
> >  			       const char *secstrings);
> >  
> >  int module_sig_check(struct load_info *info, const u8 *sig, size_t sig_len);
> > +int module_hash_check(struct load_info *info, const u8 *sig, size_t sig_len);
> >  
> >  #ifdef CONFIG_DEBUG_KMEMLEAK
> >  void kmemleak_load_module(const struct module *mod, const struct load_info *info);
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index 2a28a0ece809..fa30b6387936 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -3362,8 +3362,10 @@ static int module_integrity_check(struct load_info *info, int flags)
> >  
> >  	if (IS_ENABLED(CONFIG_MODULE_SIG) && sig_type == PKEY_ID_PKCS7) {
> >  		err = module_sig_check(info, sig, sig_len);
> > +	} else if (IS_ENABLED(CONFIG_MODULE_HASHES) && sig_type == PKEY_ID_MERKLE) {
> > +		err = module_hash_check(info, sig, sig_len);
> >  	} else {
> > -		pr_err("module: not signed with expected PKCS#7 message\n");
> > +		pr_err("module: not signed with signature mechanism\n");
> >  		err = -ENOPKG;
> 
> To prevent others from running into the same issue:
> 
> My first test got stuck here, as I tested with virtme-ng, which symlinks
> modules from build tree to /lib/modules/$(uname -r)/..., resulting in
> 
>     [   15.956855] module: not signed with signature mechanism
>     modprobe: ERROR: could not insert 'efivarfs': Package not installed
> 
> As the modules_install step was missing, modules were not being signed.

Currently the signing is deferred to installation time to keep in sync
with regular module signing and to keep the logic simpler by not having
to gracefully handle previously-signed files.
But this could be changed.

> [...]
> > diff --git a/scripts/modules-merkle-tree.c b/scripts/modules-merkle-tree.c
> > new file mode 100644
> > index 000000000000..a6ec0e21213b
> > --- /dev/null
> > +++ b/scripts/modules-merkle-tree.c
> > @@ -0,0 +1,467 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Compute hashes for modules files and build a merkle tree.
> > + *
> > + * Copyright (C) 2025 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> > + * Copyright (C) 2025 Thomas Weißschuh <linux@weissschuh.net>
> > + *
> > + */
> > +#define _GNU_SOURCE 1
> > +#include <arpa/inet.h>
> > +#include <err.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +#include <stdarg.h>
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <stdbool.h>
> > +#include <stdlib.h>
> > +
> > +#include <sys/stat.h>
> > +#include <sys/mman.h>
> > +
> > +#include <openssl/evp.h>
> > +#include <openssl/err.h>
> > +
> > +#include "ssl-common.h"
> > +
> > +static int hash_size;
> > +static EVP_MD_CTX *ctx;
> > +
> > +struct module_signature {
> > +	uint8_t		algo;		/* Public-key crypto algorithm [0] */
> > +	uint8_t		hash;		/* Digest algorithm [0] */
> > +	uint8_t		id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
> > +	uint8_t		signer_len;	/* Length of signer's name [0] */
> > +	uint8_t		key_id_len;	/* Length of key identifier [0] */
> > +	uint8_t		__pad[3];
> > +	uint32_t	sig_len;	/* Length of signature data */
> > +};
> > +
> > +#define PKEY_ID_MERKLE 3
> > +
> > +static const char magic_number[] = "~Module signature appended~\n";
> 
> This here will be the forth definition of struct module_signature,
> increasing the risk of unwanted diversion.  I second Petr's suggestion
> to reuse a _common_ definition instead.

Ack.

> (Here, even include/linux/module_signature.h could be included itself.)

I'd like to avoid including internal headers from other components.
We could move it to an UAPI header. Various other subsystems use those
for not-really-UAPI but still ABI definitions.

(...)

> > +static inline char *xasprintf(const char *fmt, ...)
> > +{
> > +	va_list ap;
> > +	char *strp;
> > +	int ret;
> > +
> > +	va_start(ap, fmt);
> > +	ret = vasprintf(&strp, fmt, ap);
> > +	va_end(ap);
> > +	if (ret == -1)
> > +		err(1, "Memory allocation failed");
> > +
> > +	return strp;
> > +}
> 
> Please consider moving these x* functions into scripts/include/xalloc.h
> for reuse.  (I am sure someone else wrote this already, but I can't find
> it...)

Petr suggested it somewhere, it is done for the next revision.

> thanks for all your efforts for reproducibility!
> 
> As I have no clue about that:  Is the patent for merkle trees [1] a
> problem when integrating that here?

That should have expired a long time ago [2].
And fs-verity is also using merkle trees.

> Can you verify if I get the mechanics roughly correct?
> 
>   * Modules are merkle tree leaves.  Modules are built and logically
>     paired by the order from modules.order; a single left-over module is
>     paired with itself.
> 
>   * Hashes of paired modules are hashed again (branch node hash);
>     hashes of pairs of branch nodes' hashes are hashed again;
>     repeat until we reach the single merkle tree root hash
> 
>   * The final merkle tree root hash (and the count of tree levels) is
>     included in vmlinux

The merkle tree code was written by Sebastian so he will have the best
knowledge about it. But this is also my understanding.

> 'make && find . -name '*.ko' -exec rm {} \; && make' does not rebuild
> the in-tree modules.  Shifting the module-hashes support from
> scripts/link-vmlinux.sh to scripts/Makefile.vmlinux might (make it
> easier) to fix this again.

I'll take a look at it.

> [1]: https://worldwide.espacenet.com/patent/search/family/022107098/publication/US4309569A?q=pn%3DUS4309569

[2] https://patents.stackexchange.com/questions/17901/validity-of-patent-on-merkle-trees


Thomas

