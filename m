Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6C7B083D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 17:28:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=alcokFvi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwgVl4T7Dz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=alcokFvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=ariel.miculas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwgTs4rqGz3bTQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 01:27:44 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c186ea81c7so19365751fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695828456; x=1696433256; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IskEJlA+1Xi+P4CK/j2l20j5wUzirP4EWW7EpWRuvU4=;
        b=alcokFvikgvRYZRpBuBnyxRY2sm/Hw5l8qyHod11MnSxKu9cJL3PBq3OzbJurR7gWh
         mlX2xDS4HPFPERoIdchc+sf1MBQFNtV9cw/QHlEcgtSGHv21zBvkAQJgXatQ0/A+OYW0
         t1SdVSe+Wq7Nlsur5sFm2a0wiQQINBA0LfjMbh0Lycb1Hpys8M0BhDAYxdWt8ktN8H9B
         F0iHKxqVbu0LaXRflsFzFLFVGh0PTyNHyfmD9dooKoCAKip+NQonO4tVOF6ikB1o9CqG
         Fe7ZUrCE7eBo321Qz6mo40I0f1XITSmROXWGl828FRWTWELpsyeGdVlB14aP9XXs7Sr/
         LBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695828456; x=1696433256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IskEJlA+1Xi+P4CK/j2l20j5wUzirP4EWW7EpWRuvU4=;
        b=JEai4F7PWochMV7rn5qL53AWyvKrqD9prAObCbiHIbTLR8A8J9MTnJcsAcUNOVSKdV
         2kRV4aOruecedlsC0kiJrGSvZHVFkvEmNsUxI3HTZHlwGDkoucBo9iLMHS5+Tl5HD7By
         f0TqXC6YVcunAjE1DMeFsgSXGXJ1vXiqv2jHyo/+zf9p0fw61V92ve9ZRZM+If/QmsS0
         cuem+Mp7JugRZBDq6VOi6QiJEYGGFbbJx3EhkkbVqKr+BYLeAkqm6+UqU1z4xbtPZTfs
         omFez8+VHBrHmq3JaRAH4CsMj6DwSRg/8LFGXz/bQJy5un8t5aW1t7yi54q+i/61rEL2
         JKfw==
X-Gm-Message-State: AOJu0YzOWm5DQgB3o8ITKW6uefZmQw3pRz5IzVlSDDyH8FipPS7sNIKP
	7syIV+ZvPRUAA3dAX5R7ElCztdlD38yDEzEH6YU=
X-Google-Smtp-Source: AGHT+IEHT5aib1jiL0PldTcUlcTIlNgMuNoB906ITYTiSL8bEUpcMEgkMjYQDTVJhcmpnJtWWNxORnbzZABEqkqV+lU=
X-Received: by 2002:a2e:9d55:0:b0:2c0:1cfd:8698 with SMTP id
 y21-20020a2e9d55000000b002c01cfd8698mr2118499ljj.36.1695828455759; Wed, 27
 Sep 2023 08:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDJoNtU9Vuh87PxDkxo+7M_Kg_K4PPNGksPuW_guFbChYu-jA@mail.gmail.com>
 <20220601155702.176588-1-ariel.miculas@gmail.com> <CAPDJoNvZmeeU+T94rp8BJ0+bH5pDXQCEKPHiQF0Kcu=JrRRfrg@mail.gmail.com>
 <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com>
 <CAPDJoNuR8pNa+rp-PG_eeS14EvpMBLAmjNf9JvL=+0QTpwww-w@mail.gmail.com> <d6bd3632-207e-b232-b4a1-0c592a3aaae9@csgroup.eu>
In-Reply-To: <d6bd3632-207e-b232-b4a1-0c592a3aaae9@csgroup.eu>
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, 27 Sep 2023 18:27:24 +0300
Message-ID: <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
Subject: Re: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've forwarded this old email thread for visibility and discussion's
sake around my recent blog post [1][2]

Regards,
Ariel

[1] https://news.ycombinator.com/item?id=37671991
[2] https://www.reddit.com/r/programming/comments/16tf5ne/how_i_got_robbed_of_my_first_kernel_contribution/?ref=share&ref_source=link
