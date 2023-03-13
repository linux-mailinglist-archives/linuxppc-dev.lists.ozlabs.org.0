Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21786B8446
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 22:54:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb9Rv407nz3bfw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:54:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rkLSo4Ze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rkLSo4Ze;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb9Qx2d6lz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 08:54:00 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA5ED3F0A2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678744436;
	bh=ImIPjsOrm96OhIKCZlul0rVIWTT/EgOhorWva5nGUwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=rkLSo4ZegEZ46634isleIoDZ5TIPZNteVPaWc2+axJ7e0inLQ8gfBEMZ4f4gYNAEg
	 hyoKcnkAnVI3ujtBhRrfYXCCogW6NU7xHC1CuPXp64AdFCxIe29ZYAT/3RSDUFJDZX
	 XHsotqB9ug68mIPz5f2LdJtuUHz0wTinCpoIjc6xKNnkym2vaCFiskJz9fR3znenic
	 rjq7nulFw/2LmbJWvXPKNiaXy6EpfKoyHShBfkoOng8WvNYy3ztoz7R1TQuSaVH8bX
	 whRrnLhLh9H0uCCiNT7/dDZaVvRQM6Unrt9hHKmnX/WUwMBaRfVlYpbhio2d3VKFRw
	 udkzxI+knckzQ==
Received: by mail-ed1-f69.google.com with SMTP id r9-20020a05640251c900b004d4257341c2so18785195edd.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 14:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImIPjsOrm96OhIKCZlul0rVIWTT/EgOhorWva5nGUwA=;
        b=NHfNeLCsE1ElAaaTv3OovrnQoTfbxWRONqu1o0vCHyqfQ2vrDfX905/A/cw5M0ib2r
         cSZK20G9OhjYE6tm9XncaopbxA5t7PsB+vJuNZzA/HVMv431jwwpIet3Z7vhWN8C7Y86
         lHOO8xP6iECaWLk3Nq/DYJT2wMTSllJ69YpW9YP8DNmnVYwShBeLIYxy+eDxOItjJQkv
         LrQr3A25xCGtCRhzf9t4UCsr5oczInPDx38PULWXQ8ACm5W8Ja+q+m7befR0SyEUaPqx
         fj+PDcMeaBBVhSsVilFrDjdzqBY4cDDXeIDlT/KyPMfw54dmb4123z/hqqTOXrv1WpQs
         0vqQ==
X-Gm-Message-State: AO0yUKXIlm9Uk7WLv1OC7p5ZqMDd+yO9frKW6ycTmavhtP78nnyUNHnh
	keOOhlihvtMBjt70zirEiYiNCcFh9n2wuGEtmsjc0egDqHF7YAffY1NkeBSw0TsKRLEwuwXXLFX
	iO4hPn8K6UEyY07iFvCuNv265OFJdShaYxiSbn1A3fAs=
X-Received: by 2002:a17:907:c28b:b0:861:4671:a834 with SMTP id tk11-20020a170907c28b00b008614671a834mr32842891ejc.71.1678744415977;
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set9QnwU+JDKxJqp5MiemT1KkMkul3FxIPfpoDNFIpwny1g50DjA6FuEnlTlK61hIsJX9PSIZrA==
X-Received: by 2002:a17:907:c28b:b0:861:4671:a834 with SMTP id tk11-20020a170907c28b00b008614671a834mr32842841ejc.71.1678744415479;
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00921c608b737sm266569ejb.126.2023.03.13.14.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:53:35 -0700 (PDT)
Date: Mon, 13 Mar 2023 22:53:34 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313214853.GY19419@kitsune.suse.cz>
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

On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> Hello,
> 
> On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > to store symbol names, thus placing a hard limit on length of symbols.
> > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > 
> > > It's a waste of space to simply expand the fixed array size to 512 in
> > > modversion info entries. I therefore make it variably sized, with offset
> > > to the next entry indicated by the initial "next" field.
> > > 
> > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > properly aligned.
> > > 
> > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > a bit less easy to read, as code like
> > > 
> > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > 	"symbol\0\0"
> > > 
> > > is generated as opposed to
> > > 
> > > 	{ 0x12345678, "symbol" },
> > > 
> > > because the structure is now variable-length. But hopefully nobody reads
> > > the generated file :)
> > > 
> > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > 
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > 
> > Is there any newer version of this patch?
> > 
> > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > with this applied (at boot kernel is spitting out lots of oops'es and
> > unfortunately it's really hard to copy paste or just read them from the
> > console).
> 
> Are you using the ELF ABI v1 or v2?
> 
> v1 may have some additional issues when it comes to these symbol tables.
> 
> Thanks
> 
> Michal

I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.

BTW, the issue seems to be in dedotify_versions(), as a silly test I
tried to comment out this function completely to be a no-op and now my
system boots fine (but I guess I'm probably breaking something else).

Thanks,
-Andrea
