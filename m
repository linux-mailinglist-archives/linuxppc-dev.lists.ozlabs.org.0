Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA16BA3F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 01:16:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbrXN3444z3cff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 11:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qvmwb0/P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=vincenzopalazzodev@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qvmwb0/P;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbrWP4s4Mz301F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 11:15:12 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso90302wms.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 17:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678839305;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3awC0gMPAiPXnlm6wKZJyVsjNQ276k/08Eimwgsa2PY=;
        b=qvmwb0/PxDkWj/0STg/wCTEyGg8MPkbhQVsg70PSBLJukww9j8oQCmHhUNMk6OXtjj
         mksE1fmju6ez2ur6MvSDX+1u4Qg8DLq9xRsNEf8pe4UjfOsVumNrY3kAGzz4ZTqAhRm+
         IQLAuvp4R2VgBIagDb6WaTjFiHpQTl+9R5aO46IxdzzomgiOooAoKIShp5o54e5cjqpv
         szMrLSZgQ4EdAagUmNvqNn2bD7ODX6+TEyEbxRRojuxWSzYLSvg+GxXgIdfYm2kxwgVT
         m6K+j6JxckWHZlonHB95o3vpCgFMoBaxVQTSmeEHMSSjljqLjejB+Fnc7sDDVxBMxQcR
         P/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678839305;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3awC0gMPAiPXnlm6wKZJyVsjNQ276k/08Eimwgsa2PY=;
        b=WMrFjidp4pmIWG3RMLqmCEi2DBWAY/Uo7kwzCX7OXH+QJFvBeBFbz6YHjEAc+EdfWd
         +BLGeyqEFUXWK7aaYL9miCQOzDMFBzZkwzb7X7j0Vc2O9w9MLfd2ipOF3oDk2wEe4zdt
         fYBmkN1mcZnyO4jOXbQFHQTDC7WyQ9sLf5d0NcN3/USZQiJiJ+Jf9wT5IMmzEuWUXk3W
         yUN6lCUDXX+RVwLFnSusvzF2I0RpnVGoKTNlqdjCu3ETeWXzFM9Yj49EvpjVD+xySL/I
         /k5jkf6zJ7jI6eM+D54+f5fzWlxEvpaUsJJBnrN+e/7gs4WHp2m+OKLtFJN23GswOZAS
         YbnQ==
X-Gm-Message-State: AO0yUKXf7y418xTgeKIOKFoZ8b69ChfL3lp3G8QNpulOGLDMSxtmpeK7
	g/WYt0vSxbQ841vQCyMUrto=
X-Google-Smtp-Source: AK7set9z+WtrIevyfgj0uiVN2/U69pNjGkpvV5AmeeklAczYUZcRXbCkH10sq6c4Hml5XTZPzgMDVg==
X-Received: by 2002:a05:600c:3b9d:b0:3ed:29db:cb80 with SMTP id n29-20020a05600c3b9d00b003ed29dbcb80mr6153512wms.18.1678839305389;
        Tue, 14 Mar 2023 17:15:05 -0700 (PDT)
Received: from localhost (93-55-83-125.ip262.fastwebnet.it. [93.55.83.125])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003e20cf0408esm72131wmj.40.2023.03.14.17.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 17:15:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Mar 2023 01:15:03 +0100
Message-Id: <CR6IV4NTEN8Z.1V1RNR667SWJ7@vincent-arch>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Andrea Righi" <andrea.righi@canonical.com>,
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: aerc 0.14.0
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
 <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
 <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
 <ZBCL1G+8z8c6zLI0@righiandr-XPS-13-7390>
In-Reply-To: <ZBCL1G+8z8c6zLI0@righiandr-XPS-13-7390>
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas
 Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo
 Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> In practice, this is what I'm testing at the moment:
>
> ---
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module=
_64.c
> index ff045644f13f..ea6c830ed1e7 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -234,12 +234,13 @@ static unsigned long get_stubs_size(const Elf64_Ehd=
r *hdr,
>  static void dedotify_versions(struct modversion_info *vers,
>  			      unsigned long size)
>  {
> -	struct modversion_info *end;
> +	struct modversion_info *end =3D (void *)vers + size;
> =20
> -	for (end =3D (void *)vers + size; vers < end; vers++)
> +	for (; vers < end && vers->next; vers =3D (void *)vers + vers->next) {
>  		if (vers->name[0] =3D=3D '.') {
>  			memmove(vers->name, vers->name+1, strlen(vers->name));
>  		}
> +	}
>  }
> =20
>  /*
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 8c5909c0076c..4744901bdf63 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -34,9 +34,11 @@
>  #define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
> =20
>  struct modversion_info {
> -	unsigned long crc;
> -	char name[MODULE_NAME_LEN];
> -};
> +	/* Offset of the next modversion entry in relation to this one. */
> +	u32 next;
> +	u32 crc;
> +	char name[0];
> +} __packed;
> =20
>  struct module;
>  struct exception_table_entry;
> diff --git a/kernel/module/version.c b/kernel/module/version.c
> index 53f43ac5a73e..5528f98c42dc 100644
> --- a/kernel/module/version.c
> +++ b/kernel/module/version.c
> @@ -17,32 +17,30 @@ int check_version(const struct load_info *info,
>  {
>  	Elf_Shdr *sechdrs =3D info->sechdrs;
>  	unsigned int versindex =3D info->index.vers;
> -	unsigned int i, num_versions;
> -	struct modversion_info *versions;
> +	struct modversion_info *versions, *end;
> +	u32 crcval;
> =20
>  	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
>  	if (!crc)
>  		return 1;
> +	crcval =3D *crc;
> =20
>  	/* No versions at all?  modprobe --force does this. */
>  	if (versindex =3D=3D 0)
>  		return try_to_force_load(mod, symname) =3D=3D 0;
> =20
>  	versions =3D (void *)sechdrs[versindex].sh_addr;
> -	num_versions =3D sechdrs[versindex].sh_size
> -		/ sizeof(struct modversion_info);
> +	end =3D (void *)versions + sechdrs[versindex].sh_size;
> =20
> -	for (i =3D 0; i < num_versions; i++) {
> -		u32 crcval;
> -
> -		if (strcmp(versions[i].name, symname) !=3D 0)
> +	for (; versions < end && versions->next;
> +	       versions =3D (void *)versions + versions->next) {
> +		if (strcmp(versions->name, symname) !=3D 0)
>  			continue;
> =20
> -		crcval =3D *crc;
> -		if (versions[i].crc =3D=3D crcval)
> +		if (versions->crc =3D=3D crcval)
>  			return 1;
> -		pr_debug("Found checksum %X vs module %lX\n",
> -			 crcval, versions[i].crc);
> +		pr_debug("Found checksum %X vs module %X\n",
> +			 crcval, versions->crc);
>  		goto bad_version;
>  	}
> =20
> diff --git a/scripts/export_report.pl b/scripts/export_report.pl
> index feb3d5542a62..1117646f3141 100755
> --- a/scripts/export_report.pl
> +++ b/scripts/export_report.pl
> @@ -116,18 +116,19 @@ foreach my $thismod (@allcfiles) {
>  	while ( <$module> ) {
>  		chomp;
>  		if ($state =3D=3D 0) {
> -			$state =3D 1 if ($_ =3D~ /static const struct modversion_info/);
> +			$state =3D 1 if ($_ =3D~ /static const char ____versions/);
>  			next;
>  		}
>  		if ($state =3D=3D 1) {
> -			$state =3D 2 if ($_ =3D~ /__attribute__\(\(section\("__versions"\)\)\=
)/);
> +			$state =3D 2 if ($_ =3D~ /__used __section\("__versions"\)/);
>  			next;
>  		}
>  		if ($state =3D=3D 2) {
> -			if ( $_ !~ /0x[0-9a-f]+,/ ) {
> +			if ( $_ !~ /\\0"/ ) {
> +				last if ($_ =3D~ /;/);
>  				next;
>  			}
> -			my $sym =3D (split /([,"])/,)[4];
> +			my $sym =3D (split /(["\\])/,)[2];
>  			my ($module, $value, $symbol, $gpl) =3D @{$SYMBOL{$sym}};
>  			$SYMBOL{ $sym } =3D  [ $module, $value+1, $symbol, $gpl];
>  			push(@{$MODULE{$thismod}} , $sym);
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index efff8078e395..55335ae98f4f 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2046,13 +2046,17 @@ static void add_exported_symbols(struct buffer *b=
uf, struct module *mod)
>  static void add_versions(struct buffer *b, struct module *mod)
>  {
>  	struct symbol *s;
> +	unsigned int name_len;
> +	unsigned int name_len_padded;
> +	unsigned int tmp;
> +	unsigned char *tmp_view =3D (unsigned char *)&tmp;
> =20
>  	if (!modversions)
>  		return;
> =20
>  	buf_printf(b, "\n");
> -	buf_printf(b, "static const struct modversion_info ____versions[]\n");
> -	buf_printf(b, "__used __section(\"__versions\") =3D {\n");
> +	buf_printf(b, "static const char ____versions[]\n");
> +	buf_printf(b, "__used __section(\"__versions\") =3D\n");
> =20
>  	list_for_each_entry(s, &mod->unresolved_symbols, list) {
>  		if (!s->module)
> @@ -2062,16 +2066,27 @@ static void add_versions(struct buffer *b, struct=
 module *mod)
>  				s->name, mod->name);
>  			continue;
>  		}
> -		if (strlen(s->name) >=3D MODULE_NAME_LEN) {
> -			error("too long symbol \"%s\" [%s.ko]\n",
> -			      s->name, mod->name);
> -			break;
> -		}
> -		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> -			   s->crc, s->name);
> +		name_len =3D strlen(s->name);
> +		name_len_padded =3D (name_len + 1 + 3) & ~3;
> +
> +		/* Offset to next entry */
> +		tmp =3D 8 + name_len_padded;
> +		tmp =3D TO_NATIVE(tmp);
> +		buf_printf(b, "\t\"\\x%02x\\x%02x\\x%02x\\x%02x",
> +			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
> +
> +		tmp =3D TO_NATIVE(s->crc);
> +		buf_printf(b, "\\x%02x\\x%02x\\x%02x\\x%02x\"\n",
> +			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
> +
> +		buf_printf(b, "\t\"%s", s->name);
> +		for (; name_len < name_len_padded; name_len++)
> +			buf_printf(b, "\\0");
> +		buf_printf(b, "\"\n");
>  	}
> =20
> -	buf_printf(b, "};\n");
> +	/* Always end with a dummy NULL entry */
> +	buf_printf(b, "\t\"\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\";\n");
>  }
> =20
>  static void add_depends(struct buffer *b, struct module *mod)
This looks promissing, do you had a small reproducer to this just to
make the code a little bit clearn to the reader?

Ciao,=20

Vincent.
