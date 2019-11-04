Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E617DEF25E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 01:58:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476WWd3btzzF3RV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:58:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=youling257@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9kqiDQ9"; 
 dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4765Wc3byrzF3ZG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 19:27:24 +1100 (AEDT)
Received: by mail-il1-x143.google.com with SMTP id y5so14010345ilb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 00:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HX4pBaoGeNQiQ+yt/czMAU0I4DAG8i9or/oZi9FPxrA=;
 b=W9kqiDQ9H6TBYA6EcpFgXwkd1ww7ZKsT2zyowkzPMfKN4YVvECqYHFNqcisKcs65Kk
 q5u5OPB/FgY9l1YV1ZSKIUBi3rPU9yIYTDQuCkSZbGymlKTuB2FEviFyZWugv98foIPI
 3x9QkmCNURX4PfLY/HJ1CUUuYZvmQxH5YuPrJ9Aqe/SqFCYweQn84SL9R17UI5R8f5Lx
 1w41qnyT3bMi/5NVlEwuLKRFhng03Ho7Hv1RrClIIepNa6dFYP5ePuUS3Fdc4rhOzmrE
 6944AZzIB5M88aKEDACrSUhxtzbdFw6bf7eVXi0c13JkVKXTQJaWqDZde9NYVcjvsI4t
 69Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HX4pBaoGeNQiQ+yt/czMAU0I4DAG8i9or/oZi9FPxrA=;
 b=N6Z2d/M7/Cll/zTz3QX+XRv11UzZzptRbWodSLxKal6wi6SsQvsV53kh+jrDi0JagD
 GVjw9OF7r0bCnBZ3V8B/aREc4pP7/KLsUtHj0F6SGRjWxOYuRnaZ+S2PLQFqbX6/2vbA
 YT6J4oofM2x6QrWb5HWhK8yOIbOs3/KzEQl/ednEB1BA/T8lSvaVDhY3AeM8kLv9PIBR
 d5fQkDQ5p8O0x5Ea0QlBvI1U2RTIEF1kIYqDCuB4HE7C97djPHiOXBigAVuGQoXkh69w
 3H/c+LcWv02rTHwQswM6aOkbcX7HGkSi7z20mwyprEGVYyL0P27kTgxAUzC7vq8MBC8b
 GdUg==
X-Gm-Message-State: APjAAAWUzZmxqDLkIGGJABFwH+BZIga3o36qZCWQJZRKijs1+k/MegLE
 ooVGXmdPu+BPKJ0zt9wTZtMe2Wv2nk+Oms0iEew=
X-Google-Smtp-Source: APXvYqyuDJikbS+1zmxs0fj3VNP0HAfX0NYxrm42A9cOVaQnPX48CUpkmsJ+WiHDhDI/Wl8EF5mvTyRVDLJGe7oNJhI=
X-Received: by 2002:a92:b00f:: with SMTP id x15mr26048913ilh.280.1572856041383; 
 Mon, 04 Nov 2019 00:27:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:4348:0:0:0:0:0 with HTTP;
 Mon, 4 Nov 2019 00:27:20 -0800 (PST)
In-Reply-To: <s5himo0cbmm.wl-tiwai@suse.de>
References: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
 <s5himo0cbmm.wl-tiwai@suse.de>
From: youling 257 <youling257@gmail.com>
Date: Mon, 4 Nov 2019 16:27:20 +0800
Message-ID: <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Nov 2019 11:54:16 +1100
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, gregkh@google.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/usb/gadget/function/f_audio_source.c

2019-11-04 16:02 GMT+08:00, Takashi Iwai <tiwai@suse.de>:

> Exactly which driver is hit?  The code path is via hw_support_mmap()
> and it's currently:
>
> static bool hw_support_mmap(struct snd_pcm_substream *substream)
> {
> 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
> 		return false;
>
> 	if (substream->ops->mmap ||
> 	    substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV)
> 		return true;
>
> 	return dma_can_mmap(substream->dma_buffer.dev.dev);
> }
>
> so at least the driver has already set the SNDRV_DMA_TYPE_DEV
> explicitly (it's non-zero) and some device object, but the device
> object was invalid for dma_can_mmap() call.
>
> This smells more like a driver-side issue, not in the core side.
>
>
> thanks,
>
> Takashi
>
