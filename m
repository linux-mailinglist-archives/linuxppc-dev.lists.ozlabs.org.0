Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B793123AE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 11:52:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYQvl75KDzDwkr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 21:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=noTNyG5d; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYQbZ1NrHzDvb3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 21:37:59 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id a19so11658274qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 02:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ap599Dj3UpmjlEExN+HPHzrzAs5oC97knPOjfcxhqlY=;
 b=noTNyG5dIpQ78mlmDpVRKXocG/8cU9E2dPSLHCT5u/6AM93GxMkWseSTmtZluCtC1u
 yE5ODBsUkFhPI+cAMajSBteIYEvsPPYS2ZOtmyoTeKzwGhR7jp9fcNyFARH6i5nGTgpM
 dXIUcSDU2sqxPlveeuN7AeubyOYqy1+xDMckILo7G5EztOQHSa2bumrX7mmH8ejtOICW
 XS95baFArQRo5qKEytXkao+wg+G9gdoie0IJ0DfySUx7NitTkJDB6K8qIQmqJgQy9EoB
 obvTdTIw4DgJAEPX0FRe4xg6xXY8KwR5bXv2W6RpikxELGJHmk5gHyO3qR8Ly8FQACVJ
 ns7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ap599Dj3UpmjlEExN+HPHzrzAs5oC97knPOjfcxhqlY=;
 b=C9g6vn3RfMfxSY9EXTgWxjaSfg8hDR3JL9ZKk1d7utKVJuD7F2oMdnfpYZfIgXTakT
 nlduHCupFTNjrS5KtkA7SGMW/V8Z6/kG3pG4MZW3Ml3SXTNm9EPwUrdz4rB0/NoNBhVc
 +zxuyQy+2EadKZ3S+qybqpeoRuYzIZ5o/gHAhN5Ay9j7MyBIW9F2SLvqIzAKm168FxFv
 nyoJokQvzryMYEHd0WkAiJvambrtpWa58/BszHi8UyRZ+irWcFBqLEUr/nOVHJPI0ciP
 0YgHDh5Q3Xxyf7W8CIJOo5JzJr/Vwg5t+sZ2F+9qb78jYYBfIwM95ZYncWWzUYq1drCW
 6+Eg==
X-Gm-Message-State: AOAM53019SIikhz71FujmQ2jYQniluFmy4xdE5NXUR5aPWMjpXJhXwDc
 5tMJiH0/dgNq2zY9F7Ox7XgzYkWtlkoeak1gFwE=
X-Google-Smtp-Source: ABdhPJwOiqCntMvtBeLH6QTT4MVjMi7lbWFN3oPd96+54QjdFnCmwrjWuqmBTwR2S2IpLCGHI53PWyxqwimbdTER1/I=
X-Received: by 2002:a37:a955:: with SMTP id s82mr12230755qke.121.1612694274969; 
 Sun, 07 Feb 2021 02:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 18:37:44 +0800
Message-ID: <CAA+D8AP4gfZ2FzTH2LOB7H0SRCYR0TBrAKLZPgpTUYq=bp0M9Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: constify static snd_soc_dai_ops structs
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 7, 2021 at 6:58 AM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> The only usage of these is to assign their address to the 'ops' field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
