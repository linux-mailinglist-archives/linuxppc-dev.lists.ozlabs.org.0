Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD0F6F37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 08:49:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BNLh6nDJzF3sk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 18:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gvu+8N/l"; 
 dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BN5L4z5QzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 18:37:55 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id cg2so4485050qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4Zb47p2XPwOCswEiVCxFP3pBYMa8dixjcKcMTAk1Xk=;
 b=Gvu+8N/lhR7xyJ0lGg6oiJJrH5spP3uTiLTY1hjI1MQw7T2ABX41o5lsHenviAHG9e
 Lfax9OZnTplip+abpfLRUNX3sr8mCLZyv01XVtD+uuObGt5p/ShA4nfi5nrooxc2l0xR
 q8p+MbexiTGoAT5xg4F1AFUwJ3lZiI3PwB0lJeTFffms9sRF8cm3hlKgDIFvpj0MW9CU
 s5d6s/uQ7G/7saHs+tYTUrm/1UXYhR+Oeui90reYAfFE0Z41w18BqZxZNlBcUNiWozBq
 K2SjQ6OOgFyJTqyGsJqx/9dNCr60a6pmjVGB/+s4bonMwDVTYCZy+ar2pJYDVR8qS4yC
 xXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4Zb47p2XPwOCswEiVCxFP3pBYMa8dixjcKcMTAk1Xk=;
 b=r/tfeRDp2CDu+gbs1UBjEQqxOACpSR1reQkexXvkxTLb7IPslDJYD6aFgVHt7huLAP
 L4DwIf3ord8cZcE/qY6FlzO4TrWp/0Ynqw7Pu22KU6i8H1X57StSCMOEiXFKDGutTJz7
 Tdz5jzmOKOkZcpex8Y4cJqxtA5+WObfCr8/w+SadaxQkaVia0g8/IdEhnieS6EkhZ577
 Oihg3DkfGzJOJVBQsbVLoipbVUUqeCV3Bp5Q7ZnR51xpeR3Krc0PO2sx6eHcx4hisxix
 O9dw8dM2ygE+F+1/PNs8110RWwsla277S1h3+Eevqlt2vmDgVoVFBwHh0XlnYHlvEH80
 9XwA==
X-Gm-Message-State: APjAAAWO+VDT8cTBK3tsf1oakj/flAZdApqMZnxsjocMYSQRd3G+g4Gh
 kXoWjeCkkLeTpFyNmCFzj5CYzvX/NnEphsH+EeQ=
X-Google-Smtp-Source: APXvYqxpJG9+Wp9uWvq5SOdQ0ClpNoEw5Bq9RYcUBHDxKCS9kLWbq+/2zfW9+9hTfC22q3nUJO9pss3ALBiVuNJqFsg=
X-Received: by 2002:ad4:538b:: with SMTP id i11mr18033921qvv.211.1573457871628; 
 Sun, 10 Nov 2019 23:37:51 -0800 (PST)
MIME-Version: 1.0
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
 <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 11 Nov 2019 15:37:40 +0800
Message-ID: <CAA+D8APXbQYTUBpaPSBtK7J3LfKL0LA8sXrOomEaHTBjqpOV6A@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 11 Nov 2019 18:47:54 +1100
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Sat, Nov 9, 2019 at 10:48 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Nov 06, 2019 at 03:27:45PM +0800, Shengjiu Wang wrote:
> > Audmix support two substream, When two substream start
> > to run, the trigger function may be called by two substream
> > in same time, that the priv->tdms may be updated wrongly.
> >
> > The expected priv->tdms is 0x3, but sometimes the
> > result is 0x2, or 0x1.
>
> Feels like a bug fix to me, so  might be better to have a "Fixes"
> line and CC stable tree?
>
> Anyway, change looks good to me:
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>

Ok, will send v2.

best regards
wang shengjiu
