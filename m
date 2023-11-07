Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DD7E3655
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 09:07:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S6bK7h/3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPgnC4X1Dz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 19:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S6bK7h/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPgmN4S30z2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 19:06:58 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a81ab75f21so64426187b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Nov 2023 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699344413; x=1699949213; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUJsPs5h4dMzP+QB89ARP4Mh+Ywy+SZafpMELyFGsZk=;
        b=S6bK7h/3xVdIu4mI4Gzo0XJMy4qiDQnmjbTWkaLXEWf36upctDg0GxNRZrOSeRCd1K
         hPn2tU3vbDqieYkELA1on5CJVKT4PCDdYwYVzy+S2lYdsvOjj0fTTBKoNkc6x3/Eoykf
         IdD7Uefxn5Y5cnv/QmaSeD3ndx+fvhIUTMyoMtDg16jm9As/3bsPza2vhuMtYidQPIuz
         1+wd8MHDiYCAZ8CrFuEvr5LiHPOHyBdQ4q5X05fjq87UNV3dl/tldPmlnE0OMNlLit5x
         6PxjHI/qSuUz8RSCl7ivRP2s/MreCPYtD8Nr8GOUbkGCbtgs8Z4Qa5BMaA3rC4f9hqfk
         hkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344413; x=1699949213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUJsPs5h4dMzP+QB89ARP4Mh+Ywy+SZafpMELyFGsZk=;
        b=KVf7V3z5v8ngrFmGUTrnvSZnZqMMAUEhFuvMUCK6xIqoownRlN517ijRmeERVSvS00
         Oy3POIz1BHnEHMRV4D2D9r+YHHQ5j0LeC0dUfBRA1/KVH6CY8uhCA9UFUfEM/6kVsg8s
         nQzmM8Mowa/uUSqFeyBoOkTO/k1U8kcbMp5Js/tPrHfVs8wJrsHbPjEwh+zrnSOcoieK
         kkbzRFDBqMBRV/Ib28EPUte+Byr/kB21WCMm8LPzOCwNws5j/GElffPFW+Cp2nVGMR8m
         BdQK7PwTVkCJoUBLbcd93XUtbWCVlhvF1EBEAun1tQA/7s4IPtHJIZGuM6pmNlzYNhTj
         m+BQ==
X-Gm-Message-State: AOJu0YzWfKrLwDzqfW2/dusXrbvBSFUhK3EuneFI8ssnUm6kO+vBjWB6
	hljBLUH2oU3pQPNiQsmhI8FXV15a94zAl1wVJoddXQ==
X-Google-Smtp-Source: AGHT+IE7d3Kze4zoxfGZhZBBF402Jw5zAXD3ojtBzTrxh8AqoiccxgGCOfF7FL603CmDsZuQ4weTyq0dtC0V95L9E/Y=
X-Received: by 2002:a81:6582:0:b0:5a8:960d:e538 with SMTP id
 z124-20020a816582000000b005a8960de538mr13935556ywb.47.1699344413174; Tue, 07
 Nov 2023 00:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20231106-virt-to-pfn-fix-ppc-v1-1-93197a7ccab4@linaro.org> <87ttpyw1ez.fsf@mail.lhotse>
In-Reply-To: <87ttpyw1ez.fsf@mail.lhotse>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Nov 2023 09:06:41 +0100
Message-ID: <CACRpkdbL1mfcAz9sPn89UGSQ6tb=jF6nRYAwp9Qz8zLXLLU_UA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix signature of pfn_to_kaddr()
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 7, 2023 at 6:57=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:

> I'm struggling to connect the removal of const with those bug reports.
> It looks like all those warnings are about 0xc000000000000000 being
> outside the range of unsigned long when building 32-bit.

Aha right. I wonder what actually causes that.

> Is it the right bug report link?

Yeah I'm just bad at understanding these reports.

> The current signature of:
>
>   static inline const void *pfn_to_kaddr(unsigned long pfn) ...
>
> seems OK to me.

OK then, drop this patch.

Yours,
Linus Walleij
