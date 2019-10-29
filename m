Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A659EE8953
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 14:22:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472XM05VtdzF36c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 00:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="mMPUyzRd"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472XGq3FDdzF33y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 00:18:56 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id y24so7589198plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pvuEzJtwy1JCp5X7vm7kUHA8B0ogZ/ZQKVMwcTk3J2c=;
 b=mMPUyzRdTbvZmttcT39vAlD8XQuSMw1OB0uhi2zQDeiKX19RuTkEzwD4DPzEKEriED
 hDXwNagfD5B6P8HaJ1YGUyexAiZ6fW+5O9p86sA7Geeq1BcrCeeyTXUMrjJquQcBDYSZ
 M58G8hECZ2Dcq5BvTUL+QsWucQWNHm0/mMCy/YWr60P702rZs1xunutr4uNVgkjNTCvN
 Wj5PFSmreN8VT5b+V3u4QTMCE5N75NCyWGB2UI4s0SMfdlD6oi1hfDACJMn+0xTzQCuN
 2jVznLsU0WIPED8xb8LmPf9XBws1styHv+jre4JrQbH4+eXB+tBV62W1HqRNMVZOqv3i
 4r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pvuEzJtwy1JCp5X7vm7kUHA8B0ogZ/ZQKVMwcTk3J2c=;
 b=b+Y9PaQPHIIkZvm6wV8w783j6I+XcsBLdmg07z7+FR7Lv73ARdL9ed3rTZo7Sp+qeQ
 7L7NGMnbVl5vJAhMLan0p+9J5Zay9S0XOy80ybP2sPKlfZ0yttUIOeA/oJIuhHKyL6p/
 sPywkRi1kK8frwKR8a6xpR8eYI0+JVbm6bS0yJwE/T3tEw13coplCVzL65eiFq3hYu5t
 wSAznTRMGUsq+coX5NvmNeprfEAFf6iVJHcsuefngSzR3ovDSZ1TF0oAfpyHdKLGbJ1a
 PR2dEozewjwnmXJWUtTO7QCRSTyTPbh6007ADo3eoqFwFLYIAAAdtqSTd5mONafQPxcO
 1Hhw==
X-Gm-Message-State: APjAAAVOgBAhC2UCTpwBcPkC8rTvvPZunuZviFglHcgXAAHos6gHBS+7
 fb1j30ZE/V3+iHeR1c8FcZlWLsykc0AWNA==
X-Google-Smtp-Source: APXvYqy9Yzd9eMDthtj14AZwGUiHvvvfwGQQB2LpKxaqTurfBAKOtYBIGduDk9lusHNW3JpAtnB4Cg==
X-Received: by 2002:a17:902:fe95:: with SMTP id
 x21mr3986776plm.53.1572355134404; 
 Tue, 29 Oct 2019 06:18:54 -0700 (PDT)
Received: from [192.168.43.94] ([172.58.27.50])
 by smtp.gmail.com with ESMTPSA id c125sm14602926pfa.107.2019.10.29.06.18.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Oct 2019 06:18:53 -0700 (PDT)
Subject: Re: [PATCH 6/6] s390x: Mark archrandom.h functions __must_check
To: Harald Freudenberger <freude@linux.ibm.com>, linux-arch@vger.kernel.org
References: <20191028210559.8289-1-rth@twiddle.net>
 <20191028210559.8289-7-rth@twiddle.net>
 <935cf73a-d06c-365d-131a-23dcb350ba17@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cd6b5b8c-77f0-ad7e-702a-27e5a929ca54@linaro.org>
Date: Tue, 29 Oct 2019 14:18:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <935cf73a-d06c-365d-131a-23dcb350ba17@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/29/19 8:26 AM, Harald Freudenberger wrote:
> Fine with me, Thanks, reviewed, build and tested.
> You may add my reviewed-by: Harald Freudenberger <freude@linux.ibm.com>
> However, will this go into the kernel tree via crypto or s390 subsystem ?

That's an excellent question.

As an API decision, perhaps going via crypto makes more sense,
but none of the patches are dependent on one another, so they
could go through separate architecture trees.

It has been a long time since I have done much kernel work;
I'm open to suggestions on the subject.


r~
