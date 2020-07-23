Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A622A711
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 07:48:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC1b3381rzDrB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h1NFcx22; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC1YK0x5jzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 15:46:44 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so3844505pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 22:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=4Bsv9nIgqKmSYSIOMPedKdrcSWXd/PYFSO2aIq/191g=;
 b=h1NFcx22ZnIuEzuWbSbkC3x7IEN9Y2dN6+57CJu8RbnCZqVp91BCoOWxD1R6Zx93Sb
 lo4nx9IxNGFCzW2Vz6QX3Plltlj4h16/LmJ0YIpIuapYsFxfeqrNXg9VDLvCy2d2UU/J
 haOQ4c/cYL4G2Y4SES+dw1eVWHBr7SQGOS22NA2U1bvjwxKAggTPT31ZqEZ3WTNy+Z7d
 PMLE8ufxcP4Y16XHvH3S/qkr0LjvrGNndguO5t1XbH1XujDd0rCNUBn2mcdMWQrhslMf
 sTP8OF/bVRL/XHpQt9lGLV6hdQRH5BtFSe/3/rFD60TtGwM6GvYDM2P8XIPmb+ZLPh6Y
 afdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4Bsv9nIgqKmSYSIOMPedKdrcSWXd/PYFSO2aIq/191g=;
 b=QuMUDykFlKfpfw+T904E95vYbOeP4YO72UPUrW1HmlNMr0rA5yq/QpMH/1KDC1H4Fx
 PrGDlpmMyhAEeh9yMX/hNWgAJYscIpszzBh56LvJlztt5chBNyD6MHDH2NrFNQqV8mEc
 1MZeuO+3XHTkyhb5Bni/+paTYfmTMtxXMfGLJDWkjSXNeq1bfqjAz5/WLdr7ALMAr9rw
 xljYONzPfGClw5PlvtzK3JJRcigSBktc7II3QURFryXkFh9eBBH1Rej+6TQWPjbF7ddL
 cU461m0XqHGVrN7HQNfO1W6Vl9Ru9rI/+duMWhOtvqo7l9LquGwFknvxXBkqiJOWyQip
 ktjQ==
X-Gm-Message-State: AOAM533DIDiupAQgvGs4zqDplZlUeZGP6NLn9OF74Gf87qDzTmWnhjmF
 2aTPQc3Vaqe+9hsad2yvE+k=
X-Google-Smtp-Source: ABdhPJyIls34k7x9JFSOkkgOqf1QQEkFiI5YZQPlp/pPPicar1BpkkeJw1obLQi4kxe5E1ASY31oLg==
X-Received: by 2002:a17:90a:1a02:: with SMTP id
 2mr2574014pjk.150.1595483201112; 
 Wed, 22 Jul 2020 22:46:41 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u16sm1295001pfn.52.2020.07.22.22.46.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jul 2020 22:46:40 -0700 (PDT)
Date: Wed, 22 Jul 2020 22:46:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200723054604.GC5476@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <abdd7265-43d2-49b5-6afd-70d65baac30e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abdd7265-43d2-49b5-6afd-70d65baac30e@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 01:16:42PM +0200, Arnaud Ferraris wrote:
> Hi Nic,
> 
> Le 02/07/2020 à 20:42, Nicolin Chen a écrit :
> > Hi Arnaud,
> > 
> > On Thu, Jul 02, 2020 at 04:22:31PM +0200, Arnaud Ferraris wrote:
> >> The current ASRC driver hardcodes the input and output clocks used for
> >> sample rate conversions. In order to allow greater flexibility and to
> >> cover more use cases, it would be preferable to select the clocks using
> >> device-tree properties.
> > 
> > We recent just merged a new change that auto-selecting internal
> > clocks based on sample rates as the first option -- ideal ratio
> > mode is the fallback mode now. Please refer to:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0
> 
> While working on fixing the automatic clock selection (see my v3), I
> came across another potential issue, which would be better explained
> with an example:
>   - Input has sample rate 8kHz and uses clock SSI1 with rate 512kHz
>   - Output has sample rate 16kHz and uses clock SSI2 with rate 1024kHz
> 
> Let's say my v3 patch is merged, then the selected input clock will be
> SSI1, while the selected output clock will be SSI2. In that case, it's
> all good, as the driver will calculate the dividers right.
> 
> Now, suppose a similar board has the input wired to SSI2 and output to
> SSI1, meaning we're now in the following case:
>   - Input has sample rate 8kHz and uses clock SSI2 with rate 512kHz
>   - Output has sample rate 16kHz and uses clock SSI1 with rate 1024kHz
> (the same result is achieved during capture with the initial example
> setup, as input and output properties are then swapped)
> 
> In that case, the selected clocks will still be SSI1 for input (just
> because it appears first in the clock table), and SSI2 for output,
> meaning the calculated dividers will be:
>   - input: 512 / 16 => 32 (should be 64)
>   - output: 1024 / 8 => 128 (should be 64 here too)

I don't get the 32, 128 and 64 parts. Would you please to elaborate
a bit? What you said sounds to me like the driver calculates wrong
dividers?
