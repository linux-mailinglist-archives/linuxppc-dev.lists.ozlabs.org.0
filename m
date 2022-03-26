Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E194E84FB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 04:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQzgG2QtBz3bvM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 13:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qI8+/rIS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qI8+/rIS; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQqqf61F7z2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 07:11:56 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id b188so11735728oia.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vyogW6pRw4TxMLFH/OAI8i2CuCNMUPvPn6TqY6UMRzs=;
 b=qI8+/rISiLM4S3syiolkBDrkAn5rJnAaX415CYTjx4dKVSFumFrpFURbiHG98m81qZ
 il0OlcEK1TKIHYiFISMHEXl/2QE2f2YHTVL8KZr5QcDlrxOgTuo4L7bk7uZwjMzv2Poj
 IfKJcRcQihpadC6DT8x0J2AlcVlZY9Eh7bh86qF4oGx5VYuAALMDWURmuCjdTmADsS4e
 E1ji/kD2o/eWDlmbxvqnNO9T84DF4D0GaCgOoKzOtshqe3skLjnJfXCSjuDLaj1fWR+W
 t2slUWX0zvkba+impWisaY+5nTg6FTnZWYwj4++z/ucX0dJ7gjmdh5ZD2lrilTA678Iw
 6q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vyogW6pRw4TxMLFH/OAI8i2CuCNMUPvPn6TqY6UMRzs=;
 b=2mKGg1ICdP1DkshxMlW7tO08q90nGxI34KY3GwD8609ty1MV6vQe3C5GlwHVDMq4a/
 +PwNIdC+/qirQa/H/cbPWnK3vmq/Y9ToOW31yyXPJKFyY72ZHYdpryxyUAWST5JrmctE
 mhGWdZI6SDtHrhS3I2K5w6ixTB37MQ6b3I4nPzMaF2m8HNyoIwAkxC7ZqpGd3fkAGhet
 RUlX3HBinRTWt4MweYKOvf2RIpaQkwZhfBEPbegUAGsWktclnjGCclzeXNVy/BRhMTAN
 ojq4u6NUEhU88FdXKN7JTWfcI8I6xL1pE3VMKAzaCLwZ4xt+NLFN6HKayEHe2axZDpje
 +1EA==
X-Gm-Message-State: AOAM530+NpPY/wzil3tbZcBDMewLBeS7qcIRz6nZl2jF09yifzTDDFtn
 6yx6RSnGGZftUO7ffkTf/ck=
X-Google-Smtp-Source: ABdhPJyyr/4gW2/fe8vL0CKJWbjKHQtaF6ZLN/tkmapCcqJDYnd7L4lOtPa78xKHoEUrtbuk1DYsgg==
X-Received: by 2002:a05:6808:124d:b0:2d7:f6e:74b0 with SMTP id
 o13-20020a056808124d00b002d70f6e74b0mr13131949oiv.141.1648325511202; 
 Sat, 26 Mar 2022 13:11:51 -0700 (PDT)
Received: from [192.168.1.103] (cpe-24-31-246-181.kc.res.rr.com.
 [24.31.246.181]) by smtp.gmail.com with ESMTPSA id
 y67-20020a4a4546000000b0032476e1cb40sm4526071ooa.25.2022.03.26.13.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 13:11:50 -0700 (PDT)
Message-ID: <bc2d4f83-0674-ccae-71c8-14427de59f96@lwfinger.net>
Date: Sat, 26 Mar 2022 15:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 16/22] dvb-usb: Replace comments with C99 initializers
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-16-benni@stuerz.xyz>
 <20220326192454.14115baa@coco.lan> <20220326192720.0fddd6dd@coco.lan>
 <63a5e3143e904d1391490f27cc106be894b52ca2.camel@perches.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <63a5e3143e904d1391490f27cc106be894b52ca2.camel@perches.com>
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, linux-media@vger.kernel.org,
 linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, devel@acpica.org,
 isdn@linux-pingi.de, tony.luck@intel.com, nico@fluxnic.net,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, james.morse@arm.com, netdev@vger.kernel.org,
 fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com, pali@kernel.org,
 brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/22 14:51, Joe Perches wrote:
> On Sat, 2022-03-26 at 19:27 +0100, Mauro Carvalho Chehab wrote:
>> Em Sat, 26 Mar 2022 19:24:54 +0100
>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>
>>> Em Sat, 26 Mar 2022 17:59:03 +0100
>>> Benjamin Stürz <benni@stuerz.xyz> escreveu:
>>>
>>>> This replaces comments with C99's designated
>>>> initializers because the kernel supports them now.
>>>>
>>>> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
>>>> ---
>>>>   drivers/media/usb/dvb-usb/dibusb-mb.c | 62 +++++++++++++--------------
>>>>   drivers/media/usb/dvb-usb/dibusb-mc.c | 34 +++++++--------
>>>>   2 files changed, 48 insertions(+), 48 deletions(-)
>>>>
>>>> diff --git a/drivers/media/usb/dvb-usb/dibusb-mb.c b/drivers/media/usb/dvb-usb/dibusb-mb.c
>>>> index e9dc27f73970..f188e07f518b 100644
>>>> --- a/drivers/media/usb/dvb-usb/dibusb-mb.c
>>>> +++ b/drivers/media/usb/dvb-usb/dibusb-mb.c
>>>> @@ -122,40 +122,40 @@ static int dibusb_probe(struct usb_interface *intf,
>>>>   
>>>>   /* do not change the order of the ID table */
>>>>   static struct usb_device_id dibusb_dib3000mb_table [] = {
>>>> -/* 00 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD) },
>>>> -/* 01 */	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM) },
>>>> -/* 02 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_COLD) },
>>>> -/* 03 */	{ USB_DEVICE(USB_VID_COMPRO,		USB_PID_COMPRO_DVBU2000_WARM) },
>>>> -/* 04 */	{ USB_DEVICE(USB_VID_COMPRO_UNK,	USB_PID_COMPRO_DVBU2000_UNK_COLD) },
>>>> -/* 05 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_COLD) },
>>>> -/* 06 */	{ USB_DEVICE(USB_VID_DIBCOM,		USB_PID_DIBCOM_MOD3000_WARM) },
>>>> -/* 07 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_COLD) },
>>>> -/* 08 */	{ USB_DEVICE(USB_VID_EMPIA,		USB_PID_KWORLD_VSTREAM_WARM) },
>>>> -/* 09 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_COLD) },
>>>> -/* 10 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_GRANDTEC_DVBT_USB_WARM) },
>>>> -/* 11 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_COLD) },
>>>> -/* 12 */	{ USB_DEVICE(USB_VID_GRANDTEC,		USB_PID_DIBCOM_MOD3000_WARM) },
>>>> -/* 13 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_COLD) },
>>>> -/* 14 */	{ USB_DEVICE(USB_VID_HYPER_PALTEK,	USB_PID_UNK_HYPER_PALTEK_WARM) },
>>>> -/* 15 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_COLD) },
>>>> -/* 16 */	{ USB_DEVICE(USB_VID_VISIONPLUS,	USB_PID_TWINHAN_VP7041_WARM) },
>>>> -/* 17 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_COLD) },
>>>> -/* 18 */	{ USB_DEVICE(USB_VID_TWINHAN,		USB_PID_TWINHAN_VP7041_WARM) },
>>>> -/* 19 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_COLD) },
>>>> -/* 20 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_WARM) },
>>>> -/* 21 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN2235_COLD) },
>>>> -/* 22 */	{ USB_DEVICE(USB_VID_ULTIMA_ELECTRONIC,	USB_PID_ULTIMA_TVBOX_AN2235_WARM) },
>>>> -/* 23 */	{ USB_DEVICE(USB_VID_ADSTECH,		USB_PID_ADSTECH_USB2_COLD) },
>>>> +[0]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_COLD) },
>>>> +[1]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,		USB_PID_AVERMEDIA_DVBT_USB_WARM) },
>>>
>>> While here, please properly indent this table, and respect the 80-columns limit,
>>> e. g.:
>>>
>>> static struct usb_device_id dibusb_dib3000mb_table [] = {
>>> 	[0] = { USB_DEVICE(USB_VID_WIDEVIEW
>>> 			   USB_PID_AVERMEDIA_DVBT_USB_COLD)
>>> 	},
>>> 	[1]  =	{ USB_DEVICE(USB_VID_WIDEVIEW,
>>> 			     USB_PID_AVERMEDIA_DVBT_USB_WARM)
>>> 	},
>>> 	...
>>
>> Err.... something went wrong with my space bar and I ended hitting send to
>> soon... I meant:
>>
>> static struct usb_device_id dibusb_dib3000mb_table [] = {
>>   	[0] = { USB_DEVICE(USB_VID_WIDEVIEW
>>   			   USB_PID_AVERMEDIA_DVBT_USB_COLD)
>>   	},
>>   	[1] = { USB_DEVICE(USB_VID_WIDEVIEW,
>>   			   USB_PID_AVERMEDIA_DVBT_USB_WARM)
>>   	},
>> 	...
>> };
> 
> maybe static const too
> 
> and
> 
> maybe
> 
> #define DIB_DEVICE(vid, pid)	\
> 	{ USB_DEVICE(USB_VID_ ## vid, USB_PID_ ## pid) }
> 
> so maybe
> 
> static const struct usb_device_id dibusb_dib3000mb_table[] = {
> 	[0] = DIB_DEVICE(WIDEVIEW, AVERMEDIA_DVBT_USB_COLD),
> 	[1] = DIB_DEVICE(WIDEVIEW, AVERMEDIA_DVBT_USB_WARM),
> 	...
> };
> 
> though I _really_ doubt the value of the specific indexing.
> 
> I think this isn't really worth changing at all.

I agree. For the drivers that I maintain, I try to keep the vendor and device 
ids in numerical order. As this table does not require a special order, adding a 
new one in the middle would require redoing all of then after that point. That 
would be pointless work!

Larry
