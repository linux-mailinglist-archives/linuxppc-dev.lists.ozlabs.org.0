Return-Path: <linuxppc-dev+bounces-11187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D37B31A16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 15:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7hLt6GwDz3cgJ;
	Fri, 22 Aug 2025 23:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755870422;
	cv=none; b=ap8VWC/5lhDD2k4l/T6cSVGMmaFKED8skQLqHrmzbnOrl0t9FdnnBFiK26KUKWatUPuBE0AwE8Otvh1JPg4INEVPVY+Uo9sFGY+YclpnZ09Ubx/e5oqxNUTCAg4+9EtuxHDFg9BqJDHpt8EEFIAFVAuZPvxS/eeGqRNAi2skezzeiD2WMVFbCUWjiT2gR/rnasP6YOj1gWr1nOSHgllmymvs9H0WfnVoEFnC1rF531vwZHqjai02E0gPoRMmPXAKDAZtVBy051z2yehNAwNJfnfeV0viesxOctaIQeMluzT5/mnJ3ZmNBFYOcjjwSEcQATUrEbWPA8xQF0H5Yipx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755870422; c=relaxed/relaxed;
	bh=NRu/0FoVw+bU0VwjyXzuUF8CXZhxspV/ZyS4JSE6Hqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrzCht2BtGFxI3pJM6iRCG7LdLALz8+HXxihQTgFaQ72rrBjZrmu2grVNOPSpiR25fCJLwGDQi0g/U/Upa9VrBJ7hLxG8KQ5Yc5empVehPGheppiAEqo7on1eC4ldhLy69GIZc71V0rA41MWY3f7r4RehqELrYLB0PYtp4Ny0GZin96JB47fHvkN6t6tl75am+9FS0jAoCINQzaQxUsTDSUrn7kVHXNAcWbs0ESpzDKsPeLq8iteiIgKiXJFfbLjtAlbmieD2lqB4vXuqGdzogK6FhopQ0Cz3bJ65K+VhT1i/Z0F1wUmR4HzLLTkaW6kYyYKDkJ04PV/p7znZybfdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LVewMVdW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LVewMVdW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7hLs1BLNz3cfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 23:47:00 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb73621fcso289641466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755870415; x=1756475215; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRu/0FoVw+bU0VwjyXzuUF8CXZhxspV/ZyS4JSE6Hqs=;
        b=LVewMVdWlATRad+DAwJgEy6/iA3Z/ykASWFCQggmgm9jDkCl+lURfJYzPhXw1U4UXL
         gvoAoU2HyJLbyhAkAzfCkGd5d0E2ngMcRsq6naCQTQgpJ/1V+AKM9s8m0ApexKw3++ye
         5eXRgoWU/yciE1HNZlX5hhoWSNWQBtyJvgJSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870415; x=1756475215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRu/0FoVw+bU0VwjyXzuUF8CXZhxspV/ZyS4JSE6Hqs=;
        b=qiAc+03+0/U070g67Qhxco05/yzX/vSmYDb3oBCMPC5B7zetLEd6aJw79Jwe6+im/K
         OYE3ps7YgTvJWE8dGLM7WMe2sTIMH3YVMUHJIoDsbq5ZSmTnjXXL+6LwXwaMpY164h+n
         DrhFiBTNIU/REjGhliJUP8/jR75/hKVKC8Fyr99nk4PTKSInTv5Cta0GQ8mzhcMur+8W
         +tsCDt9/l4L2+rsHJYhemZy5XbTZhF5UMTXmypBLqZTyXoQNG+u+I0wMNmXLjHN4bAlK
         fvUbkKC2uq/elX3BvCgG6xk2oz4vrIMVa9e6TGUFDdqr0JVrqOgDLvE+nMd9joxzMXIx
         Xihg==
X-Forwarded-Encrypted: i=1; AJvYcCWe4UKUkX/opsJIgyoE0mx5mQk+ImZYa1J7czyrl2OU9kbsvcMrHuBhqrs5toXY/Ld9Vq7qJUCZ0i329cA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDR/qeqC4z9eEA5FAbKSIxbSMBJfodT2piSzT8ilVgDcTdiaBF
	iYEqxbtq0+cqaStC+9FpbzXXsgRqNtfZD2cYxp0DkwtbDvehQxZA8VxCT4+55NK3to8pon0rqtW
	fcr8RvOI=
X-Gm-Gg: ASbGncvJnskl2gaHk1cWTUBma9gJoOj7Tl9BcG3zUvvVZWCUJFkJQGpxIJ8rmzaP8p+
	W6Xsp8csyAB3V9Zjyftd551oud+fNeG+l0k3XKy4t2KYiN3KwBGngWRmZ/oDY8h3uREz3As7Heg
	T3bvExOAya7tWwrgdtxSZayywI4GVbo2zG3Qxx/drQAjKizx6GIkpgh2Yib66RgxPGMWNYFKuo1
	Dx2IbfbrJwkI31ifuLWRjQdCxR0sCqX6fFVflOX/Lp/oLS9spMgIcTV/prM/EebwgA5KFGvILwO
	SUbY+SwJNBGSLTHb8EUu3205yoTjl/kzNCHtVTg0oKs4YX57ZrI7PTy5H5H49v5+YHyMLe3JxJr
	bnIPsKbKY7s82K2AS53QP16ZxEmpb9I8QnY8E7qc31Aoc36zwujpRfXmAZx45kbbBuTSsg9zz0I
	idDVa7cvQ=
X-Google-Smtp-Source: AGHT+IHj3fIv2TJIYvx/zkmEMeVGLyEhrzeEI305vBoPR+SJSC2lX0kXUUXHC3KblWh898KQsQd9yw==
X-Received: by 2002:a17:907:6d20:b0:af6:361a:eac0 with SMTP id a640c23a62f3a-afe295c02d6mr263617166b.32.1755870415172;
        Fri, 22 Aug 2025 06:46:55 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded530ecbsm610740166b.102.2025.08.22.06.46.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 06:46:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso582565a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 06:46:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYrY1/FlNdO3DxJyLIT91Oc8ur11LKhlfqcGGarNCR9TnbKS5KTdU7m6z4cS+pVMIiCXTiUf85nHMQ+fM=@lists.ozlabs.org
X-Received: by 2002:a05:6402:5110:b0:615:6481:d1c with SMTP id
 4fb4d7f45d1cf-61c1b450840mr2274281a12.1.1755870414406; Fri, 22 Aug 2025
 06:46:54 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1755854833.git.christophe.leroy@csgroup.eu> <82b9c88e63a6f1f5926e39471364168b345d84cc.1755854833.git.christophe.leroy@csgroup.eu>
In-Reply-To: <82b9c88e63a6f1f5926e39471364168b345d84cc.1755854833.git.christophe.leroy@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Aug 2025 09:46:37 -0400
X-Gmail-Original-Message-ID: <CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
X-Gm-Features: Ac12FXyg7aT4BFeJsiyaeWdfrE2FPhwu5xUJIJ1D8_vj4L1z_hVeZFuzgKfsNNk
Message-ID: <CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] uaccess: Add speculation barrier to copy_from_user_iter()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 22 Aug 2025 at 05:58, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> The results of "access_ok()" can be mis-speculated.  The result is that
> you can end speculatively:
>
>         if (access_ok(from, size))
>                 // Right here

I actually think that we should probably just make access_ok() itself do this.

We don't have *that* many users since we have been de-emphasizing the
"check ahead of time" model, and any that are performance-critical can
these days be turned into masked addresses.

As it is, now we're in the situation that careful places - like
_inline_copy_from_user(), and with your patch  copy_from_user_iter() -
do maybe wethis by hand and are ugly as a result, and lazy and
probably incorrect places don't do it at all.

That said, I don't object to this patch and maybe we should do that
access_ok() change later and independently of any powerpc work.

                 Linus

