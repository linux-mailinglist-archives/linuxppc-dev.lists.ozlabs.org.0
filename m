Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9DD394AE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 20:52:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LBV15LfDzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 04:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQXTin5D"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LBS74MBPzDqGv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 04:50:47 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id i8so2779959oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mtzNzCUSsxdVxTwVxd+bIYbQvGHAfnBIn5rvBFTyjR8=;
 b=OQXTin5D9dTshUeb7Y4bM60DsbmSUlShMmHN60dZZLL9XCDDB+ORnAUfy+Hr/bRkU4
 Cv0yqr74BU8WBzsrZKhPHtnDdaY0de6HTTVhECsYW3ZFDhfnMueDBif/LMeSAfUlEn3h
 UDnpCbe1YcCpVwHTuEqfOdBNQpHWtDtmXLvZG2FrS/El4fO7hc1A2zcnTOFbu7C5mW/Q
 R8WpqASpMYH4b2zJL1KNqjkz+a3zX08H5kIsv0x12+gOBo0YS8HeS10XU5lcpnd1N66R
 2jI8Uqy8aRSN0derlvny6iWoNLEhVmBJPssrItiTU/pRpjxCLC1oJG2fF5MGcFU9ZEFo
 EXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mtzNzCUSsxdVxTwVxd+bIYbQvGHAfnBIn5rvBFTyjR8=;
 b=QwhjKauB3M/JUlVJZJ6fBNxmuNxoSNySp/+fUGYitHxQeH01yzQ+ltuv4gtdD2sQYB
 m680hBYMr2NDbzBdfrMDtNKvHDEDuXwCBMPFJAVZIRZxQjjFzZtHGRfoX6qgeCiDYtFs
 8UvlIgb9jIBCcXyE4Je735exCB1Y2yL1iabik6FaNPWeuJtYuF/Aj14nKDRu7K4+k4c0
 UbhZ/mPefKezC1g1W8Q1w+ZHmlQUOQu3nvZkdmK+jUm6bGOQQbKmjdwInms1sewL8jdd
 ISPSGJttWjbCRU1ua2FB7kk5mL66dSCOocr7GQHC++A7g0jlC9kZ+qGLj4/etiVEryLA
 dScg==
X-Gm-Message-State: APjAAAUmABU3SJrz7Mx4ZU0Btu3VlHELh/m0YJR9eUp2x/Mo1qYCJii2
 u9B0qwsQsiN03TF96wIv6YcxqZ8O
X-Google-Smtp-Source: APXvYqz4kHg4ws3IMu+HwC+T75hwpF0oGqhuGhXdapOMtWtwVH7DgtPV5tHN5bGG1FLCCtTfGvS7mw==
X-Received: by 2002:a9d:7683:: with SMTP id j3mr20795572otl.290.1559933443940; 
 Fri, 07 Jun 2019 11:50:43 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id w22sm1034238otp.73.2019.06.07.11.50.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 11:50:43 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <034e6860-8fa8-0510-96c2-0cf6e6a04868@lwfinger.net>
Date: Fri, 7 Jun 2019 13:50:42 -0500
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

I agree that that patch should not be sent upstream. I posted it only so that 
anyone running into the problem would have a work around.

I will try to see why your patch failed.

Larry

