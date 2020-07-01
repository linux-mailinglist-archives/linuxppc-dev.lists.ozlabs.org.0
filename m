Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D1210BE6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 15:16:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xhZH4cgQzDr4Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 23:16:23 +1000 (AEST)
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
 header.s=default header.b=b+3X6dSj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xhWn74FTzDr39
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 23:14:13 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08BB320772;
 Wed,  1 Jul 2020 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593609251;
 bh=ZIe1Pc79giPmUYI0Hc6to9F6x2+pRUoOQUpjCGHmOw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+3X6dSjJiBcQFgXE99zLxrzM7WhzQl98zccJACb9K0kZ7AGnR6PwGBuHJkGwvtpa
 najXSdrZB7iSnKGQnpxIt9fgHyyk9bdm8fKm9GgyK0mtToF0a+XMqhttbyk3hIMa0A
 8axMpQQ/rVl9Pl3MRocMVZ9qVP9EPbvbEZ7WTjos=
Date: Wed, 1 Jul 2020 15:13:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 30/30] misc: cxl: flash: Remove unused pointer
Message-ID: <20200701131357.GA2298198@kroah.com>
References: <20200701083118.45744-1-lee.jones@linaro.org>
 <20200701083118.45744-31-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701083118.45744-31-lee.jones@linaro.org>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 01, 2020 at 09:31:18AM +0100, Lee Jones wrote:
> The DRC index pointer us updated on an OPCODE_ADD, but never
> actually read.  Remove the used pointer and shift up OPCODE_ADD
> to group with OPCODE_DELETE which also provides a noop.
> 
> Fixes the following W=1 kernel build warning:
> 
>  drivers/misc/cxl/flash.c: In function ‘update_devicetree’:
>  drivers/misc/cxl/flash.c:178:16: warning: variable ‘drc_index’ set but not used [-Wunused-but-set-variable]
>  178 | __be32 *data, drc_index, phandle;
>  | ^~~~~~~~~
> 
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/misc/cxl/flash.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
> index cb9cca35a2263..24e3dfcc91a74 100644
> --- a/drivers/misc/cxl/flash.c
> +++ b/drivers/misc/cxl/flash.c
> @@ -175,7 +175,7 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
>  	struct update_nodes_workarea *unwa;
>  	u32 action, node_count;
>  	int token, rc, i;
> -	__be32 *data, drc_index, phandle;
> +	__be32 *data, phandle;
>  	char *buf;
>  
>  	token = rtas_token("ibm,update-nodes");
> @@ -206,15 +206,12 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
>  
>  				switch (action) {
>  				case OPCODE_DELETE:
> +				case OPCODE_ADD:
>  					/* nothing to do */
>  					break;
>  				case OPCODE_UPDATE:
>  					update_node(phandle, scope);
>  					break;
> -				case OPCODE_ADD:
> -					/* nothing to do, just move pointer */
> -					drc_index = *data++;
> -					break;

I think this is not correct, as *data++ changes the value there, and so
this changes the logic of the code.

Dropping this one from my queue.

thanks,

greg k-h
