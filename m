Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E40FD4929C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 16:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdXwt5PF0z30gW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 02:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=E7uVSKBF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=E7uVSKBF; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdXwC0GQbz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 02:37:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 125F361268;
 Tue, 18 Jan 2022 15:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18941C00446;
 Tue, 18 Jan 2022 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642520261;
 bh=//SCQnLok7EMIkO0ihPwUdfss8kgJp8VvIABbDutpRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7uVSKBF8IATMOnuZU8W25ca1t59lDkSSggu/TLeVS+xkl6zgNF5vwb2QH1LJmM7w
 GQM2d9rBiErZli3Zy2BNY2hyW1geC/OpcVUQare0LgUIaq3BNKuoH0KeCTklLbb9Lt
 fbwIwFwtTtSUHOEfO9YLdL2CsKxjrJayHnwDcFjg=
Date: Tue, 18 Jan 2022 16:37:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Please backport b6b0d883bbb8 to v5.10
Message-ID: <YebewmWpzZ+7ix6q@kroah.com>
References: <87lezd1ado.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lezd1ado.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 18, 2022 at 11:44:35PM +1100, Michael Ellerman wrote:
> Hi Greg,
> 
> Could you please backport:
> 
>   b6b0d883bbb8 ("powerpc/pseries: Get entry and uaccess flush required bits from H_GET_CPU_CHARACTERISTICS")

Do you really mean:
	65c7d070850e ("powerpc/pseries: Get entry and uaccess flush required bits from H_GET_CPU_CHARACTERISTICS")
instead?

I can not find b6b0d883bbb8 in Linus's tree :(

> to the v5.10 stable kernel. Thanks.

Assuming the above is the correct id, I have backported that to 5.10
now, thanks.

greg k-h
