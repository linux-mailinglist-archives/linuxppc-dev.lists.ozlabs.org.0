Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CA2E79C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 14:49:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5Xhl0c4NzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 00:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5Xg23CxwzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 00:48:13 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DC0DABA1;
 Wed, 30 Dec 2020 13:48:08 +0000 (UTC)
Date: Wed, 30 Dec 2020 14:48:06 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: YANG LI <abaci-bugfix@linux.alibaba.com>
Subject: Re: [PATCH] ibmvnic: fix: NULL pointer dereference.
Message-ID: <20201230134806.GN6564@kitsune.suse.cz>
References: <1609312994-121032-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609312994-121032-1-git-send-email-abaci-bugfix@linux.alibaba.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ljp@linux.ibm.com,
 drt@linux.ibm.com, kuba@kernel.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 03:23:14PM +0800, YANG LI wrote:
> The error is due to dereference a null pointer in function
> reset_one_sub_crq_queue():
> 
> if (!scrq) {
>     netdev_dbg(adapter->netdev,
>                "Invalid scrq reset. irq (%d) or msgs(%p).\n",
> 		scrq->irq, scrq->msgs);
> 		return -EINVAL;
> }
> 
> If the expression is true, scrq must be a null pointer and cannot
> dereference.
> 
> Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
> Reported-by: Abaci <abaci@linux.alibaba.com>
Fixes: 9281cf2d5840 ("ibmvnic: avoid memset null scrq msgs")
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index f302504..d7472be 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2981,9 +2981,7 @@ static int reset_one_sub_crq_queue(struct ibmvnic_adapter *adapter,
>  	int rc;
>  
>  	if (!scrq) {
> -		netdev_dbg(adapter->netdev,
> -			   "Invalid scrq reset. irq (%d) or msgs (%p).\n",
> -			   scrq->irq, scrq->msgs);
> +		netdev_dbg(adapter->netdev, "Invalid scrq reset.\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 1.8.3.1
> 
