Return-Path: <linuxppc-dev+bounces-3915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8A9EB39B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:40:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71bk4l8Hz2ysX;
	Wed, 11 Dec 2024 01:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841602;
	cv=none; b=W+pPWrJX57IkqgFx9fGQ85mPMOgrSdaxnat4s4YQW69zJQ/eW7yWeJaHcBfoZFGlrNO7EPUCrgHJY58qPR0gt1EiclH3vAckO1phFVp4xvblCxKZpwHSRKSOEiqwjHZbIOQObRHqXqqpfPplSIWYaI9f3M8KDjlhBDdyI5uHpyJcd7Q6J7a+XTrSZ6x6KpfQwA5YGe47mwRrK/6X4n//wnON3uY+6/bp0HWHR0QnOwngxUqweROG7WOQLQI5ngybCPXiUR/rjmrZvWqq44TEKbhZ1b/g//EU0zyS5L9mibGWHDZAW4pfKeBjfkR0JmZPJsdgI4NGG5uzYMNZdgXO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841602; c=relaxed/relaxed;
	bh=ovhxzLa/8jUYl5kvOMEd8c3o5SBp/7V1cj39CApQCV4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cBkHyHoYwC643wU61TGjvZGtDilBOD2VkPGZSBORfJdNfUEP2ArMku2+5OWK281eKFOTivRDpUHMRKsGKMj/b++dTLQ34DpXIQ3WKLBmViOnexM+2KNRr6EiiKDWvTxqvPntteZ3EhBnYUyyr/ZZYFq+ucRSSKdHZ3MBMzZMN9UuqHHMf4o9Pz/CHfxEzRlt+YqGdrh/96KHujtpCt6phPbxQjTxW1ANjc2sP6ISAoFIAujyo5wv7BTXh4blCeQBevp5OGzw/N01T/86ukRZ7Je3gMAxtcuRU5mPf9me9rZwWcozlmX/k58RMN626NuAPEV5jhubnQG6Yyf7qgZycA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lj9ZBw8b; dkim-atps=neutral; spf=pass (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lj9ZBw8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71bj0fzYz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:39:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733841596; x=1734446396; i=deller@gmx.de;
	bh=ovhxzLa/8jUYl5kvOMEd8c3o5SBp/7V1cj39CApQCV4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lj9ZBw8b/5QIqqoDch0hO2piaDmrNzUmop8DTUdXIJqYlgsj/dvQ8H3WgdIc6leU
	 ZHoJQ0TXS+cdjGFi4d3h0R4/NXNQf74dm4l7sqNHHC5qT6yAUMjscrak/XGEd01wi
	 J/YxiKQzya3DxpI+mUdgtBgnT/EIsszgPTusyzJLa1emhUp+6IfL3nKUewTNtbAid
	 xKxZPoNuPHqtWjXKWkbzpg7/cZZu7zlBGfUlaLBdIhwuEvLOumNXc4vNFj+hYOp0f
	 3LALGOky1e1akeSHt8qLVmmoylAOGIjeFUKcihgu2r5IiPxLfZyONHQE6nRTc3fjG
	 rR9Tp1HgLdLSNhTZgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1u412V13ND-00cZfB; Tue, 10
 Dec 2024 15:34:36 +0100
Message-ID: <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
Date: Tue, 10 Dec 2024 15:34:35 +0100
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
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JbFt7Btsk+9PSBxMORdqKfCeGnR9IN1dTyKsbfkNszHIk7rVWDq
 2lnFZ0zlRmKVx5AEi6AyMfbWihLWH0fRym3k5LD9Z/Oq27y+TvLF2S0CoM5VBTPz4/cpBSp
 ljoZ9L9AWBUgtX+Uebesp1EmHbTJ+ZpzKhyIO4A7dlkXfD6085iJxdoreGY93iIozYRZxU6
 /07ZixpC8O4XhIY1fu8uQ==
UI-OutboundReport: notjunk:1;M01:P0:kGW689nf2KY=;0tHrnGTCg2J1vClV7CMWMj5P/E4
 bwRIKNUbqi1Mkb3F0Vlg9Tf4GTP7phFu69sjJDqjGaRMmp23gEUMqsV+sRtMUbit4PrdvXoJ5
 8itdKThmAVA9/jp2FP1iW86X2hW4WW5t2JTzRdJm40twQhZtjkfOZp9ffJrhfh6EzYbgnClA4
 WWEGP+IPDPR4G9sVXq2ykmz7kMS6RwlzyQUCWSJpCNWsrop8nu0l6Mr9a7+fvzDvAjCgw8wGd
 FmWTiqyGCuZYk/imLbeMBp9a+70i+jX/lBEOGkomJ66d+vFrQJNmhr/JJUcG3z1aP8lv6vUqd
 oFjVigwnRa+ayxS8sbm3ZwjCWBVZlRqnAhsBQnlHBtaEXvJgoxDQEYm6z+KGFvmbcoiAe19zo
 8bskmQMLHbyLOG82Ep0z28vKOd3BCflV6zzUkj+Qku4SLkV5G0Y/5J5AoYSj6GMQ79brIgL0z
 O9scqn9DX28da+rATSsIeR4pirLaTfUKiBHbLx490tgjO3HNEg9tXAU6BnjIYpKspzJnQUw6m
 5VX2cfW97Sf5TaiqBhk2/TAtjF+13GlEuPhs5CZIUetCiE6x7YqLmwTby615+IzkIJhAm27/E
 zasksfktukmu4B9unK9gZUjXCAME27DqWjwYnfnEJJYgf+NYtU+j4hwaqKPFI0qnSpW5JRYn8
 Z2pE1A3NG1sQa8PWEtTfrndbTvf4dh0jBvDK3axBzfxLzy4DH0nZy8I3vT4ccn5L9MWOKJCcv
 rcIppmM+63+G4fpU1F6vol8zRDZDtj+oh1AC5qBls6GqRmiW3BYkf/IpNtJ7Js36seCM0l2U8
 GbXPyS2ObqJh+fz2SJYqEx2aiIk1hEPeIvVhqiQyfflExmSUgw1vVwkQtx+OzmvcREXHNnQG8
 aAJYeM/BXba1EbqrnjM/AVZIyn18F5Yp5bzHfmvurmhL43Dc3dV4cxHf3F2mrueu1sJ4I+s9I
 7S4uw+Y3MjJ/LN71MLCx5B1FwIYxgYGmFsK6ZfZ+mHc51tZf6RoUWEQZn4ny3ICgPJDVgLM+Q
 fJfz2pEfrw63hL/xectJmmkpeqpIg5GFumdPGp2IMF3M6VDZuQuB/zQxGJzV+SP8zqZg2ox5S
 hEBvHv4TnTqw0bQeF9XqA33ue7wbg/
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/24 15:29, Helge Deller wrote:
> On 12/10/24 15:09, Thomas Zimmermann wrote:
>> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kcon=
fig
>> index 77ab44362f16..577e91ff7bf6 100644
>> --- a/drivers/staging/fbtft/Kconfig
>> +++ b/drivers/staging/fbtft/Kconfig
>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD disp=
lay modules"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>
> Typo. Should be BACKLIGHT_CLASS_DEVICE...

Beside the typo:
In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS" ins=
tead?
If people want the fbtft, backlight support should be enabled too.

Helge


