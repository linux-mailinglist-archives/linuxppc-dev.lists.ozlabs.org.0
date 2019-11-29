Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96D10DB64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 22:58:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PpL72k8mzDrG3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 08:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+Urcqkv"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PpJG4CjyzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 08:56:59 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id l14so23564738lfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LD4rQhoJx4ZWspvu75ddE3vIc7NmBG4blVspw65+Ak=;
 b=h+UrcqkvvN9oJJUK//cTB3MxoQBX/E+7ZKK7ZuLVAqkSaZ8unS864P1OMcS1vg2a3Q
 +4hoafy8DD/IG50/pEM2wJK6aDj54jKpzntXyDmHkwT0XCSKMnhW5wXqQHwU5iySfKyI
 GLHLk/7hxanv+rwdJB71FGUDdvqK97cyLo0aXVEddkXDmk27Ea0GYFzpktLN/T0aDRkY
 TMdWqD1JB/lj55gA5rZtU8T9+fd8UNhzgnpdWdjo8z5fUCGleC1y/5GGEhn307QxsjgH
 +lwUR/Zz4+wufbCuGvtgMx41MPXI2I0K7PC7na1MIoQA4ppYUzHnpljncGPzRU7HKyMX
 9ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LD4rQhoJx4ZWspvu75ddE3vIc7NmBG4blVspw65+Ak=;
 b=PbSFzIkDz9dGfVaYRA+QkYCcPVGMk0SCJgEO6A1Ojit1rnpe2Q9YyPfPxfFBKTYp+8
 L4+zevmGIp7Zl8udpTdi0txc00/ad6fPk5nesaiwXhrH+IBPZMjUDzfNzFGQlL+g6ibU
 VQ8sJSoTmdNe1Zx9Pg8QuaAdVGpWEMxkkBHrm//Uu0tkK6bcKSIdZaG09LNHC6a/9zKs
 bh9w2q4U7DY6BUx99KV59XyHS4GLd2WrAk5KszjTmTASs2hWlod+rfPtg7mJIDipQykC
 i1KG2RDuoWV8pz9JtBWpRqmimbpztOHJhIqI+OEGuOXJ07OeKiiebWibDMibxWtf/9xL
 WFHw==
X-Gm-Message-State: APjAAAXSZ0+OnLTdLXyoknXRb8yyhjKbfCXoBFBpXgw0MOqHquMBBcdb
 +WSREnJVxTVXUNXNrN3eoAihI+ny7n94r3g6qFc=
X-Google-Smtp-Source: APXvYqzr4BSwRZNjxhOAWUVDRbfg2dtVgVWBqnqcRA37vtO1uegkRbcP0hHi7H8HMy5Gjx8/7y0dzxANy2cw7iFxak4=
X-Received: by 2002:a05:6512:1cf:: with SMTP id
 f15mr5449017lfp.12.1575064611401; 
 Fri, 29 Nov 2019 13:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
In-Reply-To: <20191128223802.18228-1-michael@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Nov 2019 18:57:04 -0300
Message-ID: <CAOMZO5CP6ohaHqv5qy=RAisjiYQ6pO9xqGfKbHDzQ77gsm=CwA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: add IRQF_SHARED
To: Michael Walle <michael@walle.cc>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Thu, Nov 28, 2019 at 7:38 PM Michael Walle <michael@walle.cc> wrote:
>
> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> IRQF_SHARED to be able to use these SAIs simultaneously.

On i.MX8M SAI5 and SAI6 share the same interrupt number too:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
