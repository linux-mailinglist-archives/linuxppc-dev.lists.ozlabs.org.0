Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F45B55D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR01G2l65z3bZs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kDA2bTFs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kDA2bTFs;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR00g0tv3z2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:20:48 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id z9-20020a17090a468900b001ffff693b27so7427767pjf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=dA6nI0fw1VaZK6eWKAxMirOGm+nHjjq2l7XAqiHtDw0=;
        b=kDA2bTFsDF3QypjgblaYFYdzMbIHFglB1JtQQDJYDm5gRc8T/I2u9yIRWPVKD756fU
         nOrnkNunG22aewLveEOoOX4Mo0mMr/LdGgPk/K+bZveM8Gen7PYkRWUo/Roch894trq1
         q3yGAB94QRsDuieK6nhhPZhGJE8gBuMbtcGxqhxuG2wXJ+RMS3ZhZN2KVEYTabh0tnZb
         sRwtHwbchf63OQCYBmqEeesMN7ziBfLaqGPq5QCyaQNZ/TrYRwAYFdV5xJyAVXJzflHN
         H5RcNeXTNs4HEVwqLLGEU2Wl7J0u5MZO9KlbH+z+Q1eff4rJtEMGzgGwI5+TS4N/9s9W
         kB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=dA6nI0fw1VaZK6eWKAxMirOGm+nHjjq2l7XAqiHtDw0=;
        b=skLwd5UJer5xff2GUaeKvqx9p0QPgtx77bNOpyMjzYYBzvLy2CN2HuTvdgFyhMszHs
         XCvsTN90EKALBFeUvIYkYTYUIT3Nak4CHCTPVwsLyJlJZ4fshEfw4b288H7WziYmZ4tj
         629iuu2AXI1cvfCMVbGgELEEYT992YWqL9CMQFAanNEydiYcZIlbjgCCM12vh6zrRzfz
         /idLSyEsKS9c4ehVAbKbkR1lR0X4bBoSFYSwOEyJ8GRWllQuUWPWlA6dRgzOTmmQmnSI
         FJEe/VTcWWCPBVfUMDJxuGIz5jdeM+WOnRh38/8O056KkPXroQgKppk2PykGEp6dim1M
         dheA==
X-Gm-Message-State: ACgBeo2UZyQ2L7LJs8CH+VU+givvtLxi62srNBmtNuzg6p9H4EKKBtBV
	6WqH9qIC2YNdRAkwhZoXdY14BvQrNVoQlg==
X-Google-Smtp-Source: AA6agR5NPqxdnPUYbM/u/bfwluD1cH0QwMWzJ9NirY/DkJ4TP0HcO0od4NFirmSz83WACn+XwjZx4A==
X-Received: by 2002:a17:902:b681:b0:176:6471:8ee6 with SMTP id c1-20020a170902b68100b0017664718ee6mr25887295pls.8.1662970845652;
        Mon, 12 Sep 2022 01:20:45 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id cp16-20020a170902e79000b0016d6c939332sm5203176plb.279.2022.09.12.01.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 01:20:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 18:20:40 +1000
Message-Id: <CMU9YPK896PV.9YUXVUNC7XGJ@bobo>
Subject: Re: [PATCH v4 01/20] powerpc: Remove asmlinkage from syscall
 handler definitions
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-2-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-2-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> The asmlinkage macro has no special meaning in powerpc, and prior to
> this patch is used sporadically on some syscall handler definitions. On
> architectures that do not define asmlinkage, it resolves to extern "C"
> for C++ compilers and a nop otherwise. The current invocations of
> asmlinkage provide far from complete support for C++ toolchains, and so
> the macro serves no purpose in powerpc.
>
> Remove all invocations of asmlinkage in arch/powerpc. These incidentally
> only occur in syscall definitions and prototypes.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

