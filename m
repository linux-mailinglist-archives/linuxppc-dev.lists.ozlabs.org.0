Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DE8FF2C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 18:43:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZaxqAONZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw9Bq4Dtkz3fqY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 02:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZaxqAONZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw9B55n68z3cmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 02:43:08 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3d1f493a9cdso679506b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717692181; x=1718296981; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJAGh2u2V4Tk6rAVOOJogH71dvDxba8eyU1Mqdojbzs=;
        b=ZaxqAONZwtOvuncumbZMys5cKp2Jc1Qithdm5YPTlSAx7OictYbERbvK6B017VDE1X
         rY6cgABL0sIPvsUl8b0xcz/jCXPuRR3hfu+yh8urKx+bNqU75NRvYKEpu2fb7AGvweXM
         EGk6y/plZxFcikDIr2cEbt2wtiAVJjFiAKxb2NzlxGj6P7yIfn60zUt9lMHrvgJQhjCJ
         UB1YcXeDz6dGNJbJps9QSQGKOWqNpK8CRQcAY2ryaCDks/XyMy84EZc0IMbgAnpj1gwG
         AnjZA5lKDmXHXu1d7q8oS54r4RVrecx5fKOT0PBnFg3C2ZvfkdChzwrStUUAjYgWaI0f
         9LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717692181; x=1718296981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJAGh2u2V4Tk6rAVOOJogH71dvDxba8eyU1Mqdojbzs=;
        b=hF9b8wr3OJRyYhSnqu97uyA+A/Ev34yeiq9a3ECYs7YvF3zk34N+4vpsuC4+jJ88vS
         LZ79K+UD0FByTM0+5S+vFlXOIQJELNidKOXTCOcyjOl0+SIZjQF6HEJmZSiNS2uL/ZAI
         z+klydNyhRvDg9DiJ+CZnfLyZrOCZFP2gAejhTPK/WekVfh62yBfuzeL5mviKMzq/PDI
         nixhl7ZPE01eLMqikRpy0Y6LiJWh4MlYh7zdEejmzXzAAQxlOj2LqkFYJcqPk8obOZHM
         KKTNFrBGFnaEWUdMS+vjo+H3fhAjR6rVSWV/9jRKQ7uJqDifN3Ao5gn7N+Pquyeh6QpG
         /sHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzIR+c2qjSQddC3AGS04wQxGQ8V1lxgwDQalv3RIHllzT/ny0t9c7H2e5bKQlxqfr6xQ7T3X62vCtSwZc1xwSS6gYblDVY/OaA9QzRVA==
X-Gm-Message-State: AOJu0YyRiPMUZFrFckm+V20LRzahVN50gj5+PYnj91eCFJAjiJc6wO6R
	q88kq4VKbCGJu9/y8zc6u/g0tBi76OgF4Cq+jcJAE4U/O51KKpcLh9fEtO6C8mEv7OS3zbfuSWq
	YjI2i/IiySHj+SRZtKLwzabEGdpV8jDtEIwth
X-Google-Smtp-Source: AGHT+IERasBuiqHdx/CCrfgVVuGNQ623zgMJ03/a4UqBThWZ9fbNc1TBReaGQpa20gK0M9sgOEpWNx7/XFo7+8WGkqg=
X-Received: by 2002:a54:448c:0:b0:3d2:368:9251 with SMTP id
 5614622812f47-3d2044e5e2bmr6367048b6e.38.1717692180748; Thu, 06 Jun 2024
 09:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea> <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea> <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <CAOUHufZ8BTTx1LoXHjHGnzJE9dzyv8EnvhpXMUm0NOt=P5KHVg@mail.gmail.com>
 <CAJD7tkai+e39hFDJkQRZ_Zg_Yp8OWx2uQfawT28ZZTD=Jvh9EQ@mail.gmail.com> <20240606152802.28a38817@yea>
In-Reply-To: <20240606152802.28a38817@yea>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 6 Jun 2024 09:42:21 -0700
Message-ID: <CAJD7tkbhHDLttSC8i93G2Sq3LtC_vh=rqOuh3PEjU=NrbNrABg@mail.gmail.com>
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

On Thu, Jun 6, 2024 at 6:28=E2=80=AFAM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Wed, 5 Jun 2024 16:58:11 -0700
> Yosry Ahmed <yosryahmed@google.com> wrote:
>
> > On Wed, Jun 5, 2024 at 4:53=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrot=
e:
> > >
> > > On Wed, Jun 5, 2024 at 5:42=E2=80=AFPM Yosry Ahmed <yosryahmed@google=
.com> wrote:
> > > >
> > > > On Wed, Jun 5, 2024 at 4:04=E2=80=AFPM Erhard Furtner <erhard_f@mai=
lbox.org> wrote:
> > > > >
> > > > > On Tue, 4 Jun 2024 20:03:27 -0700
> > > > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > > > >
> > > > > > Could you check if the attached patch helps? It basically chang=
es the
> > > > > > number of zpools from 32 to min(32, nr_cpus).
> > > > >
> > > > > Thanks! The patch does not fix the issue but it helps.
> > > > >
> > > > > Means I still get to see the 'kswapd0: page allocation failure' i=
n the dmesg, a 'stress-ng-vm: page allocation failure' later on, another ks=
wapd0 error later on, etc. _but_ the machine keeps running the workload, st=
ays usable via VNC and I get no hard crash any longer.
> > > > >
> > > > > Without patch kswapd0 error and hard crash (need to power-cycle) =
<3min. With patch several kswapd0 errors but running for 2 hrs now. I doubl=
e checked this to be sure.
> > > >
> > > > Thanks for trying this out. This is interesting, so even two zpools=
 is
> > > > too much fragmentation for your use case.
> > >
> > > Now I'm a little bit skeptical that the problem is due to fragmentati=
on.
> > >
> > > > I think there are multiple ways to go forward here:
> > > > (a) Make the number of zpools a config option, leave the default as
> > > > 32, but allow special use cases to set it to 1 or similar. This is
> > > > probably not preferable because it is not clear to users how to set
> > > > it, but the idea is that no one will have to set it except special =
use
> > > > cases such as Erhard's (who will want to set it to 1 in this case).
> > > >
> > > > (b) Make the number of zpools scale linearly with the number of CPU=
s.
> > > > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > > > approach is that with a large number of CPUs, too many zpools will
> > > > start having diminishing returns. Fragmentation will keep increasin=
g,
> > > > while the scalability/concurrency gains will diminish.
> > > >
> > > > (c) Make the number of zpools scale logarithmically with the number=
 of
> > > > CPUs. Maybe something like 4log2(nr_cpus). This will keep the numbe=
r
> > > > of zpools from increasing too much and close to the status quo. The
> > > > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > > > will actually give a nr_zpools > nr_cpus. So we will need to come u=
p
> > > > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> > > >
> > > > (d) Make the number of zpools scale linearly with memory. This make=
s
> > > > more sense than scaling with CPUs because increasing the number of
> > > > zpools increases fragmentation, so it makes sense to limit it by th=
e
> > > > available memory. This is also more consistent with other magic
> > > > numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).
> > > >
> > > > The problem is that unlike zswap trees, the zswap pool is not
> > > > connected to the swapfile size, so we don't have an indication for =
how
> > > > much memory will be in the zswap pool. We can scale the number of
> > > > zpools with the entire memory on the machine during boot, but this
> > > > seems like it would be difficult to figure out, and will not take i=
nto
> > > > consideration memory hotplugging and the zswap global limit changin=
g.
> > > >
> > > > (e) A creative mix of the above.
> > > >
> > > > (f) Something else (probably simpler).
> > > >
> > > > I am personally leaning toward (c), but I want to hear the opinions=
 of
> > > > other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else?
> > >
> > > I double checked that commit and didn't find anything wrong. If we ar=
e
> > > all in the mood of getting to the bottom, can we try using only 1
> > > zpool while there are 2 available? I.e.,
> >
> > Erhard, do you mind checking if Yu's diff below to use a single zpool
> > fixes the problem completely? There is also an attached patch that
> > does the same thing if this is easier to apply for you.
>
> No, setting ZSWAP_NR_ZPOOLS to 1 does not fix the problem unfortunately (=
that being the only patch applied on v6.10-rc2).

This confirms Yu's theory that the zpools fragmentation is not the
main reason for the problem. As Vlastimil said, the setup is already
tight on memory and that commit may have just pushed it over the edge.
Since setting ZSWAP_NR_ZPOOLS to 1 (which effectively reverts the
commit) does not help in v6.10-rc2, then something else that came
after the commit would have pushed it over the edge anyway.

>
> Trying to alter the lowmem and virtual mem limits next as Michael suggest=
ed.

I saw that this worked. So it seems like we don't need to worry about
the number of zpools, for now at least :)

Thanks for helping with the testing, and thanks to everyone else who
helped on this thread.

>
> Regards,
> Erhard
