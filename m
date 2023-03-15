Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3A6BA781
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:08:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pc0Lp4kzNz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 17:08:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=EC4bDgv/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=EC4bDgv/;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pc0Kp0CRlz3c9H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 17:07:24 +1100 (AEDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 154C2423CE
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678860440;
	bh=AVU4kb/QR1tulNQD4T4kJea28Mw4MLstFyCkcQW4+m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=EC4bDgv/3b833rMvVIDrdU7yIIGgH/WUKuKhC1exkvKPDMmsk1Lfg50amPNSzQ1fQ
	 ru/anBp4cpzIOKfkIplodqBgsoF/XGeARRQhXFsCUi9Y7+/PAGxy+Zyi7xbSz0kMLf
	 gbT9wYsWZCYX3irAwedarMUwdhdFdN10JHCKbaBs32XYkqODBvzVwzKh4s/OrZf9BB
	 ioALxEZMI/CRJP45v0WdHppGgETB0q3241tw0J+sMK9ggLnUY/zDw9KxncP0xw4GUR
	 1bRAAzGoVCrYybz2JNO2SJy3oUD6Qsyr5lzdayxk+HDxVERUVJ9c8y5l5yrAHqM8yN
	 2v1LPAkqEDSqg==
Received: by mail-ed1-f70.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso25170681edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 23:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678860439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVU4kb/QR1tulNQD4T4kJea28Mw4MLstFyCkcQW4+m8=;
        b=1SeT6wJwWwjk/2z7RNDIfizvNoubAS2sb/eD6C7LJSUj0r6IM+la0z9plbG6ReGhW+
         dIrFPD/TNVwRiB1f5x5RziPswg/XT4nJgq7RvY0B1l1uciHuN2N/xs691NsE1pmiv6sc
         hdLNS/c2IIbVNnquISbrBBYa5wNvTYfYG7L7SGpQLmmp1B+7Ml7mqwMBDwZtzIcEzeMF
         JAC8BlVWl8OjaZAgM6E4T4mI3guTMTEQ5bgonizXW/ST2fbrHa+NSF3y2HumbNLT/fuv
         SSZCs5SMfviDy94QhE3LENkgT4r2z63NMembXZwMz3bfCD+ql5gghBywUT+2fRr3LH8b
         FBdA==
X-Gm-Message-State: AO0yUKXq2sTxEhYQwge/cus5EkntXCvjexrLZY34AuHGHp3g/2lZ1NHk
	2ce55TXVGvswzxgXdcvceA3g+axAPbEcLHOqpeaYnOLqzDTHGqb6nSM8saBrFGiF5z6NIw6QQO4
	3aRNvG388ew6ESRbqCxWY9Pvsu2nilL6yqAcU9Nkp7Ng=
X-Received: by 2002:a17:906:2603:b0:8b2:8876:6a3c with SMTP id h3-20020a170906260300b008b288766a3cmr5905370ejc.29.1678860439519;
        Tue, 14 Mar 2023 23:07:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MBRbsoEastfAfOs1NQLpqt3qQ+WHZ9sata8X/oRby9nHjDitGRVuHm6+gZUtsuTsG2uZPaQ==
X-Received: by 2002:a17:906:2603:b0:8b2:8876:6a3c with SMTP id h3-20020a170906260300b008b288766a3cmr5905342ejc.29.1678860439197;
        Tue, 14 Mar 2023 23:07:19 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id rq4-20020a17090788c400b00927341bf69dsm2009205ejc.88.2023.03.14.23.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:07:18 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:07:17 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZBFglTYuKeAT8dBX@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
 <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
 <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
 <ZBCL1G+8z8c6zLI0@righiandr-XPS-13-7390>
 <CR6IV4NTEN8Z.1V1RNR667SWJ7@vincent-arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CR6IV4NTEN8Z.1V1RNR667SWJ7@vincent-arch>
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 15, 2023 at 01:15:03AM +0100, Vincenzo Palazzo wrote:
> > In practice, this is what I'm testing at the moment:
> >
> > ---
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> > index ff045644f13f..ea6c830ed1e7 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -234,12 +234,13 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
> >  static void dedotify_versions(struct modversion_info *vers,
> >  			      unsigned long size)
> >  {
> > -	struct modversion_info *end;
> > +	struct modversion_info *end = (void *)vers + size;
> >  
> > -	for (end = (void *)vers + size; vers < end; vers++)
> > +	for (; vers < end && vers->next; vers = (void *)vers + vers->next) {
> >  		if (vers->name[0] == '.') {
> >  			memmove(vers->name, vers->name+1, strlen(vers->name));
> >  		}
> > +	}
> >  }
> >  
> >  /*
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 8c5909c0076c..4744901bdf63 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -34,9 +34,11 @@
> >  #define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
> >  
> >  struct modversion_info {
> > -	unsigned long crc;
> > -	char name[MODULE_NAME_LEN];
> > -};
> > +	/* Offset of the next modversion entry in relation to this one. */
> > +	u32 next;
> > +	u32 crc;
> > +	char name[0];
> > +} __packed;
> >  
> >  struct module;
> >  struct exception_table_entry;
> > diff --git a/kernel/module/version.c b/kernel/module/version.c
> > index 53f43ac5a73e..5528f98c42dc 100644
> > --- a/kernel/module/version.c
> > +++ b/kernel/module/version.c
> > @@ -17,32 +17,30 @@ int check_version(const struct load_info *info,
> >  {
> >  	Elf_Shdr *sechdrs = info->sechdrs;
> >  	unsigned int versindex = info->index.vers;
> > -	unsigned int i, num_versions;
> > -	struct modversion_info *versions;
> > +	struct modversion_info *versions, *end;
> > +	u32 crcval;
> >  
> >  	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
> >  	if (!crc)
> >  		return 1;
> > +	crcval = *crc;
> >  
> >  	/* No versions at all?  modprobe --force does this. */
> >  	if (versindex == 0)
> >  		return try_to_force_load(mod, symname) == 0;
> >  
> >  	versions = (void *)sechdrs[versindex].sh_addr;
> > -	num_versions = sechdrs[versindex].sh_size
> > -		/ sizeof(struct modversion_info);
> > +	end = (void *)versions + sechdrs[versindex].sh_size;
> >  
> > -	for (i = 0; i < num_versions; i++) {
> > -		u32 crcval;
> > -
> > -		if (strcmp(versions[i].name, symname) != 0)
> > +	for (; versions < end && versions->next;
> > +	       versions = (void *)versions + versions->next) {
> > +		if (strcmp(versions->name, symname) != 0)
> >  			continue;
> >  
> > -		crcval = *crc;
> > -		if (versions[i].crc == crcval)
> > +		if (versions->crc == crcval)
> >  			return 1;
> > -		pr_debug("Found checksum %X vs module %lX\n",
> > -			 crcval, versions[i].crc);
> > +		pr_debug("Found checksum %X vs module %X\n",
> > +			 crcval, versions->crc);
> >  		goto bad_version;
> >  	}
> >  
> > diff --git a/scripts/export_report.pl b/scripts/export_report.pl
> > index feb3d5542a62..1117646f3141 100755
> > --- a/scripts/export_report.pl
> > +++ b/scripts/export_report.pl
> > @@ -116,18 +116,19 @@ foreach my $thismod (@allcfiles) {
> >  	while ( <$module> ) {
> >  		chomp;
> >  		if ($state == 0) {
> > -			$state = 1 if ($_ =~ /static const struct modversion_info/);
> > +			$state = 1 if ($_ =~ /static const char ____versions/);
> >  			next;
> >  		}
> >  		if ($state == 1) {
> > -			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
> > +			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
> >  			next;
> >  		}
> >  		if ($state == 2) {
> > -			if ( $_ !~ /0x[0-9a-f]+,/ ) {
> > +			if ( $_ !~ /\\0"/ ) {
> > +				last if ($_ =~ /;/);
> >  				next;
> >  			}
> > -			my $sym = (split /([,"])/,)[4];
> > +			my $sym = (split /(["\\])/,)[2];
> >  			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
> >  			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
> >  			push(@{$MODULE{$thismod}} , $sym);
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index efff8078e395..55335ae98f4f 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -2046,13 +2046,17 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
> >  static void add_versions(struct buffer *b, struct module *mod)
> >  {
> >  	struct symbol *s;
> > +	unsigned int name_len;
> > +	unsigned int name_len_padded;
> > +	unsigned int tmp;
> > +	unsigned char *tmp_view = (unsigned char *)&tmp;
> >  
> >  	if (!modversions)
> >  		return;
> >  
> >  	buf_printf(b, "\n");
> > -	buf_printf(b, "static const struct modversion_info ____versions[]\n");
> > -	buf_printf(b, "__used __section(\"__versions\") = {\n");
> > +	buf_printf(b, "static const char ____versions[]\n");
> > +	buf_printf(b, "__used __section(\"__versions\") =\n");
> >  
> >  	list_for_each_entry(s, &mod->unresolved_symbols, list) {
> >  		if (!s->module)
> > @@ -2062,16 +2066,27 @@ static void add_versions(struct buffer *b, struct module *mod)
> >  				s->name, mod->name);
> >  			continue;
> >  		}
> > -		if (strlen(s->name) >= MODULE_NAME_LEN) {
> > -			error("too long symbol \"%s\" [%s.ko]\n",
> > -			      s->name, mod->name);
> > -			break;
> > -		}
> > -		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> > -			   s->crc, s->name);
> > +		name_len = strlen(s->name);
> > +		name_len_padded = (name_len + 1 + 3) & ~3;
> > +
> > +		/* Offset to next entry */
> > +		tmp = 8 + name_len_padded;
> > +		tmp = TO_NATIVE(tmp);
> > +		buf_printf(b, "\t\"\\x%02x\\x%02x\\x%02x\\x%02x",
> > +			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
> > +
> > +		tmp = TO_NATIVE(s->crc);
> > +		buf_printf(b, "\\x%02x\\x%02x\\x%02x\\x%02x\"\n",
> > +			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
> > +
> > +		buf_printf(b, "\t\"%s", s->name);
> > +		for (; name_len < name_len_padded; name_len++)
> > +			buf_printf(b, "\\0");
> > +		buf_printf(b, "\"\n");
> >  	}
> >  
> > -	buf_printf(b, "};\n");
> > +	/* Always end with a dummy NULL entry */
> > +	buf_printf(b, "\t\"\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\";\n");
> >  }
> >  
> >  static void add_depends(struct buffer *b, struct module *mod)
> This looks promissing, do you had a small reproducer to this just to
> make the code a little bit clearn to the reader?

My reproducer was to simply boot the latest 6.2 kernel with this patch
appplied on top on a ppc64 server (without the additional changes the
system just fails to boot as soon as the first module is loaded,
spitting random errors/oops to the console, due to random memory
accesses). I don't have a smaller reproducer than this, maybe I can
clarify a bit more the purpose of the last dummy entry in the comment to
help the reader understand why we need this empty entry (if I understand
your request correctly).

For the TO_NATIVE(tmp) change, instead, it's enough to build the kernel
with a recent gcc (I'm using gcc 12.2.0-17ubuntu1) and the build just
fails.

-Andrea
