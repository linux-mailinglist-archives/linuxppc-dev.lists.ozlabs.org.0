Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A178BE8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 08:36:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=i77dORvd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZd465hPQz30dt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 16:36:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=i77dORvd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=217.72.192.75; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 955 seconds by postgrey-1.37 at boromir; Tue, 29 Aug 2023 16:34:24 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZd1r19L0z2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 16:34:10 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.49.30]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHoVE-1qVyDm38PW-00Eqhu; Tue, 29 Aug 2023 08:16:56 +0200
Received: from localhost.fjasle.eu (kirkenes.fjasle.eu [10.10.0.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id 7DC8F3E75F;
	Tue, 29 Aug 2023 08:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1693289813; bh=Tee/zKgIxi0MjayamYCOiUTorl30qi/G3fi5jQxu9uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i77dORvdD3FaDs5i6DL8ZDK8Unesg1yl+uxIVHscPJOTiKMcP2VspJD2G9iOvGdwt
	 g66IuuMz7ZWJ6u7k5WjE1Y4BlJcxwiuINQexDhpLTiMQ0wsn0nnwKtN8vhCBKG0iZ5
	 ZvRHgNWgIPsQ0q0qgSPI44uFj8TAzGUWkgXHMIw8=
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id A94463949; Tue, 29 Aug 2023 08:16:52 +0200 (CEST)
Date: Tue, 29 Aug 2023 08:16:52 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Message-ID: <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JaIvwu+DOSVoCCpT"
Content-Disposition: inline
In-Reply-To: <87ttsjlmho.fsf@mail.lhotse>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:OBnWK3wK1nt78UyoQFBURm442v+SvSoVVT7mPovCe98T1OcdBRW
 545IdFbHubnZv1c8kyxGda2FhHOhq6S+JNQcmvQsPh86El8Z2oDObUTGZNkSYi3rBEhtPpe
 iFj+PMJcKoRUGTqyvPJRbQqi8muo/oIxULf5nsWJp9ECrUUtbCOcliu478mDcsJIYXLPwgG
 aRaGMaOKjgoTFmVfIQeAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nSBSSgCh6aA=;thLCeKRGORoP7Z52qbIwEOyZs8p
 s03Gq/QGaTPlQsw/arXEDUEHKjwvCW9FuCMa6k8bB1Adfem/KUX9qTptZD5/0JCFciq8zOHQc
 7XA8GGP7m1nwYgeuQkL74TG4AWMEy3Jo1SWi0gQ3YwexBD8FOI0F3p5L4loi43P3lZhckYZZy
 GtyzJYOGIzG6pCXWZHmScrB3yQxzam8o73h4a4QMcEveRHTDDM7dI2KXHMj/wqlMLMsNzTNg6
 XG6Fpk4Fu7Ml9eZUyP4xsSoIMv8MSSlMyXNfW2ulETDOGD5FNcPRdZQVpQaTo/n4JvDRfDy25
 qEOYe23HCWHy058ABBzs4DMhXDG7614CoxlJhqC8oGf/mTplvHPRTUTmIEuHyQWoBJIDHjsMN
 IpMAiZ6bZ6ew4lJ0tSIFP/ALJNs0PMLjURbWvi90SpHJJduTbKOsXye8XQrh08cPM6PhUKbHy
 j/K7Bak/CfdwlTb1kKDU2UM32tOenQGQpPn7p+x0IFOXXzPMwNJau0mtsCdEGolpMKTt9r2L+
 o+MPmghrttrrwz/hms/mFIBxy5hMDhbkv2vjZ9kqq9AcvtTdsKIOpoSFKykM290yQoskcIK0y
 BYpbol5lyMUB26Ier6aWmd+zplSPTcRqnAS5eLU3GyOPOH5iucnDoj0H7Jlrx1Qx82SU04zUK
 n6TT4SkOZiRazU+EXVNwUt8Knp8EV8w1B0h1VMA4WrXngEwgLHKlTD8RFp3mGH87hnvNS4G4M
 +XNQ4ln6zbPl92we03M99tLssRXDgKOkBjdeGAO0YnFY2C1mT0Bc/CkkEbPS2DElDubNJSQkB
 21sPhUY4DzKfVDb36V9O+/DUovedjQUVMPJ7yJxx+dKivX3PhbEpiyIc1s9jdCApHf1zcsmO1
 Hy1hB86IRbNXPEQ==
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--JaIvwu+DOSVoCCpT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 28 Aug 2023 16:17:07 GMT, Michael Ellerman wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromium.or=
g> wrote:
> >>
> >> Hi,
> >>
> >> This is my series to show *.config targets in the "help" target so the=
se
> >> various topics can be more easily discoverd.
> >>
> >> v2:
> >>  - split .fragment from .config to hide "internal" fragments
> >
> > Please do not do this churn.
>=20
> That was my idea :}
>=20
> > Like Randy, I did not get "why" part quiet well,
> > but if you are eager about this,
> > you can show help message only when the following
> > ("# Help:" prefix for example) is found in the first line.
> >
> > # Help: blah blah
> > # other comment
>=20
> I did think of that, but wasn't sure how to do it in make.

Something like this should do it:

	@grep -Hnm1 -e '^# Help:' $(foreach f, $(sort $(notdir $(call configfiles,=
*.config))), $(firstword $(call configfiles,$(f)))) | \
	 while read loc dummy helptext; do \
		tmp=3D"$${loc%:#}"; file=3D"$${tmp%:*}"; line=3D"$${tmp##*:}"; \
		[ "$${line}" =3D "1" ] && \
		  printf "  %-25s - %s\\n" "$${file##*/}" "$${helptext}"; \
	 done

but this neither beautiful nor elegant it likes to be improved.

Kind regards,
Nicolas

--JaIvwu+DOSVoCCpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmTtjVQACgkQB1IKcBYm
Emnu6hAAiTYwlEcuArYqUntbY96On0jGhH2Ro38eVcbugkgaGXZdG2o6LDj7+Jv1
diCScvmsCCd0LT80ZjU8liNtsde+lqrL5XMAnELCaOMFDQPrLSp8HQ1NoPGkR3G7
He4w0psuLoXtKYlfc5txGbe7xiXqouA0UO0p+t/LX+roPbGFNsB6801KbXfHdvQu
NeQM/chgqVRFESOgQ15prGDNjfvhCkmPL0tnsLTWbhmvH0JPhgkwbJDyJfoTiynV
+RSgVhYh2IF2pN9NHcWfKspTNX0oBQJQ0OZMuFUNJz0+wOebpslo4jGbKHE85XD+
eEAJ93mWyDzA1eAoCfEb/mJqag7FWYTou+lIxSnPwdvhp21OS6wcYxp0jSjHCYGS
bIyN/i4AGB3nGufPwyouWbu7N1ObEuT6M80sDJOla2tRCC8JpmXkMfyP6My/TZRl
h5NPK9cirqd8HYUnayL7FUYX5jgfSgm+4G37gGHmzdPor2Ugr3QEDCUIssTyw22j
v3EuoqJHuGTQWo80W8h07CFNgMxtW/zrq5ArTI9/N6vqtFQm6pec1WTAKC1/1pOU
IaMdv/ZrebiU5u9QPGGL2qi4AVe8EWKMMzsaUvfVFfh19pW0KxMW4y7afFy7t+6v
ICmnB7nhu0MM51uchAm+GjkTVLIEwVLbuq+hv8WWjpV4bfexyw8=
=Puw/
-----END PGP SIGNATURE-----

--JaIvwu+DOSVoCCpT--
