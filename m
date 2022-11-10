Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF4624465
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 15:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7PVW0B40z3f36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 01:34:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DYvHGydP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DYvHGydP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7PTX2v3vz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 01:33:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2C2F61909;
	Thu, 10 Nov 2022 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02142C433C1;
	Thu, 10 Nov 2022 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668090811;
	bh=+rHJIUa3DRKlQrklPQi153v0vgi/mtpzdYW9aIbOaa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYvHGydPUtMr6U9+8ypPRydeMyiPJGQ6rakj+r6k8Gx8fdAWdZBGFbQ2NyvB6AgCw
	 z70QISOT/2m0DOL++qT67fVZ10wD1BeQGqG++IviOGO9bvovEltqXjL2IF3wPm2EF9
	 PVKFwDyNCjUYkLiXpNSw1+5wLyRW4vw+V5KWFZko=
Date: Thu, 10 Nov 2022 15:33:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] virt: fsl_hypervisor: Replace NO_IRQ by 0
Message-ID: <Y20LuAqHljYI4Bo8@kroah.com>
References: <20dd37b96bac0a72caef28e7462b32c93487a516.1665033909.git.christophe.leroy@csgroup.eu>
 <bccb8729-7f0a-5f97-d1b1-5401ed9f3235@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bccb8729-7f0a-5f97-d1b1-5401ed9f3235@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022 at 01:25:14PM +0000, Christophe Leroy wrote:
> Hi Greg,
> 
> Le 06/10/2022 à 07:27, Christophe Leroy a écrit :
> > NO_IRQ is used to check the return of irq_of_parse_and_map().
> > 
> > On some architecture NO_IRQ is 0, on other architectures it is -1.
> > 
> > irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.
> > 
> > So use 0 instead of using NO_IRQ.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Do you plan to apply this patch, or is any change required ?

It is in my review queue, give me time to catch up...

thanks,

greg k-h
