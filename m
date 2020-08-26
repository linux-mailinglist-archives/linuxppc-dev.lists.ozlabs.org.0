Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE0252B6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 12:30:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc2FD6lr4zDqX6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 20:30:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=bGwRZ4U4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc2Cd5M9PzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 20:29:16 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1306C2071E;
 Wed, 26 Aug 2020 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598437754;
 bh=FqIljNcAU9kdTquRGY/YEvffKwBFgT6R95TwqOGVZ0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bGwRZ4U4reQ7zeesbhCXiUnk3SSIQvPPXo3B73MaoqDUQ7HC6588f+DSfp/NTSj13
 ZvR5B9oFAhIq8wdpcDiwxiC+pYDu4qQ1FVuSKHxs8IRYjKtJ5whzwpo2X2fs8LLv6E
 CShuYlojuwNrU5w0q6bDBDX++XZebwHWlmy1F2O0=
Date: Wed, 26 Aug 2020 12:29:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: Re: Please apply commit 0828137e8f16 ("powerpc/64s: Don't init
 FSCR_DSCR in __init_FSCR()") to v4.14.y, v4.19.y, v5.4.y, v5.7.y
Message-ID: <20200826102929.GA3356257@kroah.com>
References: <20200825224408.GB6060@mussarela>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825224408.GB6060@mussarela>
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
Cc: sashal@kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 07:44:08PM -0300, Thadeu Lima de Souza Cascardo wrote:
> After commit 912c0a7f2b5daa3cbb2bc10f303981e493de73bd ("powerpc/64s: Save FSCR
> to init_task.thread.fscr after feature init"), which has been applied to the
> referred branches, when userspace sets the user DSCR MSR, it won't be inherited
> or restored during context switch, because the facility unavailable interrupt
> won't trigger.
> 
> Applying 0828137e8f16721842468e33df0460044a0c588b ("powerpc/64s: Don't init
> FSCR_DSCR in __init_FSCR()") will fix it.

Now queued up, thanks.

greg k-h
