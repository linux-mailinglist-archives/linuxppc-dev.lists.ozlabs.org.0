Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5E15CB9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 21:02:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JS914NpJzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 07:02:29 +1100 (AEDT)
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
 header.s=default header.b=oqoOKlMQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JS6P1wgZzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 07:00:11 +1100 (AEDT)
Received: from localhost (unknown [104.132.1.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C481921734;
 Thu, 13 Feb 2020 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581624008;
 bh=KnHHKVe1n67O5ZYl7TzEtlRCPIGA53LFZUcP+UZsmYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqoOKlMQBYw9F9M+411L6xVqQwUVwuJhMEWjAlE313tBT8KpWqsV3XMSSnB5e7Br8
 DNkECUcNMjr9j4gYT7Uthte8mJ95tYe52py1tC/NDCGKwnPPXjWuayrTR+DFx8Uh1L
 aqYU0b094x2ZJiTMkfxhKzY7LmoGcgZZiYkQVFqk=
Date: Thu, 13 Feb 2020 12:00:08 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] serial: cpm_uart: call cpm_muram_init before registering
 console
Message-ID: <20200213200008.GB3815621@kroah.com>
References: <20200213114342.21712-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213114342.21712-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2020 at 12:43:42PM +0100, Rasmus Villemoes wrote:
> Christophe reports that powerpc 8xx silently fails to 5.6-rc1. It turns
> out I was wrong about nobody relying on the lazy initialization of the
> cpm/qe muram in commit b6231ea2b3c6 (soc: fsl: qe: drop broken lazy
> call of cpm_muram_init()).
> 
> Rather than reinstating the somewhat dubious lazy call (initializing a
> currently held spinlock, and implicitly doing a GFP_KERNEL under that
> spinlock), make sure that cpm_muram_init() is called early enough - I
> thought the calls from the subsys_initcalls were good enough, but when
> used by console drivers, that's obviously not the
> case. cpm_muram_init() is safe to call twice (there's an early return
> if it is already initialized), so keep the call from cpm_init() - in
> case SERIAL_CPM_CONSOLE=n.
> 
> Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Fixes: b6231ea2b3c6 (soc: fsl: qe: drop broken lazy call of cpm_muram_init())
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> 
> Christophe, can I get you to add a formal Tested-by?
> 
> I'm not sure which tree this should go through.

I can take it, thanks.

greg k-h
