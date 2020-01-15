Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6801A13CFC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 23:08:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yhL86FN5zDqT3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 09:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yhJ30swDzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 09:06:50 +1100 (AEDT)
Received: from localhost (unknown [62.21.130.100])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7093815A0EE0A;
 Wed, 15 Jan 2020 14:06:41 -0800 (PST)
Date: Wed, 15 Jan 2020 14:06:40 -0800 (PST)
Message-Id: <20200115.140640.367212385869999160.davem@davemloft.net>
To: colin.king@canonical.com
Subject: Re: [PATCH] net/wan/fsl_ucc_hdlc: fix out of bounds write on array
 utdm_info
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200114145448.361888-1-colin.king@canonical.com>
References: <20200114145448.361888-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 15 Jan 2020 14:06:42 -0800 (PST)
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 14:54:48 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array utdm_info is declared as an array of MAX_HDLC_NUM (4) elements
> however up to UCC_MAX_NUM (8) elements are potentially being written
> to it.  Currently we have an array out-of-bounds write error on the
> last 4 elements. Fix this by making utdm_info UCC_MAX_NUM elements in
> size.
> 
> Addresses-Coverity: ("Out-of-bounds write")
> Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied and queued up for -stable.
