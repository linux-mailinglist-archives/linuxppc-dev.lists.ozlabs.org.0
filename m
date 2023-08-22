Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1E784201
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 15:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFZThr2o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVVVZ5DLhz30XM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 23:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFZThr2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVVTj6Cpvz2xsY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 23:25:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 767FB60A6F;
	Tue, 22 Aug 2023 13:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55180C433C8;
	Tue, 22 Aug 2023 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692710741;
	bh=dafa/FkbagFfW/Wg2rtYYk5Ab81iW7YdXDqOrQLAT4I=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hFZThr2ocn7V7tRa0MewY+oDcibf1WdD0I6t9e1cQaJOMfIYBBnmTZhsVTdDLTYLO
	 w+XVfdNRrmyDiscucZCzYR1F00DOIxPUhlBWhIjbJdyIKw5Kts3UuPSVBZ210WuiTG
	 mwlpE+kOC+dHsKUvA3hZh0QPTn3Gq16lJyLbcby2jz2TwQm6Bar7Fl+qllNQMlIABr
	 kpaazCpPqSGBWp76JDC2gxh/jFHq9dFo0WkrrwndllADwxhlYkcXiI5SxxYm0wJ7qV
	 vP5KefSxtriiTs0liOCgA/58y+SsZH1eXhNv8fBs2YoJQkPBQsGzFS8D+R6BcsZdCJ
	 AGlqWXVCxMClw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Aug 2023 16:25:37 +0300
Message-Id: <CUZ3VLLQO2NT.27JTWARP7V32B@suppilovahvero>
Subject: Re: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert,
 key store
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: <gjoyce@linux.vnet.ibm.com>, <linux-block@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
 <46cda90a12da4639d1e65ce82ae342df05b7afc2.camel@linux.vnet.ibm.com>
 <CUU9DZ1YEZVF.16X1CD7ES1RXD@suppilovahvero>
 <a232e46bb7b364a6ef7d77aef853d0ddda4e3f2a.camel@linux.vnet.ibm.com>
In-Reply-To: <a232e46bb7b364a6ef7d77aef853d0ddda4e3f2a.camel@linux.vnet.ibm.com>
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

On Mon Aug 21, 2023 at 6:26 PM EEST, Greg Joyce wrote:
> On Wed, 2023-08-16 at 23:41 +0300, Jarkko Sakkinen wrote:
> > On Wed Aug 16, 2023 at 10:45 PM EEST, Greg Joyce wrote:
> > > It's been almost 4 weeks since the last resend and there haven't
> > > been
> > > any comments. Is there anything that needs to be changed for
> > > acceptance?
> > >=20
> > > Thanks for your input.
> > >=20
> > > Greg
> > >=20
> > > On Fri, 2023-07-21 at 16:15 -0500, gjoyce@linux.vnet.ibm.com wrote:
> > > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > >=20
> > > > This patchset has gone through numerous rounds of review and
> > > > all comments/suggetions have been addressed. The reviews have
> > > > covered all relevant areas including reviews by block and keyring
> > > > developers as well as the SED Opal maintainer. The last
> > > > patchset submission has not solicited any responses in the
> > > > six weeks since it was last distributed. The changes are
> > > > generally useful and ready for inclusion.
> > > >=20
> > > > TCG SED Opal is a specification from The Trusted Computing Group
> > > > that allows self encrypting storage devices (SED) to be locked at
> > > > power on and require an authentication key to unlock the drive.
> > > >=20
> > > > The current SED Opal implementation in the block driver
> > > > requires that authentication keys be provided in an ioctl
> > > > so that they can be presented to the underlying SED
> > > > capable drive. Currently, the key is typically entered by
> > > > a user with an application like sedutil or sedcli. While
> > > > this process works, it does not lend itself to automation
> > > > like unlock by a udev rule.
> > > >=20
> > > > The SED block driver has been extended so it can alternatively
> > > > obtain a key from a sed-opal kernel keyring. The SED ioctls
> > > > will indicate the source of the key, either directly in the
> > > > ioctl data or from the keyring.
> > > >=20
> > > > Two new SED ioctls have also been added. These are:
> > > >   1) IOC_OPAL_REVERT_LSP to revert LSP state
> > > >   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> > > >=20
> > > > change log v5:
> > > >         - rebase to for-6.5/block
> > > >=20
> > > > change log v4:
> > > >         - rebase to 6.3-rc7
> > > >         - replaced "255" magic number with U8_MAX
> > > >=20
> > > > change log:
> > > >         - rebase to 6.x
> > > >         - added latest reviews
> > > >         - removed platform functions for persistent key storage
> > > >         - replaced key update logic with key_create_or_update()
> > > >         - minor bracing and padding changes
> > > >         - add error returns
> > > >         - opal_key structure is application provided but kernel
> > > >           verified
> > > >         - added brief description of TCG SED Opal
> > > >=20
> > > >=20
> > > > Greg Joyce (3):
> > > >   block: sed-opal: Implement IOC_OPAL_DISCOVERY
> > > >   block: sed-opal: Implement IOC_OPAL_REVERT_LSP
> > > >   block: sed-opal: keyring support for SED keys
> > > >=20
> > > >  block/Kconfig                 |   2 +
> > > >  block/opal_proto.h            |   4 +
> > > >  block/sed-opal.c              | 252
> > > > +++++++++++++++++++++++++++++++++-
> > > >  include/linux/sed-opal.h      |   5 +
> > > >  include/uapi/linux/sed-opal.h |  25 +++-
> > > >  5 files changed, 282 insertions(+), 6 deletions(-)
> > > >=20
> > > >=20
> > > > base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2
> >=20
> > I can give because it looks good to me to all patches:
> >=20
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> > ... but should not probably go to my tree.
> >=20
> > BR, Jarkko
>
> Thanks for the ack Jarkko. Any thoughts on which tree it should go to?

I get from "scripts/get_maintainer.pl block/sed-opal.c | wl-copy"

Jonathan Derrick <jonathan.derrick@linux.dev> (supporter:SECURE ENCRYPTING =
DEVICE (SED) OPAL DRIVER)
Jens Axboe <axboe@kernel.dk> (maintainer:BLOCK LAYER)
linux-block@vger.kernel.org (open list:SECURE ENCRYPTING DEVICE (SED) OPAL =
DRIVER)
linux-kernel@vger.kernel.org (open list)

You should probably add the corresponding maintainers and linux-block to
the loop. I suggest to send a new version of the patch set with my ack's
added to the patches.

BR, Jarkko
