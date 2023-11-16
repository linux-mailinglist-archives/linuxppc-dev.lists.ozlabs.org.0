Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FC7EE5BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 18:14:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/tOBzhB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWRTN719kz3dLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 04:14:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/tOBzhB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWRSW2Mk1z3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 04:13:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rriOKmH8E9hkmOxPeS6KUmox+mrthGZOdjRWS2B5ZXY=; b=Z/tOBzhB1GcjJdQQrjjAvtFcxh
	rH5gAWfhwbAulmEQCuJeXwASCnUMMkcQGn2clVN0jCHFPyFMgCteVKp6h/xdR4OKfRks6R0uTX8NB
	pXSG4/NO9YbGtVWl96kio1ldRqxkvEalEi+SZ7NuQsmvxmpV4jsBZmHycEqUyk8OB8GgTBPEKpfCZ
	Of47G6t9hYLxm9+Xh00HpkoA27ECUMTkyJPvbqYKKfNYzmUhikbSqOK/I0tOlVPSbCMHC8E7lcYaa
	STgBqBHkmZD5PelziCmsq7/HymQvUcAJFXdMyR3yYfN6T2msb0pYvlGpPshZvSk8eFDLZksL/5rpU
	BqirE7dA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r3fux-0045Gx-2T;
	Thu, 16 Nov 2023 17:12:39 +0000
Date: Thu, 16 Nov 2023 09:12:39 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 2/3] modpost: Extended modversion support
Message-ID: <ZVZNh/PA5HiVRkeb@bombadil.infradead.org>
References: <20231115185858.2110875-1-mmaurer@google.com>
 <20231115185858.2110875-3-mmaurer@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115185858.2110875-3-mmaurer@google.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Song Liu <song@kernel.org>, gary@garyguo.net, rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Marc =?iso-8859-1?Q?Aur=E8le?= La France <tsi@tuyoix.net>, Andreas Hindborg <a.hindborg@samsung.com>, masahiroy@kernel.org, Alice Ryhl <aliceryhl@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nhat Pham <nphamcs@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Nick Desaulniers <nde
 saulniers@google.com>, linux-kernel@vger.kernel.org, "Masami Hiramatsu \(Google\)" <mhiramat@kernel.org>, Benno Lossin <benno.lossin@proton.me>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 15, 2023 at 06:50:10PM +0000, Matthew Maurer wrote:
> Adds a new format for modversions which stores each field in a separate
> elf section.

The "why" is critical and not mentioned. And I'd like to also see
documented this with foresight, if Rust needed could this be used
in the future for other things?

Also please include folks CC'd in *one* patch to *all* patches as
otherwise we have no context.

> This initially adds support for variable length names, but
> could later be used to add additional fields to modversions in a
> backwards compatible way if needed.
> 
> Adding support for variable length names makes it possible to enable
> MODVERSIONS and RUST at the same time.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  arch/powerpc/kernel/module_64.c | 24 +++++++++-

Why was only powerpc modified? If the commit log explained this it would
make it easier for review.

> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> index c8b7b4dcf782..0c188c96a045 100644
> --- a/kernel/module/internal.h
> +++ b/kernel/module/internal.h
> @@ -80,7 +80,7 @@ struct load_info {
>  	unsigned int used_pages;
>  #endif
>  	struct {
> -		unsigned int sym, str, mod, vers, info, pcpu;
> +		unsigned int sym, str, mod, vers, info, pcpu, vers_ext_crc, vers_ext_name;

We might as well modify this in a preliminary patch to add each new
unsinged int in a new line, so that it is easier to blame when each new
entry gets added. It should not grow the size of the struct at all but
it would make futur extensions easier to review what is new and git
blame easier to spot when something was added.

Although we don't use this extensively today this can easily grow for
convenience and making code easier to read.

> diff --git a/kernel/module/version.c b/kernel/module/version.c
> index 53f43ac5a73e..93d97dad8c77 100644
> --- a/kernel/module/version.c
> +++ b/kernel/module/version.c
> @@ -19,11 +19,28 @@ int check_version(const struct load_info *info,
>  	unsigned int versindex = info->index.vers;
>  	unsigned int i, num_versions;
>  	struct modversion_info *versions;
> +	struct modversion_info_ext version_ext;
>  
>  	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
>  	if (!crc)
>  		return 1;
>  
> +	/* If we have extended version info, rely on it */
> +	if (modversion_ext_start(info, &version_ext) >= 0) {

There are two things we need to do to make processing modules easier:

  1) ELF validation
  2) Once checked then process the information

We used to have this split up but also had a few places which did both
1) and 2) together. This was wrong and so I want to keep things tidy
and ensure we do things which validate the ELF separate. To that
end please put the checks to validate the ELF first so that we report
to users with a proper error/debug check in case the ELF is wrong,
this enables futher debug checks for that to be done instead of
confusing users who end up scratching their heads why something
failed.

So please split up the ELF validation check and put that into
elf_validity_cache_copy() which runs *earlier* than this.

Then *if* if has this, you just process it. Please take care to be
very pedantic in the elf_validity_cache_copy() and extend the checks
you have for validation in modversion_ext_start() and bring them to
elf_validity_cache_copy() with perhaps *more* stuff which does any
insane checks to verify it is 100% correct.

> +		do {
> +			if (strncmp(version_ext.name.value, symname,
> +				    version_ext.name.end - version_ext.name.value) != 0)
> +				continue;
> +
> +			if (*version_ext.crc.value == *crc)
> +				return 1;
> +			pr_debug("Found checksum %X vs module %X\n",
> +				 *crc, *version_ext.crc.value);
> +			goto bad_version;
> +		} while (modversion_ext_advance(&version_ext) == 0);

Can you do a for_each_foo()) type loop here instead after validation?
Because the validation would ensure your loop is bounded then. Look at
for_each_mod_mem_type() for inspiration.

> +		goto broken_toolchain;

The broken toolchain thing would then be an issue reported in the
ELF validation.

> @@ -87,6 +105,65 @@ int same_magic(const char *amagic, const char *bmagic,
>  	return strcmp(amagic, bmagic) == 0;
>  }
>  
> +#define MODVERSION_FIELD_START(sec, field) \
> +	field.value = (typeof(field.value))sec.sh_addr; \
> +	field.end = field.value + sec.sh_size
> +
> +ssize_t modversion_ext_start(const struct load_info *info,
> +			     struct modversion_info_ext *start)
> +{
> +	unsigned int crc_idx = info->index.vers_ext_crc;
> +	unsigned int name_idx = info->index.vers_ext_name;
> +	Elf_Shdr *sechdrs = info->sechdrs;
> +
> +	// Both of these fields are needed for this to be useful
> +	// Any future fields should be initialized to NULL if absent.

Curious, what gave you the impression // type style comments are
welcomed, please replace that with either a one line 

/* foo comment */

Or a multi-line:

/*
 * stuff and go into great deatils
 * more elaaborate explanation
 */

Of even better, since you are moving this to ELF Validation please add
undertand what elf_validity_cache_copy() does, and add kdoc style
comments for it and then extend it with why Rust needs these magical things.

> +	if ((crc_idx == 0) || (name_idx == 0))
> +		return -EINVAL;
> +
> +	MODVERSION_FIELD_START(sechdrs[crc_idx], start->crc);
> +	MODVERSION_FIELD_START(sechdrs[name_idx], start->name);
> +
> +	return (start->crc.end - start->crc.value) / sizeof(*start->crc.value);
> +}
> +
> +static int modversion_ext_s32_advance(struct modversion_info_ext_s32 *field)
> +{
> +	if (!field->value)
> +		return 0;
> +	if (field->value >= field->end)
> +		return -EINVAL;
> +	field->value++;
> +	return 0;
> +}
> +
> +static int modversion_ext_string_advance(struct modversion_info_ext_string *s)
> +{
> +	if (!s->value)
> +		return 0;
> +	if (s->value >= s->end)
> +		return -EINVAL;
> +	s->value += strnlen(s->value, s->end - s->value - 1) + 1;
> +	if (s->value >= s->end)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +int modversion_ext_advance(struct modversion_info_ext *start)
> +{
> +	int ret;
> +
> +	ret = modversion_ext_s32_advance(&start->crc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = modversion_ext_string_advance(&start->name);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

Please add all the validation as part of the ELF validation sanity checks
and make sure you rant so toolchains get easily debugged and fixed.
That would make the processing of data a secodnary step and it is
easier to read and simpler code. The validation then becomes the part
which kicks issues out early.

>  /*
>   * Generate the signature for all relevant module structures here.
>   * If these change, we don't want to try to parse the module.
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 973b5e5ae2dd..884860c2e833 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1910,15 +1910,42 @@ static void add_versions(struct buffer *b, struct module *mod)
>  			continue;
>  		}
>  		if (strlen(s->name) >= MODULE_NAME_LEN) {
> -			error("too long symbol \"%s\" [%s.ko]\n",
> -			      s->name, mod->name);
> -			break;
> +			/* this symbol will only be in the extended info */
> +			continue;

I cannot grok why this is being done, but hopefully in the next patch
series this will be easier to understand.

 Luis
