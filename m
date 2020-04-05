Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9533719ED7E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 21:15:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wNfY4sFszDqsL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=PF2Ynd23; 
 dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at bilbo;
 Mon, 06 Apr 2020 05:12:02 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wNZp5trczDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 05:12:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586113913;
 bh=F9t6N3Mi4poOQ1g76zkCvSdBvDzShiTzIKtgmQuU3aI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=PF2Ynd23UremHDr78VedqoRYLHmqGsGsKknDZlVobBTLJOlNKdtDqmO2NXqDhbhpg
 LrZzBpjViai4LaC+jqn/wPLs8Rm/Kb/9BrzYNzGayFspAqBkDt+xnyj7jXMiXXg5z5
 LG3LaJWdLwWuvdhpiFY5BNCkVP/Sc0da4NozVn88=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M1G68-1j1ZNd1OMS-00tF2B; Sun, 05
 Apr 2020 21:06:13 +0200
To: Qiujun Huang <hqjagain@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
Date: Sun, 5 Apr 2020 21:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R5F9cXQvCKRzVq8oaRBgCbtQfWlSVhukcrw1bBjAL3pP1En1Uvm
 HgmJ+jsDIFJAmpWjk42WpQPGcdDa5/Ek2G50g6T0Y4tIxAQRZ1tpl4fEaSzoruRn1DUprCZ
 aFNSKGIxrKrCWrnXCmpCbG5kosOQJWJLOsizdF/8TJMfKOYakLS4SMgxg+yrgfRX4NL26Uj
 YUgQSyTWgnYZ9Z1fWiq1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yH2n4XMxL7Y=:9//ic3oLtKoWbPJ4wvIkBx
 g+V1v2P5BeVIMSaqnwEXqbr5+va0Uxp2gy22GzfddK6lWApfzka/WSRdNizddrygFBSRg8mJF
 C8Ai1BjuHHvdmhS1uHW2xY0vuS7/OvBDcwwxx7+g/w+81ncLHa0e13Cmt7HjtjX81GzDCDxtV
 k1R2nXpEUBZswGEEnGI9IILIF3NUjyPiOp1gO/ggMcZzsciP6QnN0AA61NODuNYT/3fWEOQkg
 2/YKrQ2RR2eXuYHZDMw297bFMh3dcItpEd/xeCqAV6OVmS7AmL4Fn34TPk7Jwp7Z5rdoWYwQC
 jjsN+G0T/Uc7LJ59YktjfoOtcwvT2HPBDXIDwijx2lJzFKgdbVRgnnEmsywAOHBeeYNclUMKz
 kvl/+XTOwtpS3huA94AqpIZUs/cux+4ErNpxbk1LeVLF8YkYdcOpoYSArVbAgMQxtNAMsbB9+
 CBXU1WFoVOOUHYXmv801YulBao/UXHXXdMootFEnudmnWDl+gcUpWWQJnfYihf69ch1vseeKa
 /egMH5x+SgEF9zixFijzIgjESM2FU/ykOrF9P5g66+V6SQMGAHSfXYfOr3UrH88I22JaQSAoK
 QXNvYR3pwvMf+bM+xk7xrB6z5jwh60uUHjecpZ179CF5iec0xMatf3gCa5nesZJEVRzjprg4y
 pwGIzMF7Nnv57FKGy3+f1GYbaIiZMXxV+AJFEzAJExmE8fKBT6WAQTKmcgTQDZcPZ2RRPyOD0
 6vC+2OFnt4WXfaJ6KNb/vHQxaYLtm0UKuXtrrq5vaK74ye9dcUqNgMjEVP96XhtWUHB3X7L+5
 hTiPUfUeyVS1Zz1Bt/KYiUz/s4w7QT5i3Sr4bKeCJOJs/dmwvNvoso9ViJhsn4ic9hG3FPetz
 jqZVyBhgjGuweybXfVcgZKYG9dNOZhyJMCqdkIoW4jcB4dzaA1jRxS8MQeD8+vtqAUwZRturx
 7QqP53MFHobm957mlrWb4UJs5ttaYm8TJCUxL86ujzYZtV7VvdzdajCZhDmGCrwOHUD6Jxts+
 AOBnJ3CapufKV/n3O46/Sni2YWkhG6z8pSt5HaaFinhOkd12KjEOn3viLpM3ZX15x8Mp9ie8Y
 3Eu2u4i7oYtN40Df40kwWNN4I/F21Uc2h1+wiq07RA8y8M+9pmrbnJ+ihOvpCrk+S5Tc1QwK7
 GAzWgUT85xgUR0CMVbXiNZGmXzYQOQm49IuVxnSbSxfcILCdBkDqC5YDkp+zH9zhr92fsd4wt
 EbdzXZX6fTDwPAeWE
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Here needs a NULL check.

I find this change description questionable
(despite of a reasonable patch subject).


> Issue found by coccinelle.

Would an information like =E2=80=9CGenerated by: scripts/coccinelle/null/k=
merr.cocci=E2=80=9D
be nicer?


> ---

Will a patch change log be helpful here?

Regards,
Markus
