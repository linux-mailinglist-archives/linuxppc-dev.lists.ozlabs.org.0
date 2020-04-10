Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A21A438A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 10:32:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zB8J57ZNzDrK4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 18:32:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=UUOyec0I; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zB6L4Sz3zDrBG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 18:30:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586507414;
 bh=4u5hhrm6knmxsZ/NzhdPF/OsRQ8bfrQ8/6bsWh990a4=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=UUOyec0IZR6HnJWe4vqIjMxCq96sfVj4sA2WhW4CNuVJHVEb5LbzShotDs6h4WOoH
 KUC9aHbwJMKbXY+JHGrlTzf0Y/tqiY6pW4krMrw17BJkxGxb6Vs6dNldmpFgsTQ2CC
 WiFhZZsCidFz7EQWSj4PwYvLfbTw52WX0313h0xU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.110.107]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSJC3-1jqGqM3OXb-00TS5n; Fri, 10
 Apr 2020 10:30:13 +0200
Subject: Re: usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
 <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
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
Message-ID: <aa7006c9-8b83-5f30-86a6-8d60d290f824@web.de>
Date: Fri, 10 Apr 2020 10:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Acaxx2xRoOiUA8kGa6WeArQ4GquR37GMWjz+R8tYsrRc8V3TbFd
 zb6r/Y7pBEV2FDmqBkMr44apeniUobUFMZ6P+GZijdy/jr/lMV0UHDcimd6b13U+MrprqTs
 2CwIQEOOE0up3JjjyQJ5du2K3BJJSlEOtix6LwxC4zucUbCmAUqor5gl5r1WSOH+PJ5ulY+
 zyATaqchFEO5P+Lqq0jMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bx+2OvcS+mY=:/BQwNB8CoMq0k1c4AyDBdx
 K88g9gV7QdLJCRSYI+ICsqTRtaYbXKpymBXQqkDTZWHxO2fmMgqXRwGDCGcdeea1olFH/MI1A
 G2zqj1l0gWlsO6Q/wn8q2bk3oTDv0uUebIdR9JHaAVelr7vH8ds/G3jhhfSYEAuWoI6rcZXYC
 vy5m5xzosfiaIoLiDvJSa35vcko5Zqvvcc/w5kGi2JVj9Z7kNVImLfu5ecD3KYXAVqAE+Sbxp
 5TgPZEoq9b/vig7oRftlYf5eYIup6yW5CFxpezmw8wAAfkZmqvNPWu2pWaWQQB7QH13NdRzGA
 nk9iFU/cU6LT1PO9f6AxF7FIMmUPAVvER8x+tX9eIXjxLw+PeoTCQn1C5fWknqo3qwa5Xe/Pm
 IT5A+VLxGAkRLtP12dhlmERabc+MMQFVmqm6cONk8FZpZD1jG+3xM1DYDQpSwJFU8QDFpg/xT
 KbVDGsfEMImNnAB+GT5D1hTD3BrHkWIdJhvR9xMo3bpSbARX3LHlOUx14dBFc06PRbUk1Kj9n
 V47LhT+c8zILwGlI5CCnf0Zjajiaclq5SfvNavoscxnCPIGpZo4Q9vtvFLPcdA5KikAQTbkuN
 SPQK1tnQyTP6MwG+9ndf+2PS90BmkNAuUiGjNzFEN1V883Y57fE/qgk9h151E5/lnvxeQ41XU
 0sPFUkqlhpiAMiJLEZvtaqKrPrmp18clVh0GNdXYz7w8LuFsfIrooz0gqbc9UaLrIAUjOoiSb
 5fxL5oBwhsKgCpZzb2mQpAZkDtGZiBL0NRz9jQE4/gC9UEKPMwAcPtVX8MgUj9lVfbbHHJWeu
 E9ufWLVR+CUjtdMBQ39O/9rbVUXvsSPdn7tYF+drMj2FUz7YhgKwTcWgK+Tm2ln/f/5YzZ8wx
 EZIiESoOMUDfLz5JwSofBK4Hvcx4o+9zZ8o4XxCybE4atTFq34lbDGfqolYwaQx6vq8KWidVk
 RiarxI5U9C1ncoaF7nb2KCAXzVYflL+HHSCwH7L36r+YvmjPIpJid9rrWE6i5mIcQnU/COGjf
 RFHwl8PlcVWhyd4KD9mSMtJXzMzEuuzWaGGOabKCscYDxLgL9SK7Y3MqmJNCefoLgAySDEC/B
 glip4JQX6RfLENu35ISNwSA0xxJ4RZ4P5r/K4XZZHlL10kxKPYiJmrHzQ8fiU4kXvjHzJu3P+
 ZG4cxcw9ZdeyIWudv9+CqQCdf4wFod1YH0eUsa63kW7j0Q73whXCevCIhjpv1eMN+N6qh82ZH
 o0WWx10uHfuNAnkDR
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Hardware experiments show that the negative return value is not just "-E=
PROBE_DEFER".

How much will this specific error code influence our understanding
of the discussed software situation?


>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D udc_controller->ir=
q ? : -ENODEV;
>> Will it be clearer to specify values for all cases in such a conditiona=
l operator
>> (instead of leaving one case empty)?
>
> I don't know what you mean of "instead of leaving one case empty".

I suggest to reconsider also the proposed specification =E2=80=9C=E2=80=A6=
 ? : =E2=80=A6=E2=80=9D.

Regards,
Markus
