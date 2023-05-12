Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47B0700D29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 18:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHvcB4xFtz3fZG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 02:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rtNlldms;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rtNlldms;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHvbK01Gvz3f8H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 02:38:36 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64ab2a37812so6107684b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683909514; x=1686501514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI3VClWXDuKTFGWdg3vQHVn8mYYEQYaV3Uoj0tZUhr8=;
        b=rtNlldmsz3ctSPubKMZIs9MSHIgEjW+zWdMumyfKBtQa33xEAw8RKJWeJ2DGLaoOBK
         WGKHOpufyc6MSqWqHlJv9SzUeIBxzz72WSgqejMFt9CDZgPTdKUMX+LhBs+0MJWYO/5a
         JIDkP3LE4sFEbglJdH6kN1QmYtn78//5j77HPybCI4D7ojcRoB5fZEBYtO/Lwm+DWZT2
         ps5XFQ6cGjiBbrzbQRqKN5f50mm4ByXgBcU8uZ13NycPg+8LCsTcVXD5byqU4qQdvpuZ
         S7objJdTGXnGzRWkpoTBgr2BNUTZzsc3Dp12Y+BJKTuqYfj9g32UU8Ea4oJ0iPDHUEiO
         6+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683909514; x=1686501514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DI3VClWXDuKTFGWdg3vQHVn8mYYEQYaV3Uoj0tZUhr8=;
        b=GSpgorWbn/p2NyWaIWfd6AYqw29zfVy1Ag2W3rgKcwDTx5ky7fa5sTPiVGphAhKDwv
         fXTaPMHstR6XHXgD6rif70kqfvIKXkkqCJosOP3kfvxixoV0HiMPRqj3iu6A4aBbYJt7
         G2DmGTRnt3cb7A5BEAf7QBVeTY9b6WAOfQ1EXk9NAoNcFWhTDaiJp2jpuNP31Gv5MgJl
         gorMyjBNiouM/R2fNvaHViuzY6GkRpCGmB9nWVtn+EeVVpyDeMqClxHJ2OfJxrToAff/
         QgH7PAVvSpBV1KsnInzQ/V7lJ1ZR1F9VqX6Ypk4GDng/omaE/MzU7rvv0vNR591DQul6
         Ax0w==
X-Gm-Message-State: AC+VfDy6RuEna1hrDI7q4l0RYsG8t7u+TDb84pZDZGY3cmHH/kmaxTkO
	eSI/UR5tTo+sFTtkPyBnQXOMfSGQqK6eY8/Njqg=
X-Google-Smtp-Source: ACHHUZ6GWMdYadfeRV/qZ24bVy+eXwpBauXEuaI7sUETSLNb7cFw5fkqX+OZ4FeF59Wg9oTW7cKjs4y8H/suDYvU2iw=
X-Received: by 2002:a17:90a:9f87:b0:24e:201e:dcbd with SMTP id
 o7-20020a17090a9f8700b0024e201edcbdmr30692013pjp.21.1683909513955; Fri, 12
 May 2023 09:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683892665.git.christophe.leroy@csgroup.eu> <a6834980e58c5e2cdf25b3db061f34975de46437.1683892665.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a6834980e58c5e2cdf25b3db061f34975de46437.1683892665.git.christophe.leroy@csgroup.eu>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 12 May 2023 09:38:21 -0700
Message-ID: <CAMo8BfLYp6yKC6o8Z8qSYQq3BhBmHfQ32F_ShsgqRbfVepkv1g@mail.gmail.com>
Subject: Re: [PATCH 3/3] xtensa: Remove 64 bits atomic builtins stubs
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Chris Zankel <chris@zankel.net>, Marco Elver <elver@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 12, 2023 at 8:31=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> The stubs were provided by commit 725aea873261 ("xtensa: enable KCSAN")
> to make linker happy allthought they are not meant to be used at all.
>
> KCSAN core has been fixed to not require them anymore on
> 32 bits architectures.
>
> Then they can be removed.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/xtensa/lib/Makefile      |  2 --
>  arch/xtensa/lib/kcsan-stubs.c | 54 -----------------------------------
>  2 files changed, 56 deletions(-)
>  delete mode 100644 arch/xtensa/lib/kcsan-stubs.c

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
