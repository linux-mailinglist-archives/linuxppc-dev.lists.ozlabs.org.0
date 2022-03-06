Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A54CED94
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 21:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBXXL6mhlz3bbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 07:01:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OnbdavhN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=OnbdavhN; 
 dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBXWh1t9Bz30LL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 07:00:31 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id b5so2989864lfs.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Mar 2022 12:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFwJynFO3fJ8ixtoqLr++1NLbQ5v5m+5KLS3G5LcfTE=;
 b=OnbdavhNVJSLJk4bAGHLIMP/HNzhzBn7tUeoGTV+Py3x2I3KBPlcn8Xo93IFJFqxuR
 48BuPrU094sNxSTqm5atY89FnSSQWWF/IATnuI9MI+oYTTQEGt7fKr73AOz347/NINk8
 Q9tMxVvfU1l+z1sQXqyPKWaAlMZzVXnyMiNIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFwJynFO3fJ8ixtoqLr++1NLbQ5v5m+5KLS3G5LcfTE=;
 b=L1bay73kgfjci6FeS3W3dRROHXRcXjnt9qd/wmwuwpn5YS443ZqHnuXBfYVvC+yjlr
 lr+FADzKzpfd4YThzzyIHdIs6nUWoo06UpIRXiEfkXdA8K5dOLlNf1BO6/YIdsG6N8JU
 QRpAETxAobspxVv6SRDCc+z1jfZhjjIpV2V7pHihu6z2Kk3qI+iRp0G1MWuqL7gyFaDD
 ODim7/eCTaJfm8HrtNyOXsGlR/ATvYvOLoAGT+KXe++X40Od2/OPvyA5FoxP+31n09m4
 hdjoG5c/S0OTvy6orga0IfPokwS/BKMDMwxxfLINWuuw6w844dCAkvxQ+gr4/WIA1n02
 muCA==
X-Gm-Message-State: AOAM532UjKhN2QnumEggYWgNOAvqBGIhAueHV8OC4ZryLHwMe6iQXUlI
 OD9TeSZUf+3tQ5qEqMqodn/ChHGVqu741fxdeg4=
X-Google-Smtp-Source: ABdhPJxR2/rGh4hnliNAVZzk2VG/Vyx9VAjCd6W0wdQ+HAm+PxBk7FH5BjkbgM1618DXfQtsAOnSOQ==
X-Received: by 2002:a05:6512:1050:b0:447:9cad:6a46 with SMTP id
 c16-20020a056512105000b004479cad6a46mr5699730lfb.188.1646596826286; 
 Sun, 06 Mar 2022 12:00:26 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 l4-20020a2e8344000000b00247e3be2e3csm358794ljh.123.2022.03.06.12.00.24
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 12:00:25 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id s25so17712729lji.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Mar 2022 12:00:24 -0800 (PST)
X-Received: by 2002:a05:651c:1213:b0:247:e2d9:cdda with SMTP id
 i19-20020a05651c121300b00247e2d9cddamr2262817lja.443.1646596824468; Sun, 06
 Mar 2022 12:00:24 -0800 (PST)
MIME-Version: 1.0
References: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Mar 2022 12:00:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEQRDQ3fJT1KVVAeaWiJ+mYTM+MwYoXEOUQrnbERLa5w@mail.gmail.com>
Message-ID: <CAHk-=whEQRDQ3fJT1KVVAeaWiJ+mYTM+MwYoXEOUQrnbERLa5w@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-5 tag
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 muriloo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 5, 2022 at 11:51 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> powerpc fixes for 5.17 #5
>
> Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set.

Hmm.

I'm *still* not seeing the fix for the reported
powerpc:skiroot_defconfig failure:

    arch/powerpc/kernel/stacktrace.c: In function 'handle_backtrace_ipi':
    arch/powerpc/kernel/stacktrace.c:171:9: error: implicit
declaration of function 'nmi_cpu_backtrace'

which has been pending forever.

The alleged fix (commit 5a72345e6a78: "powerpc: Fix STACKTRACE=n
build") has been in linux-next for three weeks by now, but hasn't been
sent to me. And you must be aware of it, since you're the author,
signed off on it and committed it.

What's up? This has been reported forever, and was already failing in
rc2. I'm about to release rc7 and it's *still* there.

                         Linus
