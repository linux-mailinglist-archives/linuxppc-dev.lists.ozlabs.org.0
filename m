Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DE7B5D5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 00:51:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOzaTs8x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzx5v3sXFz30QG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 09:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOzaTs8x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzx503lDQz3c8D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 09:51:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CCE4CE1366;
	Mon,  2 Oct 2023 22:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C30AC433C7;
	Mon,  2 Oct 2023 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696287057;
	bh=/OqHkpnCr2yp1sDRAdjhGT7oMqmIEUALgDHapbczbmI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=YOzaTs8xV30AkpqZbykvhJSF0mNTVlgNrJdaZuah8iyObs6eMafbHTI/hNig4dWQX
	 vrC2a+GKlGOLBX6HK26gDeMOht2XNo+CNdwjXs5srCzTgdOfpbbQUUJDqTUYD0tuXj
	 5Ogpu/QrdP84k1KW44KYcZ484+H0U8gegEkBVgqLEnbrUOc4eqSG0slsHEIvnlad3P
	 Z56UeZDV+NpTwaI3LNFfV23LROuNH6PrMrmZQyTOgf4na/6gwlG+gzXU8XkYhLdzKb
	 7UXnUl6BPmy6BcW3oSUZm6y9Paqwl5OjOF2Z6r/UPVGqTS98/289KlB2V8IYDupALH
	 TqzvT1Mi7RhWQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Oct 2023 01:50:43 +0300
Message-Id: <CVYBKLX6LJR4.22G72LXAHW77W@seitikki>
Subject: Re: [PATCH v3 1/3] crypto: mxs-dcp: Add support for hardware
 provided keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>
X-Mailer: aerc 0.14.0
References: <20230918141826.8139-1-david@sigma-star.at>
 <20230918141826.8139-2-david@sigma-star.at>
 <CVS3NIJ8OO6Y.2C6GJ9OBR6COC@suppilovahvero>
 <88FFAB6B-10A8-4732-A901-50859E22352D@sigma-star.at>
In-Reply-To: <88FFAB6B-10A8-4732-A901-50859E22352D@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan
 Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James
 Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li
 Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Sep 27, 2023 at 9:25 AM EEST, David Gstir wrote:
> Jarkko,
>
> > On 25.09.2023, at 17:22, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >=20
> > On Mon Sep 18, 2023 at 5:18 PM EEST, David Gstir wrote:
> >> DCP is capable to performing AES with hardware-bound keys.
> >> These keys are not stored in main memory and are therefore not directl=
y
> >> accessible by the operating system.
> >>=20
> >> So instead of feeding the key into DCP, we need to place a
> >> reference to such a key before initiating the crypto operation.
> >> Keys are referenced by a one byte identifiers.
> >=20
> > Not sure what the action of feeding key into DCP even means if such
> > action does not exists.
> >=20
> > What you probably would want to describe here is how keys get created
> > and how they are referenced by the kernel.
> >=20
> > For the "use" part please try to avoid academic paper style long
> > expression starting with "we" pronomine.
> >=20
> > So the above paragraph would normalize into "The keys inside DCP
> > are referenced by one byte identifier". Here of course would be
> > for the context nice to know what is this set of DCP keys. E.g.
> > are total 256 keys or some subset?
> >=20
> > When using too much prose there can be surprsingly little digestable
> > information, thus this nitpicking.
>
> Thanks for reviewing that in detail! I=E2=80=99ll rephrase the commit
> messages on all patches to get rid of the academic paper style.
>
>
> >=20
> >> DCP supports 6 different keys: 4 slots in the secure memory area,
> >> a one time programmable key which can be burnt via on-chip fuses
> >> and an unique device key.
> >>=20
> >> Using these keys is restricted to in-kernel users that use them as bui=
lding
> >> block for other crypto tools such as trusted keys. Allowing userspace
> >> (e.g. via AF_ALG) to use these keys to crypt or decrypt data is a secu=
rity
> >> risk, because there is no access control mechanism.
> >=20
> > Unless this patch has anything else than trusted keys this should not
> > be an open-ended sentence. You want to say roughly that DCP hardware
> > keys are implemented for the sake to implement trusted keys support,
> > and exactly and only that.
> >=20
> > This description also lacks actions taken by the code changes below,
> > which is really the beef of any commit description.
>
> You=E2=80=99re right. I=E2=80=99ll add that.

Yup, I'm just doing my part of the job, as I'm expected to do it :-)
Thanks for understanding.

> Thanks,
> - David

BR, Jarkko
