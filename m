Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8721F8FE7C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:29:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=i0bJgvUi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw4t75427z3flp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 23:29:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=i0bJgvUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw4sN2LXdz3dKd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 23:28:19 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Vw4s56fxZz9spj;
	Thu,  6 Jun 2024 15:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1717680489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dtvu1UlIWg/CyjYI2WZ3p7cEYopcAzSKORkCKBmMBE=;
	b=i0bJgvUiVSAuNlq7G+F3qiJ2RCcDOW+mdGSowdG2MqgvDHwHkCLQnkYGV5Q2n6jwrq9hJw
	skdkUhlSDga/AEtoR/2cpS2pR9r8ZSPMfPWXW19zQqCe5wXu9a+R127RISLZEPznrF2HUh
	k6l65Z+RCds3VgmhJacG8zCZ571hX2ucyLEKDERxTX2BL3uI2IlITzL7rmmoCV9RymvMmy
	NSoWOHp/as8gVr00+ZaCju0beiLCdxGWbgEKhVYG0Iluav0T6OJkZzlohyotQPT6sv9Dka
	YWe3K1sDsE+j8XVtcMMoe7b6Nu36agmI1kVYbL8ph0d/zb0lWVJexA2qzehFFQ==
Date: Thu, 6 Jun 2024 15:28:02 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Yosry Ahmed <yosryahmed@google.com>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240606152802.28a38817@yea>
In-Reply-To: <CAJD7tkai+e39hFDJkQRZ_Zg_Yp8OWx2uQfawT28ZZTD=Jvh9EQ@mail.gmail.com>
References: <20240508202111.768b7a4d@yea>
	<CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
	<20240602200332.3e531ff1@yea>
	<20240604001304.5420284f@yea>
	<CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
	<20240604134458.3ae4396a@yea>
	<CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
	<CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
	<CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
	<CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
	<CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
	<20240604231019.18e2f373@yea>
	<CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
	<20240606010431.2b33318c@yea>
	<CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
	<CAOUHufZ8BTTx1LoXHjHGnzJE9dzyv8EnvhpXMUm0NOt=P5KHVg@mail.gmail.com>
	<CAJD7tkai+e39hFDJkQRZ_Zg_Yp8OWx2uQfawT28ZZTD=Jvh9EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: 9cdrbmmzzim9aobuo91px9dgth17d51n
X-MBO-RS-ID: efa5f4499ea98264111
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

On Wed, 5 Jun 2024 16:58:11 -0700
Yosry Ahmed <yosryahmed@google.com> wrote:

> On Wed, Jun 5, 2024 at 4:53=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Wed, Jun 5, 2024 at 5:42=E2=80=AFPM Yosry Ahmed <yosryahmed@google.c=
om> wrote: =20
> > >
> > > On Wed, Jun 5, 2024 at 4:04=E2=80=AFPM Erhard Furtner <erhard_f@mailb=
ox.org> wrote: =20
> > > >
> > > > On Tue, 4 Jun 2024 20:03:27 -0700
> > > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > > > =20
> > > > > Could you check if the attached patch helps? It basically changes=
 the
> > > > > number of zpools from 32 to min(32, nr_cpus). =20
> > > >
> > > > Thanks! The patch does not fix the issue but it helps.
> > > >
> > > > Means I still get to see the 'kswapd0: page allocation failure' in =
the dmesg, a 'stress-ng-vm: page allocation failure' later on, another kswa=
pd0 error later on, etc. _but_ the machine keeps running the workload, stay=
s usable via VNC and I get no hard crash any longer.
> > > >
> > > > Without patch kswapd0 error and hard crash (need to power-cycle) <3=
min. With patch several kswapd0 errors but running for 2 hrs now. I double =
checked this to be sure. =20
> > >
> > > Thanks for trying this out. This is interesting, so even two zpools is
> > > too much fragmentation for your use case. =20
> >
> > Now I'm a little bit skeptical that the problem is due to fragmentation.
> > =20
> > > I think there are multiple ways to go forward here:
> > > (a) Make the number of zpools a config option, leave the default as
> > > 32, but allow special use cases to set it to 1 or similar. This is
> > > probably not preferable because it is not clear to users how to set
> > > it, but the idea is that no one will have to set it except special use
> > > cases such as Erhard's (who will want to set it to 1 in this case).
> > >
> > > (b) Make the number of zpools scale linearly with the number of CPUs.
> > > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > > approach is that with a large number of CPUs, too many zpools will
> > > start having diminishing returns. Fragmentation will keep increasing,
> > > while the scalability/concurrency gains will diminish.
> > >
> > > (c) Make the number of zpools scale logarithmically with the number of
> > > CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> > > of zpools from increasing too much and close to the status quo. The
> > > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > > will actually give a nr_zpools > nr_cpus. So we will need to come up
> > > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> > >
> > > (d) Make the number of zpools scale linearly with memory. This makes
> > > more sense than scaling with CPUs because increasing the number of
> > > zpools increases fragmentation, so it makes sense to limit it by the
> > > available memory. This is also more consistent with other magic
> > > numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).
> > >
> > > The problem is that unlike zswap trees, the zswap pool is not
> > > connected to the swapfile size, so we don't have an indication for how
> > > much memory will be in the zswap pool. We can scale the number of
> > > zpools with the entire memory on the machine during boot, but this
> > > seems like it would be difficult to figure out, and will not take into
> > > consideration memory hotplugging and the zswap global limit changing.
> > >
> > > (e) A creative mix of the above.
> > >
> > > (f) Something else (probably simpler).
> > >
> > > I am personally leaning toward (c), but I want to hear the opinions of
> > > other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else? =20
> >
> > I double checked that commit and didn't find anything wrong. If we are
> > all in the mood of getting to the bottom, can we try using only 1
> > zpool while there are 2 available? I.e., =20
>=20
> Erhard, do you mind checking if Yu's diff below to use a single zpool
> fixes the problem completely? There is also an attached patch that
> does the same thing if this is easier to apply for you.

No, setting ZSWAP_NR_ZPOOLS to 1 does not fix the problem unfortunately (th=
at being the only patch applied on v6.10-rc2).

Trying to alter the lowmem and virtual mem limits next as Michael suggested.

Regards,
Erhard
