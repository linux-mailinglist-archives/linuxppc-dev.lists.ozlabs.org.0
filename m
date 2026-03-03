Return-Path: <linuxppc-dev+bounces-17554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFbPG2gqpmkZLgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 01:25:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8B1E719F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 01:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPxQT71cfz3blr;
	Tue, 03 Mar 2026 11:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772497505;
	cv=none; b=BiY+BMUECIGLnAPnfaeOxMbE0FoCRh6JPKDUmVtqczySFns/AnQ4UHxPOKw731U9cWzypmSWtu6L0xQ4V2mumQ56hj9k5iHtPWlCO3ELcBrX9C76dpL9WJ6hJO5NVkgzN+cCDLJYFQzv13VAKM+ku2W6jetOl75wtLRv+5teUXX2wsXOqK9feLCjJhpQlBnRvGXt2X7NDATR1ig8BX6y1IFad0ttymJ6yyRulMJJuNRM11DGNHz/V2T2cACZlMibE9RBXD9yVKDlOTsb7uPLM4yNGAABhqyAGo1wE4n5Z0xZhwQI/2QcH5JHZVNfdy/V6cvCtHoXaNMo1XzXC3ilMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772497505; c=relaxed/relaxed;
	bh=q4go3n2jX2K/xgDjMiM0RlAhH1iov2OMdsX0hDhRiOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5irH2+r1emLB7lnrpSTE7MX3q3Y+zRMengrM/fon6rUCsBjEpf0dH8tBmo4iYOHfwliACko6P4hQaKZHGqEwPHptyt2bFI4x5XaEMpQVPEqfzubcVnnr+JYN6KdyIfy844vhickT3fnqORlIFtwNiKZcDgz+k/AMqclo7r1+ACY3jSwGeXfz7ojv8fV+KjCZTxuWE7uWFQvyW9O0MOKNsRrVSYYxSVduVVxv3PaPXUXkcDYvvrGeJQvBvnbW3bz3Zgx6kiHo/nY6wUZECODx10RACwykaElfEEfMq3VrQWBDKymejw/XVIiTMaVR1e3nnpCJ9kKCGtOzJzhRHTs8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=byLLl9GN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=byLLl9GN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPxQS3B11z30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 11:25:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81D1E419E2;
	Tue,  3 Mar 2026 00:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326D2C19423;
	Tue,  3 Mar 2026 00:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772497502;
	bh=oMRcvAiaEAgwn2b42hGJups4wsIQaDu44aFVS4f8bas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byLLl9GNqZpApIyee1kfJtFDn+hWssaTx0Noft8I5Fj17JOAQOENdWEAcBSh7mXU9
	 uCoGtr/G+5WrKCU/EbtQIcVm3B14Wln8akOsvotSL937nSgQkwHBiZ6gZcCEsYw5GG
	 kU0PnND3+opC2YqfY/cl9yIKr0i/yy+qb13iKdtdPkMyVHrsyF+PhhfrO+CTuYPCMX
	 vTvUrCFPgQpTAV9Nj66K0nb6rN3ki4SuwUIprYDwULA+BL19Lh9s1GgUV+rrVJ1jja
	 X0F3DEfoPg6G5E0bfx6FzPNAPUHBZqBWqPDPKpc7yedxFYQt95oaGFeGMNPN0SjLY4
	 6sDcPgrHytXdw==
Date: Tue, 3 Mar 2026 00:24:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Message-ID: <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
 <20260212072229.3247604-2-shengjiu.wang@nxp.com>
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
	protocol="application/pgp-signature"; boundary="6ExE9y9OK5qW8XAv"
Content-Disposition: inline
In-Reply-To: <20260212072229.3247604-2-shengjiu.wang@nxp.com>
X-Cookie: Please recycle.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2CD8B1E719F
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
	TAGGED_FROM(0.00)[bounces-17554-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action


--6ExE9y9OK5qW8XAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 03:22:28PM +0800, Shengjiu Wang wrote:
> The transmitter and receiver implement separate timestamp counters and
> bit counters. The bit counter increments at the end of each bit in a
> frame whenever the transmitter or receiver is enabled. The bit counter
> can be reset by software. The timestamp counter increments on the bus
> interface clock whenever it is enabled. The current value of the
> timestamp counter is latched whenever the bit counter increments.
> Reading the bit counter register will cause the latched timestamp
> value to be saved in the bit counter timestamp register. The timestamp
> counter can be reset by software, this also resets the latched timestamp
> value and the bit counter timestamp register.

It seems this makes mixer-test deeply unhappy, spamming lots of:

[   56.466460] fsl-sai 30c10000.sai: ASoC error (-16): at soc_component_read_no_lock() on 30c10000.sai for register: [0x000000fc]
[   56.466469] fsl-sai 30c10000.sai: ASoC error (-16): at snd_soc_component_update_bits() on 30c10000.sai for register: [0x000000fc]

into dmesg on the Toradax Verdin:

  https://lava.sirena.org.uk/scheduler/job/2518775#L2238

I don't have results for i.MX8MP-EVK since I didn't test it with the
fixes from:

  https://patch.msgid.link/20260205-asoc-fsl-easrc-fix-events-v1-2-39d4c766918b@kernel.org

applied so the test ran out of time due to the time taken to log those
issues but I'm guessing this new issue should be reproducible there too.

--6ExE9y9OK5qW8XAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmmKlgACgkQJNaLcl1U
h9B3cAf+NouyZA9kIdqFHxWVjE4U+fzXHnEmbOGHJxlp6+/OoxBxc6rJP+be3E4L
jd/XaJrl2WVIrAugv7RxPJ+9QgDvWPVnXfOTQPe+VYe3eS2FOduc5qBW2pvIRsiK
J23us37jr/wA78RvMpBuGDRv0LWRUKdyrHu6wktXODXERhFfGxDBeWPEhsVvDD2p
zGkkHBdONRcGsru+JScmgDQrmYcg2tJ5/LbYAvMaknOr9JopRA/Mqn6BjT8mhNqi
4A9VNTOEnL6XPewqV1La3MZli0VGowBlX+X+np+bb4V4WX9xnxCDMvu8nVa2j86/
baij074nOzM2SK6GnmK3B0MKObwNMA==
=hMP+
-----END PGP SIGNATURE-----

--6ExE9y9OK5qW8XAv--

