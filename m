Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA92345B97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:02:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Rkl03TZz3bp4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:02:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gJuXXYMu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gJuXXYMu; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4RkL5g01z30F6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 21:02:33 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id o66so9722590ybg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qp/jj3l6ivGZ4OXCocertOe4BVJnz1tKssW/YzmGbTA=;
 b=gJuXXYMuBphx+t5hfk93Y7sfNFPYwhbjIw3T8P7KTZv5AR9YQ4Y0OOiEXzTlu3oo57
 crZ2GYH2sClMfNM12fQOVFB4DcyXeyCzGpZ9fit7gX4nYw1de8CsJ55YlLUb56WzSUwy
 TIAfMPbTFDWkuuBaQTTfwEzsr8GkFTEzeQQEpHWJTrjgqAtAgAo5o/UjcIcMhv9s4lGV
 MsdeVqUEza/b/LRrElL1NtVHI7ChbPkgtMXdtoJNDKSRQsFPCBgCOOz50hQhOVDd7R30
 6rh77lFlSCkHHoCnzIj3FwHAXgBj1N3xpoOGwB25mXsFh+wq85GheT3NMuG9IpPVaNfx
 UnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qp/jj3l6ivGZ4OXCocertOe4BVJnz1tKssW/YzmGbTA=;
 b=q7UuqjCbsjnMFar1lpu5B1K4I1oALdvRXHYcWiiq6xEmsls/sJHhiUxjpsPueBLn4Z
 JUBElgX8JoJ22yjE9bAIzhXzrw/H7+1prcRASEe0o8IC2YWRr6c4QKRrhAStTZAuF4J1
 EiJnJq5vbIAErhVNmKWqQztEaa/5nxajPMDUliY8/RFLeksKLaX8kQsnny+1skhoJZIg
 G3aPRTd7sLNNynUDodoLdLeZWFn4mbkJwpE1+XNdEDkePzbVC2BmDlJF0bajmtG0+rLI
 LEx2v3ZPzOAL/BjywvWyYhp7iSLU5Afr2lkiVqAeyFfvPMI5LIix9lSTI49j30c+kRWA
 pNpw==
X-Gm-Message-State: AOAM532sgPEG9ZnRp4fTZkMy0CnSLxviS0TKgL7DOmdxaQ6N4WXuBFyL
 v+J9ubcUhjHt/E1ZrBkJrxm2nweYWdXEqqMyTiHVHOBw05UdDA==
X-Google-Smtp-Source: ABdhPJylVauAaSy0QdnuaN0wsPp5eKvLs3gWNjOyhWw54JITI4zXzthk13t3k6s1NdoyOmuw9hraEbpQt1uXgHEBJaQ=
X-Received: by 2002:a25:6e02:: with SMTP id j2mr4055149ybc.247.1616493750049; 
 Tue, 23 Mar 2021 03:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210323032624.1039422-1-mpe@ellerman.id.au>
In-Reply-To: <20210323032624.1039422-1-mpe@ellerman.id.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Mar 2021 11:02:19 +0100
Message-ID: <CANiq72n-tMww2U+eQ=iHOh5u1JQgjM0b1E3XQ9jpWMfpdQ5+=g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rust for Linux for ppc64le
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Mar 23, 2021 at 4:27 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi all,
>
> Here's a first attempt at getting the kernel Rust support building on powerpc.

Thanks a *lot*! It is great to have more architectures rolling.

> It's powerpc64le only for now, as that's what I can easily test given the
> distros I have installed. Though powerpc and powerpc64 are also Tier 2 platforms

Even if it is just 64-bit, it is very good to have it!

> so in theory should work. Supporting those would require something more
> complicated than just pointing rustc at arch/$(ARCH)/rust/target.json.

Yeah, the arch/$(ARCH)/rust/target.json dance is a placeholder -- I
need to figure out how to do that more cleanly, likely generating them
on the fly.

> This is based on 832575d934a2 from the Rust-for-Linux tree. Anything newer gives
> me errors about symbol name lengths. I figured I'd send this anyway, as it seems
> like those errors are probably not powerpc specific.

Sure, feel free to send things even if they don't work completely.

I will take a look at the symbol name lengths -- I increased that
limit to 512 and added support for 2-byte lengths in the tables, but
perhaps something is missing. If I manage to make it work, I can add
ppc64le to our CI! :-)

> Michael Ellerman (4):
>   rust: Export symbols in initialized data section
>   rust: Add powerpc64 as a 64-bit target_arch in c_types.rs
>   powerpc/rust: Add target.json for ppc64le
>   rust: Enable for ppc64le

Regarding the development process: at least until the RFC we are
working with the usual GitHub PR workflow (for several reasons: having
a quick CI setup, getting new Rust developers on-board, having a list
of "issues", cross-reference with the Rust repo, etc.).

I can take patches from the list, of course, but since we are pre-RFC,
do you mind if they get rebased etc. through there?

Thanks again!

Cheers,
Miguel
