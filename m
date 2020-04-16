Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E219D1AB81C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:35:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492qHC5fJCzDq9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:35:51 +1000 (AEST)
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
 header.s=default header.b=qP6kH0D4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492q8d17KdzDrPV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:30:08 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBC6020732;
 Thu, 16 Apr 2020 06:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587018606;
 bh=Uc+wglkfcFcnujcwTpEjeJ1Iv8qtEzNgyuqAg5SvGZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qP6kH0D4GuAzSBLnpw9Ff8LwjKagJaYPK1ss5GiN8vEpT320p2mSdWhNo8ApFQrjY
 GYzmBaaMEV0qBpaNaH7K8xZ1FZWyqIgiY+PRGhBX1dU3kRqegeZh79fvm6B0nj7h0n
 TLy1250+GBD/brVAq+llty5TgDa9Vw2UWqh7rrXs=
Date: Thu, 16 Apr 2020 08:30:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v2,5/5] drivers: uio: new driver for fsl_85xx_cache_sram
Message-ID: <20200416063002.GA299193@kroah.com>
References: <20200415124929.GA3265842@kroah.com>
 <20200415152442.122873-1-wenhu.wang@vivo.com>
 <20200415152442.122873-6-wenhu.wang@vivo.com>
 <ef9f59f98f6bcf81891de87fd9cd0b5973bbd468.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef9f59f98f6bcf81891de87fd9cd0b5973bbd468.camel@buserror.net>
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
Cc: linux-kernel@vger.kernel.org, kernel@vivo.com,
 Wang Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 02:26:55PM -0500, Scott Wood wrote:
> Instead, have module parameters that take the sizes and alignments you'd like
> to allocate and expose to userspace.  Better still would be some sort of
> dynamic allocation (e.g. open a fd, ioctl to set the requested size/alignment,
> if it succeeds you can mmap it, and when the fd is closed the region is
> freed).

No module parameters please, this is not the 1990's.

Use device tree, that is what it is there for.

thanks,

greg k-h
