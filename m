Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 466DC5D7B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 23:03:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dcD01mYzzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 07:03:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dc9l5wsBzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 07:01:43 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B61A21000133B;
 Tue,  2 Jul 2019 14:01:36 -0700 (PDT)
Date: Tue, 02 Jul 2019 14:01:34 -0700 (PDT)
Message-Id: <20190702.140134.1769484209181791824.davem@davemloft.net>
To: tlfalcon@linux.ibm.com
Subject: Re: [PATCH net] net/ibmvnic: Report last valid speed and duplex
 values to ethtool
From: David Miller <davem@davemloft.net>
In-Reply-To: <1561655353-17114-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1561655353-17114-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 02 Jul 2019 14:01:37 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bjking1@us.ibm.com,
 dnbanerg@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>
Date: Thu, 27 Jun 2019 12:09:13 -0500

> This patch resolves an issue with sensitive bonding modes
> that require valid speed and duplex settings to function
> properly. Currently, the adapter will report that device
> speed and duplex is unknown if the communication link
> with firmware is unavailable. This decision can break LACP
> configurations if the timing is right.
> 
> For example, if invalid speeds are reported, the slave
> device's link state is set to a transitional "fail" state
> and the LACP port is disabled. However, if valid speeds
> are reported later but the link state has not been altered,
> the LACP port will remain disabled. If the link state then
> transitions back to "up" from "fail," it results in a state
> such that the slave reports valid speed/duplex and is up,
> but the LACP port will remain disabled.
> 
> Workaround this by reporting the last recorded speed
> and duplex settings unless the device has never been
> activated. In that case or when the hypervisor gives
> invalid values, continue to report unknown speed or
> duplex to ethtool.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

Like Andrew, I have my conerns about this.

If the firmware is unavailable, the link is effectively down.  So
you should report link down and unknown link parameters.

Bonding and LACP should do the right thing when the firwmare is
reachable again after the migration and the link goes back up.

If bonding/LACP isn't doing that, then the bug is there.
