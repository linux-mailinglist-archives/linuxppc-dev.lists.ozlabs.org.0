Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E847D785E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 01:08:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KkyzU8i9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG4My1mKQz2xVW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 10:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KkyzU8i9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=witold.baryluk@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SG3Ts1y87z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 09:28:00 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ce2988d62eso158959a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 15:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698272877; x=1698877677; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gpIvHM5NvuykoUDW2kRupuz5sx/Tvq7a0jlZsKkUcZs=;
        b=KkyzU8i9cuc6LhRyCVxOHYy3xmO7OTqKrDJ5MLm2Yd/OcknARPcKm+K8LGpEEqDVZY
         wtFA6JyP0kUDcOAFbpiHcHFvDCd6YASq5iB61GJFxtv0cnisC/2duUHTbfTdWhlqjO5l
         13zVZ8wVuhE/DZrhL+XLiS0nNjqoIFpj0mf//KEa8nha8FdUOr5z6XUBUkkpL1jpuE5q
         JnZwpO9SGtFnyg0b9EJZrrOvC9Mctu+kQd5M7H650aHoZ0jL5yztmQJuLNfQJ0UltZZk
         Dn7JomtPApCKM0Mf3BeA8xK3cYjF8oNwTBn/aFDwmkeeDxwlGDSnGZlSEKslNVrx/8PW
         Tcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698272877; x=1698877677;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpIvHM5NvuykoUDW2kRupuz5sx/Tvq7a0jlZsKkUcZs=;
        b=gOQF1S6FP4LYILztKRfiH9bckUJwVbCL+it2qYDbe0f3FpMVbX/W9Jwv7LGQwVIq1A
         7D/geY9FG7ywsFbeNc71Iu823BmPdPwVeLpXP4yh3R2t5bdNfFdnbDTWIeapCN8KTGsy
         Iyufl7Slvf2URm7Z0Nmc40IXJfmXeJbY5wvi/PiByRsBOLO/idWIs60Vs45s2YUara+9
         V/nwF6FSN1DG6DfSWMsIWZCHSyFAepr7X3afzbxukWtpjg2BQ8kVY1DjfAsIRH+hPgfm
         9cm9AX2weZ0XAcoechlVuI+Wa67buxeVxuD7XffkfIDeOrOG0lvE2C2XzipvcbZD5x2U
         Yjmw==
X-Gm-Message-State: AOJu0YzePsAIxm6HPvt0gva0QAPQuTIvZxvl0AqAA7CFoqKYB4Vd8rLU
	ZiGy+0VJlcsVrpA7xF6lYU+L7pWcEGCqxyCKT7w=
X-Google-Smtp-Source: AGHT+IGppM3tGzEymUiuG98SnROM8wXZMsAgd+v2Tnglma2FhzcDZnsttPGrnBID7W3UQdByYtn9HbwApuPSX3zdZhk=
X-Received: by 2002:a05:6871:4391:b0:1bb:a227:7008 with SMTP id
 lv17-20020a056871439100b001bba2277008mr20401190oab.3.1698272877001; Wed, 25
 Oct 2023 15:27:57 -0700 (PDT)
MIME-Version: 1.0
From: Witold Baryluk <witold.baryluk@gmail.com>
Date: Wed, 25 Oct 2023 22:27:20 +0000
Message-ID: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
To: arnd@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Oct 2023 10:07:16 +1100
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, pavel@ucw.cz, gregory.greenman@intel.com, stf_xl@wp.pl, linux-staging@lists.linux.dev, ilw@linux.intel.com, geert@linux-m68k.org, kuba@kernel.org, stas.yakovlev@gmail.com, arnd@arndb.de, kvalo@kernel.org, nicolas.ferre@microchip.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, geoff@infradead.org, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, claudiu.beznea@tuxon.dev, johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Arnd Bergmann <arnd@arndb.de>
>
> These two drivers were used for the earliest "Centrino" branded Intel
> laptops during the late 32-bit Pentium-M era, roughly 2003 to 2005, which
> probably makes it the most modern platform that still uses the wireless
> extension interface instead of cfg80211. Unlike the other drivers that
> are suggested for removal, this one is still officially maintained.
>
> According to Johannes Berg, there was an effort to finish the move away
> from wext in the past, but the last evidence of this that I could find
> is from commit a3caa99e6c68f ("libipw: initiate cfg80211 API conversion
> (v2)") in 2009.
>
> Link: https://lore.kernel.org/all/87fs2fgals.fsf@kernel.org/
> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
> Cc: Linux Wireless <ilw@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm not convinced this should be in the same set of drivers as the
> rest, since this is clearly less obsolete than the other hardware
> that I would remove support for.

I still use ipw2200 on Intel PRO/Wireless 2915ABG [Calexico2] Network
Connection card, in my IBM Thinkpad X41 (Pentium-M 1.73GHz, Centrino
platform). The laptop is rock solid, and I use it as a backup for my
other Thinkpad. In fact is sometimes preferable to more modern machines
(IMHO X41 itself is the best laptop ever made in terms of a design).

Never had really issues with WiFi on it. In terms of speed it is neither
far or slow, but does the job anyway.

Now, I do not use this laptop frequently, maybe once or twice a month.
But that is more because in I use laptops less in general these days. Not
because the machine is not usable. I have modern SSD in it, second hard
drive, two USB 3.0 ports via ExpressCard, high res 4:3 (1440x1050)
display, full disk encryption, etc.

I would really like for this driver to stay in the mainline for another 5-10
years.

I might be interested in modernizing the driver, but I have no idea how
much effort it would be (in terms of changed fraction of code). 20k LOC is
neither small or big, and not obvious (a lot of it would be unchanged),
if it is a week of work, or months of work.

I would not have an issue with removing it, and readding back if somebody
(or me) ports it, if not for re-review from scratch concerns. If I port
it, I would not be able to do re-review, 1) out of date coding standards,
2) different reviewers, 3) I would only port needed parts, and keep rest
of the driver intact, so I would not be able to really provide much
insight. So, readding after porting might be harder than keeping and
porting.

I also used in the past other drivers you are removing (zd1201, hostap,
orinoco, rndis, wl3501), but I do not have too much worry about them, as
they are ancient, and also require ancient hardware to run.


Cheers,
Witold


-- 
Witold Baryluk
