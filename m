Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62771B34A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 13:51:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rq576M91zDqb5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 21:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=jic23@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="2ExrCDaI"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rq3M6JckzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 21:49:51 +1000 (AEST)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33845208C2;
 Sat, 27 Apr 2019 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556365789;
 bh=micoXllDruCvx3gGFlYFaFNFGyDXOM8yAbo6P5dAYeA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2ExrCDaIak/HJASR4XsuGCZUxmgJS5UwpMQutPER+NyybPzWgCbu0qLe3JM0MXvw1
 oxi3Lu3fHqi6q9JBVOwLjmYMmjvWk2b18k4RtrnQ0RLej+twdB4Ti+SWXkaLKv40SH
 rhgpe21hzpDVCz0661W77VP0ANZaJNy08E0aipxk=
Date: Sat, 27 Apr 2019 12:49:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10 00/18] Introduce the Counter subsystem
Message-ID: <20190427124937.1a9920ea@archlinux>
In-Reply-To: <20190425193624.GA11240@kroah.com>
References: <cover.1554184734.git.vilhelm.gray@gmail.com>
 <20190407152550.451a7f63@archlinux>
 <20190425193624.GA11240@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: mark.rutland@arm.com, benjamin.gaignard@st.com, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 thierry.reding@gmail.com, pmeerw@pmeerw.net, linux-api@vger.kernel.org,
 lars@metafoo.de, daniel.lezcano@linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 david@lechnology.com, William Breathitt Gray <vilhelm.gray@gmail.com>,
 robh+dt@kernel.org, tglx@linutronix.de, fabrice.gasnier@st.com,
 esben@haabendal.dk, shawnguo@kernel.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, knaack.h@gmx.de, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Apr 2019 21:36:24 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, Apr 07, 2019 at 03:25:50PM +0100, Jonathan Cameron wrote:
> > On Tue,  2 Apr 2019 15:30:35 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > Changes in v10:
> > >   - Fix minor typographical errors in documentation
> > >   - Merge the FlexTimer Module Quadrature decoder counter driver patches
> > > 
> > > This revision is functionally identical to the last; changes in this
> > > version were made to fix minor typos in the documentation files and also
> > > to pull in the new FTM quadrature decoder counter driver.
> > > 
> > > The Generic Counter API has been and is still in a feature freeze until
> > > it is merged into the mainline. The following features will be
> > > investigated after the merge: interrupt support for counter devices, and
> > > a character device interface for low-latency applications.  
> > 
> > Hi William / al,
> > 
> > So the question is how to move this forwards?  I'm happy with how it turned
> > out and the existing drivers we had in IIO are a lot cleaner under
> > the counter subsystem (other than the backwards compatibility for those that
> > ever existed in IIO).  For those  not following closely the situation is:  
> 
> I've now sucked this into my staging-testing branch and if 0-day is fine
> with it, I'll merge it to staging-next in a day or so.  This way you can
> build on it for any iio drivers that might be coming.

Great thanks. 

> 
> I do have reservations about that one sysfs file that is multi-line, and
> I think it will come to bite you in the end over time, so I reserve the
> right to say "I told you so" when that happens...
> 
> But, I don't have a better answer for it now, so don't really worry
> about it :)
> 
> thanks,
> 
> greg k-h

Looks like a few late breaking comments came in, but nothing that can't
be fixed up before this reaches a release.

Thanks,

Jonathan


