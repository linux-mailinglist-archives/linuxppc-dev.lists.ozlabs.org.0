Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234F718F8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 02:31:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWnBL3yTRz3dwl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 10:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eUr9jxRG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=wout1-smtp.messagingengine.com (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eUr9jxRG;
	dkim-atps=neutral
X-Greylist: delayed 496 seconds by postgrey-1.36 at boromir; Thu, 01 Jun 2023 10:30:49 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWn9P5ZThz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 10:30:48 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D5E16320092F;
	Wed, 31 May 2023 20:22:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 31 May 2023 20:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685578944; x=1685665344; bh=lVTms7WrVNc9n
	PSJkBHh4FAzxIOS8ynj2PPYmPcYMzY=; b=eUr9jxRGNxLjBaHd53eZEw21tFkk+
	af+77+hX/XcwGswsZPN5LJVMtiQfZ84yW2kzEzV+aOMnqQNgrq161VEI25ZOmfJy
	94LGPRXXOW0l+hUGee75tJANC7tXothI9FFE8/h8acVtGhnufcRN3TXkHY+/HS++
	Q10C+Q7W4ZCba44xPUekbUYEsTNJSxT97UUcANPgYmpTUB/ecPUS1bzlFmENH+mR
	xEEzkoZr/rWvHydlU9m7BiNsQurjE53DM8JYp96vsRDPHNjh40QyaAybjgybxLhj
	ng8Du/6rEVFrXWfGt8+vYYN1EqCPK67Ahn9GJaGUQUZ5CniwJX11Erpew==
X-ME-Sender: <xms:v-R3ZH3O8f7f99rN2sxAytIP8N54JYjpkeQdqEPcrhN-BHz6Ybr_aA>
    <xme:v-R3ZGFVq9Xy45_Ol1zdNarNOCnxEdJaqu5D6QXOi-232OprEBSsJhj_2vBv-VNC8
    S1wyYsh6IxDDFbM8IQ>
X-ME-Received: <xmr:v-R3ZH7YdLO95N6oWPuh56UjxfaSMkFyodgvajTqF5XSjaIpb2BZQhAlSn1i-PT2k1QaJ7KlpBiaiU1IYG4f4bpSbzdeMsHYTC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeltddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:v-R3ZM3NTIAI1RDB3LPOvA14yEODQOmrcCbav_zw6P3I8nYqX-fpgw>
    <xmx:v-R3ZKGS2VzSBBGyxWt9ieBvdPP_8H6Ifjs37P5-TaZpfs4JaqdbCw>
    <xmx:v-R3ZN-wsk275sY5izl3SXtyK41ZnJKabgy3YrjCLb5_qvRGwVRt6Q>
    <xmx:wOR3ZGCzxvYXspHRKx9BqJG3RcWMS_gr3Ze23Qj2MpbvzSmfRXUlFg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 May 2023 20:22:20 -0400 (EDT)
Date: Thu, 1 Jun 2023 10:22:38 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc
 entry
In-Reply-To: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Message-ID: <f020b46c-f291-ad2f-6c4c-6bc79955e6f2@linux-m68k.org>
References: <20230531125023.1121060-1-mpe@ellerman.id.au> <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-394251797-1685578872=:27831"
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-394251797-1685578872=:27831
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 31 May 2023, Geert Uytterhoeven wrote:

> On Wed, May 31, 2023 at 2:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
=2Eau> wrote:
> > The powerpc section has a "F:" entry for drivers/macintosh, matching=20
> > all files in or below drivers/macintosh. That is correct for the most=
=20
> > part, but there are a couple of m68k-only drivers in the directory, so=
=20
> > exclude those.
> >
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>=20
> Thanks for your patch!
>=20
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
> >  S:     Odd Fixes
> >  F:     arch/powerpc/platforms/powermac/
> >  F:     drivers/macintosh/
> > +X:     drivers/macintosh/adb-iop.c
> > +X:     drivers/macintosh/via-macii.c
> >
> >  LINUX FOR POWERPC (32-BIT AND 64-BIT)
> >  M:     Michael Ellerman <mpe@ellerman.id.au>
>=20
> LGTM, as there are already entries for these two files under
> "M68K ON APPLE MACINTOSH".

Right. I should have addded those "X files" in commit 2ae92e8b9b7.

> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Which leads us to a related topic: Is Joshua still around?  Should Finn=
=20
> be added or replace Joshua in the "M68K ON APPLE MACINTOSH" entry?
>=20

CC Joshua.

If he's not around perhaps we'll see some bounces.

Anyway, I'd be willing to either share the M68K ON APPLE MACINTOSH role or=
=20
replace Joshua if he no longer wants that job.

But I hope he does still want it as there's always driver work to do.
---1463811774-394251797-1685578872=:27831--
