Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF01B22F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:37:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495z4w1Br6zDql9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=qsNHxSsM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495z134WqCzDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:34:31 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF60E206E9;
 Tue, 21 Apr 2020 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587461669;
 bh=7Dka82G9l1uFtfwcq6PqZbOKLwt6bMNcseQiY/abPzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsNHxSsMR1kvqvd2SRGAOvl6xVL1jmjaSqDARnRLr443/FFjTwk0nvXKlUXKt8FNP
 FHaYgMbgKTVZ51LD19AoHN81r9E44mxWTTieu0ho5A3Ylzn1f5InblYJwC1dqgwCFY
 Ayt31FqfryDbDjNNDkxRl4kMkegsp8QxXL2C7oC8=
Date: Tue, 21 Apr 2020 11:34:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Subject: Re: [PATCH v2, RESEND] misc: new driver sram_uapi for user level SRAM
 access
Message-ID: <20200421093427.GC725219@kroah.com>
References: <20200420145128.GA4131449@kroah.com>
 <AB6A-gBhCLyx5bgBRPuIiqp1.3.1587460187094.Hmail.wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB6A-gBhCLyx5bgBRPuIiqp1.3.1587460187094.Hmail.wenhu.wang@vivo.com>
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
Cc: robh@kernel.org, arnd@arndb.de, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 05:09:47PM +0800, 王文虎 wrote:
> Hi, Greg, Arnd,
> 
> Thank you for your comments first, and then really very very very sorry
> for driving Greg to sigh and I hope there would be chance to share Moutai
> (rather than whisky, we drink it much, a kind of Baijiu), after the virus.
> 
> Back to the comments, I'd like to do a bit of documentation or explanation first,
> which should have been done early or else there would not be so much to explain:
> 1. What I have been trying to do is to access the Freescale Cache-SRAM device form
> user level;
> 2. I implemented it using UIO, which was thought of non-proper;

I still think that using uio is the best way to do this, and never said
it was "non-proper".  All we got bogged down in was the DT
representation of stuff from what I remember.  That should be worked
through.

thanks,

greg k-h
