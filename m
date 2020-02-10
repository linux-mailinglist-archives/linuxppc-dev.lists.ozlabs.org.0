Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A852F157EA7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 16:21:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GV4g1YcBzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 02:21:55 +1100 (AEDT)
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
 header.s=default header.b=HtjiMHXE; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GV1d6Mj0zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 02:19:17 +1100 (AEDT)
Received: from localhost (unknown [104.132.1.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D359206ED;
 Mon, 10 Feb 2020 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581347955;
 bh=JqaNMooa6dE5vSnfD9rwkvCtggIprvOdi7XG448QR40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtjiMHXEg2E9MoB5ocWMybjprlQPDyTnSWglv3Rx7JV2pDWQJZX3Yxhj7FEyHIUZ9
 sRup8fP/LSYmY6WQoxcKADmXbUnNnhGeGhtKvWe8/3qRfPFz84N7KkJqmlfKDHtlss
 gaipYqNj01BwFElHx9vdrfdwKNHkUlzmlPmrwkTI=
Date: Mon, 10 Feb 2020 07:19:15 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 6/6] powerpc: powernv: no need to check return value of
 debugfs_create functions
Message-ID: <20200210151915.GA686798@kroah.com>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
 <20200209105901.1620958-6-gregkh@linuxfoundation.org>
 <CAOSf1CEKwjDkp-=SMjmJfQirxdGCkadougZbdDS6FK1muNNCZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CEKwjDkp-=SMjmJfQirxdGCkadougZbdDS6FK1muNNCZw@mail.gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 02:01:53AM +1100, Oliver O'Halloran wrote:
> On Mon, Feb 10, 2020 at 12:12 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> 
> For memtrace debugfs is the only way to actually use the feature. It'd
> be nice if it still printed out *something* if it failed to create the
> files rather than just being mysteriously absent, but maybe debugfs
> itself does that. Looks fine otherwise.

No, debugfs will only spit out an error message to the log if a
file/directory is attempted to be created for an already present
file/directory.

For other failures, no error will be printed, other than the normal
lower-level "out of memory" issues that might rarely happen.

thanks,

greg k-h
