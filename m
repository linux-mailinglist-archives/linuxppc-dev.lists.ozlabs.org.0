Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA328A257D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 07:12:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=IOdAEUyX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cL1BFCA9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG4Sk0fnQz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 15:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=IOdAEUyX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cL1BFCA9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=103.168.172.145; helo=fout2-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 86 seconds by postgrey-1.37 at boromir; Fri, 12 Apr 2024 15:11:55 AEST
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG4Rv0RDzz3dWw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 15:11:54 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id B625113802C7;
	Fri, 12 Apr 2024 01:10:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 12 Apr 2024 01:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712898623; x=1712985023; bh=VPZ7kJdh9c
	PLjRKHHVxTUf1hbUVmbHSA0q97FGn9WV4=; b=IOdAEUyXDYiVKbGbFZbRu/PbbL
	e9wo+0jyFCZ9E0FwrFEV7fGpZuT6VTGsRzJbPkxgtBjOxVVjMgQV7DwbR8adnEie
	8uHaYHFw1PSLu3YskQbjK98hH1QC+A+tL4MVQdbIVlN3TruepYUBRJHTfST0FKwX
	Q4B9l8R2ohw0QwPWr0l4GcjjeHD+X4j2+5GDuJjFL09X7hl4jGtcvUSKAULEn+iw
	sjmGVWowfpcwxPl1rF6AMNedtcU6763IGoVVornj1C3RFP7i3c1+LK0IDFhbR0jQ
	KQDDBHVQke6FtDF0+XlMiXhWxA0aeRsFe3TWBwJ5huDCB5I0IhHgzXACuDDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712898623; x=1712985023; bh=VPZ7kJdh9cPLjRKHHVxTUf1hbUVm
	bHSA0q97FGn9WV4=; b=cL1BFCA9FcaVisURAZlGYil167ZIhQ4h2RD4txuKqMo+
	63ybBfi53GlsHgLotvTUIhmt9MlLZyLaWuQcsp3ygvty3xqCNOmhpBIpETMd6SFK
	N7oAOvl9CbadpHh70uE9jaR+rN/NvxVPRRu0/wB0uia6D3cRZcpOTdV26ExKHIBX
	0lBnRicg2itzASOgORuJl4FiyTGSSogopIfoad8DMT1D8Xn+qVMFajQ953vjV1JK
	LSfOV/FI1RnYqZSbSIJjRbMrrAMJH6lEl5wTMqC2cWSetiwmQ6RQ1BrdStWQK6Gk
	XpQ9BzzoJYo8pP5uf9AIIRctlXk3G1TPgQuY3fVOPA==
X-ME-Sender: <xms:P8IYZnal6_fiiOzIAmPTB_AiNZ32jNwoBvrgVyk42WeeOPfzcN3oHQ>
    <xme:P8IYZmaTu2rJKevnQe-veNO6jCw0rhenj22T0HjorinTD26H5bD5uJs4MG7WkB27y
    UDfk68NjR8OcQ>
X-ME-Received: <xmr:P8IYZp--s0X167KOClclxdJCdrFZEtPGbEnHNL42j9qub1c_OTB2BOxGRgkynaUJ91JI7Q5nHJBcSJU3Vo4HFf2dtW-5kO7PxYHkug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeitddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:P8IYZtpvQgzUs2t_asAj7-EviUzBNdZTR5Yt2Y_IzSfkxnp4gsZMpg>
    <xmx:P8IYZipAA076L1jtp-WfGIoAPgd1bu7DW-vsLLel6rStuxKwnp732A>
    <xmx:P8IYZjSqpjbtpY2I58US2_AY1Zq8Ua8GxbutF-XiszGlLducdf8hxw>
    <xmx:P8IYZqrBbnSPqWn8Wr7hy9rVFDk9hMMu3JPWhvJdGPS8Ij3xaCHZCA>
    <xmx:P8IYZvgwwjjouRJN8fKzKeayGKbk1UH2KwjHACQ0XTQ9MZKhV8sPqb0g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Apr 2024 01:10:22 -0400 (EDT)
Date: Fri, 12 Apr 2024 07:10:19 +0200
From: Greg KH <greg@kroah.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <2024041201-shrug-carefully-c3a4@gregkh>
References: <20240412084310.035f018d@canb.auug.org.au>
 <87mspzci46.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mspzci46.fsf@mail.lhotse>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 02:36:25PM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > The following commit is also in the powerpc-fixes tree as a different
> > commit (but the same patch):
> >
> >   156539fd6501 ("Documentation: embargoed-hardware-issues.rst: Add myself for Power")
> >
> > This is commit
> >
> >   36627111b568 ("Documentation: embargoed-hardware-issues.rst: Add myself for Power")
> >
> > in the powerpc-fixes tree.
> 
> I can drop my version easily enough.

Either is fine, or both, it doesn't really matter :)

thanks,

greg k-h
