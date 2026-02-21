Return-Path: <linuxppc-dev+bounces-16999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCrJMO0lmmnCZAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:38:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650316DF1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJL8m4P8Nz2xNT;
	Sun, 22 Feb 2026 08:38:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771709928;
	cv=none; b=KmKWCkyYsmDkR38ELN/WaQx26oZsbNm8DGRJ0RPwGluf+SXFjfS+16EuywrDjm1HGoBGpf9q3qnSPNdTzUIUH7A698GiCbCQMU0RkvKQ63w+CDetigX41WlHzufyfq6yAA1dHSPtSQYlQbshw2mKMYOfaDd6Uro9RRW8E6SlOTYIbADD4JGDe7h93MgEdnTiZrAzxPMpI21fvYoYwkGT/9PXBhFd5pCsDey+MGSzDjoWfULEEtVUYZ6lBf+6gQy5DtQIBVtfg4rHzi+Qai4aRiEot3TFeSJFWiosquu5qLeIcdXMmWnKqXbvLkhM+MyScTSd9o1LnS1Lv5G4wp77zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771709928; c=relaxed/relaxed;
	bh=6cNXAdyyBSwZ6HHNLhtCMamgS2JtSisLhXs31ZqqLAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLIcxAbUcSzahZkPh0W3bFBt0gIqJfL2t4Dz8HXNPoh93GQFANwX1Td8DC3d7xOkVZi0BwK3ddAGqJm80YtGNtUtOsxvVHJBarPB/7RcPFutnwerY2LsExIQWFiX/Wq28d940oVr4fxtUn/a6eXvQMQE1FHkrGhxWgLDxxztignoRYTlWlCA4e7Urn4BVQjU5jeQLxvSJW3+xRu9Y5wR+qKMcDmfSBWGm3n2oVicKJ+Yc9tz2i4bqTyv5u7R9z9TKROBrGRYlFpvxwr19RS+85s+NUrWrGnXiL+vd7rAO2eo5HHpCtYFB4HUNbz8Dsu6AQ0xnupiMnrIttocEVDwdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RpvIeLgC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RpvIeLgC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJL8k4s54z2xN2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 08:38:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2212844317;
	Sat, 21 Feb 2026 21:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1BAC4CEF7;
	Sat, 21 Feb 2026 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771709923;
	bh=6f/BlOCaBHYHn12tHM4Bu5uqu60c5HeyFZykyfi11cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpvIeLgCkECuxu/6gXgTQN2VJvSNRxp9H8NYfUdN96cKwgGi5TbrmXVpqRCoCmv0U
	 8OmVb/vAvTcOeCQNkRiA6vTqRcn92yFQi7lxqql889K9VGxhBd2S3Lrj2uruF0W3N1
	 q3LW64Hu0Jzi9dPzsRlC27O5F+KqMpmiiRlL3h9J6chn3swUA+7qCqSMMa9Du9alRE
	 n1uxljy0MYxcWwo+BPYiNoKWc70PEpCrYmTd15UI34v+JYgQMoWBOrCxOrEnrqaV3n
	 FPWWMoa5bu7H3KoDUUcK3RIt06OjrYY/5chzuNfvAD15oxT3h127uPEAVN2/0On/Hr
	 JnQUEuIrWpOoA==
Date: Sat, 21 Feb 2026 22:38:29 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Fabian =?iso-8859-1?Q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>,
	Arnout Engelen <arnout@bzzt.net>,
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	=?iso-8859-1?Q?C=E2ju?= Mihai-Drosi <mcaju95@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
Message-ID: <aZol1Rsa2tX-WNaZ@derry.ads.avm.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16999-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kernel.org,m:dmitrykasatkin
 @gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,suse.com,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[link-vmlinux.sh:url,derry.ads.avm.de:mid,breakpoint.cc:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7650316DF1D
X-Rspamd-Action: no action

Hi Thomas,

On Tue, Jan 13, 2026 at 01:28:59PM +0100, Thomas Weiﬂschuh wrote:
> The current signature-based module integrity checking has some drawbacks
> in combination with reproducible builds. Either the module signing key
> is generated at build time, which makes the build unreproducible, or a
> static signing key is used, which precludes rebuilds by third parties
> and makes the whole build and packaging process much more complicated.
> 
> The goal is to reach bit-for-bit reproducibility. Excluding certain
> parts of the build output from the reproducibility analysis would be
> error-prone and force each downstream consumer to introduce new tooling.
> 
> Introduce a new mechanism to ensure only well-known modules are loaded
> by embedding a merkle tree root of all modules built as part of the full
> kernel build into vmlinux.
> 
> Non-builtin modules can be validated as before through signatures.
> 
> Normally the .ko module files depend on a fully built vmlinux to be
> available for modpost validation and BTF generation. With
> CONFIG_MODULE_HASHES, vmlinux now depends on the modules
> to build a merkle tree. This introduces a dependency cycle which is
> impossible to satisfy. Work around this by building the modules during
> link-vmlinux.sh, after vmlinux is complete enough for modpost and BTF
> but before the final module hashes are
> 
> The PKCS7 format which is used for regular module signatures can not
> represent Merkle proofs, so a new kind of module signature is
> introduced. As this signature type is only ever used for builtin
> modules, no compatibility issues can arise.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  .gitignore                                   |   1 +
>  Documentation/kbuild/reproducible-builds.rst |   5 +-
>  Makefile                                     |   8 +-
>  include/asm-generic/vmlinux.lds.h            |  11 +
>  include/linux/module_hashes.h                |  25 ++
>  include/linux/module_signature.h             |   1 +
>  kernel/module/Kconfig                        |  21 +-
>  kernel/module/Makefile                       |   1 +
>  kernel/module/hashes.c                       |  92 ++++++
>  kernel/module/hashes_root.c                  |   6 +
>  kernel/module/internal.h                     |   1 +
>  kernel/module/main.c                         |   4 +-
>  scripts/.gitignore                           |   1 +
>  scripts/Makefile                             |   3 +
>  scripts/Makefile.modfinal                    |  11 +
>  scripts/Makefile.modinst                     |  13 +
>  scripts/Makefile.vmlinux                     |   5 +
>  scripts/link-vmlinux.sh                      |  14 +-
>  scripts/modules-merkle-tree.c                | 467 +++++++++++++++++++++++++++
>  security/lockdown/Kconfig                    |   2 +-
>  20 files changed, 685 insertions(+), 7 deletions(-)
> 
[...]

> diff --git a/kernel/module/hashes_root.c b/kernel/module/hashes_root.c
> new file mode 100644
> index 000000000000..1abfcd3aa679
> --- /dev/null
> +++ b/kernel/module/hashes_root.c
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/module_hashes.h>
> +
> +/* Blank dummy data. Will be overridden by link-vmlinux.sh */
> +const struct module_hashes_root module_hashes_root __module_hashes_section = {};
> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> index e2d49122c2a1..e22837d3ac76 100644
> --- a/kernel/module/internal.h
> +++ b/kernel/module/internal.h
> @@ -338,6 +338,7 @@ void module_mark_ro_after_init(const Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  			       const char *secstrings);
>  
>  int module_sig_check(struct load_info *info, const u8 *sig, size_t sig_len);
> +int module_hash_check(struct load_info *info, const u8 *sig, size_t sig_len);
>  
>  #ifdef CONFIG_DEBUG_KMEMLEAK
>  void kmemleak_load_module(const struct module *mod, const struct load_info *info);
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 2a28a0ece809..fa30b6387936 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -3362,8 +3362,10 @@ static int module_integrity_check(struct load_info *info, int flags)
>  
>  	if (IS_ENABLED(CONFIG_MODULE_SIG) && sig_type == PKEY_ID_PKCS7) {
>  		err = module_sig_check(info, sig, sig_len);
> +	} else if (IS_ENABLED(CONFIG_MODULE_HASHES) && sig_type == PKEY_ID_MERKLE) {
> +		err = module_hash_check(info, sig, sig_len);
>  	} else {
> -		pr_err("module: not signed with expected PKCS#7 message\n");
> +		pr_err("module: not signed with signature mechanism\n");
>  		err = -ENOPKG;

To prevent others from running into the same issue:

My first test got stuck here, as I tested with virtme-ng, which symlinks
modules from build tree to /lib/modules/$(uname -r)/..., resulting in

    [   15.956855] module: not signed with signature mechanism
    modprobe: ERROR: could not insert 'efivarfs': Package not installed

As the modules_install step was missing, modules were not being signed.


[...]
> diff --git a/scripts/modules-merkle-tree.c b/scripts/modules-merkle-tree.c
> new file mode 100644
> index 000000000000..a6ec0e21213b
> --- /dev/null
> +++ b/scripts/modules-merkle-tree.c
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Compute hashes for modules files and build a merkle tree.
> + *
> + * Copyright (C) 2025 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> + * Copyright (C) 2025 Thomas Weiﬂschuh <linux@weissschuh.net>
> + *
> + */
> +#define _GNU_SOURCE 1
> +#include <arpa/inet.h>
> +#include <err.h>
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <stdarg.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +
> +#include <openssl/evp.h>
> +#include <openssl/err.h>
> +
> +#include "ssl-common.h"
> +
> +static int hash_size;
> +static EVP_MD_CTX *ctx;
> +
> +struct module_signature {
> +	uint8_t		algo;		/* Public-key crypto algorithm [0] */
> +	uint8_t		hash;		/* Digest algorithm [0] */
> +	uint8_t		id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
> +	uint8_t		signer_len;	/* Length of signer's name [0] */
> +	uint8_t		key_id_len;	/* Length of key identifier [0] */
> +	uint8_t		__pad[3];
> +	uint32_t	sig_len;	/* Length of signature data */
> +};
> +
> +#define PKEY_ID_MERKLE 3
> +
> +static const char magic_number[] = "~Module signature appended~\n";

This here will be the forth definition of struct module_signature,
increasing the risk of unwanted diversion.  I second Petr's suggestion
to reuse a _common_ definition instead.

(Here, even include/linux/module_signature.h could be included itself.)

> +
> +struct file_entry {
> +	char *name;
> +	unsigned int pos;
> +	unsigned char hash[EVP_MAX_MD_SIZE];
> +};
> +
> +static struct file_entry *fh_list;
> +static size_t num_files;
> +
> +struct leaf_hash {
> +	unsigned char hash[EVP_MAX_MD_SIZE];
> +};
> +
> +struct mtree {
> +	struct leaf_hash **l;
> +	unsigned int *entries;
> +	unsigned int levels;
> +};
> +
> +static inline void *xcalloc(size_t n, size_t size)
> +{
> +	void *p;
> +
> +	p = calloc(n, size);
> +	if (!p)
> +		errx(1, "Memory allocation failed");
> +
> +	return p;
> +}
> +
> +static void *xmalloc(size_t size)
> +{
> +	void *p;
> +
> +	p = malloc(size);
> +	if (!p)
> +		errx(1, "Memory allocation failed");
> +
> +	return p;
> +}
> +
> +static inline void *xreallocarray(void *oldp, size_t n, size_t size)
> +{
> +	void *p;
> +
> +	p = reallocarray(oldp, n, size);
> +	if (!p)
> +		errx(1, "Memory allocation failed");
> +
> +	return p;
> +}
> +
> +static inline char *xasprintf(const char *fmt, ...)
> +{
> +	va_list ap;
> +	char *strp;
> +	int ret;
> +
> +	va_start(ap, fmt);
> +	ret = vasprintf(&strp, fmt, ap);
> +	va_end(ap);
> +	if (ret == -1)
> +		err(1, "Memory allocation failed");
> +
> +	return strp;
> +}

Please consider moving these x* functions into scripts/include/xalloc.h
for reuse.  (I am sure someone else wrote this already, but I can't find
it...)

> 
> 

thanks for all your efforts for reproducibility!

As I have no clue about that:  Is the patent for merkle trees [1] a
problem when integrating that here?

Can you verify if I get the mechanics roughly correct?

  * Modules are merkle tree leaves.  Modules are built and logically
    paired by the order from modules.order; a single left-over module is
    paired with itself.

  * Hashes of paired modules are hashed again (branch node hash);
    hashes of pairs of branch nodes' hashes are hashed again;
    repeat until we reach the single merkle tree root hash

  * The final merkle tree root hash (and the count of tree levels) is
    included in vmlinux


'make && find . -name '*.ko' -exec rm {} \; && make' does not rebuild
the in-tree modules.  Shifting the module-hashes support from
scripts/link-vmlinux.sh to scripts/Makefile.vmlinux might (make it
easier) to fix this again.

Kind regards,
Nicolas



[1]: https://worldwide.espacenet.com/patent/search/family/022107098/publication/US4309569A?q=pn%3DUS4309569


-- 
Nicolas

