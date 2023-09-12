Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0779D7A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:35:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ue7JlDqO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlW2238V8z3dF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:35:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ue7JlDqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlW1B1dm1z3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 03:34:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 727E361656;
	Tue, 12 Sep 2023 17:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9138C433C8;
	Tue, 12 Sep 2023 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694540075;
	bh=9GHvDYyDgQ1uQgwUbBG3T6n5VLCoxKnTwH+ebGupVVQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ue7JlDqOAGqimu3Kkt4LS/bVe302496Rc3b4FBkHFyp80FDSRPk6O5d8jr84wRCfZ
	 iq9xmx0t/GMvCZfny0AAaTfzwpfXsruoUJcqu7ZpagXcyOwon2t6Wjv76YlFnY4E9k
	 pBdjONPwb/Gd3Gjst5vn/JIiYshbbnlZo+dfFV/IOAgQ6MLC8CG5rua0EPfSwikja9
	 DCjVoD0gbRHUI0p9pn2jrXjlqPEmIQuk7gWw0PWRBx0ifHeEn1KGNywEab2rD2bMyr
	 Jx2GQTaUMFhGMPN/QHRn9nGFXY8m6hIp2yGvJMWR4/v1nkfaOCplAjoQdmd8pMaDRX
	 Ti6LrS8+QAA8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Sep 2023 20:34:27 +0300
Message-Id: <CVH4BKBIAG68.17652WFGQ44EQ@suppilovahvero>
Subject: Re: [PATCH v2 1/3] crypto: mxs-dcp: Add support for hardware
 provided keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.14.0
References: <20230912111115.24274-1-david@sigma-star.at>
 <20230912111115.24274-2-david@sigma-star.at>
In-Reply-To: <20230912111115.24274-2-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 12, 2023 at 2:11 PM EEST, David Gstir wrote:
> @@ -101,6 +102,7 @@ struct dcp_async_ctx {
>  	struct crypto_skcipher		*fallback;
>  	unsigned int			key_len;
>  	uint8_t				key[AES_KEYSIZE_128];
> +	bool				refkey;
>  };

s/refkey/key_referenced/

No reason to obfuscate it, especially since there is no supporting
documentation.

BR, Jarkko
