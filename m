Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A085E4A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 16:24:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t6PG4rp7zDqVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 00:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="DbpGdnjd"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t6Mg4gw0zDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:23:25 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05EF02087B;
 Mon, 29 Apr 2019 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556547803;
 bh=CkUjjUJoMHq8rlvMrsqjvKQxwGL4ZgTcgUZqqiiE4wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbpGdnjdtpdQJlRzLjdXk/CzMnGnx2UImW/X2Ktk2CSjyqyJm9+xzPJkeajfWT9Qd
 N3PRnB8M7vrDlYE0ETDEyal91HTyIwFfrFHNs92GYThQ8pojlh/IRIH3MXMHNa5heE
 ZNgpK7yyRwLUt1w0xCmLk/cfr533cOSm5sUVT9v0=
Date: Mon, 29 Apr 2019 16:23:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
Message-ID: <20190429142321.GA29007@kroah.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427132959.GA11368@kroah.com>
 <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 macro@linux-mips.org, slemieux.tyco@gmail.com, matthias.bgg@gmail.com,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 04:11:15PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 27.04.19 15:29, Greg KH wrote:
> > On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
> >> Using dev_err() instead of printk() for more consistent output.
> >> (prints device name, etc).
> >>
> >> Signed-off-by: Enrico Weigelt <info@metux.net>
> > 
> > Your "From:" line does not match the signed-off-by line, so I can't take
> > any of these if I wanted to :(
> 
> Grmpf. I've manually changed it, as you isisted in having my company
> name remove from it ....

Yes, that's fine, but the lines have to match.  See the documentation
for how to have a "From:" in the changelog text to override whatever
your email client happens to pollute the email with :)

thanks,

greg k-h
