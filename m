Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80E56A07C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 12:53:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdtZ52Qpqz3c9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 20:53:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Kuo/M9df;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=ow6x=xm=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Kuo/M9df;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdtYQ3CVQz30Bl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 20:53:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D33BB8213C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD01C341C6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:53:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Kuo/M9df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657191186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0hiP75bywalq4wJilKlgvi8A6ckY7G9OfIHBXYukrA=;
	b=Kuo/M9dfJqc4ZchaoFkxvgAKDC6qHrotNcISSxGj8w/TAIjLGVbjHYVB9tng1J858d5/u7
	xTOgzzWFfIG/1JhP/Qj/E2mboSq0H4eMiO7v8S72hddr0+zvGlgoUAz3o0lGZhqGCmJ4dR
	Ybtcc05oJ0w2SETQHQLKSrey07t/Prs=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cacf7492 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 7 Jul 2022 10:53:06 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id v1so7577213ilg.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jul 2022 03:53:06 -0700 (PDT)
X-Gm-Message-State: AJIora/BkD5LW1uFV5amj21BfCkMxBYw+dxpovUXjGor9I/42m4GqwLa
	ROgOVEJoKt/g9k1BcdKHEFK/WuilF4c+UOJOL9M=
X-Google-Smtp-Source: AGRyM1uPG2aPUQGnUtUd1utWCbj/p/OG8HUm8NCM64ilDZ1INtOsvBMn+v+G15oROID8oYLRYjIM7z8FWS+ahoTmFss=
X-Received: by 2002:a05:6e02:20cb:b0:2dc:28d0:b8a5 with SMTP id
 11-20020a056e0220cb00b002dc28d0b8a5mr7727958ilq.160.1657191185406; Thu, 07
 Jul 2022 03:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707173252.5fff21f2@canb.auug.org.au>
In-Reply-To: <20220707173252.5fff21f2@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2022 12:52:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9qCTZpRKrvXVDhCGTD6z15BwDFupX0Z5QwhoWCCT2w2Fw@mail.gmail.com>
Message-ID: <CAHmME9qCTZpRKrvXVDhCGTD6z15BwDFupX0Z5QwhoWCCT2w2Fw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Juerg Haefliger <juerg.haefliger@canonical.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Thu, Jul 7, 2022 at 9:36 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the random tree got a conflict in:
>
>   arch/powerpc/Kconfig
>
> between commit:
>
>   cea9d62b64c9 ("powerpc: Kconfig: Replace tabs with whitespaces")
>
> from the powerpc tree and commit:
>
>   a2ff4b7600cd ("random: remove CONFIG_ARCH_RANDOM")
>
> from the random tree.
>
> I fixed it up (the latter removed some lines updated by the former) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Oh darn. Any clever tricks to prevent the merge conflict from
happening? Or is this trivial enough that we'll let Linus deal with
it?

Jason
