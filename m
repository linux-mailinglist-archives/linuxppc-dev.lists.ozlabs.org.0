Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD7310C8D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 15:27:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXHnL1thbzDwhq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 01:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Us2R3OO+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXHlj4msRzDvX2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 01:26:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECCE6650CE;
 Fri,  5 Feb 2021 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612535166;
 bh=vz0EpXJayRiYNc5TflA7y0RwX1/hD5Z5cZtbGrJpFV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Us2R3OO+4Wcy6hSv5VXYsF1KTJF/+0jcxZVFjtlnH4Z2jMuj41U2+Nklg6BH+Gx3A
 uulzEKrbnFji+Fw/sUCqG571ha2Uew4bvTQT5RL/4G6H67Jpvs+g+SAlk4bvHwQVtE
 58nU8jYVraXqyC5f6wEWex0/cLQOWuJKUYafnXhBOyEXWNQgFq6mzMBjfo2kB5AIO9
 zG4tZc+WlhpuACHGrQLKhXRCiRb9vqOhzbnLEMg7TsN/UXyeicMwrBq2kN863+Tjjp
 fjzAhkE+LOvTGf6TAcnTItnT3Usc/qpztnZz2J04qniMkT1VQ44WnL0a4HOYh/dGMR
 bEfvshfep5Lcw==
Date: Fri, 5 Feb 2021 14:25:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio
 channel
Message-ID: <20210205142516.GC4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-5-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Huh?
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:27PM +0800, Shengjiu Wang wrote:

> +	/* TYPE C is notification from M core */
> +	if (r_msg->header.type == MSG_TYPE_C) {
> +		if (r_msg->header.cmd == TX_PERIOD_DONE) {

> +		} else if (r_msg->header.cmd == RX_PERIOD_DONE) {

A switch statement would be clearer and more extensible...

> +	/* TYPE B is response msg */
> +	if (r_msg->header.type == MSG_TYPE_B) {
> +		memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));
> +		complete(&info->cmd_complete);
> +	}

...and make this flow clearer for example.  Do we need to warn on
unknown messages?

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdVUsACgkQJNaLcl1U
h9C97Af/adbNIcFNxOngffC2op8D1lsnbPhhXftOmDlTLcbbbFG1hQeuCEHsljRt
50gewIr1JVY2DkjhAGhtO0GkX+0VpXHSqkwPYv33tOAFJTFcODtVao9i1csmyXu8
V7i4RUPJilR6VTJiFaKLZQPL3bNUeZ+/KfqNvf/jGSydI5OqKGuH2PiomH9lEOwR
xeteoRMiPCLSxtA2+AaKVDR85e1eJkxx3qVRWuccdOkNNjSZRbvh+ViytXoAkLQj
qM7JYdtZd/ZbDagmISJiZM57cVv+ql+5Rw+B4Wb1pzxcwCbKNB6qEUmRmuD2OO+W
aBb9j6QHazt7nhnsb/x34Dx2M/D1WQ==
=ULPb
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
