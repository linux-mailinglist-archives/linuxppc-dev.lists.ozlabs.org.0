Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E27440423
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 22:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgvJ115C2z3bT7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 07:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RCw3Iivy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RCw3Iivy; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgvHN1Z4lz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 07:32:14 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id h7so43080082ede.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ozNhOMYHhRS66Zjk0oh8InVNhdkPNj4ByxHFQ8rkaUk=;
 b=RCw3Iivy1snzcZ919MyW/R1XUhrFMj1e/VuOf6L3q0VvuplLCn6XUmySNM+UDUxoJ5
 LZl0p4GKBFe0B9/BsG5ZE+EidRP0fxRxvZSZjyQP/062kOz6n+qZgdrvSvYvb24AyNPv
 TKtuUYCXBSeCRMRiW7404PnxmIuqWIEoME3cJfWsqza0wFDfF3/lM959E8ogIhnkWQ58
 FfFtnST+shH/+pOJWCUlXWELAyhswIJTWg4Er40sCS4I6bmhilkc4bkn7YGyl2iBc5oU
 kr84n03lUtZ3AHvJI3AUQYGh4L6FoIPRVQPLiSX8FdrGjrxFbBdQL9kh0mEbLP/Ov8el
 jgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ozNhOMYHhRS66Zjk0oh8InVNhdkPNj4ByxHFQ8rkaUk=;
 b=Ed1i2bQiT2eXUWCSvV9oc4hd/IgbrEabciXYTpn2lyIBc8uZcgZNsFv23b3lkN738A
 h6RnjVl5sF35TgJPao8KGWE95HbqZUXuxQu3kMuUa2iWwRDe4jl2mc+ixwIZ7aAty003
 zh0mm5SPWUeASdBzyOXBCAJ9fArnldLyK/q2Mw1nEe8VIrmkWdWwemn56lesZLH4c59h
 UJhUOGqsjtzST3PTkU8hQPrSqjzfqpUZUunKDZeOvOkrXSU8Yv4V2oAIjjaV7t0H9DYq
 WU5UT+ovbWeB9ayQIbNjdzyH49ULBsONkV7yLtQqK5uZSYzTw76szgNfn9iVgAb9nIHX
 J7wg==
X-Gm-Message-State: AOAM533YO7wU4RiWmfbYxBRusnr/xwfLp+wdesUl6la2BFxZ5y4PQ/t5
 1RO53A+ZQ9qfxk3JJsi6BnK6uOcRww3ajr1+scU=
X-Google-Smtp-Source: ABdhPJztI2Nd1ffMSi/k8qSjj7eVlfXQjs6tyYTMz/oVQicYetCA3AeEFeXv38o7aYUiOvlGfDuxFe3ZaQ5X3kpoDdo=
X-Received: by 2002:aa7:ca07:: with SMTP id y7mr17607050eds.107.1635539527085; 
 Fri, 29 Oct 2021 13:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
 <YXwZihLk1njsBNT4@smile.fi.intel.com>
 <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
In-Reply-To: <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Oct 2021 23:31:30 +0300
Message-ID: <CAHp75VeB8Dmr6Hrupb1Hj=D=oG1zPyJrhCXu37QtXHNNKdNvZg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
To: LEROY Christophe <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 29, 2021 at 10:04 PM LEROY Christophe
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/10/2021 =C3=A0 17:55, Andy Shevchenko a =C3=A9crit :
> > On Wed, Oct 27, 2021 at 06:33:54PM +0300, Andy Shevchenko wrote:
> >> When kernel.h is used in the headers it adds a lot into dependency hel=
l,
> >> especially when there are circular dependencies are involved.
> >>
> >> Replace kernel.h inclusion with the list of what is really being used.
> >
> > Seems nobody from PPC took this patch.
> > Any idea who can take it?
> >
>
> You have to check in MAINTAINERS file in the root directory of kernel
> sources: https://github.com/linuxppc/linux/blob/master/MAINTAINERS

Actually for these files get_maintainer.pl showed nothing.
I have chosen PPC maintainers manually.

> That's Michael who takes them. But you have to allow him enough time for =
it.

Thanks!

I wrote that message because I have got a notification from checkpatch
that it should go somewhere else.

--=20
With Best Regards,
Andy Shevchenko
