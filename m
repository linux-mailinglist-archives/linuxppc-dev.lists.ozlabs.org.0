Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 091056F2132
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 01:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7TWM6tzzz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 09:35:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=B0VSON09;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=B0VSON09;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7TVS3r9bz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 09:35:10 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-506bf4cbecbso413714a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682724905; x=1685316905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC3lDy6oF9TSUP8W2/TITo5d6aWrWCjfITyVQ/L7zgs=;
        b=B0VSON09q68IX0X4fxgCMfNEPdIuVtVfm5uZkWzqrLl5+9Y49omu1CarH2yxxantgk
         Z4heCJ44zsZtQMwVjx8fIWhROPdA69IAAkykA+UQtwKUfZBzrl0YxQyf67PDt68wYlAo
         aKwAsZd0lHwcwwMcnKdUIHXdot8ZQ0QVleBQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682724905; x=1685316905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC3lDy6oF9TSUP8W2/TITo5d6aWrWCjfITyVQ/L7zgs=;
        b=SzqC5XN80ruYcW5EIorTpOGMzAezA5gxGEbRAtDBN1RoBX9JFD8SDDB/dazPrDb4/n
         9Ze5FWJn+sjovIzFxc9R64zItm/hkuYV41/9iaAn9eEN3McIPfY4KkX+E+fHtFK5LQ2+
         Kl7bkVJfSpf5ohcavLjx5NJRHMwu3kyMai7YDoLoCyvdX+Os4HNB2MUS7ZfE+h+XraiR
         ubP7It0PMzybP2AXEur2h3Itc2tnL8QSGebhgxXM2ilIGC238MZb2Z3CnDnJQZuwQNfw
         JC5KffdU5Eu/2X4yrw6eepJ8ijZNEq525yiroG8GOEu6BXpZqWHkOfygpbTeXHoRnWHH
         H4Jg==
X-Gm-Message-State: AC+VfDx6tq4sTFeTN0jl5cw7HK2jmbTI144gqK7o+RQqn33Anz/O0fJX
	LygdMHfz5MZFkcE9gUaMoC1JOcTBvDdx3qa933wktLSh
X-Google-Smtp-Source: ACHHUZ5daE2RuXVUYr+8MJg3uCbZIXVngejE4NDA51otrJPftLckH8FauZ3Drkufzj9u6gBD2JMU2Q==
X-Received: by 2002:aa7:d04c:0:b0:506:b211:489 with SMTP id n12-20020aa7d04c000000b00506b2110489mr365469edo.35.1682724905368;
        Fri, 28 Apr 2023 16:35:05 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id y21-20020a17090614d500b0094b87711c9fsm11845143ejc.99.2023.04.28.16.35.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 16:35:04 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-506bf4cbecbso413671a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 16:35:04 -0700 (PDT)
X-Received: by 2002:a17:907:6e90:b0:94f:5079:ade2 with SMTP id
 sh16-20020a1709076e9000b0094f5079ade2mr8278173ejc.62.1682724903906; Fri, 28
 Apr 2023 16:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <87fs8k734t.fsf@mail.concordia>
In-Reply-To: <87fs8k734t.fsf@mail.concordia>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Apr 2023 16:34:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgY8_-BvS5mFR+UtCwbLrOVikYfHi_m9OFxE2D43B+=8g@mail.gmail.com>
Message-ID: <CAHk-=wgY8_-BvS5mFR+UtCwbLrOVikYfHi_m9OFxE2D43B+=8g@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-1 tag
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
Cc: arkamar@atlas.cz, aik@ozlabs.ru, paul.gortmaker@windriver.com, bgray@linux.ibm.com, ira.weiny@intel.com, robh@kernel.org, mikey@neuling.org, windhl@126.com, tpearson@raptorengineering.com, nicholas@linux.ibm.com, joel@jms.id.au, liubo03@inspur.com, kconsul@linux.vnet.ibm.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, nathan@kernel.org, alex.williamson@redhat.com, pali@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, mcgrof@kernel.org, nysal@linux.ibm.com, seanjc@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 28, 2023 at 2:44=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/=
powerpc-6.4-1

Odd. Your shortlog has this:

> Michael Ellerman (46):
>       powerpc/configs: Make pseries_defconfig an alias for ppc64le_guest

that removed the 'pseries_defconfig' file, but then your diffstat

>  arch/powerpc/configs/pq2fads_defconfig                                  =
             |  80 ----
>  arch/powerpc/include/asm/atomic.h                                       =
             |  53 +-

doesn't have it, resulting in the summary not matching what I get:

> 278 files changed, 2672 insertions(+), 9188 deletions(-)

versus my

 279 files changed, 2690 insertions(+), 9528 deletions(-)

and I see no obvious reason for it.

I wonder if your test-merge just didn't remove the file (it did have a
conflict due to the IXGB driver removal), and that's why.

Anyway, I'm not entirely sure about the mismatch of the end result,
but it seems to be due to that one defconfig file, and I think my
merge is fine. But please double-check.

                   Linus
