Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2BA1C097
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 04:27:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4531m74h15zDqLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 12:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDw1+6Hd"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4531kP1bkCzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 12:25:32 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d31so7755263pgl.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 19:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zi4wszV1L43AeLT0Z8PIOWy38tTYuSZF/HdHyWxecsY=;
 b=UDw1+6HdTlVp15oFELQcYeP5tV9aX4WE2CTmk/VFT9j/uRDSGzkXgwHKipfBdjUcy6
 iWd5TAVfBECyekH1/M3I65DO8JG6bsdwQiYpZPb+IvL2/NRDrhMlO6vl9tfI1DTC2n8V
 ZQObeHztzolzKrcIN2b/9VCj+OdGEtNRTQMUz8nfylBLkUKYFsgCyTvqrBD8JblWqBMs
 2ATuHVX+eMGT7vY3UOYNRORuXGhZjogeHrl6sZejHqhzP1ylwRwstzz6oGskofNicyFJ
 dU04R9JVeM7RaJ6I2pxqlhwoRSiRJyHo8rLCRYT0ThJgyxpnMnnsbjh3cJf1XWqOhld0
 Moqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zi4wszV1L43AeLT0Z8PIOWy38tTYuSZF/HdHyWxecsY=;
 b=npvva/sVe7tTCwbS6EmrE+HTDFC2Xw+sEfkX46NG5VOoWsQZ1fGZvfxn40KvGB9AyA
 18MrCAckncynMyKykVl8dEa+c+Y4zNMXwJcX+TzoKJOmJJV0l2b1L4HHSyxFnyp72725
 6V5PA4NO3esTwZwqlYsonKKomEmiWT6adVIMK0TMcm9b9nJWEiQByuh+KLbU3UIIYbPk
 O4+vs2tNr0eJkf5ZOCJ79UDHVbREttgu995ly5W+C8K6ugkBqzofnUh4uFDj87LfqV8t
 tcLoRcatXfPKeDq/nerWNXDj28UJCCen/wauIkD7Fi9nkhs68FXxDCdPjUQexmUygEur
 4eIg==
X-Gm-Message-State: APjAAAXSvT9OBbJyxxwUVPF9EcuyezMsBPGH3iNmd61uqAd/HcdBFHei
 XRtACykwDwmPV5nRw1Zuxsg=
X-Google-Smtp-Source: APXvYqwA6b0Z8MgrtwzlDdj6bF9A8j85qLr4jxGimHQO5UZWJdPr+G2gpISwBf6oV7oS7hzca+w4yw==
X-Received: by 2002:a62:6d47:: with SMTP id i68mr37943522pfc.189.1557800730620; 
 Mon, 13 May 2019 19:25:30 -0700 (PDT)
Received: from localhost ([39.7.55.172])
 by smtp.gmail.com with ESMTPSA id g83sm19072131pfb.158.2019.05.13.19.25.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 19:25:29 -0700 (PDT)
Date: Tue, 14 May 2019 11:25:26 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190514022526.GA6683@jagdpanzerIV>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
 <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
 <20190513091320.GK9224@smile.fi.intel.com>
 <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
 <20190514020730.GA651@jagdpanzerIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514020730.GA651@jagdpanzerIV>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/14/19 11:07), Sergey Senozhatsky wrote:
> How about this:
> 
> 	if ptr < PAGE_SIZE		-> "(null)"

No, this is totally stupid. Forget about it. Sorry.


> 	if IS_ERR_VALUE(ptr)		-> "(fault)"

But Steven's "(fault)" is nice.

	-ss
