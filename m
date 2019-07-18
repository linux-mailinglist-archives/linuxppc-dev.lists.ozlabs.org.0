Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D116CE3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 14:48:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qDTc29CzzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 22:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mo6-p00-ob.smtp.rzone.de
 (client-ip=2a01:238:20a:202:5300::3; helo=mo6-p00-ob.smtp.rzone.de;
 envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="SXbdAry1"; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qDRR5pGGzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 22:46:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563454007;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=c9OM5h1TsTTpwCsXm58s5ykrMr8EHVaDRbKo8dxnKh4=;
 b=SXbdAry1pHMq2+15W3OEBPCYh8AHFqRLgsvgap9cU5adl9XQuK6+XALRjkNDKxyx/5
 CJJTwEN4QSDuNTrb4lTH1/FvJeJwZ7lANaP7jXQLb53RbeqCF17FKMsxOPHKStNKH6Ss
 MhWTXWpyj+vXn83/9GwaUn+EuRI3cFEOM28eyqPkBsK7v0VCgxZ7b3jnmdNviP3Mbw/e
 sG++ojtvAQTb/LUjhiOONkXB6triHgSTCnK/CwnMFgRyVb8itAmUap9YJukPUzWVZHsU
 MzvWnDnQg/O5s7Ffd7GVYLWgUSaVAZ2chQpu/6phc9EZtQcYmARXY8QPulMgwBYB5q7m
 ZLng==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgAL+SWtdZ0PI0RlS1kbesLFOOJmg=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:c9ee:1128:b910:fec0]
 by smtp.strato.de (RZmta 44.24 AUTH) with ESMTPSA id U0b154v6ICkd2p2
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 18 Jul 2019 14:46:39 +0200 (CEST)
Subject: [PATCH v7] cpufreq/pasemi: fix an use-after-free
 inpas_cpufreq_cpu_init()
To: wen.yang99@zte.com.cn
References: <201907090939164296374@zte.com.cn>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <ca8781a6-438e-b69b-5d55-7267f2106f79@xenosoft.de>
Date: Thu, 18 Jul 2019 14:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201907090939164296374@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.07.2019 at 03:39am, wen.yang99@zte.com.cn wrote:
>> Hello Wen,
>>
>> Thanks for your patch!
>>
>> Did you test your patch with a P.A. Semi board?
>>
> Hello Christian, thank you.
> We don't have a P.A. Semi board yet, so we didn't test it.
> If you have such a board, could you please kindly help to test it?
>
> --
> Thanks and regards,
> Wen

Hello Wen,

I successfully tested your pasemi cpufreq modifications with my P.A. 
Semi board [1] today.

First I patched the latest Git kernel with Viresh Kumar's patch [2]. 
After that I was able to patch the latest Git kernel with your v7 patch [3].

Then the kernel compiled without any errors.

Afterwards I successfully tested the new Git kernel with some cpufreq 
governors on openSUSE Tumbleweed 20190521 PowerPC64 [4] and on ubuntu 
MATE 16.04.6 LTS PowerPC32.

Thanks a lot for your work!

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Cheers,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] 
https://lore.kernel.org/lkml/ee8cf5fb4b4a01fdf9199037ff6d835b935cfd13.1562902877.git.viresh.kumar@linaro.org/#Z30drivers:cpufreq:pasemi-cpufreq.c
[3] https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-July/193735.html
[4] Screenshots: 
https://i.pinimg.com/originals/37/66/93/37669306cbc909a9d79270a849d18aa6.png 
and 
https://i.pinimg.com/originals/fe/f8/bf/fef8bfc90d95b5ae9cf31e175e8ba2da.png


