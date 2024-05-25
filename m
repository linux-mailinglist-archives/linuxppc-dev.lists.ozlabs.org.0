Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BB8D5557
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:25:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tivBEOZc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr16d3pnkz3dTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tivBEOZc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=minyard.net (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vml1H3lwrz3gKG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 00:39:46 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6f8d0a215deso832770a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1716647979; x=1717252779; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ijbRL5KgMxfBrVDKaGT/ZS1YTwf/exNuTTCo0hJfeM=;
        b=tivBEOZcHsIaGg5PcrCR7rTOyMOtFPCAu+H/Tc2UfcZYZOyfnPOPYUy/UScoTtWo9z
         7pMRNj2jcIbcBTLfKu8LgbAnYjE4nbC4mXH9IL6wI7o2xKHt5P4+ARbkVT6M1wwZRSDc
         8tzFOx6tJAoJEi5PMaoyFPq9dY/vwq7dVtlUqie8Oq6KbHC5eJtdhTwftpHRv3EObzcb
         aeNbtPhSURzRJWDeW89s48vh/4935rUDRK4MeRHszO5LDQsBYS6kgJBsE1p0YqCx2Ntt
         LTD1hlAGdUL8E1MCo8lKypoc9RGSPK19Zxd9ZIxc1VZqzjYJjiIv22y8akqmmhnXG4Nn
         9Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716647979; x=1717252779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ijbRL5KgMxfBrVDKaGT/ZS1YTwf/exNuTTCo0hJfeM=;
        b=P77Quk1W7Equ7I45TCXYoBo7ZyddxW44Q61ssXQQLsFbTihw/eu1P9RkpQB8ZKgx08
         ur/ebnc3DIsMTaXg16xU/hW42qB/4kHNMT3Nkqk8EOajasB3NjFYHxDRBul2Gl80oFrw
         smjhOz5ooY4Xk0oKv1nI/822TlHHzzIbtKfZJXgEI8U69cy5stMMZzVuoWc4kGexaWd3
         wU0PU7J75WhpKyD5qBcXtWPsVwih2mTy2R09zhJXKsLNLrcrUAYDpczUsZ/Jwa3dasD9
         DIWBBuMhZ0XkNjCm9hUkc7E6Imu8Ym+PJ4P9TftUizGeSkQzEeN4/MZbwlyoLpGs2DxA
         XHNw==
X-Forwarded-Encrypted: i=1; AJvYcCW1b8cK/sd1oxm7e/aBIBv00fcoSZ7r6F52HfTWku3orojeMpt5uiNG0Si7ms8NIKHBWnhhBvvLtGphhyZXgHfpIsjlC6NUHDwFxnJupQ==
X-Gm-Message-State: AOJu0YxYaIAh5QdReirGftg5iVZTOxPsja/QBtgMkKtT/f4nWDnyLD/a
	uNHMKIdrzrFW/qj6D8yGeZZ461a15IXUh3gTmZMlXQ0OEgvN8mx4E+QTDeT7Bew=
X-Google-Smtp-Source: AGHT+IF0BZKLWwLOASvb2XVCtA5cGrrbycBktJDxiP8zfqL1QN+0/jXbjbKfObTeb3B2Xr8wgSINVg==
X-Received: by 2002:a05:6830:f96:b0:6f1:248a:b5ba with SMTP id 46e09a7af769-6f7d65af20bmr3958986a34.18.1716647979022;
        Sat, 25 May 2024 07:39:39 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b41a:8a2e:362d:fa53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f8d0e61558sm768131a34.51.2024.05.25.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 07:39:38 -0700 (PDT)
Date: Sat, 25 May 2024 09:39:36 -0500
From: Corey Minyard <corey@minyard.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <ZlH4KFZ3MYzelzZK@mail.minyard.net>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
 <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
 <Zhf9mQx/KgXOzPTs@mail.minyard.net>
 <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Reply-To: corey@minyard.net
Cc: Corey Minyard <minyard@acm.org>, Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, Andrew Jeffery <andrew@codeconstruct.com.au>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 25, 2024 at 12:10:38PM +0200, Uwe Kleine-König wrote:
> Hello Corey,
> 
> On Thu, Apr 11, 2024 at 10:11:21AM -0500, Corey Minyard wrote:
> > On Thu, Apr 11, 2024 at 09:15:03AM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Tue, Mar 05, 2024 at 05:26:57PM +0100, Uwe Kleine-König wrote:
> > > > this series converts all drivers below drivers/char/ipmi to struct
> > > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
> > > > remove callback that returns no value") for an extended explanation and the
> > > > eventual goal.
> > > > 
> > > > All conversations are trivial, because their .remove() callbacks
> > > > returned zero unconditionally.
> > > > 
> > > > There are no interdependencies between these patches, so they could be
> > > > picked up individually. But I'd hope that they get picked up all
> > > > together by Corey.
> > 
> > Yeah, I was kind of waiting for more reviews, but this is pretty
> > straightforward.  I've pulled this into my tree.
> 
> These changes are in next since a while but didn't land in Linus tree
> for v6.10-rc1. I intend to send a PR to Greg early next week changing
> platform_driver::remove to match remove_new. If these commits don't make
> it in in time, I'll be so bold and just include the commits from your
> for-next branch in my PR.

I sent them to Linus right after 6.9 dropped, let me resend...

-corey

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


