Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3E410675
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 14:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBVn04M17z2yg4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 22:41:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mtlCwGHR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=mtlCwGHR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBVmK6bdvz2xlC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 22:40:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA9486126A;
 Sat, 18 Sep 2021 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631968844;
 bh=181rwogf0AnCsX8gVJgamab5c/PSOFVPKPlSNnoLpyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtlCwGHRBQ86hplSM0c4ckwq/W3X1XUL48cZ7GNLR2wjSd8fyeyRvRa/MNq8ewWxQ
 fYnXiCtyA4TlTYs4LIy3NEdAWe5DxJ5lpD3cEarnqDxe+1HQ3geqBTvC8D0t76GPGG
 dItGHrn9sqc92OcdXKs1olW0EZQlpRvhiOZiiwFk=
Date: Sat, 18 Sep 2021 14:40:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YUXeSUVQRDXzAqhf@kroah.com>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
 <87pmu8ehkk.fsf@linkitivity.dja.id.au>
 <6e36640d-b55f-ece4-4cab-437ecec0964a@linux.alibaba.com>
 <614b778b-8486-c20f-d5ed-37cc3b92ada1@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <614b778b-8486-c20f-d5ed-37cc3b92ada1@linux.alibaba.com>
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
Cc: arnd@arndb.de, amit@kernel.org, linuxppc-dev@lists.ozlabs.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jirislaby@kernel.org,
 osandov@fb.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 18, 2021 at 08:32:01PM +0800, Xianting Tian wrote:
> hi
> 
> Will you consider to continue the disscussion of this patch? thanks

I do not see a newer version of this series.

thanks,

greg k-h
