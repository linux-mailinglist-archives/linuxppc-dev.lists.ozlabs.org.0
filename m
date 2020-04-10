Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0C1A430C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 09:36:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z8w86229zDqc5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 17:36:40 +1000 (AEST)
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
 header.s=dbaedf251592 header.b=Nq504gM8; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z8sR285PzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 17:34:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586504031;
 bh=4UbSNm3NqEG/M2HD8kXXlAMA4WIoVBdI5iU+D/pkbKw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Nq504gM8/jN717WnOhTTfO5lmbukBN/JlttfaY+ziqhN1Ixf3UtmUOeIyfRcJfNiC
 KSLqBAiQNKFmo7w3dIruqLIQvM/SV1ZrL6zgTWawhYEtZiGqNzqkDqC6Mhafgei3K+
 DmgNFZSW7PLjZeR9jIh/bEShyhQQc7DwekQvzWpU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.110.107]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6mPA-1j28aJ1pno-00wZ4J; Fri, 10
 Apr 2020 09:33:51 +0200
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, Li Yang <leoyang.li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
Date: Fri, 10 Apr 2020 09:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WobjD/4/VWOND3YdlTzKuqMM/f57kq+92hWyObzXZk7c84tG9QK
 ADaQCUdo2W8F2hYlFN61UXK2Zne3yR1PTENiBnuMTJ3xkBep4iOrA6JkynncBP7XOgGREpD
 vbTL8wOFxEXp3rIUW6lLSl8rni6jGHKGGwizkq6Ou0TxIp7ex0tQ2cVHYfN9pGIhZqVQY6E
 Ppz/TA5LSgX6eQs+Dxf4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vSAUpJI3JPc=:oL0lG2cCZpQitfX6Z7pj5p
 DeRMWlKu6UdoBK0giE7qmG/m/sQllTb7sLzmMlL4QKlyfGT1SU+MVp/WObrV8ZkzAT84+RNID
 P27TjAyJmrw9ww5q9RgCIF6KzjeMKOrr5RH/nWgCWWqEGUS0GXBXz4VgLBNeo91zk6AxulfQx
 EFJbTCnrn5vNh8k1DIu1PK90339E0b0VfR2BduA3gkeqZpqRFWbojsRJ4j3N8KhoYo1GzVBo7
 CPc1K3BitpxvE102MXmifHwBddjpHBQx06rI8F9d776lC1aEvnjd/Gs4z3ZwmlyWYh6Av9vrw
 DwNomouU8Hhu0l4J5KiEI9Zq69JnZPIJgLo4g9TNhNFXAMdb0S49wDN9OEYaVuEERvIA0andO
 Py9C1FZG8Jsk6fQHHmkj2NgQArX4xjmsG5cwk0Mu0okAr6AJz88j9CujqSggr3X8cMl4ARWR/
 TDAA7tGmr05dFtWXzI53MliGLlMalg5UCcZwvfYXZ/wZ2xXnaMyPjqfeb+o8EpjQhZcgv5PHp
 vswG1ieyyAaPWP25rUBV04avko3IYQPCcMwlIWEhIO/KcY4bCZggzOjJWyJvAW6lYIsuDjuxl
 /jQ65OtB4kK3ogqeHaHnDc0RsNKN/GGnt6TAM0SjNd6ltVYoMwXK78ALD9pgZVVusaZCEMPMq
 pvnS8nKvptSr6QucbB0bBPX1Eew/vMXOMMl7B+jS/4h9imAhznnXldRBtnMWX3ImO7nL2OE2A
 QyXAO+wx78jtt+AFVo++aDgZ93l079ZLifzaJOAghflQGll+ajkN9w7U0AHPZdPXRUmo7P9dc
 glpnj2x27wlgDDEr8QBKV1Ey4tfyAb/Wi6oziJscMwZbbPpDl4i2SJ2BkphvPVSGcJYnlFDLA
 7n059D5k8QajewgpZvbZSsBCWW0YaDZJXRxmEif8YmmqAC4PV3pTGr7EHtx0hQhyYjPbp8o0f
 +xm60TeTkWPTvjRZhrarIwHRJpulkjzbC2+Mm7Ddx3jmpxL0vmhjrNw8oP93xbf7HYxKo3D1J
 B3moRhdBwgAwTiZK+hj1ooJFBs6LZ2LoCAk0KC2LYzcTNf+WxvCYPDovlaRcnL6+tbeTAHF6+
 +q4FKaEnxkKjZU+xG7dvZfRROp6B745qvVwZkSUcMwp4ig4qJ3tNymoLAUxbR/iAmR8oLdtTR
 /d/iKIG8IuMAby4Figj96w3LNa8tJyW+IRqaEZOkk/n831jAyLEYO0lAbLsZwBKfT9+3Wymk7
 9xQCVhsxoK6pcHAPa
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER",

I suggest to adjust this change description.

Wording alternative:
  The negative return value (which could eventually be =E2=80=9C-EPROBE_DE=
FER=E2=80=9D)
  will not be detected here from a failed call of the function =E2=80=9Cpl=
atform_get_irq=E2=80=9D.


> which causes the application to fail to get the correct error message.

Will another fine-tuning become relevant also for this wording?


> Thus it must be fixed.

Wording alternative:
  Thus adjust the error detection and corresponding exception handling.


> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>

How do you think about to add the tags =E2=80=9CFixes=E2=80=9D, =E2=80=9CL=
ink=E2=80=9D and =E2=80=9CReported-by=E2=80=9D?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3Dc0cc271173b2e1c2d8d0ceaef1=
4e4dfa79eefc0d#n584

usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq() call i=
n fsl_udc_probe()
https://lore.kernel.org/linux-usb/36341bb1-1e00-5eb1-d032-60dcc614ddaf@web=
.de/
https://lkml.org/lkml/2020/4/8/442

=E2=80=A6
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *p=
dev)
>  	udc_controller->max_ep =3D (dccparams & DCCPARAMS_DEN_MASK) * 2;
>
>  	udc_controller->irq =3D platform_get_irq(pdev, 0);
> -	if (!udc_controller->irq) {
> -		ret =3D -ENODEV;
> +	if (udc_controller->irq <=3D 0) {

Will such a failure predicate need any more clarification?

How does this check fit to the current software documentation?


> +		ret =3D udc_controller->irq ? : -ENODEV;

Will it be clearer to specify values for all cases in such a conditional o=
perator
(instead of leaving one case empty)?

Regards,
Markus
