Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1F76C62D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 09:14:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qtEEl1wW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG3B25Frtz3bX8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 17:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qtEEl1wW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG38r5xstz2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 17:12:59 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so415937a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690960377; x=1691565177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjxrCLS3cadHatyI0X73qAxEEIoqBtkiSqn6zI48PFU=;
        b=qtEEl1wWBPiXWXTuEIEBv7RZq11mEMXySpGXNhrEJov+ENEjlslfHzDaZO8BGLhlET
         IfqsdtoCbaiiyZrnbLedqJWvnCqNDNgrp7gxgIpSOlznlKmKAytWlfuxVu+g9+ceywM5
         fCghSUNp0w/dxO/SfQk8ktDqtyKd5LBJcNXBQ9S9rhJJ1QU3NyphcHwlcxT4gMpoHZBw
         Oy3WB6DNdl+s64AunvIll966F/KIyu6pOmp0fv4nwjkrETLG+vNloKtMb5kUWl5+0IvN
         fFEGXXnotoE4LW6N1jXQNbOxrB6HD5acYFZRLk/EEv5v8bz9PwNt9t6Oq8Z8Gs1XTooR
         pCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690960377; x=1691565177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjxrCLS3cadHatyI0X73qAxEEIoqBtkiSqn6zI48PFU=;
        b=I/lJwPM/eATNHv+h6d/ynAlGzSLGw/i5n+o/RKm0WPLy3V2ncDf4+qFzrwy8lznhKW
         j7vZryO+dRn8TM2r+YKj/W9eYJoZBLDivYg+RYPycxL73RdNdQWo8Pt1+UIxSuSUiDD8
         2jZ4wfuYZ0mU3DUSUR38sZsvDRB8QYWae7eiMwPTGgd5v2oUNxep7WhA0m9j1fPYBPJp
         WFMqLvwrojwZ/Y0eFaNbTlGYEzyNBlS9gjJM7902yhn4RhcRZEQMr5aHsO4Ix3OAdKPe
         fprY5OtKJOKKPswXkdx0wnW6gMCQtEeQsdAZob6kDjG94eWoKMH+ILEC3P5eJC5nBcm6
         3Tqw==
X-Gm-Message-State: ABy/qLZ8H2Pd+U343qXtUBQFcLuw+wFhWQirEtRl+GTjDbCxpKP8taCk
	Z8XoL2UtVOKKhdpjIMwJSVZDxwQQflDsxM/fyck=
X-Google-Smtp-Source: APBJJlHC33MnC4vHRx9ZtDX9wNMk14xZ7mUaL2MW/X8yj9rXRade2j8zWGlUChySW6lC5l5SeDS9LuM99w88FSG53fI=
X-Received: by 2002:a17:90a:e602:b0:268:220a:7080 with SMTP id
 j2-20020a17090ae60200b00268220a7080mr18220320pjy.2.1690960376616; Wed, 02 Aug
 2023 00:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230802052117.1293029-1-chancel.liu@nxp.com>
In-Reply-To: <20230802052117.1293029-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 15:12:45 +0800
Message-ID: <CAA+D8AMY=EG8SYFOb9wmoBcr19qqhMpw9OsTB6nf119G6Li_3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Update the register list of MICFIL
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 2, 2023 at 1:21=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> MICFIL IP is upgraded on i.MX93 platform. Add new registers and new bit
> definition.
>
> changes in v2:
> - rename check_version to use_verid to make it more explicit
> - rename fsl_micfil_check_version to fsl_micfil_use_verid
>
>
> Chancel Liu (3):
>   ASoC: fsl_micfil: Add new registers and new bit definition
>   ASoC: fsl_micfil: Add fsl_micfil_use_verid function
>   ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

>  sound/soc/fsl/fsl_micfil.c | 100 ++++++++++++++++++++++++++++++-------
>  sound/soc/fsl/fsl_micfil.h |  64 ++++++++++++++++++++++++
>  2 files changed, 146 insertions(+), 18 deletions(-)
>
> --
> 2.25.1
>
