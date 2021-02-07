Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC331234C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 10:54:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYPcw4xt0zDwcK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 20:54:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pDgcBRam; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYPY74NzvzDvZ8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 20:50:51 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id a1so5633894qvd.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 01:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ4pFx7u5BUDAgelezxkYQyF+xKN7GGALoSIhITUj+o=;
 b=pDgcBRamMSdoUB2BEpAst1f1B9nv0WmaS1Vvz3pxn90Bo2k1jjA+Rmy0x4aLBo07mY
 asda/mt0rtnitVvzATsvxfXHA32w6sTXiqJjs1JBXExweSz1LhjNLHlAe1y/uJwVoXPP
 wMZxM9NPideQw1Zn+3YhCfTxp2iE+jS49MhfAhBXlxoCTbo27Rn9tle+lHnmbjfbFvXp
 X0hAwsQSyOLaIiM0VA16unpVG4z8pP0NFOokUPDV4c6WWuDTv7Mspy8/5jiWRxPdTYZ2
 ot4n0YWlHpRfnib2YaYfQTZxNBV6VLrvkNQtRO3nOIMXZmsratGIKOhZWgirQuqokfd3
 5XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ4pFx7u5BUDAgelezxkYQyF+xKN7GGALoSIhITUj+o=;
 b=TagdLFV9v0MHo6G4dNjOl41r2IicXCUHqOOu9izfVr2TtCegjugAbDcp7GTpysWy3e
 leOz1skToFG0NvaZYD43cs/abQrCR48FK08qVBoCvmF6h2xBASYDAjBttxF9ek8f+7ta
 VdTHQ7WQrylU1LLraB3zEsyyZA0i8dPJuXUFLI0aERGGpAJoKNZZTuc/C1pqN0WN0M0R
 HDIQjEbeHHHYxG98hHKGgIQ7HlXKeLXepQsVmU70kaQ1QAeYrccVH8H/f19WKXRa4UKG
 F3Yqy3EiEKj5VJGQcHaa/tMhnEVhYgqURcDCuTN9GskPlQ/dYhuBF8zHvx5aDuEBURrC
 J6Ag==
X-Gm-Message-State: AOAM533afZ9FUCKcjQJIbCTP1mSyzX1qKm6flq9/+2vTyi8TIooRU4mq
 jnMaFRIQg3kHfkH7MaxkOXtEsEZ2rq0oNzkPFHg=
X-Google-Smtp-Source: ABdhPJy645FIrmGyg3s+S/f06QE4AJor1BtSgmIOXYOPdd5fhNxXhtiMyZ5sAnnbwtjUKTyx3gqZcZrxPegIJKozRmo=
X-Received: by 2002:a05:6214:76f:: with SMTP id
 f15mr11458355qvz.56.1612691446129; 
 Sun, 07 Feb 2021 01:50:46 -0800 (PST)
MIME-Version: 1.0
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
 <20210205145816.GD4720@sirena.org.uk>
In-Reply-To: <20210205145816.GD4720@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 17:50:35 +0800
Message-ID: <CAA+D8AMTyxcz2nXEDemuWRwtORSfRoBRZO03WyX+XpuiOD0XiA@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: imx-pcm-rpmsg: Add platform driver for audio
 base on rpmsg
To: Mark Brown <broonie@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 5, 2021 at 11:00 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:57:28PM +0800, Shengjiu Wang wrote:
>
> > +     if (params_format(params) == SNDRV_PCM_FORMAT_S16_LE)
> > +             msg->s_msg.param.format   = RPMSG_S16_LE;
> > +     else if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)
>
> Again this should be a switch statement.
>
> > +     if (params_channels(params) == 1)
> > +             msg->s_msg.param.channels = RPMSG_CH_LEFT;
> > +     else
> > +             msg->s_msg.param.channels = RPMSG_CH_STEREO;
>
> Shouldn't this be reporting an error if the number of channels is more
> than 2?
>
> > +             /*
> > +              * if the data in the buffer is less than one period
> > +              * send message immediately.
> > +              * if there is more than one period data, delay one
> > +              * period (timer) to send the message.
> > +              */
> > +             if ((avail - writen_num * period_size) <= period_size) {
> > +                     imx_rpmsg_insert_workqueue(substream, msg, info);
> > +             } else if (rpmsg->force_lpa && !timer_pending(timer)) {
> > +                     int time_msec;
> > +
> > +                     time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
> > +                     mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
> > +             }
>
> The comment here is at least confusing - why would we not send a full
> buffer immediately if we have one?  This sounds like it's the opposite
> way round to what we'd do if we were trying to cut down the number of
> messages.  It might help to say which buffer and where?
>
> > +     /**
> > +      * Every work in the work queue, first we check if there
>
> /** comments are only for kerneldoc.

Thanks Mark, I will update them.

Best regards
wang shengjiu
