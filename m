Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082175EB4D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:53:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbyhg0MTXz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k+WJCcJe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k+WJCcJe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbyh31q0rz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:52:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 270E960FB8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897E6C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664232750;
	bh=X+i9bYu7/jWxfKAIE3i62yvVnxdBvG/IiRya+AP0Akw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k+WJCcJepmSQ14q6DF5jb4UgCKZYbXeY7nACK6WAMaM/uPrYsQ+x8Qku3yU28PjFn
	 PBeq/7jXzTW5J7/I1aqFgjDWN6Qv9cXBfLIQh5FAgNZfj+dcU2GHS9dh5S7NTNVbP6
	 OsuUnzF7FrpO3kLanOffFkQtonPMofZ/ELbU56XCKeHwvPoSLxg+bV/2f7ehoFgFJl
	 FKdtkqoi+DknB7qodCR5V55GUwjO6qJ3LfnKEwE5FJhXqV8k/JlVDRy2jzgrI1B4JE
	 2KQ4vLyOR6v+Ll4oUKdjtWIV0Q+QHJHHuHkzMqbZFkJTnaS6fPFr9x02dCBwO2e9Nb
	 ora+TTneLbDhg==
Received: by mail-ua1-f54.google.com with SMTP id u14so2976871ual.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:52:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf1mS/Q1WZU1zj9bmEn98gjA6PTfXMQIZ/3+lvMT25ee0Oj5hHEr
	JgpBlgQ43Rj2GEjruiew89xC5hVU9KzLnAwQ5g==
X-Google-Smtp-Source: AMsMyM43QjpEBGgBdeXDtHcyhT0+TUAlXLvP8qGgbv5J2u9gIos+nqDadyw2zzx9fWZeWcsqwCL4JDInZkzVBkDATYI=
X-Received: by 2002:ab0:2715:0:b0:3c9:90c2:1aea with SMTP id
 s21-20020ab02715000000b003c990c21aeamr7366736uao.77.1664232749469; Mon, 26
 Sep 2022 15:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210416040924.2882771-1-danielwa@cisco.com> <b517fac5-2fdc-a8c9-75d0-174c67f5a2de@seco.com>
 <20220922205334.GV4320@zorba> <dcff9b0f-82c8-5aa7-0fff-b749a05fcb20@seco.com>
 <20220922211026.GW4320@zorba> <1663881344.25129.23.camel@chimera>
In-Reply-To: <1663881344.25129.23.camel@chimera>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Sep 2022 17:52:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLibRSi2n389Q7cf+1gQSidvfiZHjHCcGirgi0hgJ53-A@mail.gmail.com>
Message-ID: <CAL_JsqLibRSi2n389Q7cf+1gQSidvfiZHjHCcGirgi0hgJ53-A@mail.gmail.com>
Subject: Re: [PATCH 0/8] generic command line v4
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, 
	Daniel Walker <danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 22, 2022 at 4:15 PM Daniel Gimpelevich
<daniel@gimpelevich.san-francisco.ca.us> wrote:
>
> On Thu, 2022-09-22 at 14:10 -0700, Daniel Walker wrote:
> > On Thu, Sep 22, 2022 at 05:03:46PM -0400, Sean Anderson wrote:
> [snip]
> > > As recently as last month, someone's patch to add such support was
> > > rejected for this reason [1].
> > >
> > > --Sean
> > >
> > > [1] https://lore.kernel.org/linux-arm-kernel/20220812084613.GA3107@willie-the-truck/
> >
> >
> > I had no idea.. Thanks for pointing that out. I guess I will re-submit in that
> > case.
> >
> > Daniel
>
> This has been happening repeatedly since circa 2014, on multiple
> architectures. It's quite frustrating, really.

It must not be that important. From the last time, IMO Christophe's
version was much closer to being merged than this series. This is not
how you get things upstream:

> * Dropped powerpc changes
>   Christophe Leroy has reservations about the features for powerpc. I
>   don't think his reservations are founded, and these changes should
>   fully work on powerpc. However, I dropped these changes so Christophe
>   can have more time to get comfortable with the changes.

Rob
