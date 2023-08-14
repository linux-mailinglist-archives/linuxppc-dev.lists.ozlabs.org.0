Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B377BFB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 20:23:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u8QFUvLf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPjT11mdlz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 04:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u8QFUvLf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPjS648NNz2yVp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 04:22:44 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d6d52f4f977so840161276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692037361; x=1692642161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ImihNqCDZEllBXBLlPPm212FqeqO2Hv5TY4g220DYc=;
        b=u8QFUvLfP+61tqDzUSKKJJSR+DggyLEtLwaGODXLBpsV2LJKHgajUJYvTQZ/ThZuXj
         kT/NXHl1fbtN+DBqPD5XBQ32fg93M27O/pSjflRag/OKKn+1EakxC8L6usEhZMAN4ko1
         Uv17RdSJq3atTjHN0Mql24Nq2HFqhwlYhBcujhGHDgGRfSQV5GnfKp9HYuBDkLZveLPt
         yQiX/hiuJ1ZIFrYfjrOv2rEtBSKefjio4ElXmMzE+/4Wmg4KrMbIWOlF7HO3PnenqoQE
         wfGoFpmAZfpTwMhSxO/rRpb8heOmYhcfEKxvn3sgKE1apv83fU025UrszFE9dk68qDRh
         Qfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692037361; x=1692642161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ImihNqCDZEllBXBLlPPm212FqeqO2Hv5TY4g220DYc=;
        b=BV3SzHPmCGs+cVYe1AGjHdlY176zhWSO4wHY6+EN48J0O3+4S1JWSS+yi5GqZ07NJM
         MeTyMtn3Vqby8ez+OOGcnVEbl3UYkzaWQ4RIxOsUs+nyjTD5WFjEpugvrPEZtxwJo2lL
         O9J7RfpZETQAUdJE1rxkQLuZz14xQKLfPUlJM7Dts7bYUOYj2W/bs9Pk/Rdg3DLL8n9b
         qrbViQ2/HtHQ9wzcgqWrr7+cISfUhrLnnpwwLtD9nRtAbCvGhGUTbekAqp2LeqnXJrZe
         iNTzugQaJ/wl05aql9Bbow/adaYvBod/l7FLNHeOwspL9xSlZYaV3mkfHWXeAAth86P5
         plIg==
X-Gm-Message-State: AOJu0Ywz/NpFm5Ld7qw0ITh9gENL6HXKOFq1iGkEwWxbCRb1DcWDb3B8
	iE2XqEXb2C9GICIlUxLB62FvEeYUhUbft4cpZS0h0Q==
X-Google-Smtp-Source: AGHT+IF9NyoQSqCsdGBy/60m2cNbaWkTF1zofsIqVu9Aqq8Fsyh6TKMhlbbW0+c4+bqEnoARxOcS7czA4ztPBGZDoro=
X-Received: by 2002:a25:ab27:0:b0:d49:4869:1bd1 with SMTP id
 u36-20020a25ab27000000b00d4948691bd1mr11093807ybi.6.1692037360994; Mon, 14
 Aug 2023 11:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org> <87a5uter64.fsf@mail.lhotse>
In-Reply-To: <87a5uter64.fsf@mail.lhotse>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Aug 2023 20:22:28 +0200
Message-ID: <CACRpkdayi5PyH7bifvShWRgtZXsNh9o8vA1TGV8tTORngeO8Hw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 14, 2023 at 2:37=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:

> > +static inline const void *pfn_to_kaddr(unsigned long pfn)
> > +{
> > +     return (const void *)(((unsigned long)__va(pfn)) << PAGE_SHIFT);
>
> Any reason to do it this way rather than:
>
> +       return __va(pfn << PAGE_SHIFT);
>
> Seems to be equivalent and much cleaner?

I was afraid of changing the semantic in the original macro
which converts to a virtual address before shifting, instead
of shifting first, but you're right, I'm too cautious. I'll propose
the elegant solution from you & Christophe instead!

Yours,
Linus Walleij
