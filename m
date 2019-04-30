Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBFF9F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:26:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tj300JrTzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 23:26:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tj0Y4KZQzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GvD0xlHf"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tj0Y335Dz8tCq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:23:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tj0Y2P1Yz9sBr; Tue, 30 Apr 2019 23:23:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GvD0xlHf"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tj0X5tJ0z9sB8
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 23:23:56 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB2B82075E;
 Tue, 30 Apr 2019 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556630634;
 bh=FX21K3x2eSTyPIYWY0QOv+WYz0qilVJ+BIvLkM+EmQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvD0xlHfZRVr6nFo7UE4aA8wDccgdkeRLC1tuVrB/I2RK73LORqUskopsimBTOzO3
 tT7P3vQnpdLOpHHAjM6wFNMkMcCz78e25Hjd0FcoERQ/erq4kp8Zxb1nnV4HJuRn+v
 C/EWw2JztFfd1+PbWabxPZbUXaydYpAVWYLK1bKQ=
Date: Tue, 30 Apr 2019 15:23:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diana Craciun <diana.craciun@nxp.com>
Subject: Re: [PATCH v2 stable v4.4 2/2] Documentation: Add nospectre_v1
 parameter
Message-ID: <20190430132352.GA5327@kroah.com>
References: <1556628147-15687-1-git-send-email-diana.craciun@nxp.com>
 <1556628147-15687-2-git-send-email-diana.craciun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556628147-15687-2-git-send-email-diana.craciun@nxp.com>
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
Cc: linuxppc-dev@ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2019 at 03:42:27PM +0300, Diana Craciun wrote:
> commit 26cb1f36c43ee6e89d2a9f48a5a7500d5248f836 upstream.
> 
> Currently only supported on powerpc.
> 
> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/kernel-parameters.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index f0bdf78420a0..3ff87d5d6fea 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -2449,6 +2449,10 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
>  			legacy floating-point registers on task switch.
>  
>  	nohugeiomap	[KNL,x86] Disable kernel huge I/O mappings.
> +	

Trailing whitespace :(

Fix up your editor to flag this as RED or something.  I'll go fix it
up...

