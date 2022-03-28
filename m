Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938D4E92DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 12:57:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRqQl2Bj4z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 21:57:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q2kwNuWn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=kvalo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q2kwNuWn; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRnSg18hXz3071
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 20:28:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B4DB80FD3;
 Mon, 28 Mar 2022 09:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF3EC004DD;
 Mon, 28 Mar 2022 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648459726;
 bh=YbP5lj9aEd4DoYw2/KO0XgPscMHFUgkHCQI0zXuUgAI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=q2kwNuWnLPg3ldJ06RzOoGZgjEApk2emBsBlcC4DIWDBf6XS6buiB/pFE0ki2GKr6
 ErVihGEORLk+Kl/joyYFH9Qnn5WIKisIJs2koQm75vxblzUACLdba7bLBadv34jqHa
 gG/dyimPa3QMXarS8taeQrItnA+PyE+69QfmI1x+OIRN37CqA8RGmFSfy8wCk32LYd
 wWNPuDjDJII9jb6UiZjaJQY+mrErr5hXT95wGlcXLjmEq3JrFXNadx78JuJyNsfATA
 KRM4AmAlzGRVV2bBDL3KM8oNuNDKBwh/AqLu5QcMplbJuTfwuOcAa7hX9WZ9rw1WWk
 IPDzzpGq0+fyA==
From: Kalle Valo <kvalo@kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH 21/22] rtw89: Replace comments with C99 initializers
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-21-benni@stuerz.xyz>
 <f7bb9164-2f66-8985-5771-5f31ee5740b7@lwfinger.net>
Date: Mon, 28 Mar 2022 12:28:30 +0300
In-Reply-To: <f7bb9164-2f66-8985-5771-5f31ee5740b7@lwfinger.net> (Larry
 Finger's message of "Sat, 26 Mar 2022 13:55:33 -0500")
Message-ID: <87k0cezarl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 28 Mar 2022 21:56:49 +1100
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org,
 Benjamin =?utf-8?Q?St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
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

Larry Finger <Larry.Finger@lwfinger.net> writes:

> On 3/26/22 11:59, Benjamin St=C3=BCrz wrote:
>> This replaces comments with C99's designated
>> initializers because the kernel supports them now.
>>
>> Signed-off-by: Benjamin St=C3=BCrz <benni@stuerz.xyz>
>> ---
>>   drivers/net/wireless/realtek/rtw89/coex.c | 40 +++++++++++------------
>>   1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wir=
eless/realtek/rtw89/coex.c
>> index 684583955511..3c83a0bfb120 100644
>> --- a/drivers/net/wireless/realtek/rtw89/coex.c
>> +++ b/drivers/net/wireless/realtek/rtw89/coex.c
>> @@ -97,26 +97,26 @@ static const struct rtw89_btc_fbtc_slot s_def[] =3D {
>>   };
>>     static const u32 cxtbl[] =3D {
>> -	0xffffffff, /* 0 */
>> -	0xaaaaaaaa, /* 1 */
>> -	0x55555555, /* 2 */
>> -	0x66555555, /* 3 */
>> -	0x66556655, /* 4 */
>> -	0x5a5a5a5a, /* 5 */
>> -	0x5a5a5aaa, /* 6 */
>> -	0xaa5a5a5a, /* 7 */
>> -	0x6a5a5a5a, /* 8 */
>> -	0x6a5a5aaa, /* 9 */
>> -	0x6a5a6a5a, /* 10 */
>> -	0x6a5a6aaa, /* 11 */
>> -	0x6afa5afa, /* 12 */
>> -	0xaaaa5aaa, /* 13 */
>> -	0xaaffffaa, /* 14 */
>> -	0xaa5555aa, /* 15 */
>> -	0xfafafafa, /* 16 */
>> -	0xffffddff, /* 17 */
>> -	0xdaffdaff, /* 18 */
>> -	0xfafadafa  /* 19 */
>> +	[0]  =3D 0xffffffff,
>> +	[1]  =3D 0xaaaaaaaa,
>> +	[2]  =3D 0x55555555,
>> +	[3]  =3D 0x66555555,
>> +	[4]  =3D 0x66556655,
>> +	[5]  =3D 0x5a5a5a5a,
>> +	[6]  =3D 0x5a5a5aaa,
>> +	[7]  =3D 0xaa5a5a5a,
>> +	[8]  =3D 0x6a5a5a5a,
>> +	[9]  =3D 0x6a5a5aaa,
>> +	[10] =3D 0x6a5a6a5a,
>> +	[11] =3D 0x6a5a6aaa,
>> +	[12] =3D 0x6afa5afa,
>> +	[13] =3D 0xaaaa5aaa,
>> +	[14] =3D 0xaaffffaa,
>> +	[15] =3D 0xaa5555aa,
>> +	[16] =3D 0xfafafafa,
>> +	[17] =3D 0xffffddff,
>> +	[18] =3D 0xdaffdaff,
>> +	[19] =3D 0xfafadafa
>>   };
>>     struct rtw89_btc_btf_tlv {
>
>
> Is this change really necessary? Yes, the entries must be ordered;
> however, the comment carries that information at very few extra
> characters. To me, this patch looks like unneeded source churn.

One small benefit I see is to avoid the comment index being wrong and
there would be no way to catch that. But otherwise I don't have any
opinion about this.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
