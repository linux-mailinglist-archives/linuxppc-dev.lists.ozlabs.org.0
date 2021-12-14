Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B102F474ABE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 19:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD6GS3Q7Jz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 05:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3nG/z3h8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=3nG/z3h8; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD6Fn0HQsz2xsL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 05:23:39 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id y13so65777546edd.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 10:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BH/wyW5b6ZLsqDtk7HoFzzH8zAQQigEUOeTbAwzBS4M=;
 b=3nG/z3h8gTZOVS6dCPVTY3pohzKG7wjQCvZeMoIogLH7pTGV0V007zgGdQctUPbOm0
 H8nbIMk7P13ENcnPTpscY4y30b3De2mNHkF2WwRXxavGK7JIo4F70cSdXV9ZSXWw9sge
 xRedYpwTUeWKkFiWnchFkbjWtkD/3bQKPhFu0ueWuoQE9PTA3k7SAZyLNUxV00Hb1ACt
 DBpSpv69L5LlymxZKehL4/mDpVH6ZGeklR34ugA/VSZMqn/zBaHm5vD2kZjtA3X6Glz1
 VRwC2DPKYFc1QX0zz9cUgAxjTZvuzYhJMoa1Z5F7/rPLN/IdNYSTiL4zXHjrlraM80Hh
 VMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BH/wyW5b6ZLsqDtk7HoFzzH8zAQQigEUOeTbAwzBS4M=;
 b=Y7ukNDGCQJ65MCT3ujQecN2TqxHAfj1UvjuqVN1RqmG/o4D47HmsprWlsFpNKJOYTw
 BHnt1VE4QEDF3Dj1hCrcBXashCh/H7ymZJGSpB3rWWTrEN+u/onwzUoYzYdSN9iVYW/H
 f4LNSUM/lbL/4ETpyw3OVO2EevD6XefYBmsV7NwUEAF+FWAmRyUPQIIQiiK8L7tbQMjL
 JbT9NUICRwsFal0M3kVg7yl7LY1T74tq4F7nYGBkhypWvSt4kfMTokVUUJ2gkYd68Yox
 cU4uhqrNYKeRyvp7SpZR4eb0c56btmiZMAgfLvN6H1NMw5nkiNtS3eSCfqqTB5L3adKe
 8Waw==
X-Gm-Message-State: AOAM531PCLnInmqmy9aqELvqA4V3Q0kDM2SWijUe5uy5rXLb7ptEUdEJ
 mifdPLL4y/xK3k7nSUY6AcqcyxsszZLbvc3R3ue7
X-Google-Smtp-Source: ABdhPJw56SWg8NjpfiW1SDbrfnDf8G9149S+aYRucO92yhvZcYnvJJLzjXEnD/Smx5evCJejVOXkLZ4W5n9y3sFBsx0=
X-Received: by 2002:a17:907:e8e:: with SMTP id
 ho14mr7600870ejc.12.1639506213438; 
 Tue, 14 Dec 2021 10:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
In-Reply-To: <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Dec 2021 13:23:22 -0500
Message-ID: <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 14, 2021 at 12:59 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Hello Paul,
>
> I've been trying to setup your test suite on my powerpc board but it's
> based on Perl and on a lot of optional Perl packages. I was able to add
> them one by one until some of them require some .so libraries
> (Pathtools-Cwd), and it seems nothing is made to allow cross building
> those libraries.
>
> Do you have another test suite based on C and not perl ?
>
> If not, what can I do, do you know how I can cross compile those Perl
> packages for PPC32 ?

Is there no Linux distribution that supports PPC32?  I would think
that would be the easiest path forward, but you're the PPC32 expert -
not me - so I'll assume you already tried that or it didn't work for
other reasons.

I'm also not a Perl expert, but it looks like PathTools is part of the
core Perl5 release, have you tried that?

https://github.com/Perl/perl5/tree/blead/dist/PathTools

Finally, no, our only really maintained test suite is the Perl based
one; there have been other efforts over the years but they were never
properly supported and fell out of use (and applicability).  At some
point you/someone was able to run the test suite, why isn't that
working now?  Or was it a different powerpc ABI?

-- 
paul moore
www.paul-moore.com
