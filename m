Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350E5BE0DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:57:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWwRK03vJz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=azy6gWBc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=azy6gWBc;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWwQf2z6lz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:56:56 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d82so2091040pfd.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=1xCkS/NtliFBAi/Unm7O+jqERrlsw7P433sZiPkri3c=;
        b=azy6gWBcH4uAn3JvvMQoDVf6XDBtjAt5NsZSWHLqsSuh4LJjSUMemhinc/jbUGQkNz
         nSjbWacmQzT0rFScKnaXXVgE/9M4fLe1q7HJ2WaujXmuSJjwS4RHp5acXPeqYF83ht6z
         BxBcRNj+t3HCeMaPJzDrr0/z0n8qxrJ34c+Py8pNW+95MahPfZ4yUIJl5ngeLToM0ZC4
         4Jsgt2sn25OJMS/SeSkqpk/D5v616MJ1BqTh/8DOxGvRLpp4EzygolAktTUGqO88/Ys5
         MXnmDRgw8Sg4Ib3mF2wZCSNf33n2NVcEL0lX8lfdJyPgWDszilpA5/AOUrC4Ab5vU4Bb
         COAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=1xCkS/NtliFBAi/Unm7O+jqERrlsw7P433sZiPkri3c=;
        b=KadE24N4yAs3p6Elb295DQpUXDlKEYqN/x3TToYjV37GmmDWoDzHhSeu77GeOmRb7G
         pxXC/+/N9EPbGkp7rYw52MkFoW54xLB/isLN1tdPx5ZvFW8xlfzj+5zIcxeJw133lk+H
         4BlBRrOoi8x9zduavI5xApy3fuhrB3elxcEbxC7dix0sqTJTuChJntOAKf4pmEn96xEm
         d9x2P1adUMDf14ZQMM1B0sR70t+ofsIBhh6LT1sGUMae+kR7BMIVqBvjWnCs/QN2iFak
         1AA31YGiB5mZHxGdm9vB5WpYN5lPDk3DqNrOUKrlWh7c8hqeQeDIuj+xe7kd9+dgTx4f
         qMkg==
X-Gm-Message-State: ACrzQf3GxsCnF3rlI7rfNxlEsOycty9PwRY3bshecb59e6S+QM4UqyHv
	FCTlPCkioW28HZHzTJEjB50=
X-Google-Smtp-Source: AMsMyM48Yj9b5Zqz62ykAeM1jQWHvPRvE0b7QwL9zrD02o/110sRTUMvRa0KxyX0KGZe86Bc2XWSAA==
X-Received: by 2002:a63:88c8:0:b0:439:494d:fd10 with SMTP id l191-20020a6388c8000000b00439494dfd10mr19078526pgd.201.1663664214258;
        Tue, 20 Sep 2022 01:56:54 -0700 (PDT)
Received: from localhost ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709027e4200b001754fa42065sm868869pln.143.2022.09.20.01.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:56:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 18:56:49 +1000
Message-Id: <CN13QQX0NEA2.M6SABG46NYYN@bobo>
Subject: Re: [PATCH v2 06/19] powerpc/cputable: Split cpu_specs[] out of
 cputable.h
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu> <a44b865e0318286155273b10cdf524ab697928c1.1663606875.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a44b865e0318286155273b10cdf524ab697928c1.1663606875.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 20, 2022 at 3:01 AM AEST, Christophe Leroy wrote:
> cpu_specs[] is full of #ifdefs depending on the different
> types of CPU.
>
> CPUs are mutually exclusive, it is therefore possible to split
> cpu_specs[] into smaller more readable pieces.
>
> Create cpu_specs_XXX.h that will each be dedicated on one
> of the following mutually exclusive families:
> - 40x
> - 44x
> - 47x
> - 8xx
> - e500
> - book3s/32
> - book3s/64
>
> In book3s/32, the block for 603 has been moved in front in order
> to not have two 604 blocks.


>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/cpu_specs.h           |   27 +
>  arch/powerpc/kernel/cpu_specs_40x.h       |  280 +++
>  arch/powerpc/kernel/cpu_specs_44x.h       |  304 ++++
>  arch/powerpc/kernel/cpu_specs_47x.h       |   78 +
>  arch/powerpc/kernel/cpu_specs_8xx.h       |   21 +
>  arch/powerpc/kernel/cpu_specs_book3s_32.h |  607 +++++++
>  arch/powerpc/kernel/cpu_specs_book3s_64.h |  488 ++++++
>  arch/powerpc/kernel/cpu_specs_e500.h      |  135 ++
>  arch/powerpc/kernel/cputable.c            | 1877 +--------------------

This series is a nice cleanup. No comments yet but kernel/ is getting
pretty crowded. Should we make some subdirectories for subarch things
like mm has?

Can do that after your series. Probably requires another merge window
to do it.

Thanks,
Nick
