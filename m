Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D600F2050E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 13:37:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rkmB1fqSzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 21:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HyMlCpMD; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rkkJ4fPSzDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 21:36:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id j10so6462442qtq.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4pFgJBI5OCUGefSIcYA75cTva8JFYmUiXoqYx+WyG9c=;
 b=HyMlCpMDocjfKKBdCi+o40gBFKbEJLUZrOAhvFFx4oLGKFgYQ+huI9As79YT6CAjOa
 z2C/Xdl9JZ0KjIxf0z+fW6ABlByiQ5bya+k/eGUH/aF4IHdwR1bTNNip68uuIJe7WlpH
 YMSHIlyZqfTwCdwD010jH6B7e3ALpCGY4ELBk3/yM9GQQH47+gIQ0ImwuYYE2D+5Njhv
 0ym+2XuFqxH3sJwOokUV7b1thTP7Nbqy0B6kLt7X61WBzB3zDn8HOkMNTidrlrHhGmhe
 bjqpiyKJ8IZ+hJ6oXMGZZc8CVPLZSl1qwaaUZry6fOksDMILHtAjkq1qVnFnpIWu5FzY
 mlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4pFgJBI5OCUGefSIcYA75cTva8JFYmUiXoqYx+WyG9c=;
 b=Y6bgb5oNsBdEIRlwVfNVoWRKriQek08pTIhuA8Tpzuc2qYQ39Zc5IdtVybSXN53OP9
 qtpIdBq2QwSg4WrXL53fg/QlBu8PDTt6/khWi0WjbX/eEHO5BH9eu1pXz5a5hxBc8Hla
 a0Ka5kChilQNMP4qSMPlVFDeGPfvRH430RlG2odOoQUABMDrAUG5f8k//LDgsKyDwwhY
 IXKVh5+c+mwhh1sm3tUtb1+1roK/T4sf+o+JkWUna5PdOPrarz8/58LZ8ydf8kJUmgzb
 TctHpajzLIiwYZTXBwEaDLO7BddzEeIHFAE4kfrpYFnSz7X1TgTWMMMY2AC2VkLQ0M5M
 7bdw==
X-Gm-Message-State: AOAM530rwqvkuaARbVUW2oSO6sjqfu2GdwULGK7uZ7yuQMnaQfQ9h5M3
 jwnv+y1+8q36CW+9p8WsyEJOvk0LvA7GedHAd5c=
X-Google-Smtp-Source: ABdhPJxO61T03lcfmOJXo9ryxEyKF6k7r6xNQ5tVWce+sBxYQ2LVJuylLY2ZNsYXy4zLvna194XXAG3+GxjVNzCv12s=
X-Received: by 2002:ac8:41c6:: with SMTP id o6mr15036092qtm.292.1592912162502; 
 Tue, 23 Jun 2020 04:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
 <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
In-Reply-To: <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 19:35:51 +0800
Message-ID: <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 4:55 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >     clk_prepare_enable and clk_disable_unprepare check the input
> >     clock parameter in the beginning of the function,
>
> These functions call further functions which perform null pointer checks.
>
>
> >                                                       if the parameter
> >     is NULL, clk_prepare_enable and clk_disable_unprepare will
> >     return immediately.
>
> The interpretation of these function implementations seems to be reasonable.
> Would you like to achieve any improvements for the corresponding software documentation?

Which document do you mean?

>
>
> >     So Don't need to check input clock parameters before calling clk API.
>
> What do you find imperative in this wording?
>
> Another wording alternative:
>    Thus omit extra null pointer checks before four function calls.
>
> Regards,
> Markus
