Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB333454F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:24:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4DDh2RBWz3hfH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=VliLkGKl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VliLkGKl; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4D9H5nhmz3h7R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:21:38 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id y5so12570355pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=D6/t64GWTSvYj3tg/pZ5Ic42OSmLCS9eM7+HxTJh7bY=;
 b=VliLkGKlUFWXjHYPHKhIoC9T8J/tXbQBlLhNPRFKpcSDmcYqAJwrSP1aEMERW9alSF
 +/C6VVdeBGrMAl6EuoauewV9NOcKnut05ZmeYuZQkmsrz6WSWGaB1xefKkXg/LWSUhtz
 54ZrfHpYG6uA/l01ZR+VOyiPyQIwl6EVfUCf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=D6/t64GWTSvYj3tg/pZ5Ic42OSmLCS9eM7+HxTJh7bY=;
 b=B+BfzrXKvievLcimbFIkrzOJxgx3srtgPw8hyXFwC6UZ7nQfOPWkX3J7YOtqhenPGg
 /p7ynkk/pSwKVcx8AhMHbf61cCbt56xlJtxNstrTqJPirRap3dJh8freuRkT73x5dKAm
 SSlMUoiCaSzVkqRLSooa+Ajx61z3/4M6tPXQKTggUg10bQfHpsfVASlVXA99S/2g/HrC
 cgKjnTHW2A366OGufImhUwXrUKLjhyuj7AZkIlKZcKA48Epr4poTO16mHC3/qJhxb0SB
 AeR/HJYq3S6gayUQYx4f+B29UQcLEzxDXkSRqxA+HjJc/F5oH/f2w3U6Nrxo1Xszb4A5
 b6mw==
X-Gm-Message-State: AOAM53132QXVq8uMq6s6KUU27JvlET1+RqceE7g12EP2UOiPz4Pgn/b5
 izxj2m+lxShTVLD0zqemQl4Vbg==
X-Google-Smtp-Source: ABdhPJw2Qp+2mIKNhFX1I+6sZk2cFgPwhAQgZTyBkhIWBJDj29kcgwl2c2YRP52g3ltzroCn2P4Oag==
X-Received: by 2002:a17:902:6ac3:b029:e6:c6a3:a697 with SMTP id
 i3-20020a1709026ac3b02900e6c6a3a697mr2657330plt.2.1616462496621; 
 Mon, 22 Mar 2021 18:21:36 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-ab57-754e-edac-e091.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:ab57:754e:edac:e091])
 by smtp.gmail.com with ESMTPSA id j188sm15051642pfd.64.2021.03.22.18.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:21:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v11 0/6] KASAN for powerpc64 radix
In-Reply-To: <5a3b5952-b31f-42bf-eaf4-ea24444f8df6@csgroup.eu>
References: <20210319144058.772525-1-dja@axtens.net>
 <5a3b5952-b31f-42bf-eaf4-ea24444f8df6@csgroup.eu>
Date: Tue, 23 Mar 2021 12:21:32 +1100
Message-ID: <87ft0mbr6r.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> In the discussion we had long time ago, 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20190806233827.16454-5-dja@axtens.net/#2321067 
> , I challenged you on why it was not possible to implement things the same way as other 
> architectures, in extenso with an early mapping.
>
> Your first answer was that too many things were done in real mode at startup. After some discussion 
> you said that finally there was not that much things at startup but the issue was KVM.
>
> Now you say that instrumentation on KVM is fully disabled.
>
> So my question is, if KVM is not a problem anymore, why not go the standard way with an early shadow 
> ? Then you could also support inline instrumentation.

Fair enough, I've had some trouble both understanding the problem myself
and clearly articulating it. Let me try again.

We need translations on to access the shadow area.

We reach setup_64.c::early_setup() with translations off. At this point
we don't know what MMU we're running under, or our CPU features.

To determine our MMU and CPU features, early_setup() calls functions
(dt_cpu_ftrs_init, early_init_devtree) that call out to generic code
like of_scan_flat_dt. We need to do this before we turn on translations
because we can't set up the MMU until we know what MMU we have.

So this puts us in a bind:

 - We can't set up an early shadow until we have translations on, which
   requires that the MMU is set up.

 - We can't set up an MMU until we call out to generic code for FDT
   parsing.

So there will be calls to generic FDT parsing code that happen before the
early shadow is set up.

The setup code also prints a bunch of information about the platform
with printk() while translations are off, so it wouldn't even be enough
to disable instrumentation for bits of the generic DT code on ppc64.

Does that make sense? If you can figure out how to 'square the circle'
here I'm all ears.

Other notes:

 - There's a comment about printk() being 'safe' in early_setup(), that
   refers to having a valid PACA, it doesn't mean that it's safe in any
   other sense.

 - KVM does indeed also run stuff with translations off but we can catch
   all of that by disabling instrumentation on the real-mode handlers:
   it doesn't seem to leak out to generic code. So you are right that
   KVM is no longer an issue.

Kind regards,
Daniel


>
> Christophe

