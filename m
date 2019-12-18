Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCA123FCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 07:52:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d5Kq38snzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 17:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JG1N9hV7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d5Hc0XzLzDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 17:50:35 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EA18218AC;
 Wed, 18 Dec 2019 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576651832;
 bh=VBdg0J6ty6QcJFBg28FlHO+nPnjtajw/gEgQgovgVrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JG1N9hV76SNT/Fh2u1Euo/BM0OhYdJZX71HVQr6hn8GUjBfVYzbIyHDrfbHQ/iYpS
 K2zsALv1e7cMaKp1dd96VTQDcFiTzI9vRLxZPtEU4aonEKZHgrnF1njrHgPyuLgNeq
 v5mzcd8tKHTZHJXLue7lhQ1RYoprG1wENf62y2QE=
Date: Wed, 18 Dec 2019 07:50:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH-tty-testing] tty/serial/8250: Add has_sysrq to
 plat_serial8250_port
Message-ID: <20191218065030.GA1270813@kroah.com>
References: <20191218040111.346846-1-dima@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218040111.346846-1-dima@arista.com>
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
Cc: kbuild test robot <lkp@intel.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 04:01:11AM +0000, Dmitry Safonov wrote:
> In contrast to 8250/8250_of, legacy_serial on powerpc does fill
> (struct plat_serial8250_port). The reason is likely that it's done on
> device_initcall(), not on probe. So, 8250_core is not yet probed.
> 
> Propagate value from platform_device on 8250 probe - in case powepc
> legacy driver it's initialized on initcall, in case 8250_of it will be
> initialized later on of_platform_serial_setup().
> 
> Fixes: ea2683bf546c ("tty/serial: Migrate 8250_fsl to use has_sysrq").
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  It's probably better to squash this into the 8250_fsl patch.
>  I've added Fixes tag in case the branch won't be rebased.
>  Tested powerpc build manually with ppc64 cross-compiler.

I have squashed this into that original 8250_fsl patch now, and rebased
the series.  Let's see what kbuild does...

thanks,

greg k-h
