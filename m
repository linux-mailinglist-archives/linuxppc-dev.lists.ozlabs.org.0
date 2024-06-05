Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9036C8FDAC6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 01:42:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gqB1nvbr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvkXw4lLGz30WJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gqB1nvbr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvkX76gDxz30Vc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 09:42:15 +1000 (AEST)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-804c45a47b6so126494241.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717630931; x=1718235731; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fURZ+GlEwn1DW8Z6q3RkvHuwBmyZjfx8HFK5EMb98t4=;
        b=gqB1nvbrGz4yVTv1niyEhdBndTQpum+dyKCUiEPXI7ECsjRHbP6wED+JhnNv/zm8o8
         qWGupkFAa9OzrSPZ/IR3BXZH+2gE8/HOGXelt4knI1c5RxxEJSqjuUbnmcyHuS8sxNoR
         8PzVHj13CpK81l26ns3c+hZAdHScpI5qKxmFKSrdb79QkSTFehGefrQeyCLx1Z2H23n0
         mcsqHv2L9Ce6V+rlgGk+u6l5g9MvAw7zSBkkiCbpfQM0dc7Nzgggjw6YFkNdi06tnXuT
         Vu3W8tI8Gnn/KWfSq3Xx5JwLAYG2TX1uc2wHwbuT7/GnYafKIZ+zzDpWkmCrDj7kU0r8
         Ti3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717630931; x=1718235731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fURZ+GlEwn1DW8Z6q3RkvHuwBmyZjfx8HFK5EMb98t4=;
        b=Qiq047Q+G8UWDmA62IOY6RHS17jspuHp8wGmcTOYm8/bNpVrI3LPIil1aswpZezZow
         po6Tn7mibsUs7LPFIHxj05qqtXDPGS2bpwFMXsg1eCVE4M0wjOSSA/+JDew30P8NH3xW
         8e8zVGG2CjmIFsSvnDUUqjOuOf66E5fRMORq9TC+1r5dDEFNQcdTkkivEC6icT7VNOw9
         b2RoB5DiJoXpUJ6WDWs79td7KEBQjICdPeEX0Ej8tqVkuhXeHjCD9ILdfSVzTw8C/r1e
         xrtbjGII54BLiIyC+F4BY7q3u4g0JNT3V6TerJIdpFI6XU3yAyFJb2F949kkgzhxLXWI
         mxUA==
X-Forwarded-Encrypted: i=1; AJvYcCWoX6Xq/sBJdrNSqikRJTX1avogaridT98B2m0nIP3HSq+RcZbGfUkcT2n++BEfSyGUxdMkh9/If8D4ZJMGyuAK6vMrLybAdhauRyArww==
X-Gm-Message-State: AOJu0YywPAyjU6YQ3LloH1LW2L1UgUaJJ8C3DD/XJtJlkGGBa0lLBsT9
	tuPaNWqC4OPLNPf9Xv7CBSgACvzso/JfQpr0iNUTPocRBGPmI8M9q9wkJmgdegwKlhNgMCMJpmP
	0HNIGoDsKZzi0chI9pjhECQNMbWqUUZCv6GRg
X-Google-Smtp-Source: AGHT+IHB5vbuYgoHzyE4VqkkyenDd0XtXJRfmN4AlQZzBmVBqpqyc1bRUTgyVv8nXskKAUiYew/UvTVdsYWeXMBGKpQ=
X-Received: by 2002:a05:6102:5089:b0:47f:40f7:2b5f with SMTP id
 ada2fe7eead31-48c047f4db6mr5870916137.5.1717630930642; Wed, 05 Jun 2024
 16:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea> <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
In-Reply-To: <20240606010431.2b33318c@yea>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 5 Jun 2024 16:41:31 -0700
Message-ID: <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
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
Cc: Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 5, 2024 at 4:04=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Tue, 4 Jun 2024 20:03:27 -0700
> Yosry Ahmed <yosryahmed@google.com> wrote:
>
> > Could you check if the attached patch helps? It basically changes the
> > number of zpools from 32 to min(32, nr_cpus).
>
> Thanks! The patch does not fix the issue but it helps.
>
> Means I still get to see the 'kswapd0: page allocation failure' in the dm=
esg, a 'stress-ng-vm: page allocation failure' later on, another kswapd0 er=
ror later on, etc. _but_ the machine keeps running the workload, stays usab=
le via VNC and I get no hard crash any longer.
>
> Without patch kswapd0 error and hard crash (need to power-cycle) <3min. W=
ith patch several kswapd0 errors but running for 2 hrs now. I double checke=
d this to be sure.

Thanks for trying this out. This is interesting, so even two zpools is
too much fragmentation for your use case.

I think there are multiple ways to go forward here:
(a) Make the number of zpools a config option, leave the default as
32, but allow special use cases to set it to 1 or similar. This is
probably not preferable because it is not clear to users how to set
it, but the idea is that no one will have to set it except special use
cases such as Erhard's (who will want to set it to 1 in this case).

(b) Make the number of zpools scale linearly with the number of CPUs.
Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
approach is that with a large number of CPUs, too many zpools will
start having diminishing returns. Fragmentation will keep increasing,
while the scalability/concurrency gains will diminish.

(c) Make the number of zpools scale logarithmically with the number of
CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
of zpools from increasing too much and close to the status quo. The
problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
will actually give a nr_zpools > nr_cpus. So we will need to come up
with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).

(d) Make the number of zpools scale linearly with memory. This makes
more sense than scaling with CPUs because increasing the number of
zpools increases fragmentation, so it makes sense to limit it by the
available memory. This is also more consistent with other magic
numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).

The problem is that unlike zswap trees, the zswap pool is not
connected to the swapfile size, so we don't have an indication for how
much memory will be in the zswap pool. We can scale the number of
zpools with the entire memory on the machine during boot, but this
seems like it would be difficult to figure out, and will not take into
consideration memory hotplugging and the zswap global limit changing.

(e) A creative mix of the above.

(f) Something else (probably simpler).

I am personally leaning toward (c), but I want to hear the opinions of
other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else?

In the long-term, I think we may want to address the lock contention
in zsmalloc itself instead of zswap spawning multiple zpools.

>
> The patch did not apply cleanly on v6.9.3 so I applied it on v6.10-rc2. d=
mesg of the current v6.10-rc2 run attached.
>
> Regards,
> Erhard
