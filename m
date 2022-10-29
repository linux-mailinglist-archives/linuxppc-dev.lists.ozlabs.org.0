Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A586121B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 11:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mztwb6dj0z3cHn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 20:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p2QpFFF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p2QpFFF5;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mztvd3YVYz3bVN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 20:11:39 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d24so6810426pls.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGovVwjV1E6BtwAiQsNOA452MnQdQNOQG6D6vOb6hjA=;
        b=p2QpFFF5brhI4B/eXe+Z4xKQnOouzEpVnsR2XVDcm6l2MYNVqlTciLf4+nBkZxvVnP
         oFSWEV1VNijYMeOfawxJGLATxCcZyE+2Ep5EkFwnGqACwpt188YeIlh0E/i3wPBvtwcQ
         6p1hfuLM/TBc5AvXxutguyvUN4gvjjV8zvXSq8YqEzyiJfxZwSMvF7pSe5TTJuuXS5wy
         vuLc60YIxYAEYtYjEjGQwsmjCIPzvg2e5WPgD4KqKhrtuyMw8ETHzKclKdrbZPz+5HYW
         hInjBTHcD+fAYruoqy00HDYWKdsBiKLgfQKI+jqNeHCWdgEpjazZVUMUP+K96RgWDNoa
         2kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGovVwjV1E6BtwAiQsNOA452MnQdQNOQG6D6vOb6hjA=;
        b=ToYNLsgS2/cvLOgjUWzWlq4J/knDcuMqMW8buy0a270blQTHvaIm8hFBTLmREAhc+l
         1J1kgoYJ8Ax2aKmXiPHf8F4RUoKQSFUrzcDThMQynDxr8B5gU/L2MxAS3aXgktTPkcgt
         v5FpX8m5mVxU9L9U6msKJidx64ZNk77+uJFQZR+5A6opf6/CCm7VFul31yGE2zfqhkCH
         iMckkMmzljOQj44ujt6LHBubTAnjgpYD7ZUlwDFgrl5xZ/pFylroqZS722SVOXjp7e26
         8qB7JUE1Pxr2Kjz5+mByonxyW7fedI6od2jl3xaRNct7cKt+dDayKwXMS3KnXL7g8wfM
         0mvw==
X-Gm-Message-State: ACrzQf0rGWW6qVsnj2ywK0xcCTuWUXuxpF1R8BbfJfCalohUyzEztfy0
	JOpsGlL4DJa/73OsSvQPnTk=
X-Google-Smtp-Source: AMsMyM4OatQFYqVqmKwLry/ueQrrTE1Ary//IAEG8r6UYYkfBMVy9IEHCtjpLWqjIXaf33tEae5evQ==
X-Received: by 2002:a17:90a:9606:b0:213:aff5:e537 with SMTP id v6-20020a17090a960600b00213aff5e537mr1690450pjo.183.1667034694859;
        Sat, 29 Oct 2022 02:11:34 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-1.three.co.id. [180.214.232.1])
        by smtp.gmail.com with ESMTPSA id i66-20020a626d45000000b0056b8e788acesm789333pfc.82.2022.10.29.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 02:11:34 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1AF4E103D6E; Sat, 29 Oct 2022 16:11:30 +0700 (WIB)
Date: Sat, 29 Oct 2022 16:11:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <Y1zuQvkyqtHOPGrk@debian.me>
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9mhS4nfECiIf9yXH"
Content-Disposition: inline
In-Reply-To: <20221027191113.403712-5-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9mhS4nfECiIf9yXH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:11:08PM -0400, Sean Anderson wrote:
>  .. only::  subproject and html
> diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/dr=
iver-api/phy/lynx_10g.rst
> new file mode 100644
> index 000000000000..ebbf4dd86726
> --- /dev/null
> +++ b/Documentation/driver-api/phy/lynx_10g.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Lynx 10G Phy (QorIQ SerDes)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Using this phy
> +--------------
> +
> +:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the la=
nes
> +described in the phandle. :c:func:`phy_init` is what actually reserves t=
he
> +lanes for use. Unlike some other drivers, when the phy is created, there=
 is no
> +default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be call=
ed in
> +order to set the protocol.
> +
> +Supporting SoCs
> +---------------
> +
> +Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing =
the
> +number of lanes in each device, the endianness of the device, and the he=
lper
> +functions to use when selecting protocol controllers. For example, the
> +configuration for the LS1046A is::

Did you mean struct lynx_cfg as in below snippet?

> +
> +    static const struct lynx_cfg ls1046a_cfg =3D {
> +        .lanes =3D 4,
> +        .endian =3D REGMAP_ENDIAN_BIG,
> +        .mode_conflict =3D lynx_ls_mode_conflict,
> +        .mode_apply =3D lynx_ls_mode_apply,
> +        .mode_init =3D lynx_ls_mode_init,
> +    };
> +
> +The ``mode_`` functions will generally be common to all SoCs in a series=
 (e.g.
> +all Layerscape SoCs or all T-series SoCs).
> +
> +In addition, you will need to add a device node as documented in
> +``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``. This lets t=
he
> +driver know which lanes are available to configure.
> +
> +Supporting Protocols
> +--------------------
> +
> +Each protocol is a combination of values which must be programmed into t=
he lane
> +registers. To add a new protocol, first add it to :c:type:`enum lynx_pro=
tocol
> +<lynx_protocol>`. Add a new entry to `lynx_proto_params`, and populate t=
he
> +appropriate fields. Modify `lynx_lookup_proto` to map the :c:type:`enum
> +phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Up=
date
> +the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers are upd=
ated to
> +support your protocol.
> +

These lynx_ keywords should be in double backticks to be consistent
(rendered as inline code).

Also, don't forget to add conjunctions:

"... Then modify ``lynx_lookup_proto`` ... Finally, update the ...
helpers ..."

> +You may need to modify :c:func:`lynx_set_mode` in order to support your
> +protocol. This can happen when you have added members to :c:type:`struct
> +lynx_proto_params <lynx_proto_params>`. It can also happen if you have s=
pecific
> +clocking requirements, or protocol-specific registers to program.
> +
> +Internal API Reference
> +----------------------
> +
> +.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c

Otherwise LGTM, thanks.

--=20
An old man doll... just what I always wanted! - Clara

--9mhS4nfECiIf9yXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1zuPAAKCRD2uYlJVVFO
o0lFAQDAGPql7PsJtgyOHANd61r9QA5C1NsAs7p1z2APtWtn7wD8CZbEagXT+kX1
GJMBh0UPc1fhpUiL2ln6IRYVs6nfRw0=
=CfkV
-----END PGP SIGNATURE-----

--9mhS4nfECiIf9yXH--
