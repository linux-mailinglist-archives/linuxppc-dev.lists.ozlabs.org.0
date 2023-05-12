Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C2700CEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 18:24:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHvGR31XFz3fXc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 02:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=d0YxE8gG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=d0YxE8gG;
	dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHvFb5Qwvz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 02:23:14 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-76c75d32005so75852239f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683908591; x=1686500591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYqg+LEPkZJcqO4f+OyWQdzbx/fRQEMeMqiumF1ATe4=;
        b=d0YxE8gG19rt8aupPyzpePMzbrfs0j3JSKwCnEwZ+0jzbM6N362ddNV07rb2jW6q0N
         l/qrs9NyaeY1XFqibY0rvre2S46fPpJXPWqJkNosJrBiiC2sCGrRV3f/B2vltFaBlpD0
         Rd7BWrFfnms6Y9ULvhoUuIOEYEcIsZIk9P/Cqfsp6rWTqrkNLiubjf3rtit4DdlY73lu
         bcaqQDuaRovuwU/ak18JtOKdYh7o8g0ujv3FKootMv4iJ6x0TwXGzoHnRPYKe62YVScy
         BmLaDbITtdPKWM71OAadSgJ0e1z3LGgI45ymrG64pjQ76l3vIFEQWno9XJNcvINOlRLk
         r7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908591; x=1686500591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYqg+LEPkZJcqO4f+OyWQdzbx/fRQEMeMqiumF1ATe4=;
        b=Dqm28QSvlBc4OSi0rEgBubUFzneIoIIJfPL5G5nqHDwHDqH7w8CE3o6g5WhwDZT8W5
         yX8x4G1MbAQVB8+877oiDHx7JAGpI3R6JZk+GbTNSAH4+lpMqOYFgKrmcvTcwQ/kDagJ
         X8Znx9QgpDhIGhL/eO3wZ0zU59/GawJMAVH8WtXFH5GIzzAwrd98qNB35Yn9pN0b+FBG
         UuOZUUxdPCLGQMRNcFd6uHt2YcN0UhefB2u8z9ckkJqOdVme+bivjdF68JYoZZUupKPy
         10VzV2BVhC4DV3IY1q3IDi7tmWvZloAU8shTunFH1fIznEJfjcudbt2OFfM71iszg8bU
         6WlA==
X-Gm-Message-State: AC+VfDwtOUkAerOFG6ads5QWtTqj+Tneqtz4s+fEM8FKct3897IEMiqw
	8/nNck541S9ULBNxLioF4qA6bScgFHygqAKTWl1s6A==
X-Google-Smtp-Source: ACHHUZ4fg7nl7btDf4GydpSsNRKgD8Bfj5CT+Heg0TucRO9A+aDjMqftnpZ42+BU65oCYNnrk9pU8EdtI5kKGbUGagI=
X-Received: by 2002:a6b:6513:0:b0:76c:76ea:3e8d with SMTP id
 z19-20020a6b6513000000b0076c76ea3e8dmr5441027iob.7.1683908591252; Fri, 12 May
 2023 09:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683892665.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1683892665.git.christophe.leroy@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Fri, 12 May 2023 18:22:32 +0200
Message-ID: <CANpmjNNLaA6TQnjwfhwd_=4o6S14vX5AAm4Az_bDaCb7zgNO_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Extend KCSAN to all powerpc
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
Cc: Chris Zankel <chris@zankel.net>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 May 2023 at 17:31, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> This series enables KCSAN on all powerpc.
>
> To do this, a fix is required to KCSAN core.
>
> Once that fix is done, the stubs can also be removed from xtensa.
>
> It would be nice if patch 1 could go in v6.4 as a fix, then patches 2 and 3
> could be handled separately in each architecture in next cycle.
>
> Christophe Leroy (2):
>   kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
>   xtensa: Remove 64 bits atomic builtins stubs
>
> Rohan McLure (1):
>   powerpc/{32,book3e}: kcsan: Extend KCSAN Support

Acked-by: Marco Elver <elver@google.com>
