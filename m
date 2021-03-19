Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4D341403
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 05:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1r743x71z3brx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NI0jLE++;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NI0jLE++; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1r6c6tqjz30CD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 15:11:03 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id z10so1639722qkz.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aaqZ5Xka3NFx+U71V6vC4ru0MXh/qF63OiW6ltUtrL4=;
 b=NI0jLE++PD268TEUsgTuwXAQEtQ0DqWORhgI3TDVqilngZgb2T7BzCI67g1UWdZe/7
 OzmvhEbfa+AfFzDtEx0knv8QT1ESOaaPMc/cYIoaSy34gTlFrT8Qv852alxW3Q+lcXJx
 LQDa9dJlw1iqfBK2+zWUq/5cLb30A+nOlfkFhnl0sqXC7v7sU+MumB803mAy9VRrFCDI
 kvWOnjTBj4CeFsPP3BiBGNq1KEHly/IeS8Yjhj+SPwjyPXuAAG8LsZl16S/v53lL0TEN
 9plCewyCIZcBR6i0iazU6D3yd8uYE0mFaZpjsx5l6TMFTy9ztlZf6DxouOTPzldIhzx7
 LyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aaqZ5Xka3NFx+U71V6vC4ru0MXh/qF63OiW6ltUtrL4=;
 b=X7YZ0GZGZjZWGzFA6MHAyOGiP0w7v46CGSWztQRfqX23msR7fjvVEm/Lo87h4tJPpk
 811DDOwqxxEJyt7SKWnBM43O8XcFmNSdI9eFhANxiOrETW3voAqqu3YOlMQXb7UAgYyL
 r3x94lyxrsuyZn+9qQrK8tubDm8bZgt/zme93ikqZkzaBEgQRYYWrC6JJDhdTGy3XZpr
 oovznpMJOJqIj6VZ0Qi5iVVhM8kYbDTfOOfMAXLrXJsK+sFd3lGZpvOgHwS+tz7SGSUm
 2cwtYdooHncma5pxEyhU4OxK3fO2u/1BfpAa2v9azSErjjHFgjSfnzKpi/TOHMGIww7/
 w8yg==
X-Gm-Message-State: AOAM533c4NqTq+0ikvc1fcFwtWGcbciarc3o0Aaerfkbv6m7wjTFRKUL
 45uDE1bhnnHYLqgK1i+JzO72NyTt+Zm4JB9Qz8Y=
X-Google-Smtp-Source: ABdhPJzSglnF+PloSPSyO4A9pea+8tGafdjSrifWXMts+rIqOZ1H55BiTRHYe1r1wfNKoEJ/HxJR8YAxSIn9uipM6Ms=
X-Received: by 2002:a05:620a:102c:: with SMTP id
 a12mr7643841qkk.450.1616127059424; 
 Thu, 18 Mar 2021 21:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
 <20210316125839.GA4309@sirena.org.uk>
 <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
 <20210316134915.GB4309@sirena.org.uk>
In-Reply-To: <20210316134915.GB4309@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Mar 2021 12:10:48 +0800
Message-ID: <CAA+D8ANuUWne1nzGH6=V4nj7YMRczuZ+pH--eJ+ghiGWfo_0sQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark

On Tue, Mar 16, 2021 at 9:51 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Mar 16, 2021 at 01:42:40PM +0000, Viorel Suman wrote:
>
> > To me it makes sense to manage the clocks and reset from the same place.
> > Currently we have the clocks management moved completely into runtime PM
> > fsl_sai_runtime_resume and fsl_sai_runtime_suspend callbacks.
>
> Usually the pattern is to have probe() leave everything powered up then
> let runtime PM power things down if it's enabled, you can often do the
> power up by having an open coded call to the resume callback in probe().

It seems some drivers very depend on runtime PM, if the CONFIG_PM=n,
the drivers should not work.  What's the strategy for this?
Do we need to support both cases, or only one case is also acceptable?

Best regards
Wang Shengjiu
