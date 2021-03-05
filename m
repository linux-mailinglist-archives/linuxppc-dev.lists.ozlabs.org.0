Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA932E76B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 12:50:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsQyd0z4Pz3dDg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 22:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iqqfOFNX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iqqfOFNX; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsQyF1c58z3cLJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 22:49:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DsQy96jkXz9sWL;
 Fri,  5 Mar 2021 22:49:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614944979;
 bh=MFuEr/zpCREmU8rWGDeBRzuATbhdbCM1oGMnXg6xVJA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iqqfOFNX9EQlJSH/QhZZ0p6dE3IkuDgX/+x3w6yrBguuBdJT+jY7FX2diXMKV0ALl
 +keQy4Z341L6a8EZLdY7Gl8NJU5gZS0MAfOpTNZiAzBO2QKsrzfaiGylrzMQIPZQm3
 CSxGVfSC5Iw41blS8SDq2alD7gJzxyOUQf0AwLVw7+h+Ps7feiYoEJ/JVJ/gr/fxMj
 UtLYMOgbVPH16NxnEsyLRgZVmjPul7J53e1mOrzcI3Mt/hrBZc2Moqi3m3N9hqpVue
 yQDAjSKkliB/ApMNL2rDGxjiCxQ9sxw2Xi1NaGtkMwf/LJy+eKyHcKqwqOAypP9nXG
 VqDsphppeLQ5A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Marco Elver <elver@google.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
In-Reply-To: <CANpmjNM9o1s4O4v2T9HUohPdCDJzWcaC5KDrt_7BSVdTUQWagw@mail.gmail.com>
References: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com> <874khqry78.fsf@mpe.ellerman.id.au>
 <YEHiq1ALdPn2crvP@elver.google.com>
 <f6e47f4f-6953-6584-f023-8b9c22d6974e@csgroup.eu>
 <CANpmjNM9o1s4O4v2T9HUohPdCDJzWcaC5KDrt_7BSVdTUQWagw@mail.gmail.com>
Date: Fri, 05 Mar 2021 22:49:36 +1100
Message-ID: <87tupprfan.fsf@mpe.ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marco Elver <elver@google.com> writes:
...
>
> The choice is between:
>
> 1. ARCH_FUNC_PREFIX (as a matter of fact, the ARCH_FUNC_PREFIX patch
> is already in -mm). Perhaps we could optimize it further, by checking
> ARCH_FUNC_PREFIX in buf, and advancing buf like you propose, but I'm
> not sure it's worth worrying about.
>
> 2. The dynamic solution that I proposed that does not use a hard-coded
> '.' (or some variation thereof).
>
> Please tell me which solution you prefer, 1 or 2 -- I'd like to stop
> bikeshedding here. If there's a compelling argument for hard-coding
> the '.' in non-arch code, please clarify, but otherwise I'd like to
> keep arch-specific things out of generic code.

It's your choice, I was just trying to minimise the size of the wart you
have to carry in kfence code to deal with it.

The ARCH_FUNC_PREFIX solution is fine by me.

cheers
