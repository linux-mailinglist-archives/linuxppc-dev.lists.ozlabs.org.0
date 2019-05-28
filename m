Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230682C6C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:41:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ctkw4rw2zDqMM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 22:41:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NHfXJIyt"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ctj54bcgzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 22:40:02 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id b8so5651751edm.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ybsMUgY6ounJuaGDtEKhAz+yC4cA28XUN/3YPkPsJiU=;
 b=NHfXJIytPkkYgJ6rar0p4QA9KmqbIkxKsQ0CHv26Br6zjd6780zyDBv19RY/Winab9
 lMf6H5okEJ2jEqcNbR0ApwdBAMFcKg1oOK2kd6e2xaOcE/VJ1qqYmkFA165hAMBNH55b
 wMOdPYxgSh4aQ97AFz73SKI/zi+9OAO7hM46m8Z/kcXS5UrDzaLjzT8RGktH5cOTHGIV
 lXqMWRs+dXQeItJ6SZPReiyJtb9p48f2isx3NR87g1eWDce88MfLS+XnSEyM7J2o7guf
 ytPjeyC9Zk63P/3zCc4kIDmyqf/ujmHbAGdLIPekeNHUnOXwiFvxBDUwktm1lUewEWKE
 gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ybsMUgY6ounJuaGDtEKhAz+yC4cA28XUN/3YPkPsJiU=;
 b=twkZvOY0n6EaaiwABpqGYrAisKFV8l/KqI0HJmWQEt0jLarAIBFMX/bmtP8pG+bH9Y
 seipyOkE7o2L/5spg6ZKJYl/BmM72rqq5LEzKKZnOCxXeDHTRNh5uPPKsyPYEVoFpnkW
 mkaOiaGRRu2o7KNhnX30L3vpuknoUgd3pqJjd5KEmPwbAKafMXM+TVeC5ZcRPujEqYtY
 wDpKxYW33EZHcnmQXWSFEm9I7O4tf569CGsd9+1xNYGMeRC1qMz2ur5Z9JMInYEhfrvG
 r/QbFXvhw4pCDqjMPIyVH6o8N5X2wQWttsgXzSmVH6wIdoOfQO9vMaTg/Pi9yuBCCoAF
 e63A==
X-Gm-Message-State: APjAAAWyIJU/iU32qoFbxvJP22x2F1z8KjSz9OHIZmk2e9sTYxNisCvt
 rI4Bq6BKUeMn4isdts986z9iMQUNKcqKDEKMU6w=
X-Google-Smtp-Source: APXvYqyiW3RuSm/Q5M7JS9tflgiot/Qc9jsuaXF8ZguxiXKGN8hQI2qQzZtasetqxOX7iKiUAzBfDfkTceixKP5vhV8=
X-Received: by 2002:a17:906:f194:: with SMTP id
 gs20mr15974716ejb.177.1559047196254; 
 Tue, 28 May 2019 05:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190420154038.14576-1-daniel.baluta@nxp.com>
 <20190421053749.GA5552@Asurada>
 <CAEnQRZDs_gnS8ehjM2M_y+Yw0Ge-Sq=A2c9BV-g=P_d0+O40hQ@mail.gmail.com>
 <20190421080439.GA8784@Asurada> <20190421082627.GB8304@Asurada>
In-Reply-To: <20190421082627.GB8304@Asurada>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 28 May 2019 15:39:44 +0300
Message-ID: <CAEnQRZD6nNH04xZjpSi7ozL=sNJvJdkEAGAYQStJESeu_2R=Eg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl: sai: Fix clock source for mclk0
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 21, 2019 at 11:26 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Apr 21, 2019 at 01:04:39AM -0700, Nicolin Chen wrote:
> > On Sun, Apr 21, 2019 at 10:26:40AM +0300, Daniel Baluta wrote:
> > > > Firstly, according to your commit message, neither imx8qm nor
> > > > imx6sx has an "mclk0" clock in the clock list. Either of them
> > > > starts with "mclk1". So, before you change the driver, I don't
> > > > think it's even a right thing to define an "mclk0" in the DT.
> > >
> > > From what I understand mclk0 means option 00b of MSEL bits which is:
> > > * busclk for i.MX8
> > > * mclk1 for i.MX6/7.
> >
> > MSEL bit is used for an internal clock MUX to select four clock
> > inputs. However,  these four clock inputs aren't exactly 1:1 of
> > SAI's inputs. As fas as I can tell, SAI only has one bus clock
> > and three MCLK[1-3]; the internal clock MUX maps the bus clock
> > or MCLK1 to its input0, and then linearly maps MCLK[1-3] to its
> > inputs[1-3]. So it doesn't sound right to me that you define an
> > "MCLK0" in the DT, as it's supposed to describe input clocks of
> > SAI block, other than its internal clock MUX's.
>
> Daniel, I think I's saying this too confident, though I do feel
> so :) But if you can prove me wrong and justify that there is an
> "MCLK0" as an external input of the SAI block, I will agree with
> this change.

Looking inside the RTL for SAI on i.MX8 I found that there
is a MUX with 4 inputs exactly as RM says:
- bus
- master clock 1
- master clock 2
- master clock 3

My point is that the DT is modelling the internal clock MUX
used for SAI to select its clock source.

thanks,
Daniel.
