Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B184DB837
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 19:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJfYQ3n7jz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 05:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=LafSDfyc;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Dvih3qnc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mkubecek@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=LafSDfyc; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Dvih3qnc; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJfXj10jqz3085
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 05:52:36 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 96D57210F0;
 Wed, 16 Mar 2022 18:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647456752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lnkKOOiU1ETiY0y3zxpYvKjnp4Sb3EQiWIiknCU8CQ8=;
 b=LafSDfycolytbYjiKn5hfbYme9YbT5vAPiU35KJEGWi5L7txBtbylxyn6JNOtX4rjX4VxR
 vvwcODMqqfZ3AeRnbIHG3gAL+uSppf1Z3GT4l2Bml+dkTh6GcHbQ21zcS5O7iz3BA2nN9/
 cug3ENtvc4EBoNPPxLlBmSaZ2Qoj4hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647456752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lnkKOOiU1ETiY0y3zxpYvKjnp4Sb3EQiWIiknCU8CQ8=;
 b=Dvih3qncc7Q137BrOoxqM720wkXZUSB12aYFK0v+NrtbkhHcch6PpT84YcWA2ajKcHDvwN
 0gviuCsJzOstFbAA==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 63C71A3B81;
 Wed, 16 Mar 2022 18:52:32 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
 id 3B303602FD; Wed, 16 Mar 2022 19:52:32 +0100 (CET)
Date: Wed, 16 Mar 2022 19:52:32 +0100
From: Michal Kubecek <mkubecek@suse.cz>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [EXT] Re: bnx2x: ppc64le: Unable to set message level greater
 than 0x7fff
Message-ID: <20220316185232.ttsuvp4wbdxztned@lion.mk-sys.cz>
References: <0497a560-8c7b-7cf8-84ee-bde1470ae360@molgen.mpg.de>
 <20220315183529.255f2795@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <db796473-69cf-122e-ec40-de62659517b0@molgen.mpg.de>
 <ade0ed87-be4f-e3c7-5e01-4bfdb78fae07@molgen.mpg.de>
 <BY3PR18MB4612AD5E7F7D59233990A21DAB119@BY3PR18MB4612.namprd18.prod.outlook.com>
 <20220316111754.5316bfb5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sqphjpr54tkrt3wv"
Content-Disposition: inline
In-Reply-To: <20220316111754.5316bfb5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Ariel Elior <aelior@marvell.com>,
 Manish Chopra <manishc@marvell.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "it+netdev@molgen.mpg.de" <it+netdev@molgen.mpg.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sudarsana Reddy Kalluru <skalluru@marvell.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--sqphjpr54tkrt3wv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 11:17:54AM -0700, Jakub Kicinski wrote:
> On Wed, 16 Mar 2022 11:49:39 +0000 Manish Chopra wrote:
> > As ethtool over netlink has some limitations of the size,
> > I believe you can configure ethtool with "--disable-netlink" and set th=
ose message levels fine
>=20
> Yup, IIUC it works for Paul on a 5.17 system, that system likely has
> old ethtool user space tool which uses ioctls instead of netlink.
>=20
> What makes the netlink path somewhat non-trivial is that there is=20
> an expectation that the communication can be based on names (strings)
> as well as bit positions. I think we'd need a complete parallel
> attribute to carry vendor specific bits :S

Yes, that would be a way to go. However, in such case I would prefer
separating these driver/device specific message flags completely rather
then letting drivers grab currently unused flags (as is the case here,
IIUC) as those are likely to collide with future global ones.

Michal

--sqphjpr54tkrt3wv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmIyMeoACgkQ538sG/LR
dpXXDwf+MojGtSLGC/uC3T0dwdw0tEaK0rWjy4+paRSL68FUFIFNkP4hQbyKbujD
v69NqqPWru5/3ayVmr+/CXLxajEcX35+bgcPQctyO98ktgqeFlyp3oMUfLbRwIQE
U2kD4diA9lZoQR+AsSy7wubP4TsIT7LtU37XErA3bKsIlPM3UKl1oty0+eh2FxAb
oBlyGHaREIkQdDfbMoCfkYJkx8sWUtMHlw3KE7NoHnPqzRiRtqRt07z2ww/SmBkT
+Bsxs3Q4dAKsbLH2jWHLU3v2zWKkaBwrEaIAyvX/v/PZqJdN9XxJZD9frKUH1rZq
YxZwuCG6FWtc8VT44sDzrIgPRa22WQ==
=MW/+
-----END PGP SIGNATURE-----

--sqphjpr54tkrt3wv--
