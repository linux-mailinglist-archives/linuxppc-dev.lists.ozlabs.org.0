Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE024834C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 12:46:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW6zP0DGXzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Fh5UJUtv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW6xY5g2dzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 20:45:05 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4408204EA;
 Tue, 18 Aug 2020 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597747503;
 bh=V2xRo09r41goWcHkv/TbZqQoAC4ijfdpV8AhWqNHVa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fh5UJUtv8etbELwMr2WpcfExLHbDpbyxc8JOao7kijScx1xcMrMp2cxAMpUru677p
 m9jcw94Zv7743Oy88oRexPOJWKKsp3xONJUS3/SWF4Dv6qL0cjeTppw8xJuMheqfxZ
 LTzaqXDgyTnnreT1mV1S2GX3/m2Q6XYGFyIC8AGc=
Date: Tue, 18 Aug 2020 11:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
Message-ID: <20200818104432.GB5337@sirena.org.uk>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hsgckl084.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <s5hsgckl084.wl-tiwai@suse.de>
X-Cookie: You're at Witt's End.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, keescook@chromium.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, clemens@ladisch.de,
 tiwai@suse.com, o-takashi@sakamocchi.jp, nicoleotsuka@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2020 at 12:25:31PM +0200, Takashi Iwai wrote:

> Mark, may I apply those ASoC patches through my tree together with
> others?  Those seem targeting to 5.9, and I have a patch set to
> convert to tasklet for 5.10, which would be better manageable when
> based on top of those changes.

These patches which I wasn't CCed on and which need their subject lines
fixing :( .  With the subject lines fixed I guess so so

Acked-by: Mark Brown <broonie@kernel.org>

but judging from some of the other threads about similar patches that I
was randomly CCed on I'm not sure people like from_tasklet() so perhaps
there might be issues.

Allen, as documented in submitting-patches.rst please send patches to
the maintainers for the code you would like to change.  The normal
kernel workflow is that people apply patches from their inboxes, if they
aren't copied they are likely to not see the patch at all and it is much
more difficult to apply patches.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl87sQ8ACgkQJNaLcl1U
h9AXXgf9Grt6q+diq7m3+Va9EPuojISFzp0rHACAAAE39g0r2Kzx/g53wYjT8uoA
Yr6dm9ajOxkGjqsZp4Zsp6iSabfuXuEAi9qBBBkCJlatDiEWwObS4X77VNUE82lo
U7d2ljdnsbtM/zTfYjc63OaAstv4bXWHm+NtjgJhiO155DifPsUOW8js8IPoSlN+
XDEPT0VVKs1syY90ef4oz7i/aTnOKLlGEejv1YHLRkvwmQyWbjZOo83UHSuB7IPB
GeTWC/+jE9ujCAKoCFmW8la4LWjfn8yV15s0LI7OFBFZZQoulBBhC7Dp316u5wsw
B2jWhNhnIJc8tG4nAuopeUqjHqIKYA==
=oDDH
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
