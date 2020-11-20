Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D992BA55C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:00:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccr9y1g8KzDqys
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 20:00:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=EJT/PvHR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccr8B1VswzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 19:59:19 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 028382224C;
 Fri, 20 Nov 2020 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1605862756;
 bh=1LWDK9wxtiHw0M8wzUFGuapScSNSyTYrfvzGmXcfH8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJT/PvHRrKa4c9dtZHdl888KShjSPLbhoJTAhjCfzTcaEojVx7t6uCU/E1+YSK+gk
 73HqRlsXwDF6DLETgBW6PEhdXkmTZSOCAQdwXAm5c68ue354eQGsk6ivbCwOGkRXO3
 JRGvpmrSFGF38tI8Zd/+/bqOlYC/PXH7RZOuCkfo=
Date: Fri, 20 Nov 2020 09:59:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH for 5.4] powerpc/8xx: Always fault when _PAGE_ACCESSED is
 not set
Message-ID: <X7eFjrnW6pK9MA52@kroah.com>
References: <d18243335a9a31763ab5455a31a0345707771dec.1605774898.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d18243335a9a31763ab5455a31a0345707771dec.1605774898.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 08:47:54AM +0000, Christophe Leroy wrote:
> [This is backport for 5.4 of 29daf869cbab69088fe1755d9dd224e99ba78b56]
> 
> The kernel expects pte_young() to work regardless of CONFIG_SWAP.

All backports now queued up, thanks.

greg k-h
