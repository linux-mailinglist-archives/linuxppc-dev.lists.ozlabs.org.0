Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB4719341
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 08:31:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWx9l56CCz3dx0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 16:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y3oVPH0n;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AmbgEac5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=jdelvare@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y3oVPH0n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AmbgEac5;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWx8s5c4lz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 16:30:53 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A10421987;
	Thu,  1 Jun 2023 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1685601049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+34HlVsA/poGj53ijrK9NrVP3E9GR2f0mj2vAOmFjhQ=;
	b=y3oVPH0njicpYWzMgNtyBnRrPKyxDG8nANLQtZyhCY946UC46a8FxBAzq+VgPvMAzEE9m/
	lmP7JLuKr8eG8rBwX6f913X0MTZ+GrFNNc7BeznYKB/pW5hboERxIhWmbEmhtkwe7iYt6m
	hBDQhrJXig7lbdBb1+WPmZyyCYZlR0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685601049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+34HlVsA/poGj53ijrK9NrVP3E9GR2f0mj2vAOmFjhQ=;
	b=AmbgEac5TEPFoz3sqP7mJOH6MebzIgli8bql5h6Knn2VAONLzYEtdb3WCoSA9ZC2BiDSfz
	3Xosw8jSh9mohECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C3D113441;
	Thu,  1 Jun 2023 06:30:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id L/j+EBg7eGQgSAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Thu, 01 Jun 2023 06:30:48 +0000
Date: Thu, 1 Jun 2023 08:30:47 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] macintosh: Switch i2c drivers back to use .probe()
Message-ID: <20230601083047.1c82046f@endymion.delvare>
In-Reply-To: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
References: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, Krzysztof =?UTF-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023 21:50:53 +0200, Uwe Kleine-K=C3=B6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention.
>=20
> I chose to convert all drivers below drivers/macintosh in a single
> patch, but if you prefer I can split by driver.
>=20
> v6.4-rc1 was taken as a base, as there are no commits in next touching
> drivers/macintosh I don't expect problems when applying this patch. If
> conflicts arise until this is applied, feel free to just drop the files
> with conflicts from this patch. I'll care about the fallout later then.
>=20
> Also note there is no coordination necessary with the i2c tree. Dropping
> .probe_new() will happen only when all (or most) drivers are converted,
> which will happen after v6.5-rc1 for sure.
>=20
> Best regards
> Uwe
>=20
>  drivers/macintosh/ams/ams-i2c.c             | 2 +-
>  drivers/macintosh/therm_adt746x.c           | 2 +-
>  drivers/macintosh/therm_windtunnel.c        | 2 +-
>  drivers/macintosh/windfarm_ad7417_sensor.c  | 2 +-
>  drivers/macintosh/windfarm_fcu_controls.c   | 2 +-
>  drivers/macintosh/windfarm_lm75_sensor.c    | 2 +-
>  drivers/macintosh/windfarm_lm87_sensor.c    | 2 +-
>  drivers/macintosh/windfarm_max6690_sensor.c | 2 +-
>  drivers/macintosh/windfarm_smu_sat.c        | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

--=20
Jean Delvare
SUSE L3 Support
