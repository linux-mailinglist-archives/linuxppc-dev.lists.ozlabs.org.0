Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF6EF262
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 02:01:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476WZt56h3zF4DZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 12:01:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=gregkh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h92Y4u9I"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47661X20QNzF4tR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 19:49:50 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id m17so6362481wmi.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 00:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AZd8DxR702MwoAlKE7sREzCDnCS7TFuUgJFAdqqjsLA=;
 b=h92Y4u9I19V2o1s+5lGhO17NSFYSHZk9QgvM5mDhCb3p4Vr39mQBIAAeC5nqfpsi7E
 4Bu32H/W8VKvnuNSVHaBWMXpaykRQBdpqblyb005vmpwKAd2pPajeArxEgBntM3nBLKj
 CddUtibvOMTxVJx2KNlPjR3XoBIJe+NH2U3j4K0JJelFf1HEtWdgk3iyAHOejVVD2gf+
 RJwDT9t3Hb7iL4cAFs4mdD4rEQqzd1PD/0A6AYCrvWEvFCYF3aqv09lC/5EFGKCN59wI
 T1KGPDXOWiB478W6LZxF6RvwiHkYgYy1j3yOyQ1KqccT28HwFd28G/rbXCZe5nN7BE4U
 VQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZd8DxR702MwoAlKE7sREzCDnCS7TFuUgJFAdqqjsLA=;
 b=T+j+R9wakXMgx4VrccIjQUmRONh1zfl4sziKUoGWWHMbsGlIVAouF2+2+emQzFM1h8
 YI4JA4pa0SfdAjQoMBa46HXFxCxiXK42utbY3HMW5KGMBsLhhJXViGB3rl28pSWcRz8r
 5uUqPitkWjFc1WBOEm099h6Nd603Sgmytsjf7I7Q+5hdFHipYeVbibhOa5PbIlpw29kA
 98vd7Rw2ILRIZxYV7fRlR+pTrSfDZ0UqebxmcPWrzwjfX+KEmtwmHXzrPzelBspXE1j6
 ewX3+szEQQLHN7FUgL+h3O0xdpKQyPf4cALYnxgR5D/ezpBYZiTXMhgYEkw9M4I+kLSR
 kXHg==
X-Gm-Message-State: APjAAAWIMXU64LK21UAnvmYomN9hDpvl8sDLlV5dvbxDkz/xvEMfTjm5
 9xndMjcSvfYX4Z+dYFDoXNQtPw==
X-Google-Smtp-Source: APXvYqzYY3HzDkh794xMS1oJwQdQFMlMRYGSpRhna8XwoC1msLOBd9EdnxKhwo914zrovZJbmWsmAw==
X-Received: by 2002:a05:600c:2383:: with SMTP id
 m3mr18810088wma.166.1572857385472; 
 Mon, 04 Nov 2019 00:49:45 -0800 (PST)
Received: from [192.168.86.166] (83-86-89-107.cable.dynamic.v4.ziggo.nl.
 [83.86.89.107])
 by smtp.gmail.com with ESMTPSA id o187sm15137370wmo.20.2019.11.04.00.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2019 00:49:44 -0800 (PST)
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
From: Greg Kroah-Hartman <gregkh@google.com>
To: youling 257 <youling257@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
 <s5himo0cbmm.wl-tiwai@suse.de>
 <CAOzgRdYTa-nAa7QV6c2aZs910BACg91vAjcjw4V-Oy8KCZVmmQ@mail.gmail.com>
 <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
Message-ID: <19c3f0ca-9b21-0c5e-894d-976594f38a86@google.com>
Date: Mon, 4 Nov 2019 09:49:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <60ee349a-1fe7-46f0-5161-1dcfcb6fbee9@google.com>
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

On 11/4/19 9:32 AM, Greg Kroah-Hartman wrote:
 > On 11/4/19 9:27 AM, youling 257 wrote:
 >  > This driver
 > 
https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/usb/gadget/function/f_audio_source.c 

 >
 >  >
 >
 > The driver is broken and needs to be fixed.  Please feel free to submit
 > patches to AOSP to do so as you can trigger this easily.

Hm, maybe the driver isn't broken...

snd_pcm_lib_preallocate_pages_for_all() is called with
SNDRV_DMA_TYPE_DEV set, so that should be fine, and the only other
buffer I can see allocate here is with a call to
snd_pcm_lib_alloc_vmalloc_buffer() which _should_ be ok, right?

I don't see any buffers coming off the stack here, unless the gadget
controller is the one creating them?

thanks,

greg k-h
