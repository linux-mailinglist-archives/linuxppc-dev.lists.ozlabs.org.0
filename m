Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BF60D268
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 19:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxf125Qvhz3c78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 04:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aQXTsL9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aQXTsL9N;
	dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxf063pfvz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 04:22:45 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id u132so2052530oib.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnycRWzQFhXW+E+yHAOypiR1qOTxMMwn/mhojHoxaPo=;
        b=aQXTsL9NfQ6zm9GGiC7urT7nYN3RJAfmUONUTx6FytLwp5zSbDRgfbpz0SkKcQutcy
         4IiyJ3bK+iCKC8ie7Y84bwUlEgaL6ANTpS+4zD0TzLANJacQoTs3TZPB6Wm9k+YJEydU
         Ke6M/V6X9jp3zk2h2TmweOM1irSxFs7/d5EqHPwZmxxqLIqLGm6bUl1n1/cq66ojxVoz
         r7bcn30Ga46Fqa5dIdpMNE1MQLX6HB1EZMpyWGIwJdkqAuXcYX26I3VWs6G6NchoaeG7
         /49Vx7VY34jlFs8ZP8oj5TyWvP0u0CjBOmubNWu2ozkoGngbbvQzSnY2njDzn7dQCvlx
         sRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnycRWzQFhXW+E+yHAOypiR1qOTxMMwn/mhojHoxaPo=;
        b=gvHpuR1fCLcetyDldahLEmbbTGVXK1OG3quMwHe55BNJql3uAjmVf9uXn96Ztj4uRY
         JVPQeHyzWwGXHScmoOrWza9PegU0W8Q8k57vf2Nv2wGq+iCuSpuuZ+KWdDKAkLiNeYh1
         qpv9+njk7opQDwWaNYYpXALsy8B/POje18ByP+EiJbIKPOLLHNh63IrjdfKYiBQISbg+
         2j4GH0OufgSO+E4ShgY1qtgjED3nIhe7zmxuDwwe+QCHOR15zEA8bkD7sgZFWJAp2zRG
         BRcWn9eWJes0vXLBrBBaN6lvFIrto2XVpu61jzVDuSAf1Kht6lul/zP2q80+x7Uumoj3
         dDkg==
X-Gm-Message-State: ACrzQf31C2LhcDeB5dm3kRVupSWkrayoV7MXmz0tTuxwuzk1qtIeA8Ci
	IUDhqKvQAKQlKit54or0C80=
X-Google-Smtp-Source: AMsMyM4Y1I0byczm5I1F5DvGJA5GWyFL+U1kQRDyENq0n5dTlj7k3Hyfz7okkqqHKolh48TLkZ4kXg==
X-Received: by 2002:a05:6808:130e:b0:359:5695:bb9a with SMTP id y14-20020a056808130e00b003595695bb9amr1590412oiv.131.1666718560890;
        Tue, 25 Oct 2022 10:22:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 11-20020aca0d0b000000b0035476861b1dsm1120347oin.49.2022.10.25.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:22:40 -0700 (PDT)
Date: Tue, 25 Oct 2022 10:22:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.1-rc2
Message-ID: <20221025172239.GC968059@roeck-us.net>
References: <CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com>
 <20221025162441.GA1128834@roeck-us.net>
 <CAHk-=wivKoK4VgfKB8ykQUHKhNSUYA2=m4X7k8QKaizSMvzgZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wivKoK4VgfKB8ykQUHKhNSUYA2=m4X7k8QKaizSMvzgZg@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 09:41:50AM -0700, Linus Torvalds wrote:
> On Tue, Oct 25, 2022 at 9:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Build results:
> >         total: 152 pass: 152 fail: 0
> > Qemu test results:
> >         total: 499 pass: 499 fail: 0
> 
> Woo-hoo!
> 
> That was quick, for once.
> 

Yes, it was. I now have an even better one, with a new personal
milestone reached (500 qemu boot tests):

Build results:
	total: 152 pass: 152 fail: 0
Qemu test results:
	total: 500 pass: 500 fail: 0
	       ^^^

... after getting yet another qemu machine to boot.

> > Runtime warnings
> 
> Oh.
> 
> Well, close enough, and those fixes are presumably pending too.
> 

Let's hope so. I think I forgot to copy the ppc maintainers last week,
so we'll see if we get some feedback on the status of those problems.

Thanks,
Guenter
