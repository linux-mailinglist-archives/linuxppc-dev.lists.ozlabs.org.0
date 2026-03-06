Return-Path: <linuxppc-dev+bounces-17804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I0qCvHCqmlXWQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:05:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237C22012C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 13:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS4pg1KnBz3c5f;
	Fri, 06 Mar 2026 23:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772798699;
	cv=none; b=hzM0nqH2FvGVk89BjOPLeZ1V8jHAZXw337Fq95+0PCBtwTZJZFYfpYEUTCjllyPB5oBP9inT5q67J/4B1itOShLY0nAPxw/OsG7jEh1gYVRy8XweDAc8mJuKM0eRl98p56e5aOhD0H/1fURM0xKnQuTdr7jjFwV1va4IgrJRNAOuENr49lhI7imhRUyvjllv9SNA+g/kDd2IJweBof4M3TWncW4I0BpDrtp31JgnmuOqhnNnXnf39gZ4e3ECLKnj5NVLwfaPQ2ALkPQM0+eNJgCvBuYb/FrbIuM7LO+dMP0EerP+h9l5OuNNAR6KLItGX0ZTP7iYFe1IuBdGgcXOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772798699; c=relaxed/relaxed;
	bh=OK/V7WgT+BtAQCQInwPGXadurJ8C6F9OPr0IpggRc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWumlqatng6doxFQlc5sQwCRuhiv7gjQSZb+v7ObVf3iue9K1RyXcWVbbFQ3Tl+VQKEA+f9yaZqp6fYpY0/uTaMfcst+W8fZNEnJledZP5zlYR1Qvr0e3HQBW2WLgT+EleTKRMh0vTu1xMBFTqfGeGQTOz5rbnsIzgw3BRJWqiIYelVioBc7N3E2vuKF9dS7AJrD0sNNtu1bpOtLlD4/A2kNsJ5ZB5n4B9saC3AmWK6u9uu5b9+HIF9tEL3gdyX9sNlSOzcsh0iQBRjeGPPCekH9kP6jxleSihH3QI8z1KlsVLRVlaMpkoCZJThvB7d2b9YKtV2GE37pFJN9PtoCtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FE8qIcXw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FE8qIcXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS4pf39h1z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 23:04:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7617E60018;
	Fri,  6 Mar 2026 12:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8A3C2BC87;
	Fri,  6 Mar 2026 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798696;
	bh=OK/V7WgT+BtAQCQInwPGXadurJ8C6F9OPr0IpggRc9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FE8qIcXwuwa4rIAFBSmP0FKHWuwRqhRCstfE0Wn9aAhYo5O/CQCk6WLD5n98ngask
	 TBrE/SWVXAdrctaNZV0xgXe2qrCiUImfriM9W/aim2EibVhVJKsLbt1AcWXGrQXVxZ
	 zfoW/N5NSokhmUPuZpvKtx5sJg8hHgveItqbg8uGmEevdcDhX2Yb/6KmFnCB5nIEue
	 LAsPqmKdCsEaYcYq2TXceFGAtwfTr+xQEk+qt51CFlL0WYQpeX07HaHWQ8+mnh1xkT
	 iPyCOm1nD0DyRoTqzargcPQV+TssjQi9Bk2G4HbF3hj0tem1wqkhdprXJdQ3fN8Gzo
	 YEdbJpsZeJKzg==
Date: Fri, 6 Mar 2026 12:04:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
Message-ID: <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
 <20260306093949.1647452-2-shengjiu.wang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pz9X0x5TI724p1R2"
Content-Disposition: inline
In-Reply-To: <20260306093949.1647452-2-shengjiu.wang@nxp.com>
X-Cookie: A nuclear war can ruin your whole day.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1237C22012C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17804-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid]
X-Rspamd-Action: no action


--pz9X0x5TI724p1R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2026 at 05:39:47PM +0800, Shengjiu Wang wrote:
> There are some registers which are volatile, at pm runtime suspend state,
> the regmap cache only is enabled, regmap will return -EBUSY when trying to
> access these registers.

> +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);

Please make anything that exports ASoC or regmap functionality _GPL, the
underlying APIs are _GPL.

--pz9X0x5TI724p1R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwuIACgkQJNaLcl1U
h9AIwAf+K+r3S9KAElHMGCrYoq9nCdr8s4aLSb2bGWX8gkmQ000L840fz/C/xb85
mLuFuCsL0I1ouP4TxE0Nn4BUMpSsC9vVYkynQIq2BxJYZWapmPwp1yABbqK5KGJP
Z1VoihCfeF/qNdnqU/zHvdnfWaBlQ89tWlXQSoZ36O613/lMMBkCFnFUAogBrxqE
zbsxPLVtdH/06BAgkN2PradMy3hDZ698G0Lf9Cy3J3r3ZzCiDwwbDqrDhjmeNOku
Ir2ppo+Fm9QiTsiO5TUSfpvrWwAAQ0A/sLTXx+rMkyLvfibEeyDDkTOh1vwM9n+c
enP3CeLjEpv7mWdxHP1SKT6LJPe4MA==
=Ex6A
-----END PGP SIGNATURE-----

--pz9X0x5TI724p1R2--

