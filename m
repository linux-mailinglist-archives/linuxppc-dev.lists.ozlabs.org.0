Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BECB1FA158
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 22:21:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m2mC5wsJzDqfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:21:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m2hs2HG3zDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 06:18:36 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 63766120ED49A;
 Mon, 15 Jun 2020 13:18:26 -0700 (PDT)
Date: Mon, 15 Jun 2020 13:18:25 -0700 (PDT)
Message-Id: <20200615.131825.395007573746693303.davem@davemloft.net>
To: tlfalcon@linux.ibm.com
Subject: Re: [PATCH net v2] ibmvnic: Harden device login requests
From: David Miller <davem@davemloft.net>
In-Reply-To: <1592234963-9535-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1592234963-9535-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 15 Jun 2020 13:18:26 -0700 (PDT)
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
 danymadden@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>
Date: Mon, 15 Jun 2020 10:29:23 -0500

> The VNIC driver's "login" command sequence is the final step
> in the driver's initialization process with device firmware,
> confirming the available device queue resources to be utilized
> by the driver. Under high system load, firmware may not respond
> to the request in a timely manner or may abort the request. In
> such cases, the driver should reattempt the login command
> sequence. In case of a device error, the number of retries
> is bounded.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> ---
> v2: declare variables in Reverse Christmas tree format

Applied, thanks.
