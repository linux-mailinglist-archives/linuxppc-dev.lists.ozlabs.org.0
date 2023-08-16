Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2E77EB56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 23:05:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BgFPs7BM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR0z26HzLz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 07:05:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BgFPs7BM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR0yB5dZGz2yWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 07:04:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E544664568;
	Wed, 16 Aug 2023 21:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1ACC433C7;
	Wed, 16 Aug 2023 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692219888;
	bh=vZzT4FLYZvxN57NaaD/Y3RFrRgr99gE1kZ6Pw1ws3hY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BgFPs7BMntOSL8c33Zzf5VpNK7hPj/8hBLAL02pTLkMKjrqkAF9i9T6Rgb8wTzpxs
	 a4t5JxDnoepdKDtZ2vn3wGhTG9WveX0JlgZRyWP2j9WumbStoGCDBtmYe+auQV4cU6
	 +Srsrk9E7jso00F/UefMS+H/9KrcPDCtNInr4QFOCvzTNPSZSbrQ/Zlw/deycgkBZE
	 MvElC0utsjlExSnsNZdNBQtByt1da4lXdX31tQ6nj0jxLQT4sI/9KSRj5NubEcLHAB
	 gwcZWHzhKeMZanibOE3SqnKVDdrtGfzb0UYtyYOu1wQcQPhZ5QKbSIMpdQHeNjv7B8
	 r87ub46p3iVgQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Aug 2023 00:04:45 +0300
Message-Id: <CUU9VV4M4LGZ.1W0BC1H1C0WE2@suppilovahvero>
Subject: Re: [PATCH v3 2/6] integrity: ignore keys failing CA restrictions
 on non-UEFI platform
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mimi Zohar" <zohar@linux.ibm.com>, "Nayna Jain" <nayna@linux.ibm.com>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230813021531.1382815-1-nayna@linux.ibm.com>
 <20230813021531.1382815-3-nayna@linux.ibm.com>
 <CUSG8HX9J4L0.37OHE7QHLL9N7@suppilovahvero>
 <3b4024eb6602fc2b7be821e6e33c656eee3c7cae.camel@linux.ibm.com>
In-Reply-To: <3b4024eb6602fc2b7be821e6e33c656eee3c7cae.camel@linux.ibm.com>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, linux-security-module@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 16, 2023 at 3:58 PM EEST, Mimi Zohar wrote:
> On Mon, 2023-08-14 at 20:38 +0300, Jarkko Sakkinen wrote:
> > On Sun Aug 13, 2023 at 5:15 AM EEST, Nayna Jain wrote:
> > > On non-UEFI platforms, handle restrict_link_by_ca failures differentl=
y.
> > >
> > > Certificates which do not satisfy CA restrictions on non-UEFI platfor=
ms
> > > are ignored.
> > >
> > > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> > > Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > ---
> > >  security/integrity/platform_certs/machine_keyring.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/security/integrity/platform_certs/machine_keyring.c b/se=
curity/integrity/platform_certs/machine_keyring.c
> > > index 7aaed7950b6e..389a6e7c9245 100644
> > > --- a/security/integrity/platform_certs/machine_keyring.c
> > > +++ b/security/integrity/platform_certs/machine_keyring.c
> > > @@ -36,7 +36,7 @@ void __init add_to_machine_keyring(const char *sour=
ce, const void *data, size_t
> > >  	 * If the restriction check does not pass and the platform keyring
> > >  	 * is configured, try to add it into that keyring instead.
> > >  	 */
> > > -	if (rc && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
> > > +	if (rc && efi_enabled(EFI_BOOT) && IS_ENABLED(CONFIG_INTEGRITY_PLAT=
FORM_KEYRING))
> > >  		rc =3D integrity_load_cert(INTEGRITY_KEYRING_PLATFORM, source,
> > >  					 data, len, perm);
> > > =20
> > > --=20
> > > 2.31.1
> >=20
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> Hi Jarkko,
>
> Without the following two commits in your master branch, the last patch
> in this series "[PATCH v4 6/6] integrity: PowerVM support for loading
> third party code signing keys"   doesn't apply cleanly.
>
> - commit 409b465f8a83 ("integrity: Enforce digitalSignature usage in
> the ima and evm keyrings")
> - commit e34a6c7dd192 ("KEYS: DigitalSignature link restriction")
>
> If you're not planning on upstreaming this patch set, I'd appreciate
> your creating a topic branch with these two commits.

They reside now in my -next. I'll send PR for the next release Fri.

> --=20
> thanks,
>
> Mimi

BR, Jarkko
