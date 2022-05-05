Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E251BB48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 10:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv6zl44ppz3bpw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 18:58:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mH9OPCLv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mH9OPCLv; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv6z34xtJz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 18:57:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651741055; x=1683277055;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=FXK7ar2tfCe3b0G5EJOLZVnb+48+yJ1/UsODDRlXrb0=;
 b=mH9OPCLvimD1x7JAgZ1eeWq7BybqT2QgocJ5thIfmPJG9rZQZBZTZMxh
 FiJeHH2cDSKM34qe+bn3oHn+lYtAKyOctrncacDTqJYlSymtW6myLwBuf
 3DzeDdpJ1JGqQIE7NXc6azmCS/dDjUx95hR9ol2Ki3JMDLYhBTPHxCGmL
 eEwLLi8Kv2H0PBHb/HRPI5WzL5mxTIeVMd4n1/EOm7xiagoNINYd/CNNb
 r8gCk73Ui2MfodcwM+2LrQkWThXxbkVXrjVdboaESHwA0Z24JhvLnDY5f
 LLzulmkWGKC0FlM8qiPJkFZ49LuvWGPU0qZVpkzZtOE4WxLZDZtNdmB4Q A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="248581913"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="248581913"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 01:56:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="585219605"
Received: from tpaatola-mobl1.ger.corp.intel.com ([10.251.220.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 01:56:20 -0700
Date: Thu, 5 May 2022 11:56:15 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
In-Reply-To: <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
Message-ID: <386eed36-94f7-8acb-926f-99c74d55915f@linux.intel.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
 <CAK8P3a0hy8Ras7pwF9rJADtCAfeV49K7GWkftJnzqeGiQ6j-zA@mail.gmail.com>
 <ca39c741-8d15-33c0-7bd6-635778cc436@linux.intel.com>
 <CAK8P3a33b4KvsGayDV7fXte0+1FzCJp_J60d8LuZO3P+i1NUEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-878121235-1651740985=:1544"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-serial <linux-serial@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Matt Turner <mattst88@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-878121235-1651740985=:1544
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 4 May 2022, Arnd Bergmann wrote:

> On Wed, May 4, 2022 at 10:33 AM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > On Wed, 4 May 2022, Arnd Bergmann wrote:
> > > On Wed, May 4, 2022 at 9:20 AM Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > > >
> > > After applying the patch locally, I still see a bunch of whitespace
> > > differences in the
> > > changed lines if I run
> > >
> > > vimdiff arch/*/include/uapi/asm/termbits.h include/uapi/asm-generic/termbits.h
> > >
> > > I think this mostly because you left the sparc version alone (it already
> > > uses hex constants), but it may be nice to edit this a little more to
> > > make the actual differences stick out more.
> >
> > I took a look on further harmonizing, however, it turned out to be not
> > that simple. This is basically the pipeline I use to further cleanup the
> > differences and remove comments if you want to play yourself, just remove
> > stages from the tail to get the intermediate datas (gawk is required for
> > --non-decimal-data):
> 
> I've played around with it some more to adjust the number of leading
> zeroes and the type of whitespace. This is what I ended up with on top
> of your patch: https://pastebin.com/raw/pkDPaKN1
> 
> Feel free to fold it into yours.

Ok thanks. With that it seems to go a bit beyond octal to hex conversion 
so I'll make a series out of it. The series will also introduce 
include/uapi/asm-generic/termbits-common.h for the most obvious 
intersection.


-- 
 i.

--8323329-878121235-1651740985=:1544--
