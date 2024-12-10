Return-Path: <linuxppc-dev+bounces-3914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E972D9EB372
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71V74f9Zz2yHT;
	Wed, 11 Dec 2024 01:35:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841311;
	cv=none; b=GKPh/pMOqIW1/Kg8CCtIlhB/Q4iy7nI+z0cJ8Cj1aL7aTwK6Pny4buhiZ+fLuF4YoAnMExkRprxEjlBtsmSmWC7ORNBt+BsQfqJuN0gr+qLkyZzlTVZhQwLfM8tIotcOwuO15cpJuzt2vPOSdeHuvG1RHwwZF2XKImlXiWACLO3EPlpj03oCeEHCc6puGbkKjiOFtqyaohJDgcKXEk8uL+ziIv3LoSsSs0nszPAJ/YoOlEwAcVd6KXEX9BQIk/Z9wy3FSKqAgqcV7E50B0QSvDIp7vkRbRi1vFabIEdcu9XtoDPpEVPLDObaFinUdp2hhNozkCPIpCVfNlbkV2Vx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841311; c=relaxed/relaxed;
	bh=IkRFleL1RhPz6osM3/97DFxqCKISORIBpc9mnMdaSuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnAmjLIP+qFVWxBqp5RB57RoRTD0JLjezS2NjjPKfJx8e6YQV/IR4ZvOUTHoLVxdn3MmS/24LPz5bxfgkIIlvO3Lg5s0rjsspcZvcZpgtfhS3YI+L4h3Nzs/6NmkBF0sh7ZF4DpayROkXBUO+xOoEr0PUqjJMcNfotgQPsmHmBqk+0xnDCdM8GDy/EibzB4mkbEqzcbJ+JcRDj7wvsYGT2jPj52Z/qx57tw1DgxZnK8sl4iulG/Z1uLNHln/nM7npp89nBLQfZL3xzXA11Au5306tSWa31nr7elrtqQVn5ql0ex4O8jj6mUI5FH5FNNg+2wO2U5FGo4fAmIE8PD/0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KsHvkzH4; dkim-atps=neutral; spf=pass (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KsHvkzH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 318 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 01:35:07 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71V31mR4z2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:35:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733841302; x=1734446102; i=deller@gmx.de;
	bh=IkRFleL1RhPz6osM3/97DFxqCKISORIBpc9mnMdaSuw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KsHvkzH4chkvmkwc5hICwK9BdEHcft8chPOp0Yf2URrcZTjSBFWO/WYFyVm0S2j6
	 FoTVrWjuP3AYwpIgj0XZvyn5Zhq+W5LqhEE1vJAih61pTulikcRhD5t4jkIfpuc4Q
	 43DB+nEkJWx6itLZ1pT5W0awwU/DJZwXdjeV60nquspaM4pxTfAe/WRC5smJKAW+V
	 7eosQaYfMgAF6pVCxY0ZVmXbVfkpqeMBvPY2ZXDhItcM/XFWCKWit45ibynsNuojL
	 ZrJI/YLyyfjfRSh4l0d0SaDppt7uhDF7xWqXxkV49lkZ67kOlBNkQMwVc+4bCztVS
	 1KDzlbziXIRQfwxlIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJZO-1trau817dG-00ebC6; Tue, 10
 Dec 2024 15:29:26 +0100
Message-ID: <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
Date: Tue, 10 Dec 2024 15:29:24 +0100
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
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
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
In-Reply-To: <20241210142329.660801-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:wPrIP1DELKObh5rF1FfYVzwnJRUZ0Oh2boaV0kCoQN153AOPId8
 0XuRXbhJk3JqwpcjlvYydynvqeXQbT974KIKyD6YubMHJa0tlR2aA7X7CNWWfEqKHarVjEL
 GLKHVoAu6lfP1abNjtaCz/u+frRzY0dlGfN70d5Js8DfojLE3ptL7bXe+sdnqJ/xVFFmDJB
 WNoE5E5XnW32HttBO//WA==
UI-OutboundReport: notjunk:1;M01:P0:tkgY3icvjlM=;GJxl2nIur0g1kO9nEirSdk8xtD8
 n+jyuuKGDksbYPAw+wdqLylgaExyX8gCafzA2VbVfzwGCqqaM+jDtHwfSgdbf5/x4LiO89awM
 ldDp+oJ8xgdvXxLeGxS8IuZdsl/poeAWw2RPqw4KhzS1WvyBVWctbMnYuxzTTxf9OR+/060cQ
 3ndqJvybNdL+/WGFDd1nvd0ag3Z7w83TmX2b2O+AEmyht+glECdITnuc7WyzMgxpwXmOV2+eL
 l6SoGkSwU4jiC2R98ciK/iVw6V7FXkh4+xfzmVDWm9e8V818A76UXeP6p8nnPyrWr85oiF7qo
 0hzSvRayIA3LbGErjDAeYr4ZRggO1NjmvOvOku1ry/PFgomHORCfrFxhkU9vYO16ZM6LBUaAz
 MPAJKR9MuIshv6S/ltZWRAf4dTahAadNB5ZBHTexzhWuD+fDynJ9OZy7fi1/WCLBaaChrUQ6Z
 1BKCCJRtVhSLBiNad6ZcQ/3a9XDmmv2Y1L8VtzwzqQTDxQADD/UZW8J3CqekkO9WWhH4SwjyE
 XtLt8U9a0PN5NzdoEMrIeTAh9ylqd1S/fKgbZ6BCrtsR19FZ4JWGGUxqs1uzSEsPhUti3hiwm
 0iT07s8jcTK4TxRSjQQxAMWcDddNNS0lAxNIARy65AWFvWL6xTSDjPFlYXlCJj10wJpqUnEXL
 W8owsP21hH+vW6Bbe4/GVh/gyimDCPsLC4t1hOoKN05FC2FEJ/9l/Z76n6reMCYhl4hxFe3Ft
 7xB/OUiazdoE8fYEyjjQslxwCrZ6cwstAvcrZKGVJ05IN2b30nSi9UC9YEAdIUICu1Hnsj5th
 HXi8pX8sUB4oZZC1X+WMrcnGPHJs+Nw1iURa1vQo0N9ltbc1eczjYeXF2Dk/Nhb+dsmf2QAPz
 w6psZy64x6uW+qg6QeHkdnDxA3UIELz1msfpz4lCJ8Ft1ZCA3xOkUBphVrpAH6D7Yz84nxDLs
 cFDkxOz/AYlfCLO0anwhJC4IeK1dICCnHVY2t1Hg+CK9CakfcCJuGD2e2EGPAvrxkk76OTDoj
 0AxHJoFvJh3TxMT3W0A4uLsnSBmPITjibmQT+751vlkx3xZ1lpYtHnKicHSS15YsDlW3IIGqg
 c/O8JLPIxe4IlNmvnqafOxtkpeCVBe
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/24 15:09, Thomas Zimmermann wrote:
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index 77ab44362f16..577e91ff7bf6 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>   	tristate "Support for small TFT LCD display modules"
>   	depends on FB && SPI
>   	depends on FB_DEVICE
> +	depends on BACKLIGHT_DEVICE_CLASS

Typo. Should be BACKLIGHT_CLASS_DEVICE...

Helge

