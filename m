Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7021C77EAEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 22:42:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WCqVy4ZY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR0SD2Mxrz2xrD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 06:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WCqVy4ZY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR0RH4Gccz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 06:41:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7EF561E27;
	Wed, 16 Aug 2023 20:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9C9C433C8;
	Wed, 16 Aug 2023 20:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692218487;
	bh=jeGSICGpy8wc3tdoolHaut30YQ4VjtnD733tnSF+jHQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=WCqVy4ZY7ELoZVdyFuauuRUD7giy3fsUvHylzb+oG2R0+bAHuYuSJL2qhI5k5ya2T
	 T812++FuHn7DFa04tR+ixnOyiADQSEKu6M6mEFRPis1AyMp0qnYx0iW3UqiTerhCYM
	 UsS1RZaVly6S0vmTqxkTFSTXoDOOpri3Y7H3riaUi9mISEC936zCdnWEppwxvMMg5T
	 A3dG8rAjfQGuBULx0pvd24O7GYX4ULyrHvPNbZUKqhr93h+znAHqGfZ0BwgHoRKdCw
	 4R/GKngz4wwhBJw2Clri3MwEsmpW2ziX7G68t4qwXidSRyk0qn46FdLZ3eHaqPC9GM
	 MpaftIyYb8RUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Aug 2023 23:41:23 +0300
Message-Id: <CUU9DZ1YEZVF.16X1CD7ES1RXD@suppilovahvero>
Subject: Re: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert,
 key store
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <gjoyce@linux.vnet.ibm.com>, <linux-block@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
 <46cda90a12da4639d1e65ce82ae342df05b7afc2.camel@linux.vnet.ibm.com>
In-Reply-To: <46cda90a12da4639d1e65ce82ae342df05b7afc2.camel@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, okozina@redhat.com, dkeefe@redhat.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 16, 2023 at 10:45 PM EEST, Greg Joyce wrote:
> It's been almost 4 weeks since the last resend and there haven't been
> any comments. Is there anything that needs to be changed for
> acceptance?
>
> Thanks for your input.
>
> Greg
>
> On Fri, 2023-07-21 at 16:15 -0500, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> >=20
> > This patchset has gone through numerous rounds of review and
> > all comments/suggetions have been addressed. The reviews have
> > covered all relevant areas including reviews by block and keyring
> > developers as well as the SED Opal maintainer. The last
> > patchset submission has not solicited any responses in the
> > six weeks since it was last distributed. The changes are
> > generally useful and ready for inclusion.
> >=20
> > TCG SED Opal is a specification from The Trusted Computing Group
> > that allows self encrypting storage devices (SED) to be locked at
> > power on and require an authentication key to unlock the drive.
> >=20
> > The current SED Opal implementation in the block driver
> > requires that authentication keys be provided in an ioctl
> > so that they can be presented to the underlying SED
> > capable drive. Currently, the key is typically entered by
> > a user with an application like sedutil or sedcli. While
> > this process works, it does not lend itself to automation
> > like unlock by a udev rule.
> >=20
> > The SED block driver has been extended so it can alternatively
> > obtain a key from a sed-opal kernel keyring. The SED ioctls
> > will indicate the source of the key, either directly in the
> > ioctl data or from the keyring.
> >=20
> > Two new SED ioctls have also been added. These are:
> >   1) IOC_OPAL_REVERT_LSP to revert LSP state
> >   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> >=20
> > change log v5:
> >         - rebase to for-6.5/block
> >=20
> > change log v4:
> >         - rebase to 6.3-rc7
> >         - replaced "255" magic number with U8_MAX
> >=20
> > change log:
> >         - rebase to 6.x
> >         - added latest reviews
> >         - removed platform functions for persistent key storage
> >         - replaced key update logic with key_create_or_update()
> >         - minor bracing and padding changes
> >         - add error returns
> >         - opal_key structure is application provided but kernel
> >           verified
> >         - added brief description of TCG SED Opal
> >=20
> >=20
> > Greg Joyce (3):
> >   block: sed-opal: Implement IOC_OPAL_DISCOVERY
> >   block: sed-opal: Implement IOC_OPAL_REVERT_LSP
> >   block: sed-opal: keyring support for SED keys
> >=20
> >  block/Kconfig                 |   2 +
> >  block/opal_proto.h            |   4 +
> >  block/sed-opal.c              | 252
> > +++++++++++++++++++++++++++++++++-
> >  include/linux/sed-opal.h      |   5 +
> >  include/uapi/linux/sed-opal.h |  25 +++-
> >  5 files changed, 282 insertions(+), 6 deletions(-)
> >=20
> >=20
> > base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2

I can give because it looks good to me to all patches:

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

... but should not probably go to my tree.

BR, Jarkko
