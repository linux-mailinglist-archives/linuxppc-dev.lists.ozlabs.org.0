Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB89013F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:20:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4692Ss5VR4zDrZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 22:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=209.85.221.99; helo=mail-wr1-f99.google.com;
 envelope-from=postmaster@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4692Nt3zNnzDrZZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 22:16:30 +1000 (AEST)
Received: by mail-wr1-f99.google.com with SMTP id y8so1338003wrn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 05:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dn2KIuS3Wg8ZAV1Rn4EmhRNXAghPOAWFXahs2NO+P7I=;
 b=B8HhYdOKPfeqwfP5omUjpmph4P7FGg+amQ5v3JmGCsJyzJCQJ1fehqtN/ws8UCaFK6
 KL33rdIhWl4do2Vzg9vi/AIf/Jww/+kSmkIbWLW8tMW1GSQ00RmU4kEY7eU0yEJK7xRl
 CqaumlZog0kzMxOYRVPOOfJmCkAPNjwTXZbe+LM6m9oIWhKDySJjBMb6SLSjssVBAHu0
 E35Y3rN/4z2jZpz1h/Uhp3zulsiS5VFvvzRaSlHqXXusYiFQqte2QwWEC8ikE4X32Dys
 3UnSgCThHc0mxMtr47TgZOcL0K/y5JdmWqqbZCWGgJAePGI70PmqLSHGL1qqZaugA53i
 ya/g==
X-Gm-Message-State: APjAAAVQmnoiEE7ktLogW+2XUQcZLPpS2BJZ4IGr16+gmaNgxFJUnO10
 4G1vw1FImbWCxEeIIrnH6SsAEX3tlDoIX9GIQuxkjpQ8pB/mTtH5u4pb2n2ySWbTaw==
X-Google-Smtp-Source: APXvYqxzvi1VoIOoRXJFajCnQ/dE3fzFo5N+5Qat7cLvuByHbL41fsf69MyjqXOpnK7z54RKl4/zDq8J3tpC
X-Received: by 2002:adf:f287:: with SMTP id k7mr10732366wro.183.1565957786460; 
 Fri, 16 Aug 2019 05:16:26 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id k67sm34897wma.53.2019.08.16.05.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:16:26 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb9d-0003MM-Ul; Fri, 16 Aug 2019 12:16:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2556927430D6; Fri, 16 Aug 2019 13:16:25 +0100 (BST)
Date: Fri, 16 Aug 2019 13:16:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Add driver suspend and resume to
 support MEGA Fast
Message-ID: <20190816121625.GC4039@sirena.co.uk>
References: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: My life is a patio of fun!
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2019 at 01:03:14AM -0400, Shengjiu Wang wrote:

> +	for (i = 0; i < reg_max; i++)
> +		regcache[i] = readl(audmux_base + i * 4);

If only there were some framework which provided a register cache!  :P

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1WnpgACgkQJNaLcl1U
h9AuxQf/SUokJSA9quJeah9hsT6jJhQKPr9uQwbuhnIcx6+bhKouXbtrmPWZsHF8
zLUHwY1cvcQm2qitQxsYCZm1a65PWSIAX9P4s+GUfNVz9p2dL0q3TYDH8mDJBjWv
CK1KDEfko6PsY4AHrSa13aNy7IImcOn2J5+/CUOonmPlKPS7CezGbfACaQMG5Zdf
Ln4T/JnCQ6IZzFeJMwzD/RzXiwXOLc7SZ5mIADxbP+4rL9ByOG1BJy/rXIV9YbJe
IQqO5Zu7uen0NjPDOQP/Uy8RF4HItglOTrO8Cjr/95gQ4QJKxLzQyq5NzEGJu1h8
BgQWgH1vDAKWp04BZb2jzQtLMtmwiA==
=hQwi
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
