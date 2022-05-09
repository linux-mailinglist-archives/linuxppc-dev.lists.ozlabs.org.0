Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8C51FB8C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 13:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxfVD24trz3bmR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 21:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1AY+7Ah;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D1AY+7Ah; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxfTT3yQTz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 21:44:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652096653; x=1683632653;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ZTyA1HS8jeWS2uplJonrsTVm9m3xk+zuXOASyRBer64=;
 b=D1AY+7Ah3KEBHDx7Ke1ggYIK5urmyAFnhyppSnOsu5CaD+NtsK4TOyFg
 952XW4oZN/DCD6pEXb9iyJqjwcWRLWEovJjSa4BgfIvtSldzODbClSolQ
 2sAadkhSHw8p0celPF3aXEM0sGNJEP2RVUyfY8lKU30ULo7h676u/9bKZ
 ix9FaJkyvkFD3YG/X5lOhgbBYGjmsYn+vNQ5oBi0NnM9G0Vs+zgNdPRJO
 sviSsol6fQO4bjkJazVIg0KiFN0TauV92x9I3BKP6+AOi1GvO2zL4LqcJ
 anAblNhCDjfaDTbeYXFo5eT6/ehRuwl1z6vHO0M6XsUhdvFyw/J7g0m+A A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355452194"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355452194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 04:43:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="591991357"
Received: from mfuent2x-mobl1.amr.corp.intel.com ([10.251.220.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 04:43:05 -0700
Date: Mon, 9 May 2022 14:42:59 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/3] termbits.h: create termbits-common.h for identical
 bits
In-Reply-To: <97b0e932-1309-edfd-3886-fee1498bff7d@gmx.de>
Message-ID: <8b407358-294-74ee-5659-f51d4598998@linux.intel.com>
References: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
 <20220509093446.6677-2-ilpo.jarvinen@linux.intel.com>
 <97b0e932-1309-edfd-3886-fee1498bff7d@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1244401664-1652096590=:1620"
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-serial <linux-serial@vger.kernel.org>, sparclinux@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Matt Turner <mattst88@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1244401664-1652096590=:1620
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 May 2022, Helge Deller wrote:

> Hello Ilpo,
> 
> On 5/9/22 11:34, Ilpo Järvinen wrote:
> > Some defines are the same across all archs. Move the most obvious
> > intersection to termbits-common.h.
> 
> I like your cleanup patches, but in this specific one, does it makes sense
> to split up together-belonging constants, e.g.
> 
> > diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
> > index 6017ee08f099..7f74a822b7ea 100644
> > --- a/arch/parisc/include/uapi/asm/termbits.h
> > +++ b/arch/parisc/include/uapi/asm/termbits.h
> > @@ -61,31 +61,15 @@ struct ktermios {
> >
> >
> >  /* c_iflag bits */
> > -#define IGNBRK	0x00001
> > -#define BRKINT	0x00002
> > -#define IGNPAR	0x00004
> > -#define PARMRK	0x00008
> > -#define INPCK	0x00010
> > -#define ISTRIP	0x00020
> > -#define INLCR	0x00040
> > -#define IGNCR	0x00080
> > -#define ICRNL	0x00100
> >  #define IUCLC	0x00200
> >  #define IXON	0x00400
> > -#define IXANY	0x00800
> >  #define IXOFF	0x01000
> >  #define IMAXBEL	0x04000
> >  #define IUTF8	0x08000
> 
> In the hunk above you leave IUCLC, IXON, IXOFF... because they seem unique to parisc.
> The other defines are then taken from generic header.
> Although this is correct, it leaves single values alone, which make it hard to verify
> because you don't see the full list of values in one place.

While I too am fine either way, I don't think these are as strongly 
grouped as you seem to imply. There's no big advantage in having as much 
as possible within the same file. If somebody is looking for the meaning 
of these, these headers are no match when compared e.g. with stty manpage.

For c_iflag, the break, parity and cr related "groups" within c_iflag are 
moving completely to common header.

IXANY is probably only one close to borderline whether it kind of belongs 
to the same group as IXON/IXOFF (which both by chance both remained on the 
same side in the split). I don't think it does strongly enough to warrant 
keeping them next to each other but I'm open what opinions others have on 
it.

The rest in c_iflag don't seem to be strongly tied/grouped to the other 
defines within c_iflag. They're just bits that appear next/close to each 
other but are not tied by any significant meaning-based connection.

C_oflag is more messy. I exercised grouping based judgement with c_oflag 
where only the defines with all bits as zero would have moved to the 
common header breaking the groups very badly. That is, only CR0 would have 
moved and CR1-3 remained in arch headers, etc. which made no sense to do. 
One could argue, that since ONLCR (and perhaps CRDLY) are not moving, no 
other cr related defines should move either.

> > @@ -112,24 +96,6 @@ struct ktermios {
> >
> >  /* c_cflag bit meaning */
> >  #define CBAUD		0x0000100f
> > -#define  B0		0x00000000	/* hang up */
> > -#define  B50		0x00000001
> > -#define  B75		0x00000002
> > -#define  B110		0x00000003
> > -#define  B134		0x00000004
> > -#define  B150		0x00000005
> > -#define  B200		0x00000006
> > -#define  B300		0x00000007
> > -#define  B600		0x00000008
> > -#define  B1200		0x00000009
> > -#define  B1800		0x0000000a
> > -#define  B2400		0x0000000b
> > -#define  B4800		0x0000000c
> > -#define  B9600		0x0000000d
> > -#define  B19200		0x0000000e
> > -#define  B38400		0x0000000f
> > -#define EXTA B19200
> > -#define EXTB B38400
> 
> Here all baud values are dropped and will be taken from generic header, 
> which is good. 
> 
> That said, I think it's good to move away the second hunk,
> but maybe we should keep the first as is?
> 
> It's just a thought. Either way, I'm fine your patch if that's the
> way which is decided to go for all platforms.

Yes, lets wait and see what the others think.

Thanks for taking a look!

-- 
 i.

--8323329-1244401664-1652096590=:1620--
