Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D304E84F8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 04:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQzdg3Ytfz30jV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 13:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FLgjPZbp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FLgjPZbp; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQp7f1SKNz307L
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 05:55:41 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id o64so11633666oib.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=od8p5pl2U97jeU4B5zrg7n+5mCzeV+pC/ksqgi0ZrCg=;
 b=FLgjPZbpsRgixevsWBrkzNi6JX+0JOdLVae2WiE33dW2CYOkn5xqbMkUlVUP8W2wu7
 GkxJRlQBc9JikV5LxxH776y/rCGduf9iWPHNwF2JwC98xLaDJOBMG8veU5JxGQ7nOAvJ
 m/+JrXhLeGunBEipRoADOWS5rGjDCc6Gz4IggFgtvunK5yE88pyhHsgbZfGiHbN0KDJE
 NB8NTlDVtPBrxk4PUIVxhTUnFKrA8WccJDTDtm7JqRWvIiRfCooKnwEhY3aTmayCwMpQ
 V3hyLVfO0DlGQFzspBvlHmqHXQ6R9+E5kFXKetAYpzKWkBQUTmJFethoAMM1paiNI8zm
 YaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=od8p5pl2U97jeU4B5zrg7n+5mCzeV+pC/ksqgi0ZrCg=;
 b=zDLseqaF8WODyiSY2bH84+6S73HUrQBA+Wyym7fMyfP4ZZQEufM1Y0tABEVXVek1C6
 3twt4PVoFtZfpRmGqf/kEaU3E6niVfH5UZL9jDXmWfMsGYGUOZqCm+pG1Ad9bCRBCJao
 3QNJLwuCo3r3gbyXwHriIPTSSxujsiiG5gp751jXZo+tgwyRqR7YDyj1fyT64GygyQd5
 gXDwlENTnyDUCRD7nA0jd3oDHGb+vrSeDvWh+TK3DjYbf/MiKtcOsCubm04IYqgFtmT3
 jKI+wSP9igrnhC5mIHFwhx8Ydv067uZdCgEJr8LdeKplrPCGQdh6dJaTorLl8i7qqIt+
 4c0g==
X-Gm-Message-State: AOAM532BuienDbLoZDX3HoqCBnpcVUmCaxmROqyYTK1ww8p3OjHL87nq
 EcNrpP0l3jQlJfuBg2iypSI=
X-Google-Smtp-Source: ABdhPJwENpqHi0yoebC6ynBYdoBH1ZAUKF4tDj7px8PfwrXlpK2apNGv6Udv3OPe7ze8luScmr+hMg==
X-Received: by 2002:a05:6808:118c:b0:2d4:4194:70db with SMTP id
 j12-20020a056808118c00b002d4419470dbmr8444758oil.93.1648320937799; 
 Sat, 26 Mar 2022 11:55:37 -0700 (PDT)
Received: from [192.168.1.103] (cpe-24-31-246-181.kc.res.rr.com.
 [24.31.246.181]) by smtp.gmail.com with ESMTPSA id
 k4-20020a9d4b84000000b005b2310ebdffsm4697502otf.54.2022.03.26.11.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 11:55:37 -0700 (PDT)
Message-ID: <f7bb9164-2f66-8985-5771-5f31ee5740b7@lwfinger.net>
Date: Sat, 26 Mar 2022 13:55:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 21/22] rtw89: Replace comments with C99 initializers
Content-Language: en-US
To: =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>, andrew@lunn.ch
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-21-benni@stuerz.xyz>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220326165909.506926-21-benni@stuerz.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 13:03:21 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 pkshih@realtek.com, linux-samsung-soc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 gregory.clement@bootlin.com, rafael.j.wysocki@intel.com, linux@armlinux.org.uk,
 krzk@kernel.org, jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, mike.marciniszyn@cornelisnetworks.com, rric@kernel.org,
 ajd@linux.ibm.com, arnd@arndb.de, kvalo@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 loic.poulain@linaro.org, bp@alien8.de, bhelgaas@google.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/22 11:59, Benjamin Stürz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.
> 
> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>   drivers/net/wireless/realtek/rtw89/coex.c | 40 +++++++++++------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
> index 684583955511..3c83a0bfb120 100644
> --- a/drivers/net/wireless/realtek/rtw89/coex.c
> +++ b/drivers/net/wireless/realtek/rtw89/coex.c
> @@ -97,26 +97,26 @@ static const struct rtw89_btc_fbtc_slot s_def[] = {
>   };
>   
>   static const u32 cxtbl[] = {
> -	0xffffffff, /* 0 */
> -	0xaaaaaaaa, /* 1 */
> -	0x55555555, /* 2 */
> -	0x66555555, /* 3 */
> -	0x66556655, /* 4 */
> -	0x5a5a5a5a, /* 5 */
> -	0x5a5a5aaa, /* 6 */
> -	0xaa5a5a5a, /* 7 */
> -	0x6a5a5a5a, /* 8 */
> -	0x6a5a5aaa, /* 9 */
> -	0x6a5a6a5a, /* 10 */
> -	0x6a5a6aaa, /* 11 */
> -	0x6afa5afa, /* 12 */
> -	0xaaaa5aaa, /* 13 */
> -	0xaaffffaa, /* 14 */
> -	0xaa5555aa, /* 15 */
> -	0xfafafafa, /* 16 */
> -	0xffffddff, /* 17 */
> -	0xdaffdaff, /* 18 */
> -	0xfafadafa  /* 19 */
> +	[0]  = 0xffffffff,
> +	[1]  = 0xaaaaaaaa,
> +	[2]  = 0x55555555,
> +	[3]  = 0x66555555,
> +	[4]  = 0x66556655,
> +	[5]  = 0x5a5a5a5a,
> +	[6]  = 0x5a5a5aaa,
> +	[7]  = 0xaa5a5a5a,
> +	[8]  = 0x6a5a5a5a,
> +	[9]  = 0x6a5a5aaa,
> +	[10] = 0x6a5a6a5a,
> +	[11] = 0x6a5a6aaa,
> +	[12] = 0x6afa5afa,
> +	[13] = 0xaaaa5aaa,
> +	[14] = 0xaaffffaa,
> +	[15] = 0xaa5555aa,
> +	[16] = 0xfafafafa,
> +	[17] = 0xffffddff,
> +	[18] = 0xdaffdaff,
> +	[19] = 0xfafadafa
>   };
>   
>   struct rtw89_btc_btf_tlv {


Is this change really necessary? Yes, the entries must be ordered; however, the 
comment carries that information at very few extra characters. To me, this patch 
looks like unneeded source churn. One other concern is that this driver is 
backported to older kernels and older compilers by several distros. Will this 
change require adding extra conditional statements to the source used in these 
applications?

Larry

