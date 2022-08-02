Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD77587E10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 16:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxxtb62B8z305W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 00:18:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SY+mGld3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SY+mGld3;
	dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxxrh6ggnz3bl4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 00:17:08 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id 125so10723327iou.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzbPWwhcEKIUb5XmuwsXZk0WHu1HAmpGHak33W/hz4Y=;
        b=SY+mGld3c8Zk5Jxf7IddnvW31p46/D08XTmBEhxsrkVs4fSRF9TXUtbmjH5o29Gxrt
         bM66MbluvwjQq1o0MRDc/b6vnsKl1e+6ofpDuhtDNVKZb08z8wTfrEPdcJSCiW6ofXiB
         qEuAm4F+ALOKrC2llY5tCHy3VoSjYivoxA06GuVSAfECweP/3IaLqi3p3FY6ucuhokla
         K4mOlgf3XQjAXVMtSZachXXq7XaOA4DS7qtJwOaRv8mXGyQ+Z+gZE4oZIhwUV0zcSiun
         FkleluOQc7MJ6OTzXCqMZT9Pusj5PuHsJNZDnH4IvH4LGi5U09DMZvSX2vIPTdKNG3zj
         mTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzbPWwhcEKIUb5XmuwsXZk0WHu1HAmpGHak33W/hz4Y=;
        b=5NwAx4l8wT3C8M3RgKrtG7/yJRtLH3Om9flbhYgLPL9TzeI7BQBaUtQhMY0zQzgLNc
         LjftayhZRRvt1/dt8W/q6lYhzlJ5hBcd1Ywvv9uns98H4Wh7qasm1NLgBwO8bfOFXkD8
         XjnfI6ZranwCHBpoWLKix8D4Kcnsz6Qyq+LjTd0V7C3BrfNtwy3OfPP7jF0Jt4wd/4Ph
         kh1LsY0aAGMzDbH9klByMETHnJ4B5CAGF0R1SWcWbhjhbsh6TMzj8cInATRez14SnAEi
         WYR21L2zSb0cYUCDDxuDZXl8FGSu0DhAlc6W0SM12uwcgDAUMdYa1uWzyPf3l+3x/reA
         A0yw==
X-Gm-Message-State: AJIora9q5/jfvE8verqphJagztEsOExCfTSuFZNYRfdnPGdvQ2vL/uIr
	Ui1iPMKjZp31RT9g+J8ml/v+s5iJ3iFcWnG9WcE=
X-Google-Smtp-Source: AGRyM1uIEC0PcctxDbe0s059lTbpgzq5joEE1C4fgSlA6DPH4iRSwaj5/x2NpdBckrK5+ERUo19alicmxyTxfHdCTU8=
X-Received: by 2002:a05:6638:25cb:b0:341:6546:1534 with SMTP id
 u11-20020a05663825cb00b0034165461534mr8193243jat.308.1659449825119; Tue, 02
 Aug 2022 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com> <YukrFS9NIMSP/I/Q@infradead.org>
In-Reply-To: <YukrFS9NIMSP/I/Q@infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 16:16:53 +0200
Message-ID: <CANiq72=rRxQf+CLhDBpR7YFYkjSFKQoik082q5_bgh_AMCb3rQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 3:48 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> handwaiving and pointing to git trees is not how Linux development
> works.  Please make sure all the patches go to the relevant lists
> and maintainers first, and actually do have ACKs.

Which hand-waving? In fact, we were requested to do it like this.

As for the Cc's, if any ML wants to be Cc'd for an abstraction we
create, even if no C code is modified on their side, I am more than
happy to Cc them. I can even do that by default, but not everyone may
want to hear about the Rust side just yet, so I have not been doing it
so far.

Cheers,
Miguel
