Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913316B8487
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 23:10:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb9nv2p9Qz3cB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:10:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=vwyLfFxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=vwyLfFxt;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb9mw6jwzz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 09:09:35 +1100 (AEDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAD963F591
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678745371;
	bh=EBMHeYCeRHGu2+rLkZfqPcI8agcZPwmUe8po8kQpky8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=vwyLfFxtVnv+Lu+h8YWH4lVX3L/gRtmZVftkVhdyCcAQcHz8Rw0f+EL1kd2H0/UDo
	 VsjyAtNo52tWtjjDQF5WCygfh8+IlEIKeL/WepDab6RMaqsvzFNNHZj1aGFQ2mnDm3
	 QNcJONAnYqAfD+jl705LiwOdY6KNNATXBA1sGtlkHID9/JG6WABlW4asyrg6pfBJHJ
	 zQbOJV+cpDf9xwlzNhBSXJVwHookxe2dfs+e0PeF6bFVtbK08I5eIs0gf/aAm0KX4O
	 qzbhlmmVClKjxswaWjl+W2VcTLSuajP4UFkqRd2XIEiH0pV1xjzGwzMm4DlAj4QFjf
	 XILBVKSE3EAKQ==
Received: by mail-ed1-f70.google.com with SMTP id m8-20020a056402430800b004cdaaa4f428so18956201edc.20
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 15:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBMHeYCeRHGu2+rLkZfqPcI8agcZPwmUe8po8kQpky8=;
        b=C/psGThkxmUCf2iCvENy1UFtSky6nNE6A1XhijwPHvHEw7UOJAIYYvFtbHuD6ZTFEf
         iNJi27hhzRQcYJ5BziJ8vF5o+LRcA7xYWQu5OrAiTQjKBezvTQFbWG8ih+8hWo4PKANj
         bdmxbVPwt8UPxty5G2/vXDgrKxcOD2LP/Id0m6TvC4WxwRd6Uy2AzlKZxLKtMVL+zB6D
         TZ032htD0Qk04GXhpwj4+As6D+jO8LtTqAM7maHOXIdsEX6Vg7p7TxR4FQQHDSXETCKw
         PsRvnJwtk0FuAD3hvj3TVCJcbSpepqyZ1hFj75IGrRpyDCC82Ook3XEb6wCNd8BjKLg2
         WhRA==
X-Gm-Message-State: AO0yUKUrVIVzGIDx5D074agyhWNkBh3MWo0ujiXhFvMuahVCTaNJdlhp
	e8sO/jKEkI840wH+/8nJFxkl/51g3vUTXGRXmZ9+qOQOXPJwjVhtUoWWSF5kYHIjf6RM71Fa6pd
	KdMhb3ABEnOnju8n/NwtTsx1/CbFkcvzuRnfFNto9vbM=
X-Received: by 2002:aa7:c552:0:b0:4fb:e14:c25b with SMTP id s18-20020aa7c552000000b004fb0e14c25bmr6867388edr.33.1678745371406;
        Mon, 13 Mar 2023 15:09:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set/c1Fg2tlgnGWAqXlrqlvJt1JsHHc+0XDpKqNUfCJ8+/7M0lzfDWfTLamqPeXAAAhttkDyZ7g==
X-Received: by 2002:aa7:c552:0:b0:4fb:e14:c25b with SMTP id s18-20020aa7c552000000b004fb0e14c25bmr6867362edr.33.1678745371068;
        Mon, 13 Mar 2023 15:09:31 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id o26-20020a509b1a000000b004aeeb476c5bsm272865edi.24.2023.03.13.15.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:09:30 -0700 (PDT)
Date: Mon, 13 Mar 2023 23:09:30 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313220234.GZ19419@kitsune.suse.cz>
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

On Mon, Mar 13, 2023 at 11:02:34PM +0100, Michal Suchánek wrote:
> On Mon, Mar 13, 2023 at 10:53:34PM +0100, Andrea Righi wrote:
> > On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> > > Hello,
> > > 
> > > On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > > > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > > > to store symbol names, thus placing a hard limit on length of symbols.
> > > > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > > > 
> > > > > It's a waste of space to simply expand the fixed array size to 512 in
> > > > > modversion info entries. I therefore make it variably sized, with offset
> > > > > to the next entry indicated by the initial "next" field.
> > > > > 
> > > > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > > > properly aligned.
> > > > > 
> > > > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > > > a bit less easy to read, as code like
> > > > > 
> > > > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > > > 	"symbol\0\0"
> > > > > 
> > > > > is generated as opposed to
> > > > > 
> > > > > 	{ 0x12345678, "symbol" },
> > > > > 
> > > > > because the structure is now variable-length. But hopefully nobody reads
> > > > > the generated file :)
> > > > > 
> > > > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > > > 
> > > > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > > > 
> > > > Is there any newer version of this patch?
> > > > 
> > > > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > > > with this applied (at boot kernel is spitting out lots of oops'es and
> > > > unfortunately it's really hard to copy paste or just read them from the
> > > > console).
> > > 
> > > Are you using the ELF ABI v1 or v2?
> > > 
> > > v1 may have some additional issues when it comes to these symbol tables.
> > > 
> > > Thanks
> > > 
> > > Michal
> > 
> > I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.
> > 
> > BTW, the issue seems to be in dedotify_versions(), as a silly test I
> > tried to comment out this function completely to be a no-op and now my
> > system boots fine (but I guess I'm probably breaking something else).
> 
> Probably not. You should not have the extra leading dot on ABI v2. So if
> dedotify does something that means something generates and then expects
> back symbols with a leading dot, and this workaround for ABI v1 breaks
> that. Or maybe it is called when it shouldn't.

Hm.. I'll add some debugging to this function to see what happens exactly.

-Andrea
