Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E6688EDB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 06:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7P0M55Mzz30Jy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 16:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0GUECC9R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0GUECC9R;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Nyt4dLlz3f6l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 16:10:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F99C61D68;
	Fri,  3 Feb 2023 05:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF78C433EF;
	Fri,  3 Feb 2023 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675401042;
	bh=/dcOSAX3NZkMRrTLbXFice7su2t52D3f7/bobQv3IeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0GUECC9RkFSU68qr0FFtoA4U0XM7Weba80dkrzpERDUZhi2oWGgV2aSPv7PG/W8XN
	 Uqb1IbgZKqg9hRJYduSgZYNyw0f05jZ+9fKhwyfhmIb5XuxXc+Rnh5Ckte6LSi4713
	 uuGg+EBOAgQeOqEUirp1mErKn5jZ9je5vl9J0/bQ=
Date: Fri, 3 Feb 2023 06:10:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/6] hvcs: Fix hvcs port reference counting
Message-ID: <Y9yXUOMmcHcdeL62@kroah.com>
References: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
 <20230202222804.383229-2-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202222804.383229-2-brking@linux.vnet.ibm.com>
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
Cc: mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 02, 2023 at 04:27:59PM -0600, Brian King wrote:
> The hvcs driver only ever gets two references to the port. One
> at initialization time, and one at install time. Remove the code
> that was trying to do multiple port puts for each open, which
> would result in more puts than gets.
> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 18 ------------------
>  1 file changed, 18 deletions(-)

I already took this patch (you got an email about it), no need to send
it again.

thanks,

greg k-h
