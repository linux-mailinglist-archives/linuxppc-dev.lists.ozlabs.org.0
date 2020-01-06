Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5C131845
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 20:07:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s4kv0fsbzDqGm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 06:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csclub.uwaterloo.ca (client-ip=129.97.134.17;
 helo=caffeine.csclub.uwaterloo.ca; envelope-from=lsorense@csclub.uwaterloo.ca;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=csclub.uwaterloo.ca
X-Greylist: delayed 649 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Jan 2020 06:05:34 AEDT
Received: from caffeine.csclub.uwaterloo.ca (caffeine.csclub.uwaterloo.ca
 [129.97.134.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s4ht5ST7zDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 06:05:33 +1100 (AEDT)
Received: by caffeine.csclub.uwaterloo.ca (Postfix, from userid 20367)
 id F03164611D0; Mon,  6 Jan 2020 13:54:37 -0500 (EST)
Date: Mon, 6 Jan 2020 13:54:37 -0500
To: Romain Dolbeau <romain@dolbeau.org>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
Message-ID: <20200106185437.z2aiq3v4zxqmy2x4@csclub.uwaterloo.ca>
References: <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <87lfr62tbf.fsf@linux.ibm.com>
 <CADuzgbq3V0F=vob-tB=rroBaLwNR4viS2-=39TRBMyQwdj+xuw@mail.gmail.com>
 <874kx81xxt.fsf@linux.ibm.com>
 <CADuzgbqtn7knixB+tO3m-r0m7fDDQXVA=z2EtGxsfQ_GjD0h7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuzgbqtn7knixB+tO3m-r0m7fDDQXVA=z2EtGxsfQ_GjD0h7Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 jjhdiederen <jjhdiederen@zonnet.nl>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 06, 2020 at 07:18:30PM +0100, Romain Dolbeau wrote:
> Applied, recompiled with 64 KiB pages, still crashes.
> 
> The backtrace seems more readable this time (and wasn't overwritten by
> something else), bad photo here:
> <http://www.dolbeau.name/dolbeau/files/Photo0033.jpg>

Is it possible this has to do with nouveau and not supporting 64K page
size on older nvidia chips?  My reading of the driver is that only
NV50 and above has implemented support for anything other than 4K pages,
so a geforce 6xxx series that I believe some of the G5 machines had would
be a problem with 64K pages, while those with ATI cards would probably
not have a problem.

Maybe I read the driver changes wrong, but it sure looks like only
NV50/G84 and up got the needed fixes a couple of years ago.

-- 
Len Sorensen
