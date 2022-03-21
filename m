Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768C4E2302
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 10:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMTQm0hzXz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 20:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jbpPCrVn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=jbpPCrVn; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMTQ72fphz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 20:11:41 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B54EA5C0102;
 Mon, 21 Mar 2022 05:11:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Mar 2022 05:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EaBaoXYAR6b4616S4
 HVTs+O1Fjylx01QZh1cTzPU21s=; b=jbpPCrVncbBcY4X+FwPZg82jyiQkUUmmf
 1WzAI21dnNO6ghSDonK7FYMnahrJ+UiY01HHnoF1QiRq8D5lC5N02m2M5rIyf/Ay
 Kb36Oo618zk7x5ZGXbMYbNTyOB0O6tUpPu94lU/4kXMftRaBUe1gD8764Jgz59IG
 i1O/v1rpQYHj9g294BKOAL6gJSN/qu+Y/i8dq2568X5WqxpM85/i66xp5Fm55WC2
 iRW4qhMQ73WsSqY+HJlYHa2SQ6nA4tVwH8kCxcMBGoK7lWylsAGH/AoLPSA6oFzf
 3RV9df8ZN+N8+hnZgcb1l9ItpLDAIjNjxCRYJkQRSqO9OsOHU8pVA==
X-ME-Sender: <xms:S0E4YuUc06YA_sE-ekyolfXUyDsCW0Mpo-74-ZHXuEKsE-OPBTFHnA>
 <xme:S0E4Yqkn6zSeMr0qeGAoolvWxe-ghz57YvbmLteVjh9aegH5Pmx162AnnL4zTdf8m
 _xUtT97qkaXxYeDEy8>
X-ME-Received: <xmr:S0E4YiYR7uL2CLnV2t4TL9EADRQv11LPuEjs8DWZfPJf4QHTmgEBqNiczum4B6wVypoRxcWe2ZesR6seY3NKFlMsCYeUQpM3FIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:S0E4YlXdsIqRWw6y11QDsxECnFnCnsysxwZ9OsQ1t5Znfgq6PXM8Aw>
 <xmx:S0E4YolfyPDTrTwsQQpqDOJDCSVtq3GgIUBs-9u6NGjNh7Zbqh2hWw>
 <xmx:S0E4YqdfWOxnfVYEFb64rfxNimM9thv5i-lmGrlFE_jgmHhZLQRyDQ>
 <xmx:S0E4Ytx0wh9jx2g3BESC2GZBoyiF5NFxEjK3tcx-6wa5dsfRvDn4xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 05:11:37 -0400 (EDT)
Date: Mon, 21 Mar 2022 20:11:47 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
In-Reply-To: <073c34e0-a016-cf70-1deb-be286da94bde@csgroup.eu>
Message-ID: <b6d69a6-9e17-d370-a1cd-8f51204ea5d@linux-m68k.org>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
 <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
 <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
 <7b16264-dfef-414-8195-87c14a89fb40@linux-m68k.org>
 <073c34e0-a016-cf70-1deb-be286da94bde@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-918512666-1647853907=:7891"
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

---1463811774-918512666-1647853907=:7891
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Mar 2022, Christophe Leroy wrote:

> Le 21/03/2022 =C3=A0 09:50, Finn Thain a =C3=A9crit=C2=A0:
> > Hi Christophe,
> >=20
> > On Mon, 21 Mar 2022, Finn Thain wrote:
> >=20
> >> On Mon, 21 Mar 2022, Christophe Leroy wrote:
> >>
> >>> Le 19/03/2022 =C3=A0 08:20, Finn Thain a =C3=A9crit=C2=A0:
> >>>> drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show'=
 defined but not used [-Wunused-function]
> >>>>    static int pmu_battery_proc_show(struct seq_file *m, void *v)
> >>>>               ^~~~~~~~~~~~~~~~~~~~~
> >>>> drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show=
' defined but not used [-Wunused-function]
> >>>>    static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
> >>>>               ^~~~~~~~~~~~~~~~~~~~~~
> >>>> drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' de=
fined but not used [-Wunused-function]
> >>>>    static int pmu_info_proc_show(struct seq_file *m, void *v)
> >>>>               ^~~~~~~~~~~~~~~~~~
> >>>>
> >>>> Rearrange some code and add some #ifdefs to avoid unused code warnin=
gs
> >>>> when CONFIG_PROC_FS is disabled.
> >>>
> >>> Why not just put those three functions inside an #ifdef CONFIG_PROC_F=
S ?
> >>>
> >>
> >> You'd get a warning about the prototypes ("declared static but never
> >> defined"). Rather than add an ifdef around the prototypes as well, I
> >> just reordered things a little.
> >=20
> > Oops, I was forgetting that I also added an ifdef around the new
> > prototype.
> >=20
> > The simplest solution is probably the patch below, as it better exploit=
s
> > the stubbed-out proc_* API in include/linux/proc_fs.h.
> >=20
> > Was this what you had in mind?
>=20
> Yes that's exactly what I had in mind.
>=20

OK, I'll submit it formally.

Thanks for your review.
---1463811774-918512666-1647853907=:7891--
