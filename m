Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4164980
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:26:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNM54cx9zDqR1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="HTzlW4fz"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kN7Y2NffzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:16:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562771749;
 bh=7l8459peeGb2vYXnop/lxk+NHQ60CsGG5hgcOvAOhc8=;
 h=X-UI-Sender-Class:Subject:Cc:References:To:From:Date:In-Reply-To;
 b=HTzlW4fz0YIOflVMyEuaPRuIrWXDnl/JwEclgYyS9zSyb+Pl63v/uIEFCy4OZ835h
 zx9o/cmD11S6zzP4Tk1knXKy5MBL5evPI+kkQTEy6a8VXqoDnWxwogfbOqLqLGtur6
 ibVbaWx9TtYCVrAgtQDyCOUZa79f9OmdNMK6JfBo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.42.76]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MBY4U-1haoz43hAc-00AWzH; Wed, 10
 Jul 2019 17:15:49 +0200
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
References: <201907101533443009168@zte.com.cn>
To: Wen Yang <wen.yang99@zte.com.cn>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9d515026-5b74-cf0c-0c64-4fe242d4104e@web.de>
Date: Wed, 10 Jul 2019 17:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201907101533443009168@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rx6isKjioqcT/7U+lYU1jaq5G/R/JZ/x4KgJh1ptX+bLkqkB64E
 OvppSgCUJwZQdWfaGmVwT1KUMfwVB9Z0iSak1zYoGzxMLLq07bxGznerb5x/jvuaQkhH3M0
 OZUSJiLQvnU1bsfW/vuY5ladchmwIcLrr6akOm9fXq5zg9WzBZYzicTPAuHRrD+WchScrpv
 o7oFiVpMpABzqmJJDmv3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4mTtbY8lkOI=:TYV95RmSE5PH6OgsrFms3c
 TGwU1adVMBTvjIBrenVA4JSzWiZvMvh8OXqGwesOCA2HljyOQQNMGKuh9foJO1nTnmPjaRhNo
 nOza4lDkJVqb+gJ03qvBJ/uzdfvgsTPRaV7/1Q8osHAQqIH55YWqbLdOGdBTrCib2RQTGGW8U
 iQAL6QSuy1YawhlOqjJ6lXFNWazRA3GRox7HM9nYJdfaJ8pQdXQM849Thbcybc1l1N1Y94vEf
 DUS2nwAQ8w1+zZRj7TwluxugJ7oFIFYklZynnsSk1cnAzHNwlyEj5RRNI2W+CrbweG6CBZPo/
 QtIAtiBCwkUQLEK8XiFZUFYN+kJR1gWI5C/73QZZx9Jv0kogmTkNLvQ8xYqawwD2CoXH6Evrs
 gMe1K5FGU3b8Fpevrh87rUHUIdVFnLDBXwkvrI05hpiI7pMWIApYHaWnMVhQj5SjgwVwlpdIu
 3aW+V+WJ8g+8AzFJ/x64CfeXITRrxGLgYYuSnSfcTC1O1n2sfbTB47MhbXpPOMtzqOYSeffHl
 WcszWWwnFX7r+bXs7prqFrShir/IgO30o0ObPjcz6p2gjnAjafEM94+18frpr3hAs8jNfcD6R
 ZJ0ydKsG8BsI1tdaxWixKOL1U7O8tNPWNu/5En0C38N8EtMmX+gl6OCwSD87Z/EIxq+9JnZyY
 25ks1aysFrHzw75NlOBDGgfDE6iaYPSuKbCq7OSItzlI+1tftqsxEHQQ0ujhdjC2Y6M14Ac6a
 S3Zrahi//c1i8FnutS7XiyQDOLaKplEcii0eMzLU/E8nnJJkfvUvIP8VwLnxZ4UmxRe+r4mZm
 jyT23kAbanA6mAKmFWzE/vIcWv2L4YV7PUrngdkpoSPC4YJvM5sxkfDCf1Qi3pmUVE7xzfgfk
 pjge7LyB54uv1fUmyjWhmRrixOvyw0UUpQaL/U2kSERjGpGmD7xmtAHFVKO91zPUkDuh8awY1
 2CZ98iH2OQtu9vK+qsPPSARCh/K6+Ft1sHEMJk+59D05ReytSdKdFgD17BliuqH5wYPLv3ifu
 9mxGOF5BRcY5cVsHsb8L/ZfO7y9aD9KT+p7NvABmu94bUVBqiiHeo3hLLQ+KT99u28HHPtTa5
 Aqf8w3PR2vRqKy8puUTv/L1wa4bvfEhdqa5
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> we developed a coccinelle script to detect such problems.

Would you find the implementation of the function =E2=80=9Cdt_init_idle_dr=
iver=E2=80=9D
suspicious according to discussed source code search patterns?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/cpuidle/dt_idle_states.c?id=3De9a83bd2322035ed9d7dcf35753d3f984d76c6=
a5#n208
https://elixir.bootlin.com/linux/v5.2/source/drivers/cpuidle/dt_idle_state=
s.c#L208


> This script is still being improved.

Will corresponding software development challenges become more interesting=
?

Regards,
Markus
