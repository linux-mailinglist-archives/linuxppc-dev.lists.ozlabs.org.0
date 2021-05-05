Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B63733A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 03:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZfdN4knZz30FK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 11:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LnLUvEXT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LnLUvEXT; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZfcw60Vvz2y0L
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 11:43:43 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id i17so180223qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UufFEkemTLqezkOFJuyAIvngoBVqC1wvHF7o4ZpqwQY=;
 b=LnLUvEXTxqsR7h20KgtvBmCyA7fmtnS18g4OPMiifa99Nsg9uqrHVjv8DcW6wCTmek
 n1zN6spbPYCaOMtBiHmdN0zKqSiX8i5xYw61f4r4G2xe33/1kZYHRELaEe4uc35Za/qp
 9+iJSUaH2nVAfdX3srOLqKaRm15fK9YoxpqVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UufFEkemTLqezkOFJuyAIvngoBVqC1wvHF7o4ZpqwQY=;
 b=LNnctVEoFx1h2Is0ZU7KuBGX53prz2PPhI15uxOkoQDCasUG54mrrI6NMaTxBm6Ez8
 Z8xoOYOh3AqEXehQtM7PfaPxKDILzJOrOryA3fLcYDXFXJ4AUUGiG30u8rGNa3ZSxo/G
 R7E5M48C6ikPi2pJMvOTPdO5KDGO7hRXBr46+c22jMaE1SLEc1gEZSFfBJqTt9+SC7fh
 hgZPZBqdYb+ye9EmjVC+LHfL0IT9vSTYId4nuDMF9xMdfTYJ+zDi75EKq10hf5IeoOrb
 v/rVMazHP4RjfNnLQWHAOxvMDmcLnKhjnL1dp6xBMYkZwLk3Zd2jTb4/+YIDVcv6zfQh
 Rd0g==
X-Gm-Message-State: AOAM533l1HGn9vLty1Q5pbNM7VCkiUdZVoEkJ/Z3cxqoQoeKxqTF+XzA
 sKZSy4Rs8xeLFZvsc55lR4urWx/MykW3oLTHl2g=
X-Google-Smtp-Source: ABdhPJzH8yxq6Jb0cRrKrlr5nYIS0LRQjdX0dp/UR/vSh/Ce6TR/lv6NUEcVlt3FkzovyRax616yFnOmhDvpn4eM58Y=
X-Received: by 2002:a37:317:: with SMTP id 23mr16206074qkd.66.1620179019917;
 Tue, 04 May 2021 18:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210503130243.891868-1-npiggin@gmail.com>
 <20210503130243.891868-5-npiggin@gmail.com>
 <CACPK8XekEXgqA1bML6A+NbsshzsLe+pLTzGJzRLdC+QKrV5T9Q@mail.gmail.com>
 <1620119643.r94ggot8r7.astroid@bobo.none>
In-Reply-To: <1620119643.r94ggot8r7.astroid@bobo.none>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 May 2021 01:43:27 +0000
Message-ID: <CACPK8XeyEaj-0LUa=YMT1WXn=_cQkDXH9xLiVARGCwZANsRk=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] powerpc/powernv: Remove POWER9 PVR version check for
 entry and uaccess flushes
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 May 2021 at 09:16, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Joel Stanley's message of May 4, 2021 10:51 am:
> > On Mon, 3 May 2021 at 13:04, Nicholas Piggin <npiggin@gmail.com> wrote:
> >>
> >> These aren't necessarily POWER9 only, and it's not to say some new
> >> vulnerability may not get discovered on other processors for which
> >> we would like the flexibility of having the workaround enabled by
> >> firmware.
> >>
> >> Remove the restriction that they only apply to POWER9.
> >
> > I was wondering how these worked which led me to reviewing your patch.
> > From what I could see, these are enabled by default (SEC_FTR_DEFAULT
> > in arch/powerpc/include/asm/security_features.h), so unless all
> > non-POWER9 machines have set the "please don't" bit in their firmware
> > this patch will enable the feature for those machines. Is that what
> > you wanted?
>
> Yes. POWER7/8 should be affected (it's similar mechanism that requires
> the meltdown RFI flush, which those processors need).
>
> POWER10 we haven't released a bare metal firmware with the right bits
> yet. Not urgent at the moment but wouldn't hurt to specify them and
> add the Linux code for them.

Thanks for the explanation. This could go in the commit message if you re-spin.

Reviewed-by: Joel Stanley <joel@jms.id.au>
