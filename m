Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587AC59699A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 08:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6yvv13tJz3blw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IOxuVGEu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IOxuVGEu;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6yvH65hdz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:35:37 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id h1so6233325wmd.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 23:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Pl8j8nMikEGLv3auuJamJeuxCXOj7rX7d17W0lTlskY=;
        b=IOxuVGEuuWrhB890xfIpMhVaObL/QznrYMLo0MDJU8skANXcLIpC5rM9IZj9P1k1S9
         RTPEAdpwwl4G0dBwPFBLTa8u7oyRnV9YiY1/D/muF5gBw8zwSV/R+RccjDUHj6/ThBOT
         OV4PiVZqQvt1vUIAoHq/jUZDO3oIqeXHxJK/d2FGT6CLpVYrMaQyZqRk17hxWFlq9Ci/
         LO2AmqpVa4X9M7v/2LShjYzdQUVjSQM0NRDLDUGEG8M1tq3ELCylC683JyE9NYHh4sgL
         sHHHwPUJeHmp17fhNCvWy4DcEu9PEPM5zQCcwH05fw+IjbjE3IShAewKoqv8ZRiSdGL9
         0frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Pl8j8nMikEGLv3auuJamJeuxCXOj7rX7d17W0lTlskY=;
        b=d3XBzpKpTo6Lyzs8FHqfhpe7Ke7b/8aFNJC3DnW7zEmQOFBpQpmzkFwSsIZZO7eSWX
         efxKOqGW0+lCNVq9QyHY+7WKSqq7oqErOqnujtJJ75PvRZySLHQL9tEKg9nXrn54+JJg
         vqZSfekSgfOoATINRaTGDRcOgb2NPG2ldWWsNLxrQiOyvaaMgEPspNimXz+XM2ub3jRu
         04n4/5TQ+ZhCoMak9Ewsixjkix90m9JiByPBY4eOxBZpVB5by4zar4Lnwk4Gexjni3m0
         IqySji9BQfc1ZDWCixxZqi6sF4bK3f5NTewxD6fMQ2uU5h0izDrPe7KDUmvwh/A7Y69m
         qkrg==
X-Gm-Message-State: ACgBeo0AribdvCbZQ/4QPajLQPS8Y87aS+HgEc2XmE7XSey8OAEI5hwA
	+ziMo8pE9kd3jAWqGEfuQvjxm9yy/WapBIWjoQY=
X-Google-Smtp-Source: AA6agR4zBXMqxaZAI8I9XcEYwlBHvitoY+sgQ8XMVVj+73mhQTWSmHQhCEcvwzy9GHQ1Z5aLc69TnVciuWCbsk4WbM4=
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr1114507wmh.83.1660718133588; Tue, 16
 Aug 2022 23:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com> <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
In-Reply-To: <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 16 Aug 2022 23:35:22 -0700
Message-ID: <CAGoOwPSgPSV2HOqC=t_NVor8YqxaLxmeDvMf8_j25phsPpcd4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 11:29 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

>> > The FIFO reset drops the words in the FIFO, which may cause
>> > channel swap when SAI module is running, especially when the
>> > DMA speed is low. So it is not good to do FIFO reset in ISR,
>> > then remove the operation.
>>
>> I don't recall the details of adding this many years ago, but
>> leaving underrun/overrun errors unhandled does not sound right
>> to me either. Would it result in a channel swap also? Perhaps
>> there needs to be a reset routine that stops and restarts the
>> DMA as well?
>
>
> Remove the reset, the channel swap is gone.

I have no doubt about that :)

> IMO, no need to handle the underrun/overrun in driver, the SAI
> hardware can handle the read/write pointer itself when xrun happen,
> and we don't need reset routine.

That'd be okay then.
