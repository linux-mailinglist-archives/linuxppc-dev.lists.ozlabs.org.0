Return-Path: <linuxppc-dev+bounces-4070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC19F0096
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 00:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Ts62Bxkz30XR;
	Fri, 13 Dec 2024 10:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734047802;
	cv=none; b=kv9HhZYvt2ry8Fbaxk1/fn48eyhUlf4X1RTk8yBwMuKV4Ak7mlkxQsALLFZ+tvyRUT7Bl2M8G+gHM7bXyzSUszkNsK+Ec0zO6fgj7qDcdX8C18UDBkq3SIlfP526kCXAEwgZD3E9gL7pdrluQvn0v78w5D3jOi+RZc4OD6Mm5rvp/ul25bpBmM+StRPgpch/Rn4nBi7gHGTL/0Unk2uPVhZiOmUgF2AsThnE1zHpvnOHQd1CsP4iJIPdAdEuuuvHYYm8KLMKVYCMTlC1kI/ejoNv7OXELgMvQeCuO50/jyYwQwGt47RO59zlk2OkS4BneouyRJv4y7M+vW/pqs0R0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734047802; c=relaxed/relaxed;
	bh=IPHedqRcXgtemeOKgImVqUQipKbdg4WLkUhhernilOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDmMbVCtbl1QPNpl49jm8T9r/ambqLG9fekvaBTV1n7WIfvgEM/CuzJ6EUkTnTby/y7iyCMnYsg2cFj1lycYEbUrFmfA2bWQRe+NDUA1g4hwhtF6fGN8XEQ2jEHbNbfIPaB9QJX8Wt0cGdcF2wgE7AakZgVDGckyu9rigmihlz8xRaJLauj/K55T/kNXa3ytmEVihn95jZsROz+IQSq8/5Va5p2Yk0L5vdUQ7C6SkfTfJQxYlQrZ46OdQ/batV7l+hBQwBM7HP8ynrE4Pjr71Jyp+GJtkj+UKlzZd0BDXKvE7iLFDBTaeekZgpi3lcyZSF/fxx1pHN7mXVKg/vhrpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=U35My+cN; dkim-atps=neutral; spf=pass (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=U35My+cN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Ts35dNyz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 10:56:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734047775; x=1734652575; i=deller@gmx.de;
	bh=IPHedqRcXgtemeOKgImVqUQipKbdg4WLkUhhernilOo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=U35My+cNcqr3STDj2lNu1MkLkY4Q42PCVEtQOr6vajhIB7sPotFvG53D2BP0EOvz
	 bIVnMTM5EcDsxxarG/LETdHcCiast7HCSBZn8jDt1tMdYyMQGQ5CKiM1nUtgVt/Ct
	 JPIduXFYCC2WykCmdLqSQrWTkt5Aayrgydo+tBqSvKZxGZS5JIgNHJX6XNDARQEvj
	 w2HayzxxPfxBzmJaF/zUKuzG1LG21bMHFb7omwsWSoSp+dbR2kMnHhkh5exvS/rFi
	 FoiOV8uGbLzrBZuJDNuMLCJe75lN/x7eyC6CX3QT54wBeD+4cdMvtmEhMpEGQX7DM
	 cYqVwLziHhYmLINlcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1t0uGx3Boa-00SHJ2; Fri, 13
 Dec 2024 00:56:15 +0100
Message-ID: <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
Date: Fri, 13 Dec 2024 00:56:13 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
 <87frmstrhd.fsf@intel.com>
Content-Language: en-US
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
In-Reply-To: <87frmstrhd.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f/tY40eYye9ZgQ21QIZ3UfoGC9TYQj96ENEo121+bOqKcMN70ul
 +joHPzY3qrEnAcraBFbamjoktxyKHGPQLDroMFrpxKLHxgiiVUXZMDwUzWj31mXLbWDv3Rd
 Ne4rn8ZuOuiiAqHbV5yW9VCRRwYmpL/Inke/z7QBiTopaAo+IZRK9XcXZC6+OcYZ0W/MGXS
 D564DlnYp08esiNT3NCyQ==
UI-OutboundReport: notjunk:1;M01:P0:Vva+NIhCaCU=;0WtonTJcKg+Sh1IVGvOkSKjma3E
 q0BqJCz9w5o/bzKVx91i/qtZSAQvDzKppLUmhTGvj0y7KMEuuR7rG+88QyCkryX77O/HWtCI3
 DMIM3JhXR3GffmgbvT0h5fER/6uqdhmAAy5HTpg0tu7WK9j6e0XN0WZ5kWhY2YAW7WpfByngZ
 y8Bts5H5aysQ3tzK0IAM+0K8ZSwnklXyb6VENIFkn3HXENCRooYcwwmncicV4e7nXXLHEUMg/
 BHu289LpBJlXDNNNyVDkM5hW7cAbRJU0yI7bL403t/kHmgFGklJFhs+ueeckWRc+kCMmaqZZN
 aMWoFHwd2Bp8mMdUwojuZ455JhqFZUERp7cszL98gfELf01eona0jdNRbmqIsRNHbbJ/z5QLP
 Ts7VvNOlxWF0nd+mwXK0OQ8Bk0JmKpqRfjmA3FrpwEKYFT6w2FTQ173U8RZVIgpJQ++qpHvaS
 nAJG32PzKtzFtIACDs2Bfc9EOrkNy4nwwvYaBuDttS1vAsnUwkrL8vgn5UD7OHIGy9e58R2L6
 3utFZoN6Jdf9R0UKYnzF1oJNtYCrY9Y//RoDh+1ZG3DTLPi1aFJ7dVO2PfDivqAVtwQ62EbCP
 debymYBVwnVruTI5MNaKRa8jrhDD2UTfJ6XPSvHLjHPVptr6QcqlvK40n7QrvUdpR2o17dLzz
 Vkai1y9zMm16eadd7YPhL1wCWyD6F9eWuc9vTJxd4sLge1XkFP1VQqsyrNTDh7z7kIBD8IKj5
 nwh6zExxFq/VVyVUqPadhRmYQ54SdemtcJ+qMq7O2Zw937eXhvEbNvHV7zDAaE6jnYQ7mVqlO
 KJl2TmoVM26L1EfszwJdIpsqDx6SHZNg9obKWQ9kLDsp7W1ZF4NWRWl7y/3rqQh0cD9jeUn2h
 rbDHRj+390zF3l0HSY7yrviN/0AD4sXw3WJXXnrVrAk9B/vgv6A3mf3mpaowIsV0XVVs7F0yg
 3SI8otev+7Fb6x9h/aHoYvcvV84IJX1FnRxbvjDtzYtTDkuch6N98IJ+oXe+FofM247HinDG9
 5Qj7nhhZ7zaz6jJL4q3NhHRErG2hEW0VVA9u31Q+0d/0uuXw8bKOERYhY9xISIgwUcL6UZe9f
 uu+WHSq9sDPXKRdD+uN4O9zjz/5Iu/
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/13/24 00:24, Jani Nikula wrote:
> On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
>>> On 12/12/24 11:04, Thomas Zimmermann wrote:
>>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>>> only controls backlight support within fbdev core code and data
>>>> structures.
>>>>
>>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>>> select it explicitly. Fixes warnings about recursive dependencies,
>>>> such as [...]
>>>
>>> I think in the fbdev drivers themselves you should do:
>>> 	select BACKLIGHT_CLASS_DEVICE
>>> instead of "depending" on it.
>>> This is the way as it's done in the DRM tiny and the i915/gma500 DRM d=
rivers.
>>>
>>> So, something like:
>>>
>>> --- a/drivers/staging/fbtft/Kconfig
>>>          tristate "Support for small TFT LCD display modules"
>>>          depends on FB && SPI
>>>          depends on FB_DEVICE
>>>     +    select BACKLIGHT_DEVICE_CLASS
>>>          depends on GPIOLIB || COMPILE_TEST
>>>          select FB_BACKLIGHT
>>>
>>> config FB_BACKLIGHT
>>>             tristate
>>>             depends on FB
>>>     -	  select BACKLIGHT_CLASS_DEVICE
>>>     +       depends on BACKLIGHT_CLASS_DEVICE
>>>
>>>
>>> Would that fix the dependency warning?
>>
>> The above is generally a mistake and the root cause of the
>> dependency loops. With very few exceptions, the solution in
>> these cases is to find the inconsistent 'select' and change
>> it into 'depends on'.
>
> Agreed.

That's fine, but my point is that it should be consistent.
For example:

~:/git-kernel/linux$ grep -r "select.*BACKLIGHT_CLASS_DEVICE" drivers/gpu/
drivers/gpu/drm/tilcdc/Kconfig: select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if D=
RM_NOUVEAU_BACKLIGHT
drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if A=
CPI && X86
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/fsl-dcu/Kconfig:        select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/i915/Kconfig:   select BACKLIGHT_CLASS_DEVICE if ACPI
drivers/gpu/drm/gma500/Kconfig: select BACKLIGHT_CLASS_DEVICE if ACPI
drivers/gpu/drm/amd/amdgpu/Kconfig:     select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/xe/Kconfig:     select BACKLIGHT_CLASS_DEVICE if ACPI
drivers/gpu/drm/solomon/Kconfig:        select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/radeon/Kconfig: select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/renesas/shmobile/Kconfig:       select BACKLIGHT_CLASS_DEV=
ICE
drivers/gpu/drm/gud/Kconfig:    select BACKLIGHT_CLASS_DEVICE
drivers/gpu/drm/bridge/Kconfig: select BACKLIGHT_CLASS_DEVICE

All major drm graphics drivers *select* BACKLIGHT_CLASS_DEVICE.
Are you changing them to "depend on" as well?

Helge

