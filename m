Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25B586D4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 16:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLhm4spkz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 00:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=okSn5/oC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=pqtu=yf=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=okSn5/oC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLdT21Hbz3bqT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 00:50:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53E7361460
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 14:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30E4C43142
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 14:50:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="okSn5/oC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1659365414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IL1fL31Kufub455HpgLgDd5H/KhEcVXE4PfEbm2p3dk=;
	b=okSn5/oClukTgZcYwlzukVFhCGGnSKMgXCl1E3xU0tHG0Q5ZYAcvswnn1KBJ7tRYBaNVsy
	8mVC2yWDF9O5hJjg/uT8IYnA/wxo0dZ2q6Lb1+ASSq5IVSKMOzvhK5OeEkVK7A4IUWntWX
	04D8j9pCgkOaK4F7VJbG77pttOhooMk=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51d4e866 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 1 Aug 2022 14:50:14 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y127so19273057yby.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Aug 2022 07:50:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo3ufBVbE4biQh9+qXBJjOfPV8GlE0v509PsNeNqgUFWcjq883Mj
	CdXwlGmGLEGLGk6Xxn6F6poULL4YhucYkEmokxg=
X-Google-Smtp-Source: AA6agR6P70edYqiN+zUwKWi9WNeeDQlBEVmK8mzIeWJiBehF/9yUDRm2k8cgf/ZDiZNwZvbs/5SzSQc6w3Gplutopvw=
X-Received: by 2002:a25:250:0:b0:673:e6c5:27bf with SMTP id
 77-20020a250250000000b00673e6c527bfmr11691124ybc.258.1659365411128; Mon, 01
 Aug 2022 07:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com> <7285be49c459bdc8f4ec3abe85d9e171@linux.ibm.com>
In-Reply-To: <7285be49c459bdc8f4ec3abe85d9e171@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 1 Aug 2022 16:50:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9rk27DA0DmTY7hhedFT0ftkMKhZn30NCvjkkzkKD0hNfQ@mail.gmail.com>
Message-ID: <CAHmME9rk27DA0DmTY7hhedFT0ftkMKhZn30NCvjkkzkKD0hNfQ@mail.gmail.com>
Subject: Re: [PATCH v3] random: handle archrandom with multiple longs
To: freude@linux.ibm.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Harald,

On Mon, Aug 1, 2022 at 4:47 PM Harald Freudenberger
<freude@linux.ibm.com> wrote:
>
> Nice interface :-)
> Here is my
> Acked-by: Harald Freudenberger <freude@linux.ibm.com>

You're too late; I already sent in my pull request. But that's okay; I
received Heiko's ack on this for s390.

> but please keep in mind that your patch does not apply cleanly as there
> is my other patch
> 918e75f77af7 ("s390/archrandom: prevent CPACF trng invocations in
> interrupt context")
> in between.

Yea, this was a late addition to 5.19, and my random tree was based on
an earlier rc of 5.19. That kind of thing happens and is fine; Stephen
caught it when doing the next merge and carries the merge conflict
resolution there. I mentioned it to Linus in my pull, so he'll be able
to work it out.

Jason
