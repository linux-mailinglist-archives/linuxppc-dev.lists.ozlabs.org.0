Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79EA392C5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 13:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrQ984qvpz309L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 21:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Rw9eANvj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Rw9eANvj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrQ8h6hCCz2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 21:10:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F1F561028;
 Thu, 27 May 2021 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622113825;
 bh=M3DIHT756xXhbeiWHhuicNBdTbcwyCz9skDBLtVxm5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rw9eANvjxWl1Odcz8PbgicIBK5gDbzfhfAPerFRKhTAgwHAkJfk9WMGaBQWoO39eb
 PG+CUcrmGQAxWWSe2TG+7BvH0yhVfxhH8Gy28ug2ajgBweAbRIYsH8IHoKytprQw+e
 OtwbAE9hT7mNWWnyjcOTYohFFGh9mpJD0xj5vB+E=
Date: Thu, 27 May 2021 13:10:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/udbg_hvc: retry putc on -EAGAIN
Message-ID: <YK9+HyS3zE09iUSe@kroah.com>
References: <20210514214422.3019105-1-nathanl@linux.ibm.com>
 <YKer6KPaHDgaWS8k@kroah.com> <87mtsliuzm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtsliuzm.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, jirislaby@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 23, 2021 at 08:51:09PM +1000, Michael Ellerman wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> > On Fri, May 14, 2021 at 04:44:22PM -0500, Nathan Lynch wrote:
> >> hvterm_raw_put_chars() calls hvc_put_chars(), which may return -EAGAIN
> >> when the underlying hcall returns a "busy" status, but udbg_hvc_putc()
> >> doesn't handle this. When using xmon on a PowerVM guest, this can
> >> result in incomplete or garbled output when printing relatively large
> >> amounts of data quickly, such as when dumping the kernel log buffer.
> >> 
> >> Call again on -EAGAIN.
> >> 
> >> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> >> ---
> >>  drivers/tty/hvc/hvc_vio.c | 2 +-
> >
> > Subject line does not match up with this file name.
> >
> > Don't you want "tty" and "hvc" in there somewhere?
> 
> It's a powerpc only driver, but I guess the subject should still be
> "tty: hvc: ..." to match convention.
> 
> I was planning to take this via the powerpc tree, but I can drop it if
> you'd rather take it.

No problem, feel free to take it yourself!

greg k-h
