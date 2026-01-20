Return-Path: <linuxppc-dev+bounces-16066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPCLCcOlb2kfEgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 16:56:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E372846DDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 16:56:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwPgt1HnSz2xKh;
	Tue, 20 Jan 2026 22:08:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::433" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768907290;
	cv=pass; b=oFUKHoTjwy0eK4zL1m2AVQ0q1i6q5eVIaY1UBduwOtu8M0YK61By+ogG/8YJWq/D0OW+LetUh2gh2CJNQA2Uu27xkSj75onCYD3d+cR035zejtdogyxqVU+uQcU1bMcC7TBH0kmnjgoAqDBii+6LrP/rdgm6/f0bK/xL2bJz3636fxZY051IpHdZRb04JHm92+3iXVpbR61nldBLwVSVHhgcef8xy8UhW8ga8AisUBFgL1eNrTl7aQQJsMwePAYa9ZKF5Sum2hJrxQVJBdue/VCMne9LqzAylULYmer2PQZGdFNTN6qjfMnF22rsPcIzZZZUmHcSObZV4L6HD1/ohQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768907290; c=relaxed/relaxed;
	bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNNuUwS3Y+fYhVGBTtvtg9O7EuDRuf5AOFzK/ZR736vcTQgUka/dIjHX5BgiHbkUpODVgvX+U0OWsqT12HKSM43bYuQLcCLSAUAuewNQYX8rVRniSamCnuZ55MtVZ4e9qRXA+bFVQR4hP6DJIuzUR/HC0BnV91B5QNXBtPzNF9i4IFPyCUOuKUlGW/F8kzDTCIccvJ51ql3sMJ1hN4GVuIJt9lUR1YU5Bu1EMfFXSMBr/QKqEZRqZOSDz761sxVevH6vv5dhgdCCgK+7tmurCjGxdJNmcWwzaCKWpPuQd1PpmImX7a+4FmK8DfStvSIfCusqqQTNZ+m173544k4VCQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Imm51V9q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Imm51V9q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwPgr2x7sz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 22:08:07 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so3026103b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 03:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907280; cv=none;
        d=google.com; s=arc-20240605;
        b=VHTzueGBWKGUk6VcIqb2dHbzIZS1fC1zKkqO4bAXtUEIZrMoIgnmEhjMW9VbGcFS9N
         OqggH8oW7qCgpFkAVnlqFARt8i8XSmQcl+FlQhLFlz5ht/vstIHBWnOoONB382Tifo8z
         Xy6FT2/ta9qYP1a+Qww0nmeFvqmOCyiXAA+u6bXgSDn+gVKI5nra2Nw0wztr5KLZKpAm
         YMCYhxH/lDh3Zvn+34zMgrhah5k/iO2IXnj4i3Gud2OM8STKctUifbqwAvYmv7M25g44
         PbSQ5KTQbO7/Tfi7UFAkBWchr+Un88O2BCvw7rDaBnGTJ/evrc6Cerwdqw1IK8A5VxiA
         oW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        fh=B4MrEMmnN7tvb2N8BwZOJbLEWO0zmdgPGQ8aqjCByn0=;
        b=UfeIXXXl83mD6CPK1mhOHR3EFRt6qWG6atxQoySkS8BYLTtTvyipMBYTZMpOn5gU62
         SwUBxD3SPZ1aHAK7+IYdljxoYmHbrzC113DfvNC4k7MDrmpRM0wd9kC4WKQKNFR03JKh
         C3JOge3DOhWPagKRtmAjUNacv5HaUkyMCCVEoO4NfKiHMknkbFu/8hRypMbUBSoI9Uyn
         fHPpsVp52+ma0QwR63df5weMQIe9jpLcMylGnfqQrY9vDTiW8DSMU9E9GDz+u7YG9Ngc
         zlGUX7pS05GZyVFV0xJmiXW3/HarOnlm2Qo4pmTz7uZpfeO9DFjba+twRCnphsfC+yCJ
         evjQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768907280; x=1769512080; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=Imm51V9quZPlPviq+NRVtXjOcWUBIJk93zvawx4Dq9+v1RcPnf+CgrW8thay+nI9xC
         RFvoZYfcK/h2oJVIil/gBKMysND8xEGXlVCmvIkwdKDUrYwP7JlZaD0eEu+TUCqMHm2Y
         X+76idoylXyzmozUvHNxyG5T4zkxXXa/zBNFFnnhKoW45oJ6P8kTK9woSQuTQJMVrW4Q
         E1+A9hrLYqNWKdN/d6ZJkDqTMwGfkhlZHjntWaMCll6fMpDiPk3ph/CatRoW5yyR5GzU
         lL0UU0kbKWS757Djp9avxaUq0adhpqIJJrCKelk2v39t+CwKx3RKgbwvYhERZt6v+det
         RCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907280; x=1769512080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTp8D9aHKubMXvdcgA6NueZbNBOyUWbHG0j1r0Ye+Vk=;
        b=hOyBwcTFziaddoKYTFjg326HYecEdLWFykpa8R1P96V9LDBojNIROsKo9vo/u2e4CM
         svgPSz8ALY6zuyI9aL4mcMmrQi5cC5M2c6VSRKQvkg82aYKX57v20HCW1AllnQPu4vT0
         vaaDH7t6vbI5XJOsN8/OsompEiCxMGDZ7AeQsLf9pFfMJ9iXxGyHadcU4rcoo7MwBt19
         6dut+ij6ueaAQlAZtVHnVAwTpiJ+Y8g+9XxWyKUmc/2c4zcGQ2tFVt/963/2RGtlWFel
         sNF0ibo9jVWxlNZeMpq8OMkWVwNBoGvZrY/umwiNBnRBa3tPAc1XwEUeS/LQobkMzhiu
         N3sg==
X-Forwarded-Encrypted: i=1; AJvYcCUan0BdPzIiMKmFp+kHhT4MXanddXwLEZHWvceuw4dS8Le+hQKJg8Hwufz+YLLnZNCEdWCMAI9JAVh1hRQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7MQ76ovHFr2aiyRUlnm/AsqGBB5tHujZ998SY4tS2dNKVEk6z
	RxmM6xtzpoakQIiuUhOa6zkowCCb2dvX/EZiASfPt8YVcny4y5NT2EdBQ5DiEtR4XagEvrmcbLL
	DbWgXVZ0pg4va6akZnnRfsOMnbIcQkvA=
X-Gm-Gg: AY/fxX5gBqDBh1jzPekozNO05HxGrE3ovZfWzHgFIcNQEmmoerVpL9hXZu7qtXRY7mU
	iWH+CAmEo61KRIViqRYtj2k0yPjApU29OzxOfv5i3hiKZPG/ryqZtieD3hGKI/YBtOqEXQgCGgp
	HL2cPHzX4jn8nHC3qddjNW2VSehSDzBEAkgRo1WSRMkGPv/Cga36+915So0Pc7FunJL1ivQT1ZC
	+eoN4QhLqkGyPJ1/dSL+LVwBfbQz4LhmGsV4wjZHlFok9+RJNjjecrAVztwN1+WfqotH0ZDv5CZ
	V/xmSw==
X-Received: by 2002:a05:6a21:3a42:b0:38b:e70c:6406 with SMTP id
 adf61e73a8af0-38dff36821cmr13408140637.22.1768907280519; Tue, 20 Jan 2026
 03:08:00 -0800 (PST)
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
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com> <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
In-Reply-To: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 19:07:48 +0800
X-Gm-Features: AZwV_QjlRWGRppxCrBr9lEF7AFifqLu4-_l_Wvfec_Mh4jj0zdL8Z4fH3sbuZEk
Message-ID: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:shengjiu.wang@nxp.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:XiuboLee@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16066-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: E372846DDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > There is no power domain defined on i.MX952, so make power-domains to b=
e
>
> There is no defined or there is no power domain? If the first, then this
> patch is incomplete. Please read writing bindings part about complete
> bindings. If the latter, then you miss constraints ":false" and commit
> msg phrasing is incorrect (and remember that in such case you won't be
> able to add power domains later because now you add complete binding).

Thanks for pointing this out.

There is a power domain on i.MX952 for the mix system of AUDMIX.
But it is enabled by default,  AUDMIX device don't need to enable it.
So can we make the power-domains to be optional for this case?

Best regards
Shengjiu Wang

>
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> Best regards,
> Krzysztof
>

