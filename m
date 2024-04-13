Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0998A3EE1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 23:45:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zqu0aoE4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VH6RT6ptYz3vr0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 07:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zqu0aoE4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH6Qn1JYZz3vbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 07:44:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 177046065E;
	Sat, 13 Apr 2024 21:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51408C113CD;
	Sat, 13 Apr 2024 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713044668;
	bh=qef3IXh1hrzGJtBo8riNKnbW4w89RpdgyjPQtVzhG28=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Zqu0aoE4KGSDrDhhmbRwFDoKr6wDi6muM9KFSQ0RD0gBcoSFOEG1PQBo1LsWXLBXk
	 C0jzon4zllhj13s8rDOhyGazZrxlMz15NXDeP0QnXxYsnbCEmRXQP7WPkcn7nw5m4z
	 cHX944YtQkiHy8LvG5THdsMe0sEzGqej9Ykp/IeUyn2gWimtBwWSi6RJEVnxglWn5T
	 MEqfB0WMTbb+cKEFFBN7ds1DcyRHj9f6c8XbkLSY+ERma0qrRDcRpT8Py1Vh1WgVK5
	 BfWVNHNk+RJIFBJzejgXpv+qg3qO+nl6DPaXY59DPWLXIjWNYrU6lc4nMWtgqUrb3l
	 cfZn5ZoL9uqng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Apr 2024 00:44:20 +0300
Message-Id: <D0JBNGXAUBLT.1HW29NDQUKW72@kernel.org>
Subject: Re: [PATCH v8 6/6] docs: trusted-encrypted: add DCP as new trust
 source
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
X-Mailer: aerc 0.17.0
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-7-david@sigma-star.at>
 <D0ALT2QCUIYB.8NFTE7Z18JKN@kernel.org>
 <ZhjUH3TZ99cT3Rhq@gondor.apana.org.au>
In-Reply-To: <ZhjUH3TZ99cT3Rhq@gondor.apana.org.au>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James
 Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li
 Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Apr 12, 2024 at 9:26 AM EEST, Herbert Xu wrote:
> On Wed, Apr 03, 2024 at 06:47:51PM +0300, Jarkko Sakkinen wrote:
> >
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> > I can only test that this does not break a machine without the
> > hardware feature.
>
> Please feel free to take this through your tree.
>
> Thanks,

OK, thanks!

BR, Jarkko
