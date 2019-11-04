Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A258DEF260
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 02:00:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476WYC4D7szF3q7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 12:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=gregkh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FZhgUCwU"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4765f953vNzF4Ts
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 19:32:58 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id p4so15920689wrm.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 00:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XF7J+DG7tWV9RXyc1r5Ixjph12lPvVDvV5bwthUbBEI=;
 b=FZhgUCwUZX7igZi16yQODx8+KbkHGclBlDJjHYCZxM7KjufVHj1csQ1x5nU3ZRUFHy
 W6P9jDawE7Aci66askzFeHB+6ipqKGEIDPN2Ki1vkVD8jIZdzdVPPYWAaH9cUTuCQGcu
 mtMasHpUeWbSaJ5F7hZ/6NQ574mhrl4uqfRZE8El7uTMrRhF5gbGUZYwLU9a5kvxVE/L
 k4FbZTQzVozpd/OHSfrPOPT/2ZE3nmsKoaKh0pdcsjJFPZUbMDzqQKX+3+8VrIUAWPbz
 Dh2lV4z13F7IEOp8RrfBBB0mXD8VVMXOiUwDIV2Fvb8GQi4ZrkAH1gqu/gdbTfTKb/bR
 gbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XF7J+DG7tWV9RXyc1r5Ixjph12lPvVDvV5bwthUbBEI=;
 b=uF8Xyjv6kjuz1ILlHHOjH69Bh97F3XpB9b9DNlEvUjDbN/TrEeMR1NVDq1gOdX6SU3
 vWlytxPmvxszQmxJr1bNqrP3RnFRHJkRECzAl74BrHQaTWWuazvX1GGYrqkGPIpKdy07
 VaWNw3SotZAfz+su8x+C/tPaUx0FsAK+se1mxfhFjOPX9LeevxgldkfXhLBA/7OEzVwr
 Rqq1fmG/02g3E7zJWH+HAw+DzGnlFPtQMjZO/9dbB8C+wazjXSt0GW/op4H9M0GvrqO7
 saURJUqMlqdkvgNmG4kerAd39SwT2QFQ/mYDQUtnmSWp3gggPRaIEaQ7bwoQDULN3RqY
 Af8A==
X-Gm-Message-State: APjAAAXXh8N/+tvMJe08fAR59wpbQZiCXfFXPYCca4xYbTvGZdqEvSf4
 WTcAdsQ1WAjezd91xACutBcaog==
X-Google-Smtp-Source: APXvYqy3vFTV9LTgmQjmmhjTc6kU9Rr4Y6pS3SE6yuds7uL1u/ShsusG3J537rgd9MSMTZj9mf8vxA==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr1452202wrr.42.1572856373332;
 Mon, 04 Nov 2019 00:32:53 -0800 (PST)
Received: from [192.168.86.166] (83-86-89-107.cable.dynamic.v4.ziggo.nl.
 [83.86.89.107])
 by smtp.gmail.com with ESMTPSA id z13sm17303360wrm.64.2019.11.04.00.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2019 00:32:52 -0800 (PST)
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
To: youling 257 <youling257@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
 <s5himo0cbmm.wl-tiwai@suse.de>
 <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
From: Greg Kroah-Hartman <gregkh@google.com>
Message-ID: <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
Date: Mon, 4 Nov 2019 09:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
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
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/19 9:27 AM, youling 257 wrote:
 > This driver 
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/usb/gadget/function/f_audio_source.c
 >

The driver is broken and needs to be fixed.  Please feel free to submit
patches to AOSP to do so as you can trigger this easily.

thanks,

greg k-h
