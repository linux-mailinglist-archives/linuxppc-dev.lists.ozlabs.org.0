Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59107AAF3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 12:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9Ta/PHx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsSkz5MMZz3cn4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 20:12:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9Ta/PHx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsSk51L2Hz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 20:12:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CA5B6224B;
	Fri, 22 Sep 2023 10:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD1C433C7;
	Fri, 22 Sep 2023 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695377528;
	bh=KTp3+5YEfk8OXMEq9FRYbmvHCPYkW/LfzyG6e8jyrmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9Ta/PHxFGYtdvyR7EyjbHhgY2PgupOINSohq8W3l1y2ntQltHwu0DFxjAxonBPT3
	 j+A0gQaDzt+PaotHTBPHV10x7An3Gqxx4qdSFjsJWuFjln8X4f/3/34GTehDaGU0jh
	 kYqssWzWSbSJfuTLNCxPyTaGGKnJHcegK5wcHIaXlWU6aE9j8VDt1kvluhd/2Le6a2
	 VGgnpL6DQAMQMhSsAZ5Kf7HGutE7W/yUIDTEj8mqPJGe8Lc5nNbStG5/CWh1MNnYV6
	 oroHipTH3ZVFkWBTIwNe6oXwzVDu4iolSrelgg6/AK41pCq+7WeOMRE9sUbh0lEG/n
	 TUROSSffqfMPA==
Date: Fri, 22 Sep 2023 12:12:05 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] i2c: replace deprecated strncpy
Message-ID: <ZQ1odR+4bLWrxn0h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9cBeMkCN/aqfYfhG"
Content-Disposition: inline
In-Reply-To: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9cBeMkCN/aqfYfhG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 11:07:35AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>=20
> We should prefer more robust and less ambiguous string interfaces.
>=20
> `info.type` is expected to be NUL-terminated judging by its use in
> `i2c_new_client_device()` wherein it is used to populate `client->name`:
> |	strscpy(client->name, info->type, sizeof(client->name));
>=20
> NUL-padding is not required and even if it was, `client` is already
> zero-initialized.
>=20
> Considering the two points from above, a suitable replacement is
> `strscpy` [2] due to the fact that it guarantees NUL-termination on the
> destination buffer without unnecessarily NUL-padding.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strn=
cpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.h=
tml [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Added "powermac: " to $subject and applied to for-next, thanks!


--9cBeMkCN/aqfYfhG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNaHUACgkQFA3kzBSg
KbZm7RAAk1/spyitaQbYe3PLY8H0wGpdmUP+Yo6vjUIH/2oT5BZDL5XJev83mjnd
GTIDBPXPr1YAK+qpPahs0BNLIVkE8qBXeQMyCfj7LJJcmnvvXuCjoUeyIGtciqLt
y6tOXNy0PwN1KDKW2tE48CsY28VJeFJcXF/ZgGOcx+/FeWz6Fh4A+10fVnaPLPl5
J2iYBxmmrUT/heLsa0WDpuImW/k4iw37gLaEYIYjNlguYES0HgOe3zwQVGmzO38z
xN3CZNr1vFQYqI8hCcZtFayOD50W5YHN88pMbEQC7WJc8Uij0fjdoWLwGLPxSfzn
9noJZkQXGnA7nr+jBM1A4X6uXywLFPacbcHYjcMHeePljzthLhrOuJOJCd96p0IF
F4ckvd8AnRt0q3tXiracT+PnkXWlKGrREIkkxfdJ7L4OWTAzVQbRmcceXjO4+zac
fWW/rnNblvanTac8r7gU0AtVSavJqCnRawLvOeiVxJcNUxSr8IX1w5GMnOkWXT+V
YN9OP4iVcFFM8GEC3mbY49YOeO2z+4H79BjwXpef2lfYu6zYrDfYpgkMvrGjRXaZ
Wp/V5GE1bXbWi3uQhe6F9ruU07xz1ZOEfnW6gVtTt6whyi6g1AksJHCHTcpF0Sna
BIErf242wmZ6BSNpB/a60OXqcovC9Z1xQeXMUUzvdHIuUXZEZ7s=
=8uVT
-----END PGP SIGNATURE-----

--9cBeMkCN/aqfYfhG--
