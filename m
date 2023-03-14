Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E86B9824
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 15:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbbkx1w66z3cKn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 01:39:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=N5i3dJBa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=N5i3dJBa;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbbk04f4gz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 01:38:30 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4081941B6C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678804705;
	bh=288VuNJSsTmZZFRO0N0jW/xRk9rWGq8/Z/699waOGV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=N5i3dJBacBa7JPKYlht8A/Lp47cNRb9lb8eH+YEBpsPnmT+RWfv4Yrq1AEWKpPuBT
	 7qRXeZ1eVhY4joyJmWCUHfLYO9skhmjfCqpid6SvSVO2s5WbVvDUttlCsl6iEMgCY9
	 SQyKovKOw/cZiWRANGYMGMqcz6v3kZQvFN2BFDI4Ui0Q1A43LfKGF62noYkUdlUzpu
	 aLyEXs4XnZxKHrYaM7Z9EhZcugmrNSDNrnECc61KaVEG1miuuz3kHnUj8Hq/3WmeQu
	 eVKPapQ84dO5eS801/qIKlEi76CwWYo5jcrPlwoSmVnt3tOo0huJEGZ/uYuag3vcnQ
	 BqVrxkLp44boQ==
Received: by mail-ed1-f69.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso22242720edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 07:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678804704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=288VuNJSsTmZZFRO0N0jW/xRk9rWGq8/Z/699waOGV4=;
        b=LLia62UIATsPAC6Zvgpmpa+5PlHRUxzUVEqRDwqlYXdupMehH5EOdgTDIMnouWipWR
         0COfwuL2slcnj/Y1gYoIwPxogq++7FJxYmtw6TSgk+6lyRHG5sfNk1eeyjemZfbxyvVA
         tjxQy4GUP1Lfvgx9J01i101gvY4o/WXX31S5x170qItPCJ3pPh11MxRTA9gK0NQy4tVP
         Fr/MJ+dEpMuvJOKoJv7PaBrUPLdS+kh/1QW/QX9HmIhedgQSx+xj1cNp5ZTQ0eaP67Nq
         xejVozzVEEFsFTJBJaTPRjzWepOK8fFViLvozE+jugbmXem676PCPYIL5qjjutB4ohMK
         6zlA==
X-Gm-Message-State: AO0yUKVt85eB0gEYd/fs/f7855oDyWrrIZyIM2ngdF8uXB+C9U5tPxV1
	bGAoO1gj4kvSso00OIRiZmxAaE/GLzasOjr2sZZJ7+SWTNoiAmyus3T9G0gE2JUlrwmIPNbwo0y
	jDeLMH4kNI6AoYybLn4/zPAlMNgQrueXEKXn4LPbcihI=
X-Received: by 2002:aa7:d402:0:b0:4fe:1b54:4351 with SMTP id z2-20020aa7d402000000b004fe1b544351mr1915021edq.4.1678804704637;
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set/9UQPw+w9rgl+fak2wtd9z0XAPlW1SUX/vS1Y0goDh90JNitSGRt9qq6R5GMdI7yAfTMFM5Q==
X-Received: by 2002:aa7:d402:0:b0:4fe:1b54:4351 with SMTP id z2-20020aa7d402000000b004fe1b544351mr1914999edq.4.1678804704301;
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id u19-20020a50c053000000b004fc537aec3csm1143462edd.74.2023.03.14.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
Date: Tue, 14 Mar 2023 15:38:23 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
 <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 11:09:31PM +0100, Andrea Righi wrote:
> On Mon, Mar 13, 2023 at 11:02:34PM +0100, Michal Suchánek wrote:
> > On Mon, Mar 13, 2023 at 10:53:34PM +0100, Andrea Righi wrote:
> > > On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> > > > Hello,
> > > > 
> > > > On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > > > > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > > > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > > > > to store symbol names, thus placing a hard limit on length of symbols.
> > > > > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > > > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > > > > 
> > > > > > It's a waste of space to simply expand the fixed array size to 512 in
> > > > > > modversion info entries. I therefore make it variably sized, with offset
> > > > > > to the next entry indicated by the initial "next" field.
> > > > > > 
> > > > > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > > > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > > > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > > > > properly aligned.
> > > > > > 
> > > > > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > > > > a bit less easy to read, as code like
> > > > > > 
> > > > > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > > > > 	"symbol\0\0"
> > > > > > 
> > > > > > is generated as opposed to
> > > > > > 
> > > > > > 	{ 0x12345678, "symbol" },
> > > > > > 
> > > > > > because the structure is now variable-length. But hopefully nobody reads
> > > > > > the generated file :)
> > > > > > 
> > > > > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > > > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > > > > 
> > > > > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > > > > 
> > > > > Is there any newer version of this patch?
> > > > > 
> > > > > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > > > > with this applied (at boot kernel is spitting out lots of oops'es and
> > > > > unfortunately it's really hard to copy paste or just read them from the
> > > > > console).
> > > > 
> > > > Are you using the ELF ABI v1 or v2?
> > > > 
> > > > v1 may have some additional issues when it comes to these symbol tables.
> > > > 
> > > > Thanks
> > > > 
> > > > Michal
> > > 
> > > I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.
> > > 
> > > BTW, the issue seems to be in dedotify_versions(), as a silly test I
> > > tried to comment out this function completely to be a no-op and now my
> > > system boots fine (but I guess I'm probably breaking something else).
> > 
> > Probably not. You should not have the extra leading dot on ABI v2. So if
> > dedotify does something that means something generates and then expects
> > back symbols with a leading dot, and this workaround for ABI v1 breaks
> > that. Or maybe it is called when it shouldn't.
> 
> Hm.. I'll add some debugging to this function to see what happens exactly.

Alright I've done more tests across different architectures. My problem
with ppc64 is that this architecture is evaluating sechdrs[i].sh_size
using get_stubs_size(), that apparently can add some extra padding, so
doing (vers + vers->next < end) isn't a reliable check to determine the
end of the variable array, because sometimes "end" can be greater than
the last "vers + vers->next" entry.

In general I think it'd be more reliable to add a dummy NULL entry at
the end of the modversion array.

Moreover, I think we also need to enforce struct modversion_info to be
__packed, just to make sure that no extra padding is added (otherwise it
may break our logic to determine the offset of the next entry).

> @@ -2062,16 +2066,25 @@ static void add_versions(struct buffer *b, struct module *mod)
>  				s->name, mod->name);
>  			continue;
>  		}
> -		if (strlen(s->name) >= MODULE_NAME_LEN) {
> -			error("too long symbol \"%s\" [%s.ko]\n",
> -			      s->name, mod->name);
> -			break;
> -		}
> -		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> -			   s->crc, s->name);
> +		name_len = strlen(s->name);
> +		name_len_padded = (name_len + 1 + 3) & ~3;
> +
> +		/* Offset to next entry */
> +		tmp = TO_NATIVE(8 + name_len_padded);

^ Here's another issue that I found, you can't use TO_NATIVE() in this
way, some compilers are complaining (like on s390x this doesn't build).

So we need to do something like:

	/* Offset to next entry */
	tmp = 8 + name_len_padded
	tmp = TO_NATIVE(tmp);

I'll do some additional tests with these changes and send an updated
patch (for those that are interested).

-Andrea
