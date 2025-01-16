Return-Path: <linuxppc-dev+bounces-5344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9645A13EA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 17:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYnfb5qsbz30Tm;
	Fri, 17 Jan 2025 03:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737043287;
	cv=none; b=oachKLwIbv2rAzWeAAQvH9da4Orp5dar5ep+y1Tk6SdiLnsgJA6hmwDMXG2eceg6nORBFIhuYR9jSu7fbAzD+rCeRP6NjDp6mBBCinf+/2Vu+MDtSqb1zjG0whMR+aO6hPYoDCxWWLlOe660ZVdId/PaMkVrQ79AEIyR9IvFQ2QhRufD7ZflmPUZfGNfCPm0/0ffiHg5LCMsbUoGjWM6m1Z9w8j4PmbY50uQ7WtQiAMK1WnbcaMhlQ2aAlh7R/EqtqWFsQ4TSkkJxasplSxNR3lj9QjflVA4VMt2mXbn86np5r0wmnle6Trp4CbpdrkEQEnRLaHQiTyN4701swpX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737043287; c=relaxed/relaxed;
	bh=JCm3+RjhVuSQCejMVhKRl/6oWniP2n2Ur3OehXT3ivA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJsGueJb9WOH2EwH83txR3iLQV7vSJcYyDttNaaKCii+abDMw7O50jtlrpIaCEhB5reNnH8ahJZWgkeyvjrEWL6kux4CD4Am5OIZml4VWaT8MQNZPDSXyJ0UxykoOwgv7GA1b8E3q70XFYb51jG8n73kRF5GDzG8yinjemDMkgoTCT3ChJ+YmUcwZXKWY9IjpLyx+8O6HNLHzcC+yVHodhBDOhvkbZqdmWvjYW6+/eLdyew6whHmCnE2ReqmJa2rrKVrcOC50YqEA2g7m/CEiFrmzIDlUD/6bAtlIHuh6GSv8Pn3TUGPTDjJ9x70bf8Np/feY87oxz7kXXofWBjGoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YFD1ZS5x; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YFD1ZS5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYnfZ535Bz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 03:01:25 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436a39e4891so7312465e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 08:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737043280; x=1737648080; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JCm3+RjhVuSQCejMVhKRl/6oWniP2n2Ur3OehXT3ivA=;
        b=YFD1ZS5xBqp5ylKJ+tSTCa5bn19wDHJmVGN5rf52t3aNNj9GpcfiVtMd0RiYmEm5RV
         WjR7K6O8ioYuoK4ClKy5450xD6RFe04xN6XrxVDQoQxFkwh+UzIwjlxDSrX+iD9+3flA
         0vNG9ySzbKUXGb4+CNGJ0vkQVKmlDZjFGJ7VXbZqnL5P5mCm7+OCWUjpMtqnuEEqGCZY
         O5OPI6fQp8PW96bD6F/iYCiqTe9Uhoctq42IQvUgNyW5UP9xRq85sQgKXOyOZZ1gzn0a
         XsZoDZVzzS4qFjj/ZPb+ZajIE4bD8uSIs+jDga8pb5SLtd7AStCvZBDd4q2e1hlcZ44k
         8oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043280; x=1737648080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCm3+RjhVuSQCejMVhKRl/6oWniP2n2Ur3OehXT3ivA=;
        b=qP7sYyGQX6N/VbavhD7fph7kLILDC2zL6EaiZhDIDo//k5Xi/eaohV4ynb2Y2xGF97
         5xXswHW53bw802nsQCrqR8XsClJXLyQJrlRsFHdk2pYyD5tksg7esWSMKDsYpFvmp/Uc
         ieciKW/rnZK4e1RBFOypGsGRZbjZPve8jHHuWekkp7uL4SxATtpn7MzO6BlkICQsHrjD
         HkG9EUAQqWMWhd9bfdAC2GFe5DBgnbu0DVvBwICIzVSS8+Slei3WC/jclMVNdZFNWZkA
         SV/h0S/KpdWFhhZZT2BxqtcsQZUB9QgPYsjK+3zOrhqNy2FvLDQKsoVam5TBDUizszQx
         /Elw==
X-Forwarded-Encrypted: i=1; AJvYcCVS843NuYiiBLxDVMOag44esxM1U0yqVT7x84CxlAS8e5nFxDDWcazCkI9QpMll+wwWf+KiK0ayO7WJhwg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwF2hj8pBDJI+7e+ujkpfwyF6umwA3Ym4sr7AIaGDMKQL3B76B8
	odyz0v9XVBU2iuYLlhmeuWNMsLgiAwrzJKkoxcXX6z7XtMEMLtiLH7S0IibQWH0=
X-Gm-Gg: ASbGnctGdhkpcCaPtTZD8iBPbNmEsRHO8l/5TcE3xVdIvl3aAcUImYcrp+nYtYpYz1f
	cXZCdPZe860voQzKGBl5h/bQwpCntzg4AIh3+wee0j+owhq88acBK8b6fNG2R/SrrUwNvzlHH26
	u0YOXojDhM9ihSPezBtl0IO1xYrZXhSbYeOM8G8EDQraAxlvPvWHhKp2fDFINxwRqPEPUxO1XQ+
	Zql58T6KslxLk8WUdf4CnSj//Um26VQ5tZq8qzIop2j0BH903USUcfbeQ==
X-Google-Smtp-Source: AGHT+IHyRz1gyv15Lqi1nuYBzi/mTSC1DAiPMnP5AAlwXnopn/osJQo1L+qc7o/1JvWFWfdLziK1Kg==
X-Received: by 2002:a05:600c:3aca:b0:434:f335:855 with SMTP id 5b1f17b1804b1-436e26eb428mr259739245e9.28.1737043279871;
        Thu, 16 Jan 2025 08:01:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046b0f5sm3188465e9.39.2025.01.16.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:01:19 -0800 (PST)
Date: Thu, 16 Jan 2025 17:01:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, jikos@kernel.org,
	mbenes@suse.cz, shuah@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
Message-ID: <Z4ktTdwl8aqqwZpf@pathway.suse.cz>
References: <20250114143144.164250-1-maddy@linux.ibm.com>
 <Z4jRisgTXOR5-gmv@pathway.suse.cz>
 <af77083e-2100-ea2e-ae14-dc5761456fef@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af77083e-2100-ea2e-ae14-dc5761456fef@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu 2025-01-16 08:10:44, Joe Lawrence wrote:
> On 1/16/25 04:29, Petr Mladek wrote:
> > On Tue 2025-01-14 20:01:44, Madhavan Srinivasan wrote:
> >> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
> >> adds the caller id as part of the dmesg. Due to this, even though
> >> the expected vs observed are same, end testcase results are failed.
> > 
> > CONFIG_PRINTK_CALLER is not the only culprit. We (SUSE) have it enabled
> > as well and the selftests pass without this patch.
> > 
> > The difference might be in dmesg. It shows the caller only when
> > the messages are read via the syslog syscall (-S) option. It should
> > not show the caller when the messages are read via /dev/kmsg
> > which should be the default.
> > 
> > I wonder if you define an alias to dmesg which adds the "-S" option
> > or if /dev/kmsg is not usable from some reason.
> > 
> 
> Hi Petr,
> 
> To see the thread markers on a RHEL-9.6 machine, I built and installed
> the latest dmesg from:
> 
>   https://github.com/util-linux/util-linux
> 
> and ran Madhavan's tests.  I don't think there was any alias involved:
> 
>   $ alias | grep dmesg
>   (nothing)
> 
>   $ ~/util-linux/dmesg | tail -n1
>   [ 4361.322790] [  T98877] % rmmod test_klp_livepatch

Good to know. I havn't seen this yet.

> >From util-linux's 467a5b3192f1 ("dmesg: add caller_id support"):
> 
>  The dmesg -S using the old syslog interface supports printing the
>  PRINTK_CALLER field but currently standard dmesg does not support
>  printing the field if present. There are utilities that use dmesg and
>  so it would be optimal if dmesg supported PRINTK_CALLER as well.
> 
> does that imply that printing the thread IDs is now a (util-linux's)
> dmesg default?

It looks like. The caller ID information is available also via
/dev/kmsg but the older dmesg version did not show it. I guess that
they just added support to parse and show it. It actually makes
sense to show the same output independently on whether the messages
are read via syslog or /dev/kmsg.

So, we need this patch, definitely ;-)

Best Regards,
Petr

