Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CB535254
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 18:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8DX464pgz3by9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 02:53:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Uw2QqULb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Uw2QqULb;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8DWQ4rslz3bbV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 02:52:32 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id m20so4031078ejj.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KIrgpKkAzwB07gYimrtbZQWgxesfa74CNz+gljHxsDM=;
        b=Uw2QqULbsgoG8dWkUYz5Wetvt9zrj+w2Z/3KG1NXe+Ga2SYOQA4ahHz0GCrZxRVxxs
         V+aWCEb61jpbUN2D2snj9yzTr4OzNyUFkAE5Zt5ZRUjf0jixHym11fMEvpdfrn+XIvS7
         eBQrWbr/A3ETMNkjZcLBXDbPoHW+g5IGealpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KIrgpKkAzwB07gYimrtbZQWgxesfa74CNz+gljHxsDM=;
        b=iEStRjoA4CNtCClxnzkXmG98hryqxfwPdMJCBMc6MqIRnPgnT9687KubnHpa4RK/jZ
         eiTfcUyVmtC55pU6pOYp0gaLwN5dU8OYYCKK4/XRZXwzl2nXkdyje8UymFIE1dd96bGd
         FDDzlwTCqADDYUXV6jgdWP0+movdWHko8S9my67iPiEipvBTAIAbAzV+yAqfDic7YQzM
         KkaVkK08d0kaNouyiNlRED51jt5HBwKxClm3UWsw+OwLOrXZlWCyEzmHzE/bzF8S8Yj4
         zP0DtyCmoayMglv2bstJmig46KMgFOs8I7vrz4lkoVI/4ag2P3xQ3YTeX1CT5LrOW7K1
         63og==
X-Gm-Message-State: AOAM532nL486HK99ua0Vnue9H6LhSmxY+WNHDNI/Sk5RoWalWpV/xf8/
	pQpnhA9DeaO023jmreZHNlzMrK5px8WIVqJ0P4c=
X-Google-Smtp-Source: ABdhPJzhBZMGTQgMt75OffHEa5zvaTmkFQZzY8OL6XnSb08j2uyxbQmXRhgUK9H4ywc1LWWm/C37tQ==
X-Received: by 2002:a17:907:7ea7:b0:6fe:fce4:e802 with SMTP id qb39-20020a1709077ea700b006fefce4e802mr15297082ejc.47.1653583944394;
        Thu, 26 May 2022 09:52:24 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id o25-20020a509b19000000b0042617ba63a7sm1014693edi.49.2022.05.26.09.52.20
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 09:52:22 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id l30so2843800wrb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 09:52:20 -0700 (PDT)
X-Received: by 2002:a5d:58cc:0:b0:20e:643d:e46a with SMTP id
 o12-20020a5d58cc000000b0020e643de46amr30854195wrf.97.1653583940350; Thu, 26
 May 2022 09:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh1XeaxWXG5QziGA4ds918UnW1hO924kusgVB-wGj+9Og@mail.gmail.com>
 <871qwgmqws.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qwgmqws.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 May 2022 09:52:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjd-RVttYwPc9RYD+x0b=WNYc_PZ2JKwPxc8fm54t0d2w@mail.gmail.com>
Message-ID: <CAHk-=wjd-RVttYwPc9RYD+x0b=WNYc_PZ2JKwPxc8fm54t0d2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] locking/lockref: Use try_cmpxchg64 in CMPXCHG_LOOP macro
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
Cc: Waiman.Long@hp.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 5:15 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Do you know of a benchmark that shows it up? I tried a few things but
> couldn't get lockref_get() to count for more than 1-2%.

Heh. 1% for a small instruction sequence that is only handful of
instructions and is used in just a couple of places counts as "very
hot" for me.

I assume you did the natural thing: threaded pathname lookup (with
paths being of the longer variety to not be dominated by system call
etc costs).

               Linus
