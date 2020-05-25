Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F24431E06D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 08:20:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vn500DvrzDqTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:20:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sgLbL5BC; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vn3J1NwYzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 16:18:36 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 185so54700pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 23:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qkQKxQdGGgWdvEooTQeXfQ5Uv6xFbcDpVhOQuc16oUc=;
 b=sgLbL5BCVGnsptyzLFvhBHakHWNFyE7cXapL55cgodXb2vOhXm56MOdyIhCbvyn+V6
 N5SpUnMqMfQTxpDC1oxfNr3O0Z5D9Q+P35dmFRYpwkUHzM7HUXzNKDIN4y3Q/pt4yOOj
 nJ79hm3sG+vkBgfUoOUM7+9/7ASYFUIelrkTzM+sj4p7iYvQyMjNUzbnGcY/2i3fO8x8
 78Xsdeo6b0CdlwlRBVjX9uib/uaYHpQkXdll055UGUGElf7mLUzQphtdpc4wZyA7j5eV
 FgMRfBBTXcDDFYydBzTMFJxhjryo7u9v5GiERnJ6QEtJl9DvihXJrH+0ZCeDrKJ9dyYr
 NrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qkQKxQdGGgWdvEooTQeXfQ5Uv6xFbcDpVhOQuc16oUc=;
 b=Un5AjxdbhV9EdwVGeIDR9okfrOhS3AABCi+Je/PZX+z7ab7IvafFWELR99dSFb6Rto
 MjXHA0PqnlYzgOCY2t/3deOHR1GMFOkcnQY8mr3+ztK8zQszGIE6dvG2a3o1UWx7d+hZ
 dLlUQieM+uPIffL3kc9EHdtoGCD59+gO5DyZzutom3P72e0DsFniixBGpamlt37J08y2
 VC17Z3WHPtFwUWBYBtGkaMZOu4zDhck8wNOwJnSZsWWsjCySuX4wxPmFBM7/q3xJ4tYm
 9bgr89KSC6YyA8MgAKHk7Xowq9XjF+8Guyv9jqBcjV0W7JvCC5QJVQ/A0G3wNvsL4UuR
 HRMg==
X-Gm-Message-State: AOAM530BuPFwsv8zXNI350jgVCBm4DRXpAd68vP3gixv0ABvwT5ZOiJ2
 pVRUA/NbihrDabYHKPX+EoY=
X-Google-Smtp-Source: ABdhPJxg1bg01cddhbRJZVYfWekQ2aQNsAE8dMBcRjN0GaOgL4XmmTFhE2NzLEqiY8iUckwGGjP/VA==
X-Received: by 2002:a65:52cd:: with SMTP id z13mr10751049pgp.259.1590387512418; 
 Sun, 24 May 2020 23:18:32 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 i197sm24018pfe.30.2020.05.24.23.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 23:18:32 -0700 (PDT)
Date: Sun, 24 May 2020 23:18:27 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Message-ID: <20200525061827.GB12112@Asurada>
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
 <20200525050950.GA1244@Asurada>
 <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 02:11:18PM +0800, Shengjiu Wang wrote:
> > > @@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> > >                       goto disable_asrck_clk;
> > >       }
> > >
> > > +     /* Stop all pairs provisionally */
> > > +     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > > +                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > > +
> > > +     /* Restore all registers */
> > > +     regcache_cache_only(asrc->regmap, false);
> > > +     regcache_mark_dirty(asrc->regmap);
> >
> >
> > I see you doing regcache_mark_dirty() in the resume() now,
> > being different from previously doing in suspend()?

> Which is for probe -> runtime_resume case.
> After probe, the power may be disabled, so move mark_dirtry
> to runtime_resume, then regcache can re-write all the registers.

I see. Just noticed that you add a regcache_cache_only
in probe(). Acked already. Thanks.
