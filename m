Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72854213B23
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 15:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ywyr1fmFzDqwT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 23:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.193;
 helo=mail-pf1-f193.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yww60l4hzDrDn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 23:36:03 +1000 (AEST)
Received: by mail-pf1-f193.google.com with SMTP id a14so9429964pfi.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 06:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5rcVRIkgD/btpU3eP+kPgBcl/ql3dV8wsHC9ym85fc=;
 b=hYh2/9rNOzpTEiVr/ozwlWHIfBmIOZRFvp4Y3tf6RyS0TKyJEOHKNRfLndNhyyWFER
 Ahk3XfV8F5Rr+nGeoWAKa+RVX/4azQVadxo+QcNXwPwrpdgydfgD+GsgO/2AyyxeY56a
 8lxkXGnUBZsI93GYtAqwGcfFyZ1bbTg2sJVGouj/kB6QxlnjGIleesFf9L+weojHI9Wb
 PZDsc9+9itMDmL7Di89SJuxdoqNRZJXtcFvgX7xvyGyXPy9Bgj5svgzL9sEUdF0jbWX+
 oMvyPAd/xkYfxqMVUI7m+n33DWZGJyYHJhoi7a4mmFyJTwV1pfAa1+ZAz4zmRJwzZV79
 XkhQ==
X-Gm-Message-State: AOAM530nS14cAsc4Xb3kYfR2QBIa8Iz23DbJvv/dYj8X+TlhlY4mOIMr
 s98a/sEiBXFsTmNrXpYyy9M=
X-Google-Smtp-Source: ABdhPJzpEuquvHuz9dy6BTpylDSjUJQBr0XwgRqlpSIxXVt6avNzJ3DHhTKXkfB0Cil4QhB/QzoeTw==
X-Received: by 2002:a65:640c:: with SMTP id a12mr28887324pgv.88.1593783360171; 
 Fri, 03 Jul 2020 06:36:00 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id m16sm12805082pfd.101.2020.07.03.06.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 06:35:58 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 1885F40945; Fri,  3 Jul 2020 13:35:58 +0000 (UTC)
Date: Fri, 3 Jul 2020 13:35:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [v2 PATCH] crypto: af_alg - Fix regression on empty requests
Message-ID: <20200703133558.GX4332@42.do-not-panic.com>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
 <20200626062948.GA25285@gondor.apana.org.au>
 <CA+G9fYutuU55iL_6Qrk3oG3iq-37PaxvtA4KnEQHuLH9YpH-QA@mail.gmail.com>
 <20200702033221.GA19367@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702033221.GA19367@gondor.apana.org.au>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 James Morris <jmorris@namei.org>, Eric Biggers <ebiggers@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 chrubis <chrubis@suse.cz>, linux- stable <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jan Stancek <jstancek@redhat.com>, LTP List <ltp@lists.linux.it>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 01:32:21PM +1000, Herbert Xu wrote:
> On Tue, Jun 30, 2020 at 02:18:11PM +0530, Naresh Kamboju wrote:
> > 
> > Since we are on this subject,
> > LTP af_alg02  test case fails on stable 4.9 and stable 4.4
> > This is not a regression because the test case has been failing from
> > the beginning.
> > 
> > Is this test case expected to fail on stable 4.9 and 4.4 ?
> > or any chance to fix this on these older branches ?
> > 
> > Test output:
> > af_alg02.c:52: BROK: Timed out while reading from request socket.
> > 
> > ref:
> > https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884917/suite/ltp-crypto-tests/test/af_alg02/history/
> > https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884606/suite/ltp-crypto-tests/test/af_alg02/log
> 
> Actually this test really is broken.

FWIW the patch "umh: fix processed error when UMH_WAIT_PROC is used" was
dropped from linux-next for now as it was missing checking for signals.
I'll be open coding iall checks for each UMH_WAIT_PROC callers next. Its
not clear if this was the issue with this test case, but figured I'd let
you know.

  Luis
