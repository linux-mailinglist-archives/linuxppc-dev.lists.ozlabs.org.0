Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD057899F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 20:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmrJ71VF2z3c5N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 04:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EwLXjpVQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EwLXjpVQ;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmrHQ6Vq2z30DP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 04:35:13 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id va17so22972607ejb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvDVeCPZSKsQ1iYeMyLd3oWMSh1qMXx1KJqR09/AQsE=;
        b=EwLXjpVQO3GPGwx9EHiWHXuUFvxgk+FZuiceO6VnMKQHAqh1pVyaaXS4ceyIIeSpcH
         L/hqkZztVlSz/vxaWsGsgm4BkBiPOafZx9hF/It8EUx+FH4+Xs+F8Anfhp9JVMcin2/v
         oOUJ5W/BUU2E0ppmAklPxWL1CFcOprHfrOyRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvDVeCPZSKsQ1iYeMyLd3oWMSh1qMXx1KJqR09/AQsE=;
        b=qH3UMP88g4LwEQWRfz3lViSFjf81rUfLVzm/rfzacxQdbwSN5xzVpUNsGlM+LhBF5N
         szVvDCzeBRZkwrsi1LUxDEsn7wrwGINQHPrMErth7SqTFFjb1vi+nBi4yPKrVbLTdfvW
         fPoaGVbSsLSWuPbaJJpg97PpHWPBT25og+BpecXaY9Z83Hy3jPFRJLIspPYDPw1Wkx/g
         8cT9lQxJDffHR8uuXJkDr2J7V5mILKsScgNybHEDKIDEPJpa7Az92odn4c9OT1GsFZxJ
         4I1r2qOtnUIVlfGGMTP+BWWL14idY8ozg+Az6l8XTEQO+aEBAUTSDXai36/WIbRIPniL
         CvUg==
X-Gm-Message-State: AJIora8OCPU3xDImrC3AhO7SChyt81QdRvUWQbrKVLP/gf1UF8VGbKDw
	NG6cw/lj4+5Sc/YH6H/cGqJPJPlDfjKKMngR
X-Google-Smtp-Source: AGRyM1soKa5cjcCe985dg62X9LfnpnhAuPKvnoXzMaxRXc2cCQejsXXVKaFK2mSR3meL09Pgw4nCJw==
X-Received: by 2002:a17:907:c26:b0:72b:4d8e:b458 with SMTP id ga38-20020a1709070c2600b0072b4d8eb458mr27346955ejc.195.1658169307737;
        Mon, 18 Jul 2022 11:35:07 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u15-20020a056402064f00b0043a6c538047sm9082416edx.70.2022.07.18.11.35.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 11:35:07 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id bu1so18311014wrb.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 11:35:07 -0700 (PDT)
X-Received: by 2002:a5d:69c2:0:b0:21d:807c:a892 with SMTP id
 s2-20020a5d69c2000000b0021d807ca892mr23821149wrw.274.1658169306930; Mon, 18
 Jul 2022 11:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <87cze3docs.fsf@mpe.ellerman.id.au> <20220718134418.354114-1-mpe@ellerman.id.au>
In-Reply-To: <20220718134418.354114-1-mpe@ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Jul 2022 11:34:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihbCSydApZcH21hev5pcKu=-CrQgwp6qmPwuv5kMpwxQ@mail.gmail.com>
Message-ID: <CAHk-=wihbCSydApZcH21hev5pcKu=-CrQgwp6qmPwuv5kMpwxQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64s: Disable stack variable initialisation for prom_init
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
Cc: linux-hardening@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 6:44 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> With GCC 12, allmodconfig enables CONFIG_INIT_STACK_ALL_PATTERN, which
> causes the compiler to emit memset calls to initialise on-stack
> variables with a pattern.

Ahh, and that explains why "volatile" made no difference. That did
seem very odd.

Thanks for figuring it out,

                   Linus
