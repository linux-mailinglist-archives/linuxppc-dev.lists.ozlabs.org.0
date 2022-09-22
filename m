Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737355E5C87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 09:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY6Xz2fwJz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 17:36:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256 header.s=fm2 header.b=myRn0aul;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FnZ2BBMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cerno.tech (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=maxime@cerno.tech; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256 header.s=fm2 header.b=myRn0aul;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FnZ2BBMO;
	dkim-atps=neutral
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir; Thu, 22 Sep 2022 17:35:53 AEST
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY6X955vcz2yy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 17:35:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id 24F312B059F9;
	Thu, 22 Sep 2022 03:28:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 22 Sep 2022 03:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663831688; x=1663838888; bh=9+zOvyfksA
	251WIvkjW/QnZqpctASy/cR3TjFBEJGn4=; b=myRn0aulDM5L8tUe4fqe/7J45i
	cY8+5osPo0QVR1EZ5vaKIa8eIQEXqx9xuKq0tcPPxSbDBw3YRF2yKYnw9O6+rmmP
	4FSXKJpcR3qYtO7EWbFTTRGMHKAe9GoDA5+FipV5o/S3mO6S+D2Qon5yQTz4WSVc
	wkcXDb9X0ZZiJCzKxV0he4afcH8W42gcIIeclRFnw92WqitEzttwe2NcBIthViqj
	PpefGZdUiNJDHxE325/XpnqToQZAt7vmsqPOQFa8pdaoZHNfBDYWdtZtJJ6c4EpL
	rwdc3GDFbnvaEdbhoyF5gOzRSZi1VGGo/YLPRUzy+JFzjbTqmBX9L9cXwpjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663831688; x=1663838888; bh=9+zOvyfksA251WIvkjW/QnZqpctA
	Sy/cR3TjFBEJGn4=; b=FnZ2BBMO+1CCzdG1QUm+LdR4chFNDH+nhivWP82ell21
	IU7Lb0gS795PvwovSwnXMJdvn9yXs5e9/VseeJ8FQDB0y46qHnq9cDV8VHTVM4bq
	cnbb45kxvGQZvfoS7zPgtwKZnP+ESOKeRG62jeyyEvzvQR0YQjSCH1XO2dcFrkFp
	mUQhmniZr3b48fotFRqqidDxipWW4eHk/zKIwPPpmPoTA686kZ68xZU/cN26Joic
	KVtoUDlw60de6NOf1e8lTg3wkPVwMLrHnZ8cxUZVgo2M8jKR+qT9dcPNwZ2lXo2f
	7ZBzw09GimHZx3wfrhfdsfqWbuFa1QF2UdZuB5nCjw==
X-ME-Sender: <xms:hg4sY1AkevPWD9JVRhSJriAUugw6vlHVel773lEsld0tABsxGN1RKw>
    <xme:hg4sYzhyV4nDTt_vlTfrlj8bQlSj9wj3dskde5TjZYdA_DTXceY11y4Civbbobx4p
    HHvQUKF5PsXKgBOUc4>
X-ME-Received: <xmr:hg4sYwlK2t3qQEHHaOnlf-9fNsc37C-A_uGDLfkRYWi5GNi-XoBE6prZiH9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hg4sY_wHpefOELoyJiOWz2e17nsG3beLnWJ2ycO0usxrsJL8kddQbg>
    <xmx:hg4sY6SSBAez_cvFkCNIQWDF1lTt_wjT197-iOq3t2JEvAlwhy-nkQ>
    <xmx:hg4sYyZkyADq8xcZezHVUL_fNXt68MGNYB3B62YcNnHyhv-UApoaaQ>
    <xmx:iA4sY9-s0jEl4Am3LvHFgY4Isxu0FyS01rbp4j-p-BnFYgG2U46RoPypG_k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 03:28:05 -0400 (EDT)
Date: Thu, 22 Sep 2022 09:28:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
Message-ID: <20220922072803.giqo6dhqktnyjncv@houat>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
 <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sg26q6ygbmxgpjm"
Content-Disposition: inline
In-Reply-To: <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>, daniel@ffwll.ch, paulus@samba.org, msuchanek@suse.de, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2sg26q6ygbmxgpjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 08:42:23AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 21.09.22 um 18:48 schrieb Geert Uytterhoeven:
> > Hi Thomas,
> >=20
> > On Wed, Sep 21, 2022 at 2:55 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> > > Am 05.08.22 um 02:19 schrieb Benjamin Herrenschmidt:
> > > > On Wed, 2022-07-20 at 16:27 +0200, Thomas Zimmermann wrote:
> > > > > +#if !defined(CONFIG_PPC)
> > > > > +static inline void out_8(void __iomem *addr, int val)
> > > > > +{ }
> > > > > +static inline void out_le32(void __iomem *addr, int val)
> > > > > +{ }
> > > > > +static inline unsigned int in_le32(const void __iomem *addr)
> > > > > +{
> > > > > +       return 0;
> > > > > +}
> > > > > +#endif
> > > >=20
> > > > These guys could just be replaced with readb/writel/readl respectiv=
ely
> > > > (beware of the argument swap).
> > >=20
> > > I only added them for COMPILE_TEST. There appears to be no portable
> > > interface that implements out_le32() and in_le32()?
> >=20
> > iowrite32() and ioread32()?
>=20
> Do they always use little endian, as these *_le32 helpers do? I though th=
ey
> use host byte order.

They use either outl or writel under the hood, which are always little-endi=
an

Maxime

--2sg26q6ygbmxgpjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYywOgwAKCRDj7w1vZxhR
xc9KAQCMr0zR6IAKUmzuCZlUwOV3XuBDcqbYhVsa28Oti2b1hgEA9jZk4RV7+p/W
TCyVh2a1nFK4iRcTGNsKIk6mmF08Owo=
=wGmI
-----END PGP SIGNATURE-----

--2sg26q6ygbmxgpjm--
