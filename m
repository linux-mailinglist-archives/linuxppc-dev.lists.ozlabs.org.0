Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2114E22FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 10:10:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMTNM09HBz3bM7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 20:10:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cm73Pm1X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Cm73Pm1X; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMTMl5VQPz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 20:09:38 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D62EF5C0138;
 Mon, 21 Mar 2022 05:09:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Mar 2022 05:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vLQoGvnOQD745HIMF
 MEs9b1qZOatFwmieO2cnH7aQaI=; b=Cm73Pm1Xv/F0UYdtHNikVMhK8vhOsmpwd
 /2OvkDZQUmn6Lm9d6P/oo4hInRoaYaSw6Qg2SQjNkCt195I5KuAitCb6QnXDIH4U
 sV667bI5sq5HyaKJgJHeNVL+OiQSTkaKwwmuWJHnZjxEGJyQms+z/rr9pKcb25N8
 PktISjFDulu96x5BCx1lmRrM0wSoGOQQdQktPTnA7uYpm7d0O/5U236dT27qM/PA
 c4MiihExwtaY8qKEbkT4iLqW0VPodAtax3AGlJoHCArXQFnAXAnGcPU737XACCZY
 tKiQ46bQwXzlDdP/e5FJbzyYtl3RytPC92KK0n+PmPFscP6m+TlbQ==
X-ME-Sender: <xms:0EA4YmKRXrmHeRPsFbJ2fYFAMZJ-GAWlQvxpYbzfmgnP3Ot2MQgI-Q>
 <xme:0EA4YuIOMC4_dGvNiGN0thkqZlSgykxgLXUEGaRnkByKoix8UB4viUXz5WBB8cAvW
 FS2SmySgvOE9vvK5Uo>
X-ME-Received: <xmr:0EA4Ymu6jYPWN7xC4eYsHKckTXMWOjjBPFLH5nvFIFKNHBsAcOR7XZLTve0JJ-y5gB4fW2KBzTkL1LpoN33D4QLNWE_JUklvoyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:0EA4YrbtW0KCVJ9YjbtW7OGYG-wte9qP7hLVDT7sJJV5Q1-IVuZyVw>
 <xmx:0EA4YtZ-wQzu8Vl_wq2YZszM-n9peTt1YwWRxyxzneARJLXF98McQg>
 <xmx:0EA4YnDhhUhRByYe-MR8Fs2L335a0Vkv8CZOAlVSFmnPIoWPOOq7kA>
 <xmx:0EA4YhEFH4uiYbRLKnNg9CWYpSoqabN2XlN7i5qgNx0GaGDKrChEDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 05:09:33 -0400 (EDT)
Date: Mon, 21 Mar 2022 20:09:40 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
In-Reply-To: <CAMuHMdXqzWo1+gAfEjOQEZHeprbPEzWyCaUqLKx0_4nrDG+5Uw@mail.gmail.com>
Message-ID: <d2469ece-a241-015-377e-31cf46d581b@linux-m68k.org>
References: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
 <5291a177-9a67-b23a-515f-7faa3cc887e8@csgroup.eu>
 <e8398356-8ba3-e9de-8da0-3591907340b5@linux-m68k.org>
 <CAMuHMdXqzWo1+gAfEjOQEZHeprbPEzWyCaUqLKx0_4nrDG+5Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-1515361155-1647853780=:7587"
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1515361155-1647853780=:7587
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Mar 2022, Geert Uytterhoeven wrote:

> On Mon, Mar 21, 2022 at 9:29 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > On Mon, 21 Mar 2022, Christophe Leroy wrote:
> > > Le 21/03/2022 =C3=A0 05:30, Finn Thain a =C3=A9crit :
> > > > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> > > > via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> > > > via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> > > > via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> > > > via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> > > > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init'=
:
> > > > via-pmu-event.c:(.init.text+0x20): undefined reference to `input_al=
locate_device'
> > > > via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_re=
gister_device'
> > > > via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_fr=
ee_device'
> > > > make[1]: *** [Makefile:1155: vmlinux] Error 1
> > > > make: *** [Makefile:350: __build_one_by_one] Error 2
> > > >
> > > > Don't call into the input subsystem unless CONFIG_INPUT is built-in=
=2E
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Cc: Randy Dunlap <rdunlap@infradead.org>
> > > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > > ---
> > > > This is equivalent to the patch I sent a couple of days ago. This o=
ne
> > > > is slightly longer and adds a new symbol so that Kconfig logic can =
been
> > > > used instead of Makefile logic in case reviewers prefer that.
> > > > ---
> > > >   drivers/macintosh/Kconfig   | 5 +++++
> > > >   drivers/macintosh/Makefile  | 3 ++-
> > > >   drivers/macintosh/via-pmu.c | 2 ++
> > > >   3 files changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> > > > index 5cdc361da37c..b9102f051bbb 100644
> > > > --- a/drivers/macintosh/Kconfig
> > > > +++ b/drivers/macintosh/Kconfig
> > > > @@ -67,6 +67,11 @@ config ADB_PMU
> > > >       this device; you should do so if your machine is one of those
> > > >       mentioned above.
> > > >
> > > > +config ADB_PMU_EVENT
> > > > +   bool
> > > > +   depends on ADB_PMU && INPUT=3Dy
> > > > +   default y
> > >
> > > Could be reduced to
> > >
> > > config ADB_PMU_EVENT
> > >       def_bool y if ADB_PMU && INPUT=3Dy
> >
> > That's great but my question remains unanswered: why the aversion to
> > conditionals in Makefiles, when that would be simpler (no new symbol)?
>=20
> While conditionals in Makefiles do exist, they are far less common,=20

Perhaps the Kconfig solution is more common. I did look for it but didn't=
=20
find it in recent commits. Maybe I didn't look hard enough. Mostly I see=20
invisible Kconfig getting used for things that are hard to do in any=20
simpler way.

> and can be confusing.

Kconfig can be confusing too. I don't think your approach reduces=20
complexity, I think it increases it.

> They're also harder to grep for.
> E.g. "git grep via-pmu-event.o" after your alternative patch would
> give:
>=20
>     obj-$(CONFIG_ADB_PMU)          +=3D via-pmu-event.o
>=20
> but would miss the important surrounding part:
>=20
>     ifeq ($(CONFIG_INPUT), y)
>     obj-$(CONFIG_ADB_PMU)          +=3D via-pmu-event.o
>     endif
>=20
> Keeping configuration logic in a single place (the Kconfig file)
> avoids that.  The extra symbol is invisible, so it doesn't hurt much.
>=20

The same argument applies to Kconfig. "git grep CONFIG_ADB_PMU_EVENT"=20
doesn't even mention drivers/macintosh/Kconfig.

If you do "git grep ADB_PMU_EVENT" you get:
=09drivers/macintosh/Kconfig:config ADB_PMU_EVENT
with no mention of the "important surrounding part" that you were=20
concerned about:
=09config ADB_PMU_EVENT
        =09def_bool y if ADB_PMU && INPUT=3Dy

Anyway, we don't have to debate this, as drivers/macintosh already has a=20
maintainer who can decide the question. Both patches are available.
---1463811774-1515361155-1647853780=:7587--
