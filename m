Return-Path: <linuxppc-dev+bounces-2538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648A9ADB52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 07:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYvLV251Fz2xHT;
	Thu, 24 Oct 2024 16:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729747058;
	cv=none; b=oJZeMg/MQveqdm+0EL2c2cbsxRLNXQUtttG2TbXF7PbaDyL4MTA/xYIr+uycJd8kS1dVXS5EMMUF0rceqysvH/FW8XvXk8yA5vQTezRwblbqq1423iLvvN4i+tPqHGq4nUmfugd11h+cajuKW/9Q5G1veT/lVwfp1PfCCt4f9/T+M8D9uWow/2BBz+aJg8dNEgeoIvkCH0zmgfEpV3OmbCCzEZb/ETg7AcX1ULcoIDqpwi2oon+rLjpqJ7D+SvNlG4h0jIYMhTzJzNIrtubVkqR37N7maaGr4oL95tgHYoL/vGZG4otzLbauu9LVoEalvZhqN3BUeo6iTdeUai5/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729747058; c=relaxed/relaxed;
	bh=ea5E0CUqTApv+zwvwXAvyODO1+mnbcCQh2rAZz+WNMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyrJCJf720yQvTzStCMIcGqMbVS+GkMYnklMVuV2KyERcCefsuFrWNLMjRdWri8sbrF0fVIGyR3XQcGrOqbe4I3VTJQyLZ7171k9jPrS0VnmxK3KOLkT3PNK2UfazLd1u9HMRq3W5xaw4+OIsQ2G8RTkYK8CcMVGq+eDIqX1ZpxOhgudQ8ZOtABY3eGRpneJ4Y4WSsA72izlLsAkEGDPIrF1NZaWW1xD4Gp5JUz0JywpJDVeJZSnPpz01ZcA5kze9BY01jYbbVylMRJARzU9oex1MDBvQrnV0LEi2NN2vAizSSOExLxTAfetdjYt0O/4j5BH+5serTRuz2IKdfkC1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XqNj+w+P; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XqNj+w+P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYvLS5lx8z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:17:35 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a3b63596e0so2052445ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729747051; x=1730351851; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea5E0CUqTApv+zwvwXAvyODO1+mnbcCQh2rAZz+WNMM=;
        b=XqNj+w+Pwq96iVE2TqnqquXDzOoHUk/e9CP2U1DJJ4i8Ahdnpd/GFr7EvjT9SO/qI2
         GlZRDiiYlJFVZnMs+bzT6a3Zt/hYZOLSaGVA0e1XWUVo9+xDkyBLonmHfsLgex3KxUP0
         JzIQFl5uGwZVgZn1WTeEEDh6n5vdTDdFmETITorzjJKv9dJXDyHcEFnhCq2mXMMJOeVE
         xzPhCMDhnik/T1p28XET3tulr7Nu27uhd+G3F6V5YGh7lHK0vp1h9IloJs+GCbs7uT1E
         rkj9NAW6Wf6iePINGcMvFCh/+sW/ZyGxoj4L/7mEVAEetOSOcN1AFfSvBWSWpl2QWmqc
         9jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729747051; x=1730351851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea5E0CUqTApv+zwvwXAvyODO1+mnbcCQh2rAZz+WNMM=;
        b=RftF6CVADfsOUyFdODm5VzX8JD1UpqZ5fIOkGo6T820DHDQTWSMhuP4NzB+bZqaXOu
         Nv497ruLwvwq03ht8sQ7rQZ19HX8jhs3nKXCeay2G/nyrRLC1WvVXISYhgOXKUm1nIHr
         zRoqzaEBEXhPChxwu0BDUloyBe3kZvKslJn4IfcQbWZlXsGDOE0mKi7sQ7lX9jJU8Edh
         QJp/QU3RSBJmfXUFmKV2xxACGiKnaqL0eNx0ujTSBPSK7mE9McxN1+ij5A2netzA+EpL
         BkdeDAHkH0YMhvlqNRmLCy/meUgsLIu8S6B+2qxKSPEyXpgJN7ZB0ADOrrezDUCyK6vE
         2m/w==
X-Forwarded-Encrypted: i=1; AJvYcCXS+LU6a9u0ZXx84sz29oStCwka6nTsd+A7YJS3Z/EFUIV6N3dYRteKLBAYl9qk1sj4TcOwIxUAcZ3zMu8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2qsOwCVQz92m6tCvr1I81tg7ICzrvxJPLLUAZeN26URz7LQXF
	8GMGm5ksvRcWh3YIoEyFe7BEZg5SxgYb22ZIe8LC9+nypmNin7CRMZL0kVaWgk/ixuKdkusvbwM
	rty2qn/OK42hSvve8+MtG6pC4s6o=
X-Google-Smtp-Source: AGHT+IEDNxSK8qOUKRknMFAvP1j4nHhQxGJuBuCD0rhR+4p1pIEFITHngRl61dN3J8puKbloY/+3j3q7ZwSl+ywaA+A=
X-Received: by 2002:a05:6e02:5aa:b0:39f:325f:78e6 with SMTP id
 e9e14a558f8ab-3a4de685e50mr5077685ab.0.1729747050765; Wed, 23 Oct 2024
 22:17:30 -0700 (PDT)
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
MIME-Version: 1.0
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com> <ZxiKdpeuIhe/DiV4@vaman>
In-Reply-To: <ZxiKdpeuIhe/DiV4@vaman>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Oct 2024 13:17:16 +0800
Message-ID: <CAA+D8AO7f3z4oetm=2wseSAwN=eFnNePK8VnC31mNw-owZF-ig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
To: Vinod Koul <vkoul@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 1:32=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 25-09-24, 14:55, Shengjiu Wang wrote:
> > This function is base on the accelerator implementation
> > for compress API:
> > https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59=
911-1-perex@perex.cz/
> > Add it to this patch set.
> >
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the patch 1 and patch 2 is for ref=
ining
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > modules.
>
> Are there any patches for tinycompress to use the new IOCTLs here, I
> would like to see those changes as well

Yes, just create a pull request here:
https://github.com/alsa-project/tinycompress/pull/26

Best regards
Shengjiu Wang

>
> --
> ~Vinod

