Return-Path: <linuxppc-dev+bounces-2241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F699D6A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 20:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS5cH5xfGz3bcp;
	Tue, 15 Oct 2024 05:39:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728931167;
	cv=none; b=MNBcNFQXhFGfYGDgZFDxuwMaJ6vWtYAGM3btNV8dCS5GFQc/IPP1TTHhuUO0nYO/3csv0Kg79B4CIzw/S7tde1kHwW4w4l0En+haJF1rauTNNVrxg30uIOKUeUNoIeyfFBTrvzPhGFwIXwx3xIXW0HajemrTAG0dBUjoAgg+vbUNRAZERqG9HPZHU/FnknESDhM2qaCK38+EuQwI1lAXyAYcFgly6uNiDD6qOsxHjzpKj6qLW1SDp0kou3Zk/PThuwepBt0PQj0jStV21myLko1paT+LQnZhAdlSxnqoMC7T1b6Jqw1dl2U1XSaj7nbWbDeWJSKbRZC2R7RBW3UX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728931167; c=relaxed/relaxed;
	bh=0r76MqNhjQHMwaWhdIiFLyHSJMjIu1KOA2CjoqqtSM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHgEC886Mkh/XGzrX5P1DymwroUmT8jIRPkYX+NxkqgCQK6O+DbovoIPm5EvADyajV12cP+rjKGjAK+dMqfCB6XJAPHfnzcqugAZeQH9f66pUFPCoySeIt8owHWeBbBlAJEmrD89sjkBIsFtVTVmuXMDCIQ/W8miV8Bx5/TqBktt55rJ9Kh8oYzeF1lqOpT4hrjDk30iVGcKYafji7xORgmgcMILHEL+sCiX1LK+YUvPFcqPPL9q4gQa59oAEofvZHUh1o3iJbQ33whM6WyQX4uTmRLpI8SbgHTjUrPG7B8I6i07eDR2Zjd9SRPD4shc8lEOB5OL2yn/2r5kEks7zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hks5M7V/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hks5M7V/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS5cF73WPz3bbn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 05:39:25 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9a0f198d38so211468166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728931158; x=1729535958; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0r76MqNhjQHMwaWhdIiFLyHSJMjIu1KOA2CjoqqtSM4=;
        b=Hks5M7V/cfqvQ/QfiNT7QK2rSSF0X+o4fxbsKTL+mv6WfdK4rchXYReSMHNE3JKtOS
         vbKLxX6VU4zKqTD9fpEeLbibHKQIXubuRf6WwDQdpqejFPPNDJPDgFiy2kSvKay4gfm4
         bbpfIZ0c5nVir0EyzPluNMS9fm0asaZzXdadZJcr+iENnlRIz6H4UcpJ4c9cj0sDbm+A
         mlTHBR8zB7tPLfv9SCN7SZGOeC8RE3JFeSPru1MIuWdYKAvgnqE/0pS8rWD+MpkkaOJe
         Fr0JD6V9FR6RRy60/jTc/EGvBPYymrmcWd6SZt7MmXP+4t0A2W5AwmtB82LRgsaKfKUw
         Mqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728931158; x=1729535958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0r76MqNhjQHMwaWhdIiFLyHSJMjIu1KOA2CjoqqtSM4=;
        b=aWVOtgG2Xg3SfsEXQcysAHaS+ZzVoLVHlcQ/BJrnLb2Xj4m9gs/DJJctevPjoXxPK3
         exOtf5gRnaONl8dkTYwavOqTCVyg9sZ/PhjjrkR+YeVBYNhKVE5/K40OWTLNrvB1V1zM
         8GLowsuvPfs9IAYRCVYYqnOpIRLhCPXkqwKLSvwD+trJMPKH4gFhOIViFZeEjOfe6sPG
         lmVMyKYr8tDF80NKLWpdiintoU+IKYVsXyMziRqdAddt1pDqv2NFlfWgGMx231bcFA2Y
         o/V6Zcw3vfg3w1b2JXlpRQkKHlFXGiNbM6RLGwhaPa1xufm2UwSvYO+66Rldpj5L5Y4l
         Y9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXr+sGibDzuCTlStwnGjhE4gk3FFHVmfS8cFD2646P5qp447Hlx5rjSkrskIKO8QnXHCx9y9FJInpAFVOM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz21Sbg2L0bFJm8oU6iqVUtlUlqno7j6hBxc6Vjp4Zm8JARpdVJ
	ibhtGy+eCWUyG35YMT3CQnOxmR4unsn2e4DEQjIMiBzAw5vbp72t
X-Google-Smtp-Source: AGHT+IFhhSROBO9GfBivL9KwataGn4/0YIUxuXdkFCm1rEekyN3xQH7THl7pb75iTikmddIrLHixIA==
X-Received: by 2002:a17:906:da83:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a99e3e437f4mr874605066b.43.1728931158353;
        Mon, 14 Oct 2024 11:39:18 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a16989a01sm126620866b.116.2024.10.14.11.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 11:39:17 -0700 (PDT)
Message-ID: <a02e3e0b-8a9b-47d5-87cf-2c957a474daa@gmail.com>
Date: Mon, 14 Oct 2024 20:39:16 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] ipw2100 ipw2200 ps3_gelic rtl8712 --- Are we ready for wext
 cleanup?
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Geoff Levand
 <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>
References: <a7eb3db4-ad0d-451a-9106-90d481bd3231@gmail.com>
 <87iktv58tn.fsf@kernel.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <87iktv58tn.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14.10.24 11:32, Kalle Valo wrote:
> Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:
> 
>> origin of this question was the following patch series from Arnd Bergmann
>> [PATCH 00/10] Remove obsolete and orphaned wifi drivers
>> https://lore.kernel.org/linux-staging/20231023131953.2876682-1-arnd@kernel.org/
>>
>> Here the remaining files that use iw_handler_def:
>> drivers/net/ethernet/toshiba/ps3_gelic_wireless.c:static const struct
>> iw_handler_def gelic_wl_wext_handler_def = {
>> drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct
>> iw_handler_def ipw2100_wx_handler_def;
>> drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct
>> iw_handler_def ipw2100_wx_handler_def = {
>> drivers/net/wireless/intel/ipw2x00/ipw2200.c:static const struct
>> iw_handler_def ipw_wx_handler_def = {
>> drivers/staging/rtl8712/os_intfs.c:     pnetdev->wireless_handlers =
>> (struct iw_handler_def *)
>> drivers/staging/rtl8712/rtl871x_ioctl.h:extern struct iw_handler_def
>> r871x_handlers_def;
>> drivers/staging/rtl8712/rtl871x_ioctl_linux.c:struct iw_handler_def
>> r871x_handlers_def = {
>>
>>
>> In this Email Greg writes over rtl8192e:
>> https://lore.kernel.org/linux-staging/2024100810-payback-suds-8c15@gregkh/
>> "...
>> No staging driver should ever get in the way of api changes elsewhere in
>> the kernel, that's one of the rules of this part of the tree.  So from
>> my opinion, it's fine to delete it now.  It can always come back in a
>> new way later on.
>> ..."
>>
>> So it should not be an issue to remove rtl8712.
>>
>> Stefan Lippers-Hollmann was one year ago still using the ipw2200.
>> https://lore.kernel.org/linux-staging/20231024014302.0a0b79b0@mir/
>>
>> Here my opinion why I think we should reconsider this:
>>
>> I really like to use old hardware. One of my computers is from trash
>> and the other one is bought for 50€ three years ago. But non of my
>> hardware is from before 2012. Do we as a community really need to
>> support hardware from 2003 in kernel 6.13 for WLAN that evolved so
>> rapidly? I do not think so.
>>
>> People around me are complaining that the 2,4GHz WLAN is difficult to
>> use because so many devices are using it. Such slow devices consume a
>> lot of time to send and receive the data and block therefore other
>> devices.
>>
>> The longterm kernels will still support this hardware for years.
>>
>> Please explain to our very high value resources (Maintainers,
>> Developers with wext and mac80211 expierience) that you cannot find
>> any other solution that is within technical possibility and budget
>> (USB WLAN Stick or exchange of WLAN module) and that they need to
>> invest their time for maintenance.
>> Here the example of invested time from Johannes Berg:
>> https://lore.kernel.org/all/20241007213525.8b2d52b60531.I6a27aaf30bded9a0977f07f47fba2bd31a3b3330@changeid/
>>
>> I cannot ask the Linux kernel community to support my test hardware
>> just because I bought it some time ago. Rather, I have to show that I
>> use it for private or business purposes on a regular basis and that I
>> cannot easily change.
>>
>> Using this hardware is security wise not state of the art as WPA3 is
>> not supported. We put so much effort into security. Why not here?
> 
> I didn't quite get what you are saying here, are you proposing that we
> should remove ancient drivers faster?
> 

Hi Kalle,

I propose to delete the last three drivers that are using wireless 
extension:
ps3_gelic_wireless
ipw2x00
rtl8712

Thanks for your response.

Bye Philipp



