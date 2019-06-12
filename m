Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152F41A19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:54:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nqg20FXBzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FyH/B21A"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NqdD6xMszDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 11:52:48 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id m206so10462810oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dZNefY29tKM9ryZRIGvVbjsKJ2b4TgUTWY8UBz9yJko=;
 b=FyH/B21AKA+b64BgH5EUU4Egx3zWgkj7opUJGSUvScZPqFBjEoRrGyzBpdsyRTe7fk
 SvCO7rsajEs/NnuDuKwOBV1aclkSLFhTEzq0uQLy4R+UClpRP7V21jkk7yYOX/S2ICe/
 SWF7Rj4oKPI1IxytVmeCir81VYDsWoGtwxM1eIp3UQDXVEhf7zCrXt/r78EYX+26jLd+
 LXEeoO0Zn65n/1deD15/PIgWVPXExqu0GjMDCKCW4pee2QvkmLqawYWPAVTaUOMKAZeI
 U6zy7dK4khDFWM2EqCW1NIrEh89X7759fwcBVjV1hzbrzXhLbuhXdFEkM7+6BJsz2ygk
 hhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dZNefY29tKM9ryZRIGvVbjsKJ2b4TgUTWY8UBz9yJko=;
 b=DtY6eVM04RtSwhIPJ1Kc6emwAlSItYER9toh9mByB5Tf+L2enM+/NQNvgeeC4PQYm5
 qKqlZ6NEvlI0aOlY6ySBTjxWgmp2Akx/gfQDm/4r2u1FUd47UQKAum5w+UOuNb8Mb9Fd
 Nxw23/l7BVAqryN22Q74TKzH47cddJK0i8tY2BjMZW5PQ9XWHXvTE050+N15knJXQebS
 DdJfOhqbQsW9rYBw6RZ6yTCW7zjhY90OWZmUvCd+EelqSMValVGaUbEKj2fPLik5jPTv
 fth06pIVov2y/RTdtb5o3kNC4hsy4TdfFwP5fcVpI0ewUpWX/Qeq55ELwsKPzGjGczxt
 dNUg==
X-Gm-Message-State: APjAAAU4bFuZuvz7zDaP3dz1tAkI3lcASuE0PlkAhcI0SGZ+hU73ANRz
 aLKS3Zz53KrT0UUolkDX6Bk1CxfH
X-Google-Smtp-Source: APXvYqyt6I4dEKDJQaN7+xYncZIh+w6qVHdohQ3Aq8eNLhV8fo7OpKWR9D7GGsQBR6gEGLr1wrIgzw==
X-Received: by 2002:aca:fdc3:: with SMTP id
 b186mr16827205oii.114.1560304364920; 
 Tue, 11 Jun 2019 18:52:44 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id x128sm1695129oig.54.2019.06.11.18.52.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:52:43 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
 <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
 <0b257651bb7ac4a6f0a8dce5470120b7701720b9.camel@kernel.crashing.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <7dcf54a9-a7aa-3a4c-8e2d-556be633d6e0@lwfinger.net>
Date: Tue, 11 Jun 2019 20:52:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0b257651bb7ac4a6f0a8dce5470120b7701720b9.camel@kernel.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/19 5:46 PM, Benjamin Herrenschmidt wrote:
> On Tue, 2019-06-11 at 17:20 -0500, Larry Finger wrote:
>> b43-pci-bridge 0001:11:00.0: dma_direct_supported: failed (mask =
>> 0x3fffffff,
>> min_mask = 0x5ffff000/0x5ffff000, dma bits = 0x1f
> 
> Ugh ? A mask with holes in it ? That's very wrong... That min_mask is
> bogus.

I agree, but that is not likely serious as most systems will have enough memory 
that the max_pfn term will be much larger than the initial min_mask, and 
min_mask will be unchanged by the min function. In addition, min_mask is not 
used beyond this routine, and then only to decide if direct dma is supported. 
The following patch generates masks with no holes, but I cannot see that it is 
needed.

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..e3edd4f29e80 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -384,7 +384,8 @@ int dma_direct_supported(struct device *dev, u64 mask)
         else
                 min_mask = DMA_BIT_MASK(32);

-       min_mask = min_t(u64, min_mask, (max_pfn - 1) << PAGE_SHIFT);
+       min_mask = min_t(u64, min_mask, ((max_pfn - 1) << PAGE_SHIFT) |
+                                        DMA_BIT_MASK(PAGE_SHIFT));

         /*
          * This check needs to be against the actual bit mask value, so


Larry
