Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0721AEBE1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 12:47:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4948mK4s1TzDrqC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 20:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PW1rCGhq; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4948kb6xdQzDrL2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 20:45:41 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id np9so2236896pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Ny/Pcfc4MYQgeT5bB0SY9/mF1WZmwT7h0EiEyODFyJ4=;
 b=PW1rCGhqlZg3C+5HvTZ9oq4k+7XNNR1u1QzZikIWyVjeyQvYGgLAKJuwKVMRFBKox3
 lMNIlrWxH2aDO6/2EQUmFVCYWbcE6e+ECeiXU2iisvWx5Sm28afMLqZy4el7ZVGt57O5
 R7o23llYEsgMRb86RELlaaheO3f0TKVAxdljCI9v4qq1xeIK78mgehQrKfhkPEHOhvQj
 uK/j5Zig8G+cMX2NTwgq3RsVS/iuvs+MziQUW70cbWvnMV/zqo8XiWT9MdyZOik6Pf5v
 wtfQoDqe588bz2nrqCeisqnCWejZudXYdkHu6R64LL4qpp2dbJiFh+rAIs3ulXKHklKc
 Tvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Ny/Pcfc4MYQgeT5bB0SY9/mF1WZmwT7h0EiEyODFyJ4=;
 b=b34Dibc+Dj++OH7elefycQgJ5Rv4FgkYCDp6u2mS2umdmwPLGKZTg1/u6vgjYBaM3L
 +nGsrCtX+ZXoYWf3IknGZhzANn9HaYZWzSMb25xE8O5P3nfKhBNVtK3LxFcdOEUoGUXN
 UAJDkYxdHZ2LYOK3+83Cet/i8N68RxLgS5vIVMTglBowMUrJjJWKfUi2Cpqe9Z8d/qmQ
 qPJyoZ0/YMUIZcKvHbinE8lOVIOWIQl68F90qRSH52k0gIOIQS4fdqjkL8SDMx2OTBF1
 cgPNFHhtK2hUGf5+3pEHIUYNPYqmBdPQUhLE4IK1zyoLPsvehN6N1hrdI7EbxgBHWIGC
 Yqqg==
X-Gm-Message-State: AGi0PubvPeXjimIUeBrpA026809+uu0Fm+Dfh8IDgyvZAjiUmjekLwld
 maWHjdyTl8kmlQ5HWSis2pI=
X-Google-Smtp-Source: APiQypKT8yWlRZsexgHxKxuvNTJ0BbbHOCHTL1QKY1YrWVPBC0+W+cUzpq9smYnVvCB2GxNQYj6u0w==
X-Received: by 2002:a17:90a:6f22:: with SMTP id
 d31mr9799684pjk.14.1587206739671; 
 Sat, 18 Apr 2020 03:45:39 -0700 (PDT)
Received: from localhost (220-244-86-41.tpgi.com.au. [220.244.86.41])
 by smtp.gmail.com with ESMTPSA id l22sm7848088pjq.15.2020.04.18.03.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 03:45:39 -0700 (PDT)
Date: Sat, 18 Apr 2020 20:44:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64/signal: balance return predictor stack in
 signal trampoline
To: Alan Modra <amodra@gmail.com>
References: <20200417091747.316707-1-npiggin@gmail.com>
 <20200417234026.GB29913@bubble.grove.modra.org>
In-Reply-To: <20200417234026.GB29913@bubble.grove.modra.org>
MIME-Version: 1.0
Message-Id: <1587204036.ptxypxbi2s.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, Anton Blanchard <anton@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alan Modra's message of April 18, 2020 9:40 am:
> On Fri, Apr 17, 2020 at 07:17:47PM +1000, Nicholas Piggin wrote:
>> I don't know much about dwarf, gdb still seems to recognize the signal
>> frame and unwind properly if I break inside a signal handler.
>=20
> Yes, the dwarf unwind info still looks good.  The commented out dwarf
> near the end of sigtramp.S should probably go.  At least if you really
> can't take an async signal in the trampoline (a kernel question, not
> anything to do with gcc support of async signals as the comment
> wrongly says).  If you *can* take an async signal at some point past
> the trampoline addi, then delete the comment and uncomment the code.

I don't think the kernel has anything that holds off signals from being=20
raised in the tramp area, so it looks like we could get a signal there.

> Note that the advance_loc there bitrotted ever since the nop was added
> before the trampoline, so you'd need to change that to an advance_loc
> that moves from .Lsigrt_start to immediately after the addi, ie. 0x42.

Okay, would you do the honors of fixing it for upstream kernel? I'd just=20
be repeating what you wrote without understand it if I write a patch.

Thanks,
Nick
