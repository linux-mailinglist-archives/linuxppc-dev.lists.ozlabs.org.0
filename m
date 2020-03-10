Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122517EDEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:18:52 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48by0T6wL7zF0k7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:18:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=23.128.96.9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
X-Greylist: delayed 369 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Mar 2020 12:10:50 AEDT
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxqG2xZNzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:10:49 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 75AE215A01A79;
 Mon,  9 Mar 2020 18:04:30 -0700 (PDT)
Date: Mon, 09 Mar 2020 18:04:30 -0700 (PDT)
Message-Id: <20200309.180430.1182071186379257002.davem@davemloft.net>
To: julietk@linux.vnet.ibm.com
Subject: Re: [PATCH net] ibmvnic: Do not process device remove during
 device reset
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200310000204.58596-1-julietk@linux.vnet.ibm.com>
References: <20200310000204.58596-1-julietk@linux.vnet.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 09 Mar 2020 18:04:30 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tlfalcon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Mon,  9 Mar 2020 19:02:04 -0500

> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index c75239d8820f..7ef1ae0d49bc 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2144,6 +2144,8 @@ static void __ibmvnic_reset(struct work_struct *work)
>  	struct ibmvnic_adapter *adapter;
>  	u32 reset_state;
>  	int rc = 0;
> +	unsigned long flags;
> +	bool saved_state = false;

Please preserve the reverse christmas tree ordering of local variables.

Thank you.
