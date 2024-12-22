Return-Path: <linuxppc-dev+bounces-4422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C49FA855
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 22:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGZS640fMz2xmS;
	Mon, 23 Dec 2024 08:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734903878;
	cv=none; b=Iaepxn24ivNyHY5Ko+nwmdoPTGqkEF6e4WOsZb5tIcOoeiLCb5Q9Et1hZtOWOwKZV5iWmkhh2JKD61reZWOgf6z/kdfWe1XSA09zhxDF6jGWxsQEciJA0sGs2TQ/dFjRU51pfu72AeWIXmWwZHKS8wK0pavr+1vnwjTtXNnoRBNMGGbmHg3dDB02otsEwX2xCX3/g8XMoKe83H3grYDwFZbbo5h4cp2nt0y2ckc22sJE4lq72AclsRBX/zKCYZ/JyQhkUqvEhv6haoEtO/aXO9pOhAyU5JNXxCl01jJJf7e0OkJ1quyyVX05s8+As0tQe/kqCzYIaOpw0xcP9KgEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734903878; c=relaxed/relaxed;
	bh=v1YmuBHIh89yK3XPiyf/BITD4OiuLyeQj/PKCz7liSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoG0oYklxwvuYR0J2goRabx7LpmfZudSc0gvJlH7KIx4p296xp7Dc2YGKQq4Yy2/Xpe83HeS4+sEqZmHQ2b71ulyo3hpV7EeUliwu341r64O3GaPezNKGyXRkQHJudwW7jKB+FZeXbqIFenMzy6XCLI58Tuv7F3JvTi8jJ+vsqNeO1lgmn8BlWvjFOnOoR9vlqf3Ki4MgYlfFMnYAimTNRaU9GlbKmtJE6ggZ80P92vt0EvG445eqLNv58WX4xdbl+oB5sCABSsc538l5ueiJjpNFZu/tMDT7w9xeP8gFM/ffQKGXG5CWgGNrYlAvK+N9rlfkIPb5+NI2m+AqfmuYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=YUoRxjuR; dkim-atps=neutral; spf=pass (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=YUoRxjuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGZS42JCfz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 08:44:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734903849; x=1735508649; i=deller@gmx.de;
	bh=v1YmuBHIh89yK3XPiyf/BITD4OiuLyeQj/PKCz7liSY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YUoRxjuRrNnc3zisCG2bN4CO+jBDrL0RYczCGVf4lRdOUG/pHIn9CWBnrDLbzQ0Q
	 +b3yBx3pqojVMgoOYXxiDnPJiMVxfzvJJXcfPj++XFUw9X8I9N5a7jikpCM+Qq8bn
	 VQlalYvEfILDqFAE9lPa9rsSSAtw5CP+4w/M67jTxHlC6idBMFH9tb7ELyDqAbN0k
	 YtO36k67G9/K+thSc4UUo3aRIVQy+QFy093uVWILmn3czt0Z6jg0YY7DxPalYOHgf
	 /p6PgMcQkoiMbl4Ve2Tsiq1hEimDDuNgEe+eQpLZ0qalXHrnhtK5Mfw9+RVvaS8zS
	 ejpB6ZF1yiEY61gwQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O2Q-1tOvVn2ghC-000N1U; Sun, 22
 Dec 2024 22:44:09 +0100
Message-ID: <34168023-13ed-473b-ae92-48ad91322105@gmx.de>
Date: Sun, 22 Dec 2024 22:44:06 +0100
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
Subject: Re: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241216074450.8590-1-tzimmermann@suse.de>
 <20241216074450.8590-2-tzimmermann@suse.de>
 <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
 <4e1a06aa-3b00-45b5-a5e3-bb802e774c88@suse.de>
 <83c2f489-4ef1-4b31-8fb3-50f027bebd4c@gmx.de>
 <270f8274-43e7-46fa-a6c5-a998edae1c7c@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <270f8274-43e7-46fa-a6c5-a998edae1c7c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y+JMo7BKB1O45GqYtLtgaeolOYTRSrtRhAAzHsNP5Dzzybc34+G
 KkTzfYPshFrgRTIohieWUCpPJIkPKF0my11DiiOmb30w+CejE5FwRcRpe2IV5QLGfOHTjsi
 A4DC60alhaFP50DsJJGCN1qr9MO9s1FwHAbSOICEQed4Pzo6hxx33siIK6VXhlA4yRlFkRz
 dd1qG1UGZfH/4U/eZ0/Sw==
UI-OutboundReport: notjunk:1;M01:P0:B3uhuEogKyY=;DOgd2RsK+cp1UbQ6B5UPWl2fEA1
 fXMQZ1tzpuFZh2c46UwIHoUEhasK28Ea4hme1zmZfguik8m4mlfXG3Xi35SVuwvRinM/6mtUz
 Wo32M3g4qVLV3sfwxu/iWZY32gQNGnA6PdyuU37dFE/E6fSfzrb5wNInq/8vl+u518TWJYL5x
 3WFReMkivj9WmbCql4OgW/qoStcH3wvZhzp5+wtpGWwT7XTNyFeN69adynrmLesqkaGb+TIoe
 fo5Bd039xyzkY3s8rMHBV1NdiENXdeVow6THTT2m/tbJXuaQcJGhRVKLLL6rxqUSDwSvlHAf7
 Q38MCTPCPDWJ1B/nBc30FuyVlteNsUtYlzVr7lj/cY69BkNJJW/ZcWqX6MBNlt8VpPXDH65nl
 IMiHDFtBQIGfHSJe111KPxyboSVptk3xLhO6mEtZpFkjh+mhlEHY1eUmFVtnLti3N7BNhsNe/
 YK+7wDED6CKjPZ3UWqtu74f7TAAgFjBZsj9NGS/hEs33otXa61A5bq5qb/v87F3O81HThHBOg
 aR42XCsB29QQOIYOdAbQ9ZjFoXjT1uzGpedntOHbat60N5o64b0RR7M4s3f4JI8oEiI/nmVDO
 9k4ldHy8GoBPoXAMqVvVK/CZOhSEpmCClKOgqudFeMQ4USRpV1fRybOaGXRcNFqdfg51aj6t6
 YklsKnXR15rTPjGB0LCvbv14JM/GuHO8BkvvoIbPQXM+r1o0V4YiQt8uoQdQmYhD+4FW2PYVK
 IhKx2FGgWDm8+wuZAcx6Zag58g22wwEMzfDl/kuLvILOxHChCtklfkOHSdW5XP0/Y8Xh02eMk
 spYIrDkStYAIpPv+pWXLNYt4jek3SlcL+w1OoiFfg1J1c5vjaWreuGbPna4x2yZxaKQbMAOd5
 6RPlHgOSXc8W2AU0qRMo4sCv9TQ5JRKRW79hTgZHGI7srH7NvATaBlh+rndPO1XSUK5pk4mv4
 X0gUdoSELt9VhPxHDSCe89+8pmSCFHCeR4L+5QSlU/CB05TQtyLXgGo8ZrADUAsRNcvVfr0g4
 mozCiNtbkAZr0HyDLbHxnzEAW4Sq/wfoM0TlRY5feIgjxMOAMWVN36YlsNYknvyqZXlPmqFHD
 xDZKS0pft6SKg3OAQ9V4AJyAFrHvNT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/22/24 21:50, Arnd Bergmann wrote:
> On Sun, Dec 22, 2024, at 21:15, Helge Deller wrote:
>> On 12/22/24 17:09, Thomas Zimmermann wrote:
>
>>>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIG=
HT_CLASS_DEVICE=3DFB_NVIDIA
>>>>
>>>> Seems wrong. BACKLIGHT_CLASS_DEVICE is of type tristate.
>>>> There are more of those, please check.
>>>
>>> It's exactly correct. Linking would fail with FB_NVIDIA=3Dy and BACKLI=
GHT=3Dm. The above construct avoids this case. Please see Arnd's review co=
mment at [1].
>>
>> I'm not arguing against "depends on BACKLIGHT_CLASS_DEVICE=3Dy".
>> It's the "BACKLIGHT_CLASS_DEVICE=3DFB_NVIDIA" which is wrong.
>> BACKLIGHT_CLASS_DEVICE is tristate, so either "y", "n" or "m", but
>> never "FB_NVIDIA".
>
> There are multiple ways to express this, but that line is a correct
> way to allow all of
>
>    BACKLIGHT_CLASS_DEVICE=3Dy, FB_NVIDIA=3Dm, FB_NVIDIA_BACKLIGHT=3Dy
>    BACKLIGHT_CLASS_DEVICE=3Dy, FB_NVIDIA=3Dy, FB_NVIDIA_BACKLIGHT=3Dy
>    BACKLIGHT_CLASS_DEVICE=3Dm, FB_NVIDIA=3Dm, FB_NVIDIA_BACKLIGHT=3Dy
>
> but disallow the broken
>
>    BACKLIGHT_CLASS_DEVICE=3Dm, FB_NVIDIA=3Dy, FB_NVIDIA_BACKLIGHT=3Dy

Ouch.
So, in BACKLIGHT_CLASS_DEVICE=3DFB_NVIDIA,  "FB_NVIDIA" is simply
being replaced by the current value of the FB_NVIDIA config option
(which is then one of: y/n/m).
I didn't thought of that!

> If you find this line too confusing, can you suggest a different
> expression that has the same behavior?

It's confusing, but probably the shortest one.

Arnd, thanks for explaining!

Thomas, you may add
Acked-by: Helge Deller <deller@gmx.de>
to the series.
In case you want me to take the patch, please let me know.

Helge

