Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5C25CE54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 01:28:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjH6f1PQlzDr58
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 09:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=gWGJKo5x; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjH4V52lMzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 09:26:18 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id a15so5822613ljk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eoc+5mie1+ZuNTuaPcGzSI2qJ6owz7A4Ofr10ghZJJ4=;
 b=gWGJKo5xiJNWPTtwqGkQlOlOwg3GjNMHWAbbLf6G2umLeN+ziH7HLU4o7mqfu6xrQX
 0nqy/1qDWFPlTHlbUl4hIrosGA73uytx27UrMGezo0ol7EOlqSXT8KqCo6mWmcDs1cwA
 at576v5S6IW6A1SwuGUswjPYeT1mwL3S6Pfko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eoc+5mie1+ZuNTuaPcGzSI2qJ6owz7A4Ofr10ghZJJ4=;
 b=W9hGrOtK2w1LaWyBzvJt+PHktiGdfWA7+VvgGoSs7uO+Gr6wf2XyPyT4cvrXNNxDFU
 uf7fekPwPIAM4SakO83GlFx+cGBEZJLDAs9MbKXUlMm1orWassCqjHt1Jb5nSxvA/4wE
 wS2tsGC9TpJMKSA395uNUgcWAZC7MqFWWdeiG1eo5ph4uu7mZ5knY5/tAVECJL1AZpxu
 tE9dO4phr5ntLH3Ua6nOeuZ4KaHsJ76RoHtw1WkhFF2xQifoJEXrFMq9VtxSJeIP9AtK
 4aNjGJbnPQQ/FKnD3rF4OJyKSG0G7JhKDz/EhQOPuLliNEG9zckMiYvYWpxLu9I4RB77
 KQVQ==
X-Gm-Message-State: AOAM5310GiiWFtPY9AatNz4fNicO5PKHWbAn2b3HnGVCX2ug576H/zUH
 HyisTKIkVQ4+9/Hm+qbdAYdEtZPO1/ufiA==
X-Google-Smtp-Source: ABdhPJwggO17z7Xfzf0SYlT1zM7YCf2AMTnsr6OcVHjVAzjT4VsGxssVLM58CrjaS4dVgbd6AQ27dQ==
X-Received: by 2002:a2e:8193:: with SMTP id e19mr2663305ljg.80.1599175572693; 
 Thu, 03 Sep 2020 16:26:12 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id t5sm881761ljg.111.2020.09.03.16.26.10
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 16:26:11 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id z19so2862489lfr.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 16:26:10 -0700 (PDT)
X-Received: by 2002:a19:4a88:: with SMTP id x130mr2429205lfa.31.1599175570612; 
 Thu, 03 Sep 2020 16:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-13-hch@lst.de>
 <9ab40244a2164f7db2ff0c1d23ab59a0@AcuMS.aculab.com>
In-Reply-To: <9ab40244a2164f7db2ff0c1d23ab59a0@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Sep 2020 16:25:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whDtnudkbZ8-hR8HiDE7zog0dv+Gu9Sx5i6SPakrDtajQ@mail.gmail.com>
Message-ID: <CAHk-=whDtnudkbZ8-hR8HiDE7zog0dv+Gu9Sx5i6SPakrDtajQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] x86: remove address space overrides using set_fs()
To: David Laight <David.Laight@aculab.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 3, 2020 at 2:30 PM David Laight <David.Laight@aculab.com> wrote:
>
> A non-canonical (is that the right term) address between the highest
> valid user address and the lowest valid kernel address (7ffe to fffe?)
> will fault anyway.

Yes.

But we actually warn against that fault, because it's been a good way
to catch places that didn't use the proper "access_ok()" pattern.

See ex_handler_uaccess() and the

        WARN_ONCE(trapnr == X86_TRAP_GP, "General protection fault in
user access. Non-canonical address?");

warning. It's been good for randomized testing - a missing range check
on a user address will often hit this.

Of course, you should never see it in real life (and hopefully not in
testing either any more). But belt-and-suspenders..

              Linus
