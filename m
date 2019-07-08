Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452B562779
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 19:47:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jCZk61pkzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 03:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="p1pbDkyB"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jCXx63jJzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 03:45:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1562607924;
 bh=/ocw3rGinAIDYS+MLc8v0ILHw8w4guyq+ttXWZ1+zYs=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=p1pbDkyB91MxJgyalMe9w8E+dHe3fthIY62t5I4p7q6NE4BxV41pm9GUCeYNLP9QL
 7uO8EAan/8yGKbhRmz1tl0Nt+aVqlPU3LRLUvDdJtoMpZ600qMRgdyZ+BwYbilNMpf
 5FjHsksnv0d7cXyzCe47k3soyphyK8A2BO8cuqGQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.165.233]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M5bEe-1ihteO18eG-00xf0c; Mon, 08
 Jul 2019 19:45:24 +0200
References: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
Subject: Re: [PATCH v3] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
To: Wen Yang <wen.yang99@zte.com.cn>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
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
Message-ID: <1af4a5c6-b0f1-5ea1-d311-951dc80455f1@web.de>
Date: Mon, 8 Jul 2019 19:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3LEP3HMdhu1lN7mB5iYIWOfS9NazuaAM3Ok9b9J2TvLCpvb3cZZ
 fnggkL0kSoeH9U0I36MxWGpMSCRTCDlIu0nRWFNr1IMjtyDgJoJdP38n05bL+vGB78MuRPK
 Fdc024DBRLaEygO+GcS0KRr4xcNzDfPNW8rKZb+H+2tpUbm3KpLykAZW3QvpedKL6VKClrW
 mn5iI76mLX2O/8oo0UBRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9pdpswlNcJM=:llTp7AEIUCVlDnEP2ujq4U
 rulsu5W3biyfbl/6wP7cnsjRsbIIhltlogy6yOgWhCSj73lSU7xrlVJ9hiJjFBV2bwzSd9ygX
 o88uiQFSXWDTwc7vxL3hsdl8btANL52fKzh1sSyg2xSsAPQ/1eUAsv008JK6jc7+H/bYJ7RAb
 iyKDwfeFgyEN6lFRZ1FMAC8ZVJknj1dadbG/J3EFvfArKo7XNI4EOudmm+eUwwsXcyfRtyA8L
 Kk/FrX1v50P7YN+R/OfHvRc+TZCADXGJ2hr4xjdhz55mHnVipYcbE6u5TQY6fn4GTROzDu/hR
 ONO62yM8gf8/S2pAwuKHUra8MXMW+8Bbm737zv9pV59Ukc/GS3OJ3/+t9u603ZUr2vMFoVrdv
 TWdTefE88Sec0lFzqfrQb/8Vb4TzwOQp0MzzGTbjJGQoJrAaKlBmVJ0z8j3l611JSb5v8nkA1
 MFJsSMCLf66xU5TQh4mjqG92Sus3ZguubidFBUGZ6D5M2nhCjkBo/fQ1Exj7lLXC2y+6SgpjL
 AMSnIFycmSPzBt10S2QYTRirLt+9N8TOP35SjBqNSoCvxYCJV0+RRliVi/LwJ9Wm9clrcJlDr
 6pmJ0zCzOwzMOnb7Ap79QANUl5x5GmWxFO4iMxts4WZBSeIKzoMrU6LzKhvsnziC//+FQ5yWF
 knf52j6lPqLNQzVAcZSb1JtjOPJE7NibihJXIkNMOW8YabdL2moGMdk87UeY3NKmI8tAavgjK
 wIWnlp1dLQjcyL+hNcy5g4q+fGH4xm5/YAXl6I6yCsfD0h8cXH+SddNhtQ8dGSWBkTbaAJUqR
 fN/sGWdA8ee0PDQ5cgAlcINjiM8jda/xLdM8HWCAx3jkhaBMxd5grd/SaNYqyz7x/tSdtJfqk
 p61++nECpuKeiB7PFKriEFiLbmXZX9djPMeU8gw4d+f1udAfPfB7HCK1E0PApI/KkQ0qHRYfd
 DJBYH9RjtUuLxUANxQUTARCVTn35HaK+vXuWLdbVDPK7rtUa1jZHSR6QWjQ92Y9oIMgTt//YB
 IqfsDJIWsFikK5HsY2br/xcALS81VbL0q96zbFto8ixT5BfbpB2J+DC+xspXNX+H8o+wxcQNt
 456Lke+oiufUj4lw7932PC7rsQiIQbjm4Rl
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> @@ -204,6 +205,7 @@  static int pas_cpufreq_cpu_init(struct cpufreq_poli=
cy *policy)

>  out_unmap_sdcasr:

>  	iounmap(sdcasr_mapbase);

>  out:

> +	of_node_put(cpu);


I would find the usage of a jump label like =E2=80=9Cput_node=E2=80=9D nic=
er at such
a source code place.

Regards,
Markus
