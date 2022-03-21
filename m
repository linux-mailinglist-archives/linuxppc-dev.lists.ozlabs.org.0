Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541034E2249
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:34:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSb314fLz3bVf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QPY3fFhy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=QPY3fFhy; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSZR3TlLz307B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:33:50 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A7505C0148;
 Mon, 21 Mar 2022 04:33:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Mar 2022 04:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VtZrK2QJiD142HH3e
 GmHXidaImy2Iw8OCXmGcQVUc68=; b=QPY3fFhy5BPpxmLoGrFk6WJorIKyixJor
 69vOYsoS8sXfCDN+02J5Y771+jowJidfQwr2ENoq2z78TL+7P717CetjPCJvDQ8T
 qKQcM20/dIxJHY2kYw5AE8Qu4azDD5A7EoFvkK6J2qq0EaUTGKaSVcenZc54gtzK
 Y7KgRDUcR/dCn+hXm2paWWcY1Rdc0VlHHvpE6F94jd4iMxn2RVT17rgPo03cyVLd
 B+E3LUo8GpzdduAOLC9a1BKgTUvVVS7oveVM0m20uCRjyKcYtTGKba+walTdKVBw
 d2TyQoN5KkYPOE+rI7//VIShPPBKIkvyqhDpHbOA6UQ+xLu7KYdsQ==
X-ME-Sender: <xms:bDg4YlIWvlY11pNN6C5YQpq9YkfPMWGbEqkE24kIA5Z6vZmstLZ8gQ>
 <xme:bDg4YhJJi65ZonIC1Roo10xa-o-9Ye3r8wDczuIhRxGjSUNazHajFKvfC1IC7OlWY
 oGC7QsupScIR4-hALI>
X-ME-Received: <xmr:bDg4Ytug7GTBFnwV3KiJCAwQUt87jNzkDABa8MUKD4j096A1XzTNi6Fq-3Ht5X021df26BVNdgGrrzZmilUHwcx1POdXfJvJ9Ac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffh
 gfehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:bDg4YmarDAoULOf4IE2EJh377O5zWgzcWqgeWJFynO8TfXFjrHO7mw>
 <xmx:bDg4YsZirls1e2q3o7Lxx3Sg78mXPniQQaJKJzSoSeHfq1pDEZglyg>
 <xmx:bDg4YqCObPnrhNwUdapayoyOR_dPwVoeX2ZPnJxxuq1XIfJeeGiBqQ>
 <xmx:bDg4YrnCPB4wnMmMWJFw1yr2VU2ve0PcMV4pG486hcvMPClzL0CUIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 04:33:46 -0400 (EDT)
Date: Mon, 21 Mar 2022 19:33:56 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
In-Reply-To: <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
Message-ID: <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
 <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-1870743231-1647851636=:12278"
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

---1463811774-1870743231-1647851636=:12278
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Mar 2022, Christophe Leroy wrote:

> Le 19/03/2022 =C3=A0 08:20, Finn Thain a =C3=A9crit=C2=A0:
> > drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show' de=
fined but not used [-Wunused-function]
> >   static int pmu_battery_proc_show(struct seq_file *m, void *v)
> >              ^~~~~~~~~~~~~~~~~~~~~
> > drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show' d=
efined but not used [-Wunused-function]
> >   static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
> >              ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' defin=
ed but not used [-Wunused-function]
> >   static int pmu_info_proc_show(struct seq_file *m, void *v)
> >              ^~~~~~~~~~~~~~~~~~
> >=20
> > Rearrange some code and add some #ifdefs to avoid unused code warnings
> > when CONFIG_PROC_FS is disabled.
>=20
> Why not just put those three functions inside an #ifdef CONFIG_PROC_FS ?
>=20

You'd get a warning about the prototypes ("declared static but never=20
defined"). Rather than add an ifdef around the prototypes as well, I just=
=20
reordered things a little.
---1463811774-1870743231-1647851636=:12278--
