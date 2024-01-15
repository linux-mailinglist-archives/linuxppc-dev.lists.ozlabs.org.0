Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899782D540
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 09:45:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fS5JOKSG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TD5MH16vSz3bX3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fS5JOKSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TD5LQ1QXgz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 19:45:00 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a2d6ded84fcso100735266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705308297; x=1705913097; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C76vN2UDn6EUDP01K9KG9fUM6gU4ZfDAK5/kbr9SnI=;
        b=fS5JOKSG9gvE3itRt/G68JCNCnHsGePrV0j5/qNhv91WY8a+xzMslz83N0q4x6E4vN
         /eEdcRhcbrsWqodnQ94R+20WB93f4uxn95F11OrgPv/Qdx2JFSFtmWL4yIHLJ/96psSo
         1pQKrafzXl/j4hADzO9zum3lunuUmKCnFwqXPX1d9S5+MA1nYZ7aDvuzsCd0Ym8itdk9
         lKCB9JCrJy0Heamxg5NNGauWHgSfEjIPhvUgjUe4lEcf5VStY5YMeIZEedHtk1SgK4sW
         qaGzMs/SyvP8q9+jM8Ry5E1FNgI1OgV9O2w/iuhbXWWEm6L8ttDZkJiIsZYHVQo4wQIb
         N9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308297; x=1705913097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C76vN2UDn6EUDP01K9KG9fUM6gU4ZfDAK5/kbr9SnI=;
        b=bwt3HEEblBmjAzxgvwOFCbPpDsNcsrI7d+i/18QJ2kDS/Sron+Ry7Y669S8+lgay3m
         c6ylIekA9W+hk2sai083ZsGrjAxhPb3HJcULtnMyrCMojbauRo9o0DgKNvUuRO/3mwja
         rgmm5iPXpyz80lGuUF0Sm6c+OaHeGqt8EJHkflDm2e4PCjX2Sc2sw/L1Z9dTwwIKXMbe
         t7znTBtPYuTNAseTJmkTUciBb5ZYRj86Pi8EL5RN8eow66Q8OAmZR+zLp/UAkuey4j/+
         lkokVffEO1MHtwYiOMRUQ5OIGP3mljvgMqONmG5/w8xlnpM3e+cr+z+4coBYYW/c54W9
         QSaw==
X-Gm-Message-State: AOJu0YyAI/iKNWRGPF5czP5N5/MkOsu7PPb6DN1bH5sa8oQUw/24I3M7
	yRqJpUT3P1GBU5kQLUSfgu3BAXTk+V/cDeht+g8=
X-Google-Smtp-Source: AGHT+IH7nvS/JdO/EzfUQDdzm0WV8ZdWqB1u3wrr0534j/vihMpugOZn083H8/xbA9kXJqWmr0IeLilNh0zeciM1Nsg=
X-Received: by 2002:a17:907:a80a:b0:a2c:aff6:f6a9 with SMTP id
 vo10-20020a170907a80a00b00a2caff6f6a9mr2469795ejc.150.1705308296578; Mon, 15
 Jan 2024 00:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 15 Jan 2024 10:44:44 +0200
Message-ID: <CAEnQRZCT31ti278aLqh1QtTQ33fJU6xnb_qoVMRooBi7WsJ6Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 7:44=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> Support SAI and MICFIL on i.MX95 platform
>
> changes in v2
> - Remove unnecessary "item" in fsl,micfil.yaml
> - Don't change alphabetical order in fsl,sai.yaml
>
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
>   ASoC: fsl_sai: Add support for i.MX95 platform
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
>     platform

For all patches in the series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
