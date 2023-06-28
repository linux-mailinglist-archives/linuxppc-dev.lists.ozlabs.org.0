Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE31741795
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 19:57:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yzU2JoIQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qrq692RFRz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 03:57:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yzU2JoIQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3o3sczaykdmaykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qrq5J3MsLz2xpj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 03:56:18 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-576d63dfc1dso695687b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687974971; x=1690566971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oft31F5mAAnY3y8JHizHeZojVgGUNJAYwhDFnTgpg8o=;
        b=yzU2JoIQ6C81Hm062cJ2Hc3EmkrShnx3KDof7OpjrvrceMW2p/JIqkFL3bPzaIzfQi
         V0Dc3dj9921O8AA28Eb8uR90sAND7PQjSUi3zuhfCUzdQxBhnZVZsYvTlt3X7kuQYZp2
         KjoOs6xj0SFu1apHoMQ0Luhg6NI5lnYXDv0N0Mko9n7j5Y4SbNUrBHzkXz29K2cpjBMT
         6cWrkLt8pVICK6OZ+FHUiEg5csnak4W+YtNqidraNd5gfTgRYXcfZLtfLwAwEiMQcEjR
         MS6a30GfaRHxg0cP3WbpBtjznhW8uoJXj5dkOCiweAp9Kwj2cDsBt61bjdnFUtxW6njJ
         otXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687974971; x=1690566971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oft31F5mAAnY3y8JHizHeZojVgGUNJAYwhDFnTgpg8o=;
        b=YgYjiv7KoFpUYx3d6QoO4I/DC2UqFSINtxyzkMt65gjADUl2vhozVnJqIFYqj3wRP7
         LF2LuYcRcZuDo8Rl7twemq/CWYb3twrMPumdrNp5ulSldn52farpM+4W/2HxVrgH5rM5
         StDpsJdINEgsx0Av9W0O1WKas8amfVYKkd4ojZfUiP0W0r7xKxcVCSYnoANDt2QjNGNw
         r/HA1PbEsJwPbtF4OZ57IU82C+ppA67rpm/2FTHEToG2NqrZQdsaz54wlulnhQc/PECg
         jXPSgTqIysgYFTZ9eT/N9y6RTH+fzDpeQ5YXrfRu5Fh9yLnCpCN113tn5lkbJe9LhRC0
         bWug==
X-Gm-Message-State: AC+VfDyue8lCstQ/rMMfEQKdy6uyMEvxACTir+xhGqVslFhSruKjhzfy
	RiT0KMy6YYcsePT84BLJAi+C3sZJpxo=
X-Google-Smtp-Source: ACHHUZ5/HawWcuOHI8uZBuEAt0m4vKfLDhoPBp3MHo3Wacm6ZrRpEToDO+6/6KfJozZIuzIqSu5wFGU5F90=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae5d:0:b0:573:ab97:578 with SMTP id
 g29-20020a81ae5d000000b00573ab970578mr8329623ywk.2.1687974971110; Wed, 28 Jun
 2023 10:56:11 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:56:09 -0700
In-Reply-To: <20230608024504.58189-1-npiggin@gmail.com>
Mime-Version: 1.0
References: <20230608024504.58189-1-npiggin@gmail.com>
Message-ID: <ZJx0OVEphb/OqQ+t@google.com>
Subject: Re: [PATCH] KVM: PPC: Update MAINTAINERS
From: Sean Christopherson <seanjc@google.com>
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 08, 2023, Nicholas Piggin wrote:
> Michael is merging KVM PPC patches via the powerpc tree and KVM topic
> branches. He doesn't necessarily have time to be across all of KVM so
> is reluctant to call himself maintainer, but for the mechanics of how
> patches flow upstream, it is maintained and does make sense to have
> some contact people in MAINTAINERS.
> 
> So add Michael Ellerman as KVM PPC maintainer and myself as reviewer.
> Split out the subarchs that don't get so much attention.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Thanks for documenting the reality of things, much appreciated!

Acked-by: Sean Christopherson <seanjc@google.com>

>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dab9737ec16..44417acd2936 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11379,7 +11379,13 @@ F:	arch/mips/include/uapi/asm/kvm*
>  F:	arch/mips/kvm/
>  
>  KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
> +M:	Michael Ellerman <mpe@ellerman.id.au>
> +R:	Nicholas Piggin <npiggin@gmail.com>
>  L:	linuxppc-dev@lists.ozlabs.org
> +L:	kvm@vger.kernel.org
> +S:	Maintained (Book3S 64-bit HV)
> +S:	Odd fixes (Book3S 64-bit PR)
> +S:	Orphan (Book3E and 32-bit)

Do you think there's any chance of dropping support for everything except Book3S
64-bit HV at some point soonish?  There haven't been many generic KVM changes that
touch PPC, but in my experience when such series do come along, the many flavors
and layers of PPC incur quite a bit of development and testing cost, and have a
high chance of being broken compared to other architectures.
