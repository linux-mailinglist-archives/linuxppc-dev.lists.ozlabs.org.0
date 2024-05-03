Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FD8BB870
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:46:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZoQANMu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWS9f0XWqz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 09:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZoQANMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWS8t3NJBz3dTb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 09:45:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8E5061D82;
	Fri,  3 May 2024 23:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F4C116B1;
	Fri,  3 May 2024 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714779915;
	bh=DlRlFVsHUqhvPdkfip9DnPPB8Y/bNEuxfZL0IMIFLYk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BZoQANMu5xxuHXX714j4tlKziMZOQFhvYDjQLmlnL6HneFF17oZkflc23OPLrUjm6
	 l96OiS8KxIKEs5kczliHGVnsn10tT68fYsWkcfAYPWXZ1XvmzGoHvUkp1ZxmKrWpDC
	 s7td0SjDAOIEg2AzAYplNdCnrGMHYph1oVDt7Xqi8J5CfL0NaerWmmjCQ7oBTxZkFN
	 hi9mYVwSgjD715rrjl4RTDFa7RFivlIKP+ftuX65ggz1X4tvvvHVoGTWJAtpHvh7Rc
	 WVqUjjU2Mp8QltWKiPa2PEtJQ3MsGF6I9PdUxd++kH3e/soRIgYBMoF7CMkgpxB3MJ
	 71FCga1RH5W5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 May 2024 02:45:05 +0300
Message-Id: <D10EQTNQXQYO.1QBNX5LMFU8NK@kernel.org>
Subject: Re: [EXT] [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new
 trust source
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>
X-Mailer: aerc 0.17.0
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
 <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
 <DB6PR04MB3190F6B78FF3760EBCC14E758F072@DB6PR04MB3190.eurprd04.prod.outlook.com> <7783BAE9-87DA-4DD5-ADFA-15A9B55EEF39@sigma-star.at> <DB6PR04MB319062F2A19A250BA22C12D48F1A2@DB6PR04MB3190.eurprd04.prod.outlook.com> <DB9357A7-0B20-4E57-AF66-3DD0F55ED538@sigma-star.at>
In-Reply-To: <DB9357A7-0B20-4E57-AF66-3DD0F55ED538@sigma-star.at>
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan
 Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James
 Morris <jmorris@namei.org>, dl-linux-imx <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pankaj Gupta <pankaj.gupta@nxp.com>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Paul Moore <paul@paul-moore.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li
 Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Kshitiz Varshney <kshitiz.varshney@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Varun Sethi <V.Sethi@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Apr 30, 2024 at 3:03 PM EEST, David Gstir wrote:
> Hi Jarkko,
>
> > On 30.04.2024, at 13:48, Kshitiz Varshney <kshitiz.varshney@nxp.com> wr=
ote:
> >=20
> > Hi David,
> >=20
> >> -----Original Message-----
> >> From: David Gstir <david@sigma-star.at>
> >> Sent: Monday, April 29, 2024 5:05 PM
> >> To: Kshitiz Varshney <kshitiz.varshney@nxp.com>
>
>
> >>=20
> >> Did you get around to testing this?
> >> I=E2=80=99d greatly appreciate a Tested-by for this. :-)
> >>=20
> >> Thanks!
> >> BR, David
> >=20
> > Currently, I am bit busy with other priority activities. It will take t=
ime to test this patch set.
>
> How should we proceed here?
> Do we have to miss another release cycle, because of a Tested-by?
>
> If any bugs pop up I=E2=80=99ll happily fix them, but at the moment it ap=
pears to be more of a formality.
> IMHO the patch set itself is rather small and has been thoroughly reviewe=
d to ensure that any huge
> issues would already have been caught by now.

I don't mind picking this actually since unless you consume it,
it should not get in the way. I'll pick it during the weekend.
Thanks for reminding.

BR, Jarkko
