Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B85536A58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 05:07:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K9ZG07LszDqjn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 13:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EV/94w61"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K9Xz0K1bzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 13:06:23 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id z24so633233oto.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 20:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NLcc8Hvj4GxnkbZqOSpti57+EMywR1QkzctaKlv9FJA=;
 b=EV/94w61cJndW/aF09hT2OcRE+FgL4ycdCqgiGCIlPUBHZaw4RCokWfccuZsBTni+H
 A8hpGC53VKVyXWlsr0ebnvShJizejBIdhp7LqCqlAG7ajtZOIRYcBm1+bt+6ghAjh7mK
 K9deV8X0D/Yzw2ukIVzanS+6Bnk5MW7PVgjKYJLitlYdSQIP/0bNvrSU8cREls2bq4Oi
 mTeKWqJbdA0D4u/mmWIuzkmjNyPTKqRjFYdGyjp8KYzcG+jbCAC8tgcVdyjWfVLxxAj+
 p+L0uioQLYpw4WZI6qD5aBVhGXtbgCDj7aQGGvAc50k2+2qvVLdxflrJgaGmrhdN7OO+
 SvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NLcc8Hvj4GxnkbZqOSpti57+EMywR1QkzctaKlv9FJA=;
 b=A6ryAM3c4tqIEk3q95/GPfbl/q6IDzLmhDn574L2eTq3C3MzYBT+6OBYGqALTKeL8g
 S4mK7bvRSwZ1xE/VXh5BzLwTwLgrW0G7kGrQV4AREyGmSE3Zp8QAb4Qxifm3gug8j4jQ
 Jin+8plGHIwQlfcXToMt5nkiYc8adz6RqTA0NeGGdpRNf00gJO4uYAH8hfE/4g59JHJf
 wflvCiCiAZxgPqjpMgWjjQg2L9zKhjZXEkc1JG/XdU1xZpkGRy0U5rhY8sIaVOs3SAnH
 xgTgYBshTowIepaHrfF4WdxEhYa9Q+ru7XslN79yTu/V6P8JnK60ymRcLGsHoVwF1JFD
 ofoA==
X-Gm-Message-State: APjAAAVPOdkqDLij6pnJlRvRA0wnhMiYCQqfougqApffQ1uCE43AL1Yw
 Qro1nyQdW5DrnDiznhlAm+7cGTHU
X-Google-Smtp-Source: APXvYqxjGCBhEAui2RBiuztJJeXSwwWM/3JyYC5cgJCRJFtBekZKrRXELpA8QUdY9Iq6B9LmR5hhCg==
X-Received: by 2002:a9d:6042:: with SMTP id v2mr6290825otj.73.1559790380624;
 Wed, 05 Jun 2019 20:06:20 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id y4sm245567oiy.56.2019.06.05.20.06.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 20:06:19 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <35b3f09b-b371-e2cc-4436-120c67e2f1fb@lwfinger.net>
Date: Wed, 5 Jun 2019 22:06:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/5/19 5:50 PM, Aaro Koskinen wrote:
> Hi,
> 
> When upgrading from v5.0 -> v5.1 on G4 PowerBook, I noticed WLAN does
> not work anymore:
> 
> [   42.004303] b43legacy-phy0: Loading firmware version 0x127, patch level 14 (2005-04-18 02:36:27)
> [   42.184837] b43legacy-phy0 debug: Chip initialized
> [   42.184873] b43legacy-phy0 ERROR: The machine/kernel does not support the required 30-bit DMA mask
> 
> The same happens with the current mainline.
> 
> Bisected to:
> 
> 	commit 65a21b71f948406201e4f62e41f06513350ca390
> 	Author: Christoph Hellwig <hch@lst.de>
> 	Date:   Wed Feb 13 08:01:26 2019 +0100
> 
> 	    powerpc/dma: remove dma_nommu_dma_supported
> 
> 	    This function is largely identical to the generic version used
> 	    everywhere else.  Replace it with the generic version.
> 
> 	    Signed-off-by: Christoph Hellwig <hch@lst.de>
> 	    Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> 	    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Aaro,

First of all, you have my sympathy for the laborious bisection on a PowerBook 
G4. I have done several myself. Thank you.

I confirm your results.

The ppc code has a maximum DMA size of 31 bits, thus a 32-bit request will fail. 
Why the 30-bit fallback fails in b43legacy fails while it works in b43 is a mystery.

Although dma_nommu_dma_supported() may be "largely identical" to 
dma_direct_supported(), they obviously differ. Routine dma_nommu_dma_supported() 
returns 1 for 32-bit systems, but I do not know what dma_direct_supported() returns.

I am trying to find a patch.

Larry
