Return-Path: <linuxppc-dev+bounces-2174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AC99BC42
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 23:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRYVl40QRz2y8Z;
	Mon, 14 Oct 2024 08:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728851339;
	cv=none; b=HzmuxT0gRl/9j9GQXxCYGDMgGpbjMA+gyLxfki6Br8YhXi9O75uNR8k506ABEhH5amO+WxF2og9p3V9vIX0QgfFCPNXl7QtjX9nrBkOfWx/PW6ImF+Hrp1qmP6XL4l2JUOn7VRGqJr56oSHP7VxpNOl+7aqcFO743P4DawiZ8lCJkLWYf2QOGIZo259WvdoImfhSv30MD9+WoduQ9xtOMWShKjiI7u0BPz9vJzBcUeu1E9oQEgRP/o39cofJ/uP4ZyQeqkuUalb1ko/R91yOxLnnEEr5XNTO+VXm2heJXZxqmbtaoWtY9q/bKYvXtNXufDtTjWGK41fQ6u5BsImVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728851339; c=relaxed/relaxed;
	bh=3wRWCdVZVlOXVVV3K+TnOo4abj1WCau4sw4RIKpf2YQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=HLhMyW3N9UZayLHsecQUryavrVjplEFgEefdPwV+HJh/NfyTSTpsFf+JtiGe297rz0poexUquuVXWbjQvFhQewuaEgoQeirYq0TvGNpr5H4dizJ0uj+yzlkwlERyi7yG6kHjpuCsH11A5IUn2QlZ6UcU5Ugu6KXRa7qmjfC8bkM4ZJ+uZlUhweq7t7yxk+B4xpXb/bfwo/AHibMtGrSX21cYoTjzaxVpgRbaEfBqOysex4d4SA0FizUdmuJPr06BojDg2wgEzpp/qv7AxZ8kOnz0c//P+uslG2UKCDi9Q1GYaE4l2c8Z2XYAKrvxhYSPBGuqRZl3jkiYrK/ZbA4Zow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VBqUIm3s; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VBqUIm3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRX546BPgz2xBk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 07:28:55 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso607613566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 13:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728851330; x=1729456130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wRWCdVZVlOXVVV3K+TnOo4abj1WCau4sw4RIKpf2YQ=;
        b=VBqUIm3s0Zyzhu42V5PpK+TeCHfZJmj3i0k3xGQUKXFS3iLl9VLFaOJUqVFsBdNMw0
         u5NQLs3hmSNaRokzpFLi9Xo28fVk6Dn7WAbGMaZjz6MQ5q+INSeNAxmo3AjHkcTignBY
         4FGj9spoF6hFctdM/fFJD3I7XmewObqtE1Ogxps8IHrtUjWr7rUCGQPO7HhhLUvV6Cra
         2Yo0fA2jHv/nCQAMQuLOI3lmvPkE6QrZ68Yx4Vhoi0RooPTDtEjQhT7oZdval9f6vx3x
         rGDs0Pple24QywzI+JsW/4CfMMTP5WqpTCTRpaIywxE8HAAQImBcd5blD7Tok1zbST0I
         54Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728851330; x=1729456130;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wRWCdVZVlOXVVV3K+TnOo4abj1WCau4sw4RIKpf2YQ=;
        b=oKWIEuwKospEt5e+LsyE46v5daicaD5e3LzJS4a+ck9sqDPQbZ+MhnoQVDdJ3jLSGC
         DSNK1rXEAqnuBT69/uateKeAM24VeUPgUNSm1GT88chfY7AYVejZNLNABdW5s02s2pnB
         jIkC1XRSp+0XRfFAEDViKN8gUUJcwU91P+WkwbfJstmoDn27Xwj8Mt69/R3q3dsvYUkw
         QvTWrnnhHlnC8CDHzkqU7rgfUdgs8Qiujl/7ShzvJlSwhlbSt1zFogkj9gjBda1kR4Z1
         0XJjab/6YNj+6h+eibyGsScxuXV2mu49KaSEgW8E6J8JHuJvUHfVhQRtQehDVhA516Hz
         sYrw==
X-Forwarded-Encrypted: i=1; AJvYcCUYumBgctpLv1z475TZn4XzB317YCkgldFZFE/8NXCmq6qkzTmvD9o/q8PUiJFjYrzWqRa0qyefym19Pic=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyegf/on5grklG5XoBIMAf0VxQ+tPwjfLI/EPUkTRp9IQOtoJCo
	S1+6HaabUu+YFqMURIbnRY41NP4jugASivncq+kcjsH4aXcDjnjL
X-Google-Smtp-Source: AGHT+IFs8k6ARM1XBsiAlApkPDu0TO2sAvbk/FEu1+/7bODbqmT00VImgLMaitpFuy+TrqJfC18XtQ==
X-Received: by 2002:a17:907:86ab:b0:a99:f887:ec09 with SMTP id a640c23a62f3a-a99f887ee29mr376832566b.35.1728851330052;
        Sun, 13 Oct 2024 13:28:50 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a06169967sm114645266b.97.2024.10.13.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 13:28:49 -0700 (PDT)
Message-ID: <a7eb3db4-ad0d-451a-9106-90d481bd3231@gmail.com>
Date: Sun, 13 Oct 2024 22:28:48 +0200
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
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] ipw2100 ipw2200 ps3_gelic rtl8712 --- Are we ready for wext
 cleanup?
To: linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

origin of this question was the following patch series from Arnd Bergmann
[PATCH 00/10] Remove obsolete and orphaned wifi drivers
https://lore.kernel.org/linux-staging/20231023131953.2876682-1-arnd@kernel.org/

Here the remaining files that use iw_handler_def:
drivers/net/ethernet/toshiba/ps3_gelic_wireless.c:static const struct 
iw_handler_def gelic_wl_wext_handler_def = {
drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct 
iw_handler_def ipw2100_wx_handler_def;
drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct 
iw_handler_def ipw2100_wx_handler_def = {
drivers/net/wireless/intel/ipw2x00/ipw2200.c:static const struct 
iw_handler_def ipw_wx_handler_def = {
drivers/staging/rtl8712/os_intfs.c:     pnetdev->wireless_handlers = 
(struct iw_handler_def *)
drivers/staging/rtl8712/rtl871x_ioctl.h:extern struct iw_handler_def 
r871x_handlers_def;
drivers/staging/rtl8712/rtl871x_ioctl_linux.c:struct iw_handler_def 
r871x_handlers_def = {


In this Email Greg writes over rtl8192e:
https://lore.kernel.org/linux-staging/2024100810-payback-suds-8c15@gregkh/
"...
No staging driver should ever get in the way of api changes elsewhere in
the kernel, that's one of the rules of this part of the tree.  So from
my opinion, it's fine to delete it now.  It can always come back in a
new way later on.
..."

So it should not be an issue to remove rtl8712.

Stefan Lippers-Hollmann was one year ago still using the ipw2200.
https://lore.kernel.org/linux-staging/20231024014302.0a0b79b0@mir/

Here my opinion why I think we should reconsider this:

I really like to use old hardware. One of my computers is from trash and 
the other one is bought for 50€ three years ago. But non of my hardware 
is from before 2012. Do we as a community really need to support 
hardware from 2003 in kernel 6.13 for WLAN that evolved so rapidly? I do 
not think so.

People around me are complaining that the 2,4GHz WLAN is difficult to 
use because so many devices are using it. Such slow devices consume a 
lot of time to send and receive the data and block therefore other devices.

The longterm kernels will still support this hardware for years.

Please explain to our very high value resources (Maintainers, Developers 
with wext and mac80211 expierience) that you cannot find any other 
solution that is within technical possibility and budget (USB WLAN Stick 
or exchange of WLAN module) and that they need to invest their time for 
maintenance.
Here the example of invested time from Johannes Berg:
https://lore.kernel.org/all/20241007213525.8b2d52b60531.I6a27aaf30bded9a0977f07f47fba2bd31a3b3330@changeid/

I cannot ask the Linux kernel community to support my test hardware just 
because I bought it some time ago. Rather, I have to show that I use it 
for private or business purposes on a regular basis and that I cannot 
easily change.

Using this hardware is security wise not state of the art as WPA3 is not 
supported. We put so much effort into security. Why not here?

Thanks for your response.

Bye Philipp








