Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55B1EC0DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 19:23:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bzQL4D0GzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 03:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=l6z8ud1K; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bzMq4R3XzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 03:20:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591118434;
 bh=vzoyCQAVhDVRG128Qg5VrOsZZSGwD/IaCEQIgguYR/k=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=l6z8ud1KAiU5N+b9C+nmGxSQxBiNBONjivhnkXqiKOx5tqb9AGpHjM6vHhyQNl07r
 gakM7xUNAQOFSoSodhWBIBKGSvxtB8iFC2xrt/xR8uNy9dItG/d5HJe2vKVNDJiNtf
 EuA9KCd1NRanbmd+Nwl3ZhB76UhnkvZryBUVxuFA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.186.246]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWz8l-1jVYeh1GTx-00XUqQ; Tue, 02
 Jun 2020 19:20:34 +0200
To: Wang Hai <wanghai38@huawei.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
Date: Tue, 2 Jun 2020 19:20:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GXgW0Cj5LnEMpxP3UD/IYVpnnIdAdXbfa/5xLeUwq9XKXYBFO1+
 oKcn+E+yM3LDjCr2WbsYIjAAmJ0O+xkEssw9E/5V5X6WQgDqbMVK94WwJL45xusTWjyAsDT
 99AAZ0Zp3/vkQq7wlVcJF1fY+aDQMO8z//z1ftE9scc5G5HpWkfJE3HzJkgBRPvOXWGn8v5
 6uirGFn64ctMNa2IAY/YA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vq9OeyU7w2g=:Fpn5ZTmBdR99Z5AhGWdjGi
 nRdPbvxmV8UODpIcg1QWz2JVLyn7ZdfSrPU8XMwiIW8NL/E46N+rFm4zFbgQd6qspcmJodtJU
 jgZa4VhOcc5CiqMRISNzfwUFd6ELGh/hUSetd6FlCIz6orkGmS6nj50rmA6HWWy5SZAGRts2F
 ZaTMzEsl20ODnSZ4UV3aMEfkIroIXFoHXfRaMkp+LmKqNEH+blt1GPoLgrahnh9V39N3r0OqH
 DVvgmXlwUzruOVq6/+NANn8NK84toF58/KDXJ+e7tIgvpofwlyKjHyNzAyJO7BaKmAQQKt9AL
 i64NJSP6I8l+RAvzGqUgXCvpjriPqaikA7RZbP/lIKCWfpwywJ4sleZp57FAkgkm7HbfxWBzz
 Idip8gtcaFY3yEqrN2GIp1ysHbXLsczAd/bCfJraL4ulkwbXGt+dbJzeq1SWp2sLm250ieqNw
 t3QOkyMAtLE15OjS0z4KUZS97s5GW9C8ZAwbTkzrMBFPUv4DHikTHwUoGaMK2ZmrN5w1KJTyj
 3bCfKwFpxa6EpkoHM45yR0sE43h2u71O+lRFMoEkJ6/dB8AzlCAQpdsLfgslXbwS0d1FS5ax/
 tQXcQBRAxSe0opWfD4r0404yO3ZOD7mg0YjqYWS2rqq20tl1UQC5uMnz3O3TuZxXyM42m5iT+
 IPJThl2S0RD8SkvFXNdTwPr19rO+k3xocoFi+NGLNo8xBatqKSI2H35q3nEjg3NizFkTjhj7l
 VoVsKILai07odxlf1FUuP0+kmx7myoEwxoG0lW4fRoWoY86MUTa2XBB5aXlmc1LOut2n+gZYx
 TKmdtjCaXP3FSJaa8e7IWcBu/WiLQt8pfdL3CPYii73AeiFt3wNkfIZgFbnRAOlvmqSNeLnlU
 wwzg0C8rRfUZNoIlvawVXtRsTmb4+G/mOUZPi3f5GZHgGKGK8cpZtu2a6AVkbdHY/0J1YVZQI
 1RLC3cxpYemTW3e/so+YsT2/b+96vvggA78lKKn3dpF85BUmA7MjRNx8aFSfsxP4gkK/mfLQz
 bQErQo2S+hsQg0sdm5iY3IfiYQyw0X9m+VebHjP3jd1DI4xoJQke91MX/dzFKSE70QvkMOmGZ
 lm3XdDo09pXfGz/HwNnMInMBbk9XIVFET6r8DHgXzEN5KmSs1HOnylrvEW3ZMR9egq0b8nlHa
 rR0XQWsRddGQpJWMZMddR9khA3W7Qxe3SdG2OQQIqIBrDZlCIcWzF4GzVPluLCb4NufGlAsa0
 SBggMH+M9YqNBcBi2
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

> Fix it by adding a call to kobject_put() in the error path of
> kobject_init_and_add().

Thanks for another completion of the exception handling.

Would an other patch subject be a bit nicer?


=E2=80=A6
> +++ b/drivers/misc/cxl/sysfs.c
> @@ -624,7 +624,7 @@ static struct afu_config_record *cxl_sysfs_afu_new_c=
r(struct cxl_afu *afu, int c
>  	rc =3D kobject_init_and_add(&cr->kobj, &afu_config_record_type,
>  				  &afu->dev.kobj, "cr%i", cr->cr);
>  	if (rc)
> -		goto err;
> +		goto err1;
=E2=80=A6

Can an other label be more reasonable here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3Df359287765c04711ff54fbd11645271d=
8e5ff763#n465

Regards,
Markus
