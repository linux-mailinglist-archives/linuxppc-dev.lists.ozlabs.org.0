Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 382381EC897
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 07:09:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cH5Q3BJxzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:09:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=n5BBIUPK; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cH3S4VmTzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 15:07:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591160843;
 bh=5YtTV9QSRV+W9hQitTlstdO3VpKB4X79hpPCb9EhlAY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=n5BBIUPKa72MBvV9Qhh1lFX2Iv7HE4yRgRbKKjYyP23udXa68YoRrc3r+UI9F1vZV
 qpcJsE2RMgU0p7GhoVrZutf6yh36GrCKtyD6ooDm1Bk/R+kreRzwsuoTHArUAYshn3
 vacRr3ifyXELDxlMXpz4zeXXVG38BuDJVW5m1AmA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUEsc-1jX2FN0Tas-00Qzie; Wed, 03
 Jun 2020 07:07:23 +0200
Subject: Re: cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
To: Michael Ellerman <mpe@ellerman.id.au>, Wang Hai <wanghai38@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
 <877dwoj1hz.fsf@mpe.ellerman.id.au>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1d9752bf-fe39-6e1d-bda1-47c90ef9c37d@web.de>
Date: Wed, 3 Jun 2020 07:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <877dwoj1hz.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:clihFhtMBl0JjcLlTwGdMqBQupmYB68FkNlkt7J4zx9z/l27qca
 qhW+fVO9cfO5V/ATXnh9Wbu72iLpk01kQpUOUGhOzniyoTkptNrEQrevH8s/9T6nV3Y3Ywk
 djoC6wxM5r4HD3BgPIDnnLbCjlEy6EjhWRC+Ru9mARiEnDaCX9JFmC3MM26IRqq4qxsmupK
 pW0TFAsWHTwOMum5/VfwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0rkCxrChgxA=:lV7CqI362TV7K5ZFxV7ILy
 bAVBnGfJRyiroWeEW1LP3U9x15QUUCqnehHl9ZJAOxFMK97+z6tVi1RDGuxpTX3N3gy/o/XWP
 eoauJocZeNRsSylW4YXaA4fHqYj1PhxygyxsxnNn/kE6QiYtEK3RKkVK89pbUD/7DEdVE8LMS
 1aWBhib6P6/AP8ZFwW2jeCMAnYvRMVG4ODKA7tujfly7DC3stLm1SATE76vnhI+CrStmIf2b6
 DRGW8n9s313nlJusAyCW+AEttLkVUATICd8x742N5PXGpqc9pY3nH+aLQJOHcNxaa00tL6nsH
 ZdAxrtLLpBzO0uKMl8I0iwo5UQDlnjD+YNPnkUbygPuDn3UFQnK1/NamvpsPZOJehlqTOlS/E
 oykKHcEQZgNG7VICz/qenfqRQtF1SRH7tA6SgZwOGW97ignCghRePtH11dYSE0ywP36ahfIik
 xrkeMt1Jfuvc/SRSfX/gch1ke6/5eIAp02PxIimj23BqrdEtPSCFGFvNWXstrhdIX/RAaR6M4
 38dilnZTchlggflzRK8ubTJWUqP8gMlNAXB+kNaXSox8EsUAoyUg1su1xDs6bV4gLkHAnuEdt
 z8cfx8lz2JhTfuYwz5ImuPkhVGDwbgiW7sO9/QBcKffOvkdtYatvWGQBwQCpVd9rUyEpQUcNN
 +TskoVkLSaaBajqnS0CLM+XpEvODhxdVNQQ7QeSSoLRTB6F0xHJGhOdrSYq7aN+bxt2KqKZQo
 Wa82CgRV+MuUTO6Jr4zjwiBOpO5UN+/vS06SaHLfOjk+Dd66KIRNoH6MJI7KoanC1NJreECmj
 gTfX9d8uq6U6UI0ED4HWa185nBTeY/ovNA2iswbrwyDms9VrxGGybvZf5ziBOkWDvBm6qpbEU
 adN68pNTHAQ1YfL8gqMkMVTchtmd51qL+CWDyBoSnjOxADRrCn/ySzTAh9wAJQMXwdFxbq3nG
 ZHUJTVnpr6N9zBmIIqXKUdgaBFTLP7Y/CeRrJeApfC/63dHSFFV4Z1z9J4ALC5HPb91HGS/4+
 rTsDGxrhOaBa5DNneVaj+KxQ0rOBNxe1s45iI7fqyU2nyOPXwblCdsLbqSMeeTiCsNZ2V341x
 u67kp9zZN9kCBDTfb2lczcDumnovZp8M206F0I3+MJEz3EjecuF53siyzvVy+HZWW+z433LCc
 8d5gFxXyVal7OBaU1l133hYhuq8ONFax/QXONiSNbrtwc/hDTZixKXxxGxveYWHNN3KXvU5C0
 GJ3COdDK+DpY+HiTy
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/coding-style.rst?id=3Df359287765c04711ff54fbd11645=
271d8e5ff763#n465
>> I just used the original author's label, should I replace all his label=
s
>> like'err','err1' with reasonable one.
>
> No.

Do you insist to deviate from the current Linux coding style?

Regards,
Markus
