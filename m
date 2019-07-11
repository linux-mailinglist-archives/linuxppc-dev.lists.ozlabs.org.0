Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD3653E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:36:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45krXT0sTrzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:36:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="BIrf/49k"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45krVQ342XzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:34:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562837617;
 bh=QMVNj5fg+/7lPtHz1QND/Mzp+oXxlM2TSpezOk+oacA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=BIrf/49kJehFww3FgmPUBhIlupe6E8wfnMm0rP93UdTfgan+9nAz3Do+9bixtk9pN
 k/NJkynyNymuUy5z59p06M3+rXd+YrTwNcpx0qvZIsLOr6+tIcN/pwoxKEXqnilWpq
 c/UdopFZvdnIiX6zz0LXGfeE/cduiE0nxOXpvW5o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.182.165]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MT8cQ-1hslEN1gFa-00S8yH; Thu, 11
 Jul 2019 11:33:37 +0200
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>,
 kernel-janitors@vger.kernel.org
References: <201907111435459627761@zte.com.cn>
 <alpine.DEB.2.20.1907110845551.3626@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e0e19253-afbc-3576-fcc3-22deea4db674@web.de>
Date: Thu, 11 Jul 2019 11:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1907110845551.3626@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:vF7Ayn7m0WSIGgJ8Iz9/UhW4AwGPyUxCenUfU3dLIOT0/YlM2tW
 TfiTE33m7hhXEzvlTZjY+0WbZCPqk2LVjXiX8ZvhzrOReIBnAAHee9bmNwL823cApnuMiis
 5suxy/KPx4ULhHsul/FMH6/QRTp9A8zmLPOXBEBRW3gcERlnf3lwVjVfRtShRvv7k/l8kZk
 MNe4pFPkBA7oyeq61s6vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CKzj7shNjl0=:ik0J8kqkgDqG/J3jlfZIgV
 +DymDWKBDTwr4BlrQQ3jYCmOYQsx4dN9HZBuAXWbaCkroRiepiNB+/AQu264uYs2hAQNPwhSf
 0RfIa5YzUzhppN/OhuwFPL/1ezyFc0JnF1xSa1ezp0Oy/4k/4y5FEczxdHL+uVFpjgzrGBIGW
 gxhvcV4+OGF2svvnFl5ZJKRetHfJ0ObAAFTUjF7m0IQDDbL0NrgFWbU/QWe4VmNlrBwJOhsg9
 nmGSca7QZITK5/K191rI6KLYwijy0e8vezEEOlxXhYqA5bn4jgwlk2V0TPm3QrMZRzcw41RXc
 CrTyybBWctNLDRINNQE4GemryLPzB4zqnBFyEbuRlmqp1AVQn7U0CjL85Hf6XWzGflW4gk2Ww
 su0/erP3NfY1slyp+kNlXfPUYhrwb2zr/QIqsBXCSoGcadu3sYTEM+dUBUibtuw/s7dVo06s7
 EEZft3bm99ZWRwwAqOuVtWuvDSG7kewNGkud3aC+clYD5zXSQ3fWK5kSrg3NEwtWIvZwTos5e
 qXGinA4IetcSVdb9FVLZXXwIU6GatEhkr8EgWtt6MK3eUw4ctao2J/zObZISbURwh+9TWpCp0
 xo3uuTIWJM+9/lyv4NQUikRKgKuzfXthRrmlKkPubJBYdkuhk7l/GjV9liIqM87jrufSjSLOQ
 weXCvZQ8jBPYN5T56+3yRE2zy7gqhT8jqObX6v907lwWfi2uTFzuCl1JE2+Vo9bwhb7vX2dZK
 TW9sjgMnhAD6wKf21CDPv6QvlpdqYd6KEX28v4brYVafJNdN5aQ92vsvQ/HtL2VsoCQEn5GNU
 fDV1alc4m67crVqRtO8H209OfoY0YImHrBhs6PxeyJColvOIRpw5y7LZTQ19EPMw/hKoseXNY
 dOBHuYKOJH3UIlc4wVt961g1yKDoSkoCISlXTMC6fSBQhzvq7NjShBkTbf9cZaNa5wauj2c8p
 /o/D5CcClilZsuA92J2FgvjILErCMtHLxIMnOi3Atee4FYAvRj0uPMptnApyq8OHvkKR6g2z2
 HJCu80cCQhR1wzQQ/iydeRz091QrH6dCv0CcKWMwP8TiOov04tHWoPflxpqiJa9Mqlu0r3L+G
 RoMvQirUhdrHzsl/6CELsgyjXEWuLYM2tQq
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 Xue Zhihong <xue.zhihong@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 Cheng Shengyu <cheng.shengyu@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> In my experience, when you start looking at these of_node_put things,
> all sorts of strange things appear...

How much will this situation influence the achievement of further improvements
also for your software?

Regards,
Markus
