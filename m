Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4955103AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 18:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnncQ6pWDz3bcY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 02:37:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMqMxHb5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UMqMxHb5; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knnbl1bGqz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 02:37:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991043; x=1682527043;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=YkchwpoFBWYE6wjpBeZGz+2BPwCBUpcUNyTQQIFBqC8=;
 b=UMqMxHb5tUv6r9ZVv5eWyFWHVQJtVwsJz9W941C4vwdFTeDkqKG4F0be
 I7Jf65goiU8c/u08MINsl9lrpDb/DZZUVXTcozKiDWxnVdrcDe7vzBr3J
 rHTBAuMHQ2eWkUywq4FN1jmcRAvAAp9ySXDaHvxYGsYRAxY9RlLSOXSr1
 h393ozc+ndntO0ZgTHRx76hgdKZSrm9wXpwrKGbrIruu/ixTe+J9ZGlI2
 V9KyqO4PX6Y1OkeDaiLRc9doK3bVR0UhMtxgQc1dg+zHbfA+9cjRVbyLl
 BzCxN3aqONaQHdLnojT0m4Z6rfepf+GD6vFOQRz9h6+A8slE+UO4a5j+6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265449311"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265449311"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:29:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="580016188"
Received: from mmilkovx-mobl.amr.corp.intel.com ([10.249.47.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:29:11 -0700
Date: Tue, 26 Apr 2022 19:29:08 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 05/10] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
In-Reply-To: <Ymf9UhyXj7o8cNhq@kroah.com>
Message-ID: <9a9dda88-b239-9c63-82d-2f7678fdbf9@linux.intel.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com>
 <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com>
 <Ymfq+jUXfZcNM/P/@kroah.com>
 <b667479-fb27-8712-cec8-938eed179240@linux.intel.com>
 <17547658-4737-7ec1-9ef9-c61c6287b8b@linux.intel.com>
 <Ymf9UhyXj7o8cNhq@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1964830911-1650990558=:1644"
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, heiko@sntech.de,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arch@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-serial <linux-serial@vger.kernel.org>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Johan Hovold <johan@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Lukas Wunner <lukas@wunner.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1964830911-1650990558=:1644
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 26 Apr 2022, Greg KH wrote:

> On Tue, Apr 26, 2022 at 05:01:31PM +0300, Ilpo Järvinen wrote:
> > 
> > ADDRB value is the same for all archs (it's just this octal vs hex 
> > notation I've followed as per the nearby defines within the same file
> > which makes them look different).
> > 
> > Should I perhaps add to my cleanup list conversion of all those octal ones 
> > to hex?
> 
> Argh, yes, please, let's do that now, I totally missed that.  Will let
> us see how to unify them as well.

Unifying them might turn out impractical, here's a rough idea now many
copies ... | uniq -c finds for the defines (based on more aggressively 
cleaned up lines than the patch will have):
     89 1
     74 2
     14 3
     58 4
     11 5
     54 6
There just tends to be 1 or 2 archs which are different from the others.

...I'll send the actual octal-to-hex patch once the arch builds complete.

-- 
 i.

--8323329-1964830911-1650990558=:1644--
