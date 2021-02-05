Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11687310CD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 16:00:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXJWM2tYDzDwp1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 02:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dAu9XING; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXJTn2rn7zDvbl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 01:59:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 220B864FBC;
 Fri,  5 Feb 2021 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612537146;
 bh=pcoVC9g6Ql5brnm8ZYrxM8gXd4vKE+CdwztAMluc3jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAu9XINGXWMXKM/v4VSMEpR5UUCt36txoacXH7ka0tNv+vG8Uhvnlhf5OOFcYyRyK
 tKUvQdjoSvGBnoTZ1QDZRsluTJ4fRW+i0tlc+VKsUF9R5bkMFO921B8eKwzT9xS89+
 BxgNKjCkkKuVdr2Xb16fv/oWk2wF/IpowhfTwmRmdl/hk0xAPKiy6q/JPbOV9rihec
 DwKrhy22qVj5ArEmPBouXYoyduoc9mEyFyB8W2cvPw7M1ank7v970HjrN9h2zkMlCC
 yhP5EQx8DqzkpHfzgFM25WJfLei1aGv86v8U7bPoZpWQE7W4pd9B5eIU9O0dmMTnAy
 8ir6e/XFyhIKg==
Date: Fri, 5 Feb 2021 14:58:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 5/7] ASoC: imx-pcm-rpmsg: Add platform driver for audio
 base on rpmsg
Message-ID: <20210205145816.GD4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
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


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:28PM +0800, Shengjiu Wang wrote:

> +	if (params_format(params) == SNDRV_PCM_FORMAT_S16_LE)
> +		msg->s_msg.param.format   = RPMSG_S16_LE;
> +	else if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)

Again this should be a switch statement.

> +	if (params_channels(params) == 1)
> +		msg->s_msg.param.channels = RPMSG_CH_LEFT;
> +	else
> +		msg->s_msg.param.channels = RPMSG_CH_STEREO;

Shouldn't this be reporting an error if the number of channels is more
than 2?

> +		/*
> +		 * if the data in the buffer is less than one period
> +		 * send message immediately.
> +		 * if there is more than one period data, delay one
> +		 * period (timer) to send the message.
> +		 */
> +		if ((avail - writen_num * period_size) <= period_size) {
> +			imx_rpmsg_insert_workqueue(substream, msg, info);
> +		} else if (rpmsg->force_lpa && !timer_pending(timer)) {
> +			int time_msec;
> +
> +			time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
> +			mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
> +		}

The comment here is at least confusing - why would we not send a full
buffer immediately if we have one?  This sounds like it's the opposite
way round to what we'd do if we were trying to cut down the number of
messages.  It might help to say which buffer and where?

> +	/**
> +	 * Every work in the work queue, first we check if there

/** comments are only for kerneldoc.

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdXQcACgkQJNaLcl1U
h9ACUwf9EcHPKiRzzRa6Atb6PHhaM1oBK/2zYZcdmLDejwBct/KltZywmVsBQv0o
JmeLnKw7/jLk3Sph4Pqk6J2lyizC5nik/w7NjFO5CIUyNTQnFRZtaDILcnVr7vNk
28HX0/XoPM54EbfyncrP41lr/L4EYgHmjIMqi/TjVtFnfyOt1Pq99Rj02lKDVnV3
ERmOguBociG3yf9kV/wcrZzJ4hOg7Lw468CHtxoeCpPKsJovmByQ0I78JQJlJ1Jj
TRjC06zUmRhscWFCrWiOkItqPpTcrv5TxMVh5Ko5zE1rYslk8XURTFpnKDxWoxkR
MtylP+v1qS4G4STsZObKZtcso3D9hA==
=hzt6
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
