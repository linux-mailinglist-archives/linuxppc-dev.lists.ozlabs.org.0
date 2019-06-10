Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8543BBFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 20:46:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2D61ghwzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 04:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DVW5iXzx"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N29x54vBzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 04:44:53 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id r10so9316576otd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D3rnPxkKkOcWLjb9M3zXKMP8YGdus9mVV7OMcZq7pcE=;
 b=DVW5iXzx64p4Z3JZnxlxs0vIKwgxfFCNmYLEcmQukipOh4AkADT4du6f0HN/erCPT0
 yuTL9qyCL6VAMwebjQD3hB1vTUCR3FJEraylBTE1PQ/6HfA7xk47lLm92/JbD/8kquWs
 8whChl5q7Bd4PZZRchNe33DfU/HStFantcBM+eLHLsstePld5xV84aCqf4L03cmJiFu8
 KH8bTM434yHlZjNa0ohDkL0oJz6qFfjNGcr8fw2SL9GgZvo5VgeYu5O5KL93bK2DNED2
 5j3uNh1vklJhT2VMvsjlKcZjt2c/z7HiKLaKetkwy0kQXJCMJHv0GtezcsQrC1x6hZSa
 T+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D3rnPxkKkOcWLjb9M3zXKMP8YGdus9mVV7OMcZq7pcE=;
 b=eDD/876HNLhCkXAr8IgdE9FDMPDRwLz7vSbNsJMnKkDYR79iKsPL17enmBFuoE4WJS
 NaWh4zZjVvgYXxES8FeN2Hvu96z58HFiUJZ4LCJn9qae+tYD9sCBN4I5f8AlBb3a3bO/
 /tnN2ZOZq3bGepeNXXtJHOHNXXDagiYaZjE1WWoD/3Vsmi/8iyssqyMATM2SKQq1Mr1r
 BZaylKYO6aZhgq80WuBQI+dyJSBg4WJ2EYf2vO2WD6hHbQ1GKZRY4soAbOoiuhUk3pJE
 0dCxdCFEqV+ZCXtyY7PcUQ+O4VN56fQ2XQU562j2B5I3I5aJDyoSlPmCy6eYLa/ufj4b
 hfIg==
X-Gm-Message-State: APjAAAVQDJWtdtx7WtyWwYUYwgBJvNEzml4MOQwwwqB+ic0T61J7savv
 hyT957WDF/r7/25fv+lB76g=
X-Google-Smtp-Source: APXvYqzFkDPZUfQTRZ+iIhDbbjsNqAeRD5O0Bl+f2oVgQX41yDJYVUD2AZA7z+ewtprdGgM6/MXViQ==
X-Received: by 2002:a9d:6c46:: with SMTP id g6mr25448205otq.162.1560192290284; 
 Mon, 10 Jun 2019 11:44:50 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id f5sm4018251otl.51.2019.06.10.11.44.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 11:44:49 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <3ed1ccfe-d7ca-11b9-17b3-303d1ae1bb0f@lwfinger.net>
Date: Mon, 10 Jun 2019 13:44:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
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
Cc: linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/7/19 11:21 PM, Benjamin Herrenschmidt wrote:
> 
>> Please try the attached patch. I'm not really pleased with it and I will
>> continue to determine why the fallback to a 30-bit mask fails, but at least this
>> one works for me.
> 
> Your patch only makes sense if the device is indeed capable of
> addressing 31-bits.
> 
> So either the driver is buggy and asks for a too small mask in which
> case your patch is ok, or it's not and you're just going to cause all
> sort of interesting random problems including possible memory
> corruption.

Of course the driver may be buggy, but it asks for the correct mask.

This particular device is not capable of handling 32-bit DMA. The driver detects 
the 32-bit failure and falls back to 30 bits. It works on x86, and did on PPC32 
until 5.1. As Christoph said, it should always be possible to use fewer bits 
than the maximum.

Similar devices that are new enough to use b43 rather than b43legacy work with 
new kernels; however, they have and use 32-bit DMA.

Larry
