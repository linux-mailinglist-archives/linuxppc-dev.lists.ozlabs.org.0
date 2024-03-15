Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8E487CA55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 10:03:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=luIYzghi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twyw33mtvz3dhY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 20:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=luIYzghi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwyvF6YpYz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 20:02:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1710493346; x=1711098146; i=deller@gmx.de;
	bh=8QSAngh93Fh7RS7D0R2QjSELDi+nntpa83PPWvfuPLo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=luIYzghiLxwdAyZ83XQhMDwCJSaGBXxBhjpmWMy59qPfp6J1cT51m4X92EhgbjYD
	 yfyEvPMfYk0GCKrU6YzkNO2wbpkYxYQAnmgvXuuPhEElvTB/1jIMgBbu9BhUfiXfA
	 yfGxAQxRKGpUt5iMK6KNgQi0JctEvZQpoxxJi0HFBxsqGYjxsaGXQwVZTrlOURrbs
	 EltPPsJV0qSGUVgmRAuUlkDO9sAuLmZeg2Gn1+xxKIH4v/T6eM8ZWkcn9gbO6oMIW
	 67g46eu4XQW8hGEpA2ZokTD+m5zi7EM40+44mXhGSmzfYUzQj7JWLfQfYuNvGx8cN
	 2BhpEpRNiCoPDsm84w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wyy-1rfZHa0hQS-005VuE; Fri, 15
 Mar 2024 10:02:26 +0100
Message-ID: <5fccb301-4119-4b26-accb-abc24ade2b0d@gmx.de>
Date: Fri, 15 Mar 2024 10:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/mb862xxfb: Fix defined but not used error
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20240229115010.748435-1-mpe@ellerman.id.au>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240229115010.748435-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oa3Lg6BTYi/59RnYVtUSbuy01UHFdC0MXqi5ZN7nMXUHEle99vW
 BvXMz4V0bAUE2IY/GfuHS0+98S76AaGsfBkTHQsaSEZmfocavvv0q0yT1FehHFAPIFvWujA
 jhQ0BeLa2YbMxQUbvC55vs0xcSCRpX7UkOUr/swqjDl0A0SQhUb1KwrAx96ND/gaR1s/697
 0OrsiskN5jiCuZgsGW5mA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eF0nIZtkgwE=;RU7KXo1IKfoT2UTfCt87aJSd7aS
 IlpUCHigT7ccCuMrsA8ZNN3GBn49gf1U/ZOXWSkDvTjtqdEBKC/wP6j7rSnWYcX7bjm6FwBn0
 qShFiq6QIDDk7QGdFGwTxwPBO+5+mNiJgoXMNlmaQJDg2SDSiRMBcM3kacfgJkn9/u6AXxxYD
 7B2P9VpZ86ydaetkb/1PZiXQl9u1dqJX5WNOrIIXugy7Fz54aSnKzxGodRfgHpQcVA7vi7AMA
 trIb1Vstgl+zw7xyf/U3Yu97GlADu7vYFE1rYsZd2KzTIXZNo8/PTy8955rYW11dYtBihFsfy
 odJ8mzm8elOaOp/67pGP8BR7hFMFh8OafkZQmoEGJGwr/WvNPOVeiuOMd37uMfDJEwp3xGQ+1
 6jBJzV6aibgcIGWQksgDwtNe4CzTBeno+xgXbJse8pc90grNsBUCaBf/0Brw2ww4AnNjQI0yl
 4rmTyTMnoh5SqnE16KjHmNtUIXpMsSVxaOj517kZJYvoW0zwSRyHyAiAPCnUQuz+XJxK0AAP0
 egeEEp7REIEe46iEOYbo1tkuHOhGEMHNDTYE6+7ZFUlwDrAI4RIkrDcj4XNZkbhbxIUisF1cb
 o9UtykUZmiBCUeFPsZlFPg7On/LjZTjnfdHCexc/EQaDlWMrmOIHfJfmatyU31ysb6bFwWXHl
 iZtE/F/JKe9vBwp036AIS0hQhaid7HqAi4LCR7Rae+vIzctz7BWQRlGVOa1AQZbGmYV3YPXcL
 4uYuvFEoWR0ks0Ii+PYDlEymFRM783waq7kx4uh+Kp6MfDhNZWCTMgAzR7BLP06slNZiU4uvK
 Mxld2tTxi1k8Tk6Z2y91UAzQWoefekQ7wSSDWxb/wvf6I=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/29/24 12:50, Michael Ellerman wrote:
> socrates_gc_mode is defined at the top-level but then only used inside
> an #ifdef CONFIG_FB_MB862XX_LIME, leading to an error with some configs:
>
>    drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:36:31: error: =E2=80=98soc=
rates_gc_mode=E2=80=99 defined but not used
>       36 | static struct mb862xx_gc_mode socrates_gc_mode =3D {
>
> Fix it by moving socrates_gc_mode inside that ifdef, immediately prior
> to the only function where it's used.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/=
fbdev/mb862xx/mb862xxfbdrv.c
> index 7c402e9fd7a9..baec312d7b33 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -32,15 +32,6 @@
>   #define CARMINE_MEM_SIZE	0x8000000
>   #define DRV_NAME		"mb862xxfb"
>
> -#if defined(CONFIG_SOCRATES)
> -static struct mb862xx_gc_mode socrates_gc_mode =3D {
> -	/* Mode for Prime View PM070WL4 TFT LCD Panel */
> -	{ "800x480", 45, 800, 480, 40000, 86, 42, 33, 10, 128, 2, 0, 0, 0 },
> -	/* 16 bits/pixel, 16MB, 133MHz, SDRAM memory mode value */
> -	16, 0x1000000, GC_CCF_COT_133, 0x4157ba63
> -};
> -#endif
> -
>   /* Helpers */
>   static inline int h_total(struct fb_var_screeninfo *var)
>   {
> @@ -666,6 +657,15 @@ static int mb862xx_gdc_init(struct mb862xxfb_par *p=
ar)
>   	return 0;
>   }
>
> +#if defined(CONFIG_SOCRATES)
> +static struct mb862xx_gc_mode socrates_gc_mode =3D {
> +	/* Mode for Prime View PM070WL4 TFT LCD Panel */
> +	{ "800x480", 45, 800, 480, 40000, 86, 42, 33, 10, 128, 2, 0, 0, 0 },
> +	/* 16 bits/pixel, 16MB, 133MHz, SDRAM memory mode value */
> +	16, 0x1000000, GC_CCF_COT_133, 0x4157ba63
> +};
> +#endif
> +
>   static int of_platform_mb862xx_probe(struct platform_device *ofdev)
>   {
>   	struct device_node *np =3D ofdev->dev.of_node;

