Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C114E2232
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:29:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSTm14lnz30Lq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MekULqoF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MekULqoF; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMST54N9zz3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:29:11 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D6865C01CC;
 Mon, 21 Mar 2022 04:29:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Mar 2022 04:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mJOoRUMYX3YmX13po
 9qoHQ56zhl3uYpuOoJWbXxYEFY=; b=MekULqoFVnQl1+cCRF8WdVEiPR4UQiA1v
 iwe8N8NXBsUHo/NGxe6+PrtWL9xPyZ9aelp3k3FZSWmL0VFQeDf2CIB9R8XLYmcK
 LAVakqRxrBTYXuuCFwpr/zGJ3RVq6zWhqwDJXpsEKjrdcJPn6mbBbHUcb/UiwVCZ
 TZv+6LRrDsuuhwC0sSPhyzboVBAR0z640It0iZuLlK50KWXblBxDaKUNLbOIgmVZ
 yqfgNg2zpEtW6seIq4i4CWknX/4daBGPFmLLGDCfmaTMhCnDTxqJ47UzJi9JBEsx
 Sz+Mq9AXxdzFfbkRifU2xs0SUe1njJNOGKQuJXJJN8b/E3DJ4OpGw==
X-ME-Sender: <xms:Ujc4Ys58J6p33yC3OE4CC8fIbr3phjWBN6TVNgfAeI5NeLhVPJ6jog>
 <xme:Ujc4Yt5Tz-bxaG5sSBmBIxduzMI1Xmg3wNLj35xlzw3bPwLTQnf6vlO4nx_Mcvhia
 5F_nruF7y_D1ASfyKg>
X-ME-Received: <xmr:Ujc4YreBqFeQ6y8vzQjVRMYl-Gc2K7kA6uNYf-ZWEV6Oi5sX-zwgd9CU6RZjozZ4N7Slugep2z8HbvrYlF1RFPsZZ8Sk0BW0y1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffh
 gfehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Ujc4YhIR4UJ85EMUEC8wyjlG4oCseuRfJMWZAni0cppdgXdNc6n9xw>
 <xmx:Ujc4YgI1BkS9zlHsEGdY4mpsWCBjsWj8ouUQnlCSbsxHHJLloK05LA>
 <xmx:Ujc4Yiz6AqWNYh51xGjJ6yYhSbCNngQcBG5Y6JarjE7UiQ46W2LUow>
 <xmx:Uzc4Yk35x4Apxk0Gh7N1bj5Qe5iy07pVLl1LyWD7KpfUlY1NFaJ-9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 04:29:05 -0400 (EDT)
Date: Mon, 21 Mar 2022 19:29:11 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
In-Reply-To: <5291a177-9a67-b23a-515f-7faa3cc887e8@csgroup.eu>
Message-ID: <e8398356-8ba3-e9de-8da0-3591907340b5@linux-m68k.org>
References: <d987663bbed18d7dbf106db6066a759040b4e57a.1647837028.git.fthain@linux-m68k.org>
 <5291a177-9a67-b23a-515f-7faa3cc887e8@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-1060938498-1647851351=:12278"
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1060938498-1647851351=:12278
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Mar 2022, Christophe Leroy wrote:

>=20
>=20
> Le 21/03/2022 =C3=A0 05:30, Finn Thain a =C3=A9crit=C2=A0:
> > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> > via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
> > via-pmu-event.c:(.init.text+0x20): undefined reference to `input_alloca=
te_device'
> > via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_regist=
er_device'
> > via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free_d=
evice'
> > make[1]: *** [Makefile:1155: vmlinux] Error 1
> > make: *** [Makefile:350: __build_one_by_one] Error 2
> >=20
> > Don't call into the input subsystem unless CONFIG_INPUT is built-in.
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> > This is equivalent to the patch I sent a couple of days ago. This one
> > is slightly longer and adds a new symbol so that Kconfig logic can been
> > used instead of Makefile logic in case reviewers prefer that.
> > ---
> >   drivers/macintosh/Kconfig   | 5 +++++
> >   drivers/macintosh/Makefile  | 3 ++-
> >   drivers/macintosh/via-pmu.c | 2 ++
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> > index 5cdc361da37c..b9102f051bbb 100644
> > --- a/drivers/macintosh/Kconfig
> > +++ b/drivers/macintosh/Kconfig
> > @@ -67,6 +67,11 @@ config ADB_PMU
> >   =09  this device; you should do so if your machine is one of those
> >   =09  mentioned above.
> >  =20
> > +config ADB_PMU_EVENT
> > +=09bool
> > +=09depends on ADB_PMU && INPUT=3Dy
> > +=09default y
>=20
> Could be reduced to
>=20
> config ADB_PMU_EVENT
> =09def_bool y if ADB_PMU && INPUT=3Dy
>=20

That's great but my question remains unanswered: why the aversion to=20
conditionals in Makefiles, when that would be simpler (no new symbol)?
---1463811774-1060938498-1647851351=:12278--
