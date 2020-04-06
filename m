Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 671FC19F34A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:09:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wmVN4rmwzDr4L
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:09:32 +1000 (AEST)
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
 header.s=dbaedf251592 header.b=AeXxU4Ft; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wmLV5QPxzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586167335;
 bh=JFE5yypuYuZzW5WwkCf5zJCeEjjeW5Qyz2xHEI/OQro=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=AeXxU4Ft+bfibvhKa1wd1ofSGRd3Vc2QvFsYjP4jYUSx9mF6gDu8I7uFj/SGkmGZ8
 vWzuekP6x1pCbmccTvIIBd/Ra+wAf9vvV7XcWMC5cQm1K8j431TQxbSo9PrSbpaLJo
 oYC0gGe3zM/mL39+/v+P4cbM4wmQ98PE76GD9tx8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.176.200]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLPaA-1jKqLl2TAo-000bTG; Mon, 06
 Apr 2020 12:02:15 +0200
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Oliver O'Halloran <oohall@gmail.com>, Qiujun Huang <hqjagain@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
 <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
 <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <d8334f5d-403f-941f-abcc-2714d297082b@web.de>
Date: Mon, 6 Apr 2020 12:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:elEk+FNh8DDJPDv/vyH6T56FR0YYNiKzXr4V9womxuj82Z9nlRJ
 kwGWRYm6uUINU7LmcwSiwuDOx5GpWeckFgvh+wl2hDWyLjPw92i9hzQ3zp9TQmge7w3IYEx
 KwQjWf2vk77EoruoH1ginatKYhFuHunaW80ZuSEol/IOYLcORXGYU4LMDZarBROZ5i4bOuR
 LT7dSexaBA2gKYcXRwpUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vlDb4B/53Qw=:1NKXuT386l1Fvr7BkC+8H0
 pqjuPnBHtPWYqYeEtMcZ0beJbJ7pApfaK3RERVLEM67BH4orWFA3aioHnQPViqP+oD+O2+1ZR
 UMxiUhCefNQGK3xnjbMEr6lArR1FOwqofj8KDpbQkjT/IPbuF8w0Pds8HMXBteFEf5fqWwlK+
 3XX1LUuEm5w1CVfMU1xT1tAhYXyHmvi4MpVtLQBH2C6otrmxEieafaMrDC/XHJ0Td6xgvZbNh
 XGKIjTlk9xmFztvrPgpvURct/haGXHljh5Ad+ADolWnHZiEH7+eZO9+z3Fq2Pfwy3GFgEE8RF
 VhdyvrGz2IZ3uXeLkUQpl9Cv7lCRWDBrOzQ6k1d0lQ6XK8sm1NLi3xxp6otP3Ns42BNgTB5aQ
 UPgNGqicte+S/j0CMU2HzjB/Wx+OjSPCt6u3JdLs650faC2t3SIQ5jecYkXbqWjVMtNSrHtpk
 54JqaVGIPV8cPJvMmc7i7C+LH9Y0p+gHIxpFF6rerESr7oib7FzAtLeH2l2yv0WHB2hxZIxwk
 qlg8bOsqFFWZnYXlfvQquL1/9uwfsCgNDk3VTDoVjntwnESiu7dwFbSlQgP4gZbNVwBD7hOcW
 LS1Ae/1m4tMIM8toUJL7rnfRTp31LGFEfWJZdIkwf/OHihUxfOpoQv3yHMK4gfOFG9FmPTw/i
 bXETrBCURHEJD5pyHXPX8hqtFxocfPNm7y4KFYEEfyZSZKX3vxgrKyRo57a1FKtO+Am0fQWeJ
 xawbxIwV0R+RKEVgFhy5VB5/tTKldtMqXQH8+pfl0IOKmHmV8IzG5iiy5LVvumbPujD0ADoix
 vtWSaU/sBPDNLxNCMUTnd65Lg1tPp3Kb8Bsow3cY/BeNt18pNSO+BD+vmY9hxlwLjLPWTL1RM
 7TyU1FYe6gbYDaHe4hceUf8Ubpu2/3zsbuLPBypTO7HJMbdqOMvgFADH+PVUN1nIjgqqn+YTG
 dH2A9YOC2IssffSImD901ciwba0JH/OsYqiUBGeFxPbu551tF0zbyeGCiCMHiSaQJyx/BFq5o
 qgBgk5v1n2fF3M+S8nyZbKDRqA/fZOV9N0Xn3jafefW5eJrYjU46XR9t0CPq9LYpCXwzvdcfe
 bHN8/iQTwnqqah6i8Uk4i2XqB8GCZQnCrzTyqPN9T4kgH3zS50Cv5K2X+wgAEP9Jz6eRfE4t3
 U0tRk9MAneqmfvdrXH0ZVhiBdqYtC7edyd+8ZHvC5r4ia5vp9J5UgbzHiAWoMcwiIwjIztCdj
 XELNB9T60SkvFMYRW
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
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>> Here needs a NULL check.
>> quite obvious?

I suggest to consider another fine-tuning for the wording also around
such =E2=80=9Cobvious=E2=80=9D programming items.


>>> I find this change description questionable
>>> (despite of a reasonable patch subject).

I got further development concerns.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3Da10c9c710f9ecea87b9f4bbb83=
7467893b4bef01#n129

* Were changes mixed for different issues according to the diff code?

* I find it safer here to split specific changes into separate update step=
s
  for a small patch series.

* Will the addition of the desired null pointer check qualify for
  the specification of the tag =E2=80=9CFixes=E2=80=9D?


>>> Will a patch change log be helpful here?
>> I realized I should write some change log, and the change log was meani=
ngless.

Will any more adjustments happen for the discussed update suggestion
after the third patch version?


> The changelog is fine IMO. The point of a changelog is to tell a
> reader doing git archeology why a change happened and this is
> sufficent for that.

We might stumble on a different understanding for the affected =E2=80=9Cch=
ange logs=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3Da10c9c710f9ecea87b9f4bbb83=
7467893b4bef01#n751

Would you like to follow the patch evolution a bit easier?

Regards,
Markus
