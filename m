Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B763E9DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN5bf5DNjz3bfP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=benboeckel.net header.i=@benboeckel.net header.a=rsa-sha256 header.s=fm1 header.b=k1flX33X;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F3i2JKvW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=benboeckel.net (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=me@benboeckel.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=benboeckel.net header.i=@benboeckel.net header.a=rsa-sha256 header.s=fm1 header.b=k1flX33X;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=F3i2JKvW;
	dkim-atps=neutral
X-Greylist: delayed 576 seconds by postgrey-1.36 at boromir; Thu, 01 Dec 2022 14:55:52 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN2L016YMz30R8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 14:55:52 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C7DF5C00C1;
	Wed, 30 Nov 2022 22:46:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 30 Nov 2022 22:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1669866370; x=1669952770; bh=IE
	SJHOtcUSkXCEqZm4KWkM9Tzwy8cx/dN5nGJgfkLqE=; b=k1flX33XzZRRIa3rZE
	tsZ4vckUNst/LFgq6QK7J5TfgGd0DnaNrZ/KihsGoNY5jvS7ZMGOsVHFuex2uZex
	6U/Zs/3pEQPGz/Rzy7MTuFSkW4QOb1Kso+XXy1R52xqcv4ZKFk+yzBHtzgP2NzYN
	NQ3f3aCDJCYpKKTe5ogNBvcuUKg3duL7IkC1mJWcMgKebpdg/CdOO496dwjQMe24
	ctLKE7SlSZWWTBsC5FZ8gWMWrOth45SD+cPUqyDJfE5xb7Hr+PWF4iF2UbwWYeuS
	4hiS5H2eNj3mmtV30vx1Zjo3325IUyumSfQH3RWKBMBH740l8vvkxZtEw0gDSVCm
	lviA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669866370; x=1669952770; bh=IESJHOtcUSkXCEqZm4KWkM9Tzwy8
	cx/dN5nGJgfkLqE=; b=F3i2JKvWwHf9O9SeM58LC+fDBrkr5Z1r3FReoTT05GhZ
	KtNFZkmdgyUlCJThjYgzyDjctMHRmTDb145k9/Zt6BiuC0MuZOyJs4MFMSLTQFNv
	0uU3JQpdO/5xZ9HHkLjkZ9KWgweSMcUKHGajlhIsq29uzv6jQpVgLa1XKQBXYqYF
	svXG4zMkm8NbHwB+2AgsYpeo6BfsvRdHpfu5Gvh6cEIDuaUoXpuLiOD1DwaMBhrV
	ReXnbXFIHtfDPMQLTPG8bhwXENWvBgjYQIu+GcyBmRsTCSWqbnqZLBMiWTXiNs5F
	9hmeWLA8bYC1/CNNyQvjgixT5SK5gD1FqJSCPpJ9VA==
X-ME-Sender: <xms:gSOIYzrtNsFK4azwOefuQEHzCsDdqZsiXfcEYmvodhbqD4L2hbYAZQ>
    <xme:gSOIY9o58-I4dkg5qGrsKMhcqrTqAvAYkiVt-ptVlF7V-e29pOcQdHHY60jJl1FJA
    di7DikeECYWZJyefOo>
X-ME-Received: <xmr:gSOIYwPW4X8BdSCu1hTAxWUhWznDwgFRNqb4jpR8sh7BDi6m057tmuCR4GDcDo5nY2gVyMQ8ItgSvK1TtKsoOGCWAPDanCIg1ORs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeffleegffevleekffekheeigfdtleeuvddtgffhtddvfefgjeehffduueevkedv
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
    essggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:giOIY249FoMgjmgBy8iZTsDxXHAdJ31kwUiqJGtMCZUaqFN-7i8sYg>
    <xmx:giOIYy7AVA08T-sADk_N2-1pcrE84kvyJJQw8VP4mZpWoqpG-Zjk4w>
    <xmx:giOIY-jDDWFaCqF27SV4S7jybNr1M2UxV1x4dNoEj4OeQfo4nNbmhw>
    <xmx:giOIY_y5Q_Fj--2gXXFj2JnWgr1NOE4A9ltKtUVJMmIr-OYJbRj1XQ>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 22:46:09 -0500 (EST)
Date: Wed, 30 Nov 2022 22:46:09 -0500
From: Ben Boeckel <me@benboeckel.net>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
Message-ID: <Y4gjgf2xHOYTVnSc@farprobe>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
 <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
 <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
 <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mailman-Approved-At: Thu, 01 Dec 2022 17:22:05 +1100
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org, keyrings@vger.kernel.org, Hannes Reinecke <hare@suse.de>, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 09:19:25 -0600, Greg Joyce wrote:
> On Wed, 2022-11-30 at 08:00 +0100, Hannes Reinecke wrote:
> > On 11/30/22 00:25, gjoyce@linux.vnet.ibm.com wrote:
> > > +	case OPAL_KEYRING:
> > > +		/* the key is in the keyring */
> > > +		ret = read_sed_opal_key(OPAL_AUTH_KEY, key->key,
> > > OPAL_KEY_MAX);
> > > +		if (ret > 0) {
> > > +			if (ret > 255) {
> > 
> > Why is a key longer than 255 an error?
> > If this is a requirement, why not move the check into
> > read_sed_opal_key() such that one only has to check for
> > ret < 0 on errors?
> 
> The check is done here because the SED Opal spec stipulates 255 as the
> maximum key length. The key length (key->key_len) in the existing data
> structures is __u8, so a length greater than 255 can not be conveyed.
> For defensive purposes, I though it best to check here.

Perhaps naming it `OPAL_MAX_KEY_LEN` would help clarify this?

--Ben
