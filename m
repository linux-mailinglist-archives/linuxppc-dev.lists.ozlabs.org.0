Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC26B82C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 21:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb7dl2c3Jz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 07:33:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=L9ACVyqb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=L9ACVyqb;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb7cm44KYz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 07:32:22 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E26213FDAE
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678739538;
	bh=1KExiXuZ2mrX5RXNq61mPBXSlFqkJlTHfvOGTBT7ZaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=L9ACVyqbZ4voDv/g2b6pvCSLm5ZVhomB2e7jwLZGuNpGJBQdj+/Jm2NzWJatA2Hu2
	 tx6aS4Ldgk9rndaiHWM4qotlR5S2wX2cn6110Iz74dhgabT3pNMxJzz6f8KDBaUjlv
	 qXes8CzdfFY9cX+0bZLQhFw80p9VatkEbDkkImiV8lr/fS/Y4MeuSHBCD8m5WB4ony
	 C0FiLcPOat8Nfb/ysbEaOxacG7CwH4GdG9l0ccz0/SOIaACYWJLmxsfiEY687JvNb7
	 DQcUz72VoWANTdS+EfGQnVK7z+EgsenAPla0zHjevAmaG/Urps2H769qgqbz659g0L
	 551yaEcJWLWzw==
Received: by mail-ed1-f69.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso18573686edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 13:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KExiXuZ2mrX5RXNq61mPBXSlFqkJlTHfvOGTBT7ZaY=;
        b=insxd41wMp+a7zE2uURcZoWDFJWMBltkghxioVV6ZZXorsIjEiG/iYNXXvLOweItmn
         ZNkVItjh5s7X4aypY9Off3SpGIIah4ElSg970CkcaW7P7KT2YG6bj5yslJ8FB5tTFlfT
         zjdpcQrSN6W3uO61fZVwQ8gv2lvxHc9gwucYirnDkI0oPmty1yCti9LJdMz2xbIzVl6Q
         /6WJ/JnrN4FpEuQc4jnj6yyR+5i4kWeHnESABKdigRVmbx3VRs0HtIOijGkb2RNG2fIJ
         fA/d/buNgwEVPh8V8HT9ilw7VSPPIYtjzsz+1Fap5FFEHxPCo7AZwjFT1ej6J+wlxfTf
         Qrzg==
X-Gm-Message-State: AO0yUKWmoWgRViH3r3mStJEGdbZYdhVslkUh4J2rj1hE5M46wWv9NUZI
	6c8RiuKTx6EbNn0oD7G4JkgGvIupsRhP3KMWtQi6pasrzsa1guTc12xf1eaeiyxdSmdsqAm62Rw
	sofDBnQFLr+FP8AVfP1YjcXrC+8zpJxiOCSkJRmpNWOg=
X-Received: by 2002:a17:907:2d2c:b0:92c:1756:8c4b with SMTP id gs44-20020a1709072d2c00b0092c17568c4bmr85348ejc.3.1678739537657;
        Mon, 13 Mar 2023 13:32:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Hz/NflAYKnUyIH0ZlDjBEhCXB+FjCSw+3FgiE4kBEpxbt1v3na1v9YXEAxYpTvm5i83j1pQ==
X-Received: by 2002:a17:907:2d2c:b0:92c:1756:8c4b with SMTP id gs44-20020a1709072d2c00b0092c17568c4bmr85306ejc.3.1678739537315;
        Mon, 13 Mar 2023 13:32:17 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id ke4-20020a17090798e400b0092153c6b549sm216886ejc.22.2023.03.13.13.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:32:17 -0700 (PDT)
Date: Mon, 13 Mar 2023 21:32:16 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111161155.1349375-1-gary@garyguo.net>
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
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, Guo Zhengkui <guozhengkui@vivo.com>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> Currently modversion uses a fixed size array of size (64 - sizeof(long))
> to store symbol names, thus placing a hard limit on length of symbols.
> Rust symbols (which encodes crate and module names) can be quite a bit
> longer. The length limit in kallsyms is increased to 512 for this reason.
> 
> It's a waste of space to simply expand the fixed array size to 512 in
> modversion info entries. I therefore make it variably sized, with offset
> to the next entry indicated by the initial "next" field.
> 
> In addition to supporting longer-than-56/60 byte symbols, this patch also
> reduce the size for short symbols by getting rid of excessive 0 paddings.
> There are still some zero paddings to ensure "next" and "crc" fields are
> properly aligned.
> 
> This patch does have a tiny drawback that it makes ".mod.c" files generated
> a bit less easy to read, as code like
> 
> 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> 	"symbol\0\0"
> 
> is generated as opposed to
> 
> 	{ 0x12345678, "symbol" },
> 
> because the structure is now variable-length. But hopefully nobody reads
> the generated file :)
> 
> Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> Link: https://github.com/Rust-for-Linux/linux/pull/379
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Is there any newer version of this patch?

I'm doing some tests with it, but I'm getting boot failures on ppc64
with this applied (at boot kernel is spitting out lots of oops'es and
unfortunately it's really hard to copy paste or just read them from the
console).

Thanks,
-Andrea
