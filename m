Return-Path: <linuxppc-dev+bounces-9313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A7AD74DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 16:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ5Jp2L5Yz2xHT;
	Fri, 13 Jun 2025 00:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749740346;
	cv=none; b=nHEia6Q/AU6OkuApCrM7RwvEvjI7Y5TYCmaeR/rzCCtON1i1WfTtJnKsJx238S8j5uEo71AMeWi4NFmnRNG+6EmHoRX2hw+oBCnZgzN0LjiAaYuxBt6cy7qilh7p4/zJpcnumYXOc2Q0EdfEqDwIb9mw2ThAIPdiLo0R7wcgnXZ0v8yyWE5mv9B1lbjh/ZALeZbaO/LnVts6p7PC2WlTrPRknC/n8AJN/p0hn6S+fC8a+rKc8gb+UiuadET3R+LEJDvEUK+2oXGbTX8rXB+8wRSKuUyXkhAzdm9EIk3FpQyFqgs3kY5mHreuLbEVUhAEt8H+vPDPo74QHPrgZgv/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749740346; c=relaxed/relaxed;
	bh=j7urv+43q9m5//eN/fBrHnA2GxbG1zcAPVe31MZBFY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbzeFc2j9yQMqyS9NJIg1DdROERMMjB6+Xuye02dahmoe45eRAsXQSxylBBaYpdeyEtxi8PTVzH98kPFRO8V/TCqQNd+mO2X44Y3K3+S/rO9TDbRGUBWghxqsEREuEAX2kIxU6fzQtrvCQWkuNpSm8xjKjtq313NNJhCgBnADTpgh+lFwUV7Nvdf5OUmxKeoFgumSybIOS847XXVzjeurK6I39LntkHLkfBaTrRJUEY0HdXlOxdKKTNXhJ6plhThLxgKTNvXLQBiIJRK3wc12t2HTQRdyjWY2x8sWMXnoGFik84xth2Trdc5Oe33KWjOpMOxqsPaOCMdWiR4uBcjPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.47; helo=mail-vs1-f47.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.47; helo=mail-vs1-f47.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5Jm44PMz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 00:59:03 +1000 (AEST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7b8112f4dso272352137.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 07:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740339; x=1750345139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7urv+43q9m5//eN/fBrHnA2GxbG1zcAPVe31MZBFY0=;
        b=dDRNdLJOUPjj7lhOdrbsZd2eUKQUiExvT4R27yCyL1vGq82pBM0rsUeMA+TCU8DkG3
         12BNHjqEQkG1acVTtqAezbFMS9vynZbLlDzZ7WKPfrQbzziLf2I+zHuvvxYJU8Q5aZmL
         GgXTfjCS+7Aq5V5EOFJWKnXzVU/1IKvLvydvWE+79wWPgx59l6bC1TJ/8WpE31f4JW9l
         FTSa5kKw0cBACKkz4X1d6HG9XZqhmp8/hlDyPBtSlGCGfpCxuRD6WSJ+DGwVlixUTNTC
         bIMISDh3IE8zbf+cfsP8eu92UhYCEl2AB7Q9xoSBwuyy/QEAT/JzTufUG/Ul2uhn9QdW
         DvbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGI7ONw0TILO4jpD5W5qjq5KQeT8G37nzcWgn2Ii3VdhCDjFtI9cN91hiFh9U79hMNDKCt4t0JgCAiBoM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDCkTyxt+2FbASbVdkCNxFjoqMiDWfAyHXZ5btTl8bjOnIr/VT
	pboXMAhbOpS8aJd4oLvwraCFR8ypusjI3w1mpI0BWURWwL6JXYZFFKNAW63ckHom
X-Gm-Gg: ASbGncva74L1B5KRkue8BnIpbuGC06i9071WeC0X4KNSRw0sGmW8p1ARW+PTuS/pXtd
	YR2bJntDzzM5LWw1h2lxxEpZWSjwJJEeoIRkqqrMVYQyQBmc1Cx7A2ipU2RMUF192Q+GiTKDiD+
	2ijFUazkuWKLsRO7KG1cl7dIQHUC28b06wBjrcM/rJA57lBOeQirTVZZC8v//00pphjN87h8IIx
	sDW8UV4oBGYYWQM7bYU2wSNXmBZ/kRJniTfHWPv9UuGDMFcrERrzRlB/sDoK38zLOUsG9E9fUPd
	ejJuiTgSklO8dXTF+gK/bfsYQGlAp2ZmYFCE+SkNZYEaa+nej39S3V8ZTN1aA8tgeqpqQyAox5d
	1SUWZukB2gXHM6234gXY5PAJW
X-Google-Smtp-Source: AGHT+IFH7L4o1QoQcY133jVp7utaII/vRnpZUFTKF899LgpzNlGokdW/G8F3im1askQwy/5PrxKZeg==
X-Received: by 2002:a05:6102:390e:b0:4e6:dbbc:16d0 with SMTP id ada2fe7eead31-4e7cccc353fmr3766760137.14.1749740339270;
        Thu, 12 Jun 2025 07:58:59 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d07d752dsm245837137.12.2025.06.12.07.58.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ed3b792a2so294142241.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCezUYpfD4O6L2+2I24v8SdaEvdLg/2U5v8HO7SKeLmEaXzUFARL4arEESZmKGcrpoRtHkcBnyrgENH+Q=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3046:b0:4e6:a338:a41d with SMTP id
 ada2fe7eead31-4e7ccb9decbmr4392145137.11.1749740338109; Thu, 12 Jun 2025
 07:58:58 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:58:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
X-Gm-Features: AX0GCFuo1dTCSfHZ3zIJsOn9_JIHrUSOYlkHewmTg8yRd6ll7bXt9Le_Qc4mtYM
Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 10 Jun 2025 at 14:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

