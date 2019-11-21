Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B902104DB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:18:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JXWR4VfDzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pTdxGys+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JWNv59SZzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 18:27:43 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49BD02089D;
 Thu, 21 Nov 2019 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574321260;
 bh=gPWdK3ZQs3w3pA48qJ20NHH19/TD+hbiKK+54x6ca3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTdxGys+fI/YWmhs8ajHyqe9MpZFOMqsSpbZM4ITK0fB17xJiuhgJvs1fxMLYpCvf
 82lTIevOKs+X04tx7NsT34LTKYCScq8DKhMoySraei9v6CsowPflU/BOZu2x2R4Hh7
 1jj4m0+06Cvw+2SmBRdkw30QwC1TqHDSmWmZ5vfs=
Date: Thu, 21 Nov 2019 08:27:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] tty: Fix Kconfig indentation
Message-ID: <20191121072738.GA368332@kroah.com>
References: <1574306408-20021-1-git-send-email-krzk@kernel.org>
 <20191121072124.GA356838@kroah.com>
 <CAJKOXPeW_ffza48Bbxm7Od-Xo_Vt-Qfy+8OY5w8AzZOPkxriXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPeW_ffza48Bbxm7Od-Xo_Vt-Qfy+8OY5w8AzZOPkxriXg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 03:22:27PM +0800, Krzysztof Kozlowski wrote:
> On Thu, 21 Nov 2019 at 15:21, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Nov 21, 2019 at 04:20:08AM +0100, Krzysztof Kozlowski wrote:
> > > Adjust indentation from spaces to tab (+optional two spaces) as in
> > > coding style with command like:
> > >       $ sed -e 's/^        /\t/' -i */Kconfig
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Fix also 7-space and tab+1 space indentation issues.
> >
> > Same here, I already applied v1, so this one does not apply :(
> 
> Hi Greg,
> 
> I missed your notification that the patch was applied and then I
> worked on a updated version fixing few more whitespace errors (pointed
> during review on other patches). This supersedes v1 but if you do not
> want to rebase, I can send it later as a separate patch.

My public trees do not rebase, so I need a separate patch, thanks.

greg k-h
