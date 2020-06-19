Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4AF2003F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 10:31:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pBpq2HF7zDrPJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 18:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cogentembedded.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qkbi8YvZ; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pBmN6ZDfzDrMb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 18:29:04 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id d27so5062781lfq.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=irVvm75B8uOjhet4ds9NewlHhGnanjSr3qTRTZzIUE4=;
 b=qkbi8YvZIpYdgXOhuLz+oLhk6FU5nre6FOh8jwCxVM9654uCe38mG3xi4sHqGzzDyG
 SEH1hJrw2TFIChHUxX1ZXnbwARwg6RC5j0BV0+jMRPStvzbKMhHOWFkkmEsrWjqdX5F+
 D1IOfQlW2zLQg/nVx9gJMOxi4uOERKvqBd1S1RhEt6EhjY5th0/tAvBfP2KAJAM96y7o
 h72udRwv1GPKxwptl875dVONvJoltvXpQNW88Rr7UCqkXi2dwlS43kJ7lnlN+shZedPc
 UEpFi+EUsizwMgSG5KrzWkYQzjXdopu2qfdbxfjTUi6dvlVTSJe8cWAu3gdUIqCShHxT
 T2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=irVvm75B8uOjhet4ds9NewlHhGnanjSr3qTRTZzIUE4=;
 b=sjg+yBwvVyVl3QBgP7QaQahxYnzt/U1i+UqFwcs0LYMMyrdGcTq2IYYjG7uYZdXzOt
 XX6yEwEbL2kwed5bABhLXYtO5mrkk7lmizVhq3LpuembXK+XiMeDLMeBOVynDjjv18Zn
 0ckRlt9lnv3VAqfFJhJP7aaOGUWtchfctv7gHIiaY6QiyIdyE0DLf841NwpLQ51dBRIf
 ewGoAuj3o8vDADKgYYbtx4/W2BzKolC9jQ+z3Wiy1P1uxcqgelwzoMIrNoA5cjEwA9fv
 yhRMGqqBLXFQ5a+qJUSP5cGsGJPJaQsA3xWF/0DxNeLKD4Zo47B+iRFN0FvSEFsCWAzH
 Ajbg==
X-Gm-Message-State: AOAM532FUnqyludOxH4YefjmPKdc2aZ4AwhOUpb7o1GVym59ucGrPYoW
 5C2K9xsJWGonTUSCAG57T7IDVg==
X-Google-Smtp-Source: ABdhPJxnSAk4hCfsyIu7N052ONa1UuRXTstPiF0JmLx3L/kM6WdrlnqV1xaj4A+uNl5wLop8yEYwoQ==
X-Received: by 2002:ac2:5c49:: with SMTP id s9mr1327184lfp.90.1592555339610;
 Fri, 19 Jun 2020 01:28:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8c9:4beb:2ce8:f19d:33e5:571e?
 ([2a00:1fa0:8c9:4beb:2ce8:f19d:33e5:571e])
 by smtp.gmail.com with ESMTPSA id a16sm1058721ljb.107.2020.06.19.01.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 01:28:58 -0700 (PDT)
Subject: Re: [PATCH 3/6] exec: cleanup the count() function
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
References: <20200618144627.114057-1-hch@lst.de>
 <20200618144627.114057-4-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <04e7876b-a8f3-3f6e-939c-bb0764ece1ac@cogentembedded.com>
Date: Fri, 19 Jun 2020 11:28:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618144627.114057-4-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

On 18.06.2020 17:46, Christoph Hellwig wrote:

> Remove the max argument as it is hard wired to MAX_ARG_STRINGS, and

    Technically, argument is what's actually passed to a function, you're 
removing a function parameter.

> give the function a slightly less generic name.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
