Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 700923A23A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 23:54:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LtT75zHCzDqxs
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2019 07:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tzvISmEO"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LtRM1XmRzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jun 2019 07:52:29 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id d17so5077572oth.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jun 2019 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DP0Ajt421DWmwrwPNPAX2Snzk01exwZi53pmjm8wyCc=;
 b=tzvISmEOqHqBLXuy40FjHOzFqJ26diODbTZR6+DZIDlO4cEPiRGFRwVsaPPccWWb22
 Dt+krxD8IbMjPpv3jL/u3t8j+Dcz2FJgHolsWR3RfVDBaeJ4Dd+khyn4YnBPbiV3JdQe
 F5L9RodSkDYunEDFhRlGXD/9A3AfKLbtfGu7JuHE96q+hfY9t155d6Bs8r9iCgbgRvpW
 mHQyL60NAtW+cecdreCwYb87VHDMKZtOjEUUSPH92V7yhWG3c74nzSUzNVq2mhU8Di0S
 N71xiKfzyWnDhAcOhvIKqi5vVooZcBQgjgOooEIDBGJMLqkXUE3u0PhUyqzVfgVflP+J
 +tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DP0Ajt421DWmwrwPNPAX2Snzk01exwZi53pmjm8wyCc=;
 b=truTvo/49/BOT8oibg2IsWyKkvRY8JU8yIlIxIt46cGGwgmUjaRWNDkfs47c/hCLbJ
 az4y8jbDeY9R/gWdPN0pqYoh8upIgfPyQQ9BgmOvJcSUUhozvVfNfZEn3/bxnFwdMLG2
 WH3CWbLMoM/cnbe3KPme50Qp7fK3/0nY4Cwm9F74YTU/YALNHwOXg/kwkysK5W2L7s1Q
 zFubDx+OZ8aSVYElAEwBWVBXJIhE42/wnGKXOMdVr+ah59QZusi3U02ujy/csdcfWvIw
 iowMwlg3y9bjmUpkuf+XhNqbBd6B3nJHqIGTbhusRsSzn7tnjKNm/NZ3cjjCF2yNr1/P
 Bl8w==
X-Gm-Message-State: APjAAAW5njPyiaFN6Hh3DKD7flN291NvuPIR1vA4dkHtlUavN7C4TmL+
 f4N0eKZbL29hdQcrFJm/LYPTq8kQ
X-Google-Smtp-Source: APXvYqylrHE1LwideVdmvtrEqXgf6WG98D9rmgXo7hve9bgy8IQFtIcM/FU4/1dkGLypNJ6zscThgQ==
X-Received: by 2002:a05:6830:1558:: with SMTP id
 l24mr18682545otp.352.1560030746626; 
 Sat, 08 Jun 2019 14:52:26 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id c204sm2472908oih.19.2019.06.08.14.52.25
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 14:52:25 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
Date: Sat, 8 Jun 2019 16:52:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607172902.GA8183@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/7/19 12:29 PM, Christoph Hellwig wrote:
> I don't think we should work around this in the driver, we need to fix
> it in the core.  I'm curious why my previous patch didn't work.  Can
> you throw in a few printks what failed?  I.e. did dma_direct_supported
> return false?  Did the actual allocation fail?

Routine dma_direct_supported() returns true.

The failure is in routine dma_set_mask() in the following if test:

         if (!dev->dma_mask || !dma_supported(dev, mask))
                 return -EIO;

For b43legacy, dev->dma_mask is 0xc265684800000000.
     dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x3fffffff, and the 
routine returns -EIO.

For b43,       dev->dma_mask is 0xc265684800000001,
     dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x77777777, and the 
routine returns 0.

Thus far I have not found what sets the low-order bit of dev->dma_mask. 
Suggestions are welcome.

These tests have all been with your patch that sets ARCH_ZONE_DMA_BITS to 30.

Larry
