Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D92CAAA9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 19:23:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clr7V4gRQzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 05:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
X-Greylist: delayed 511 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Dec 2020 05:21:31 AEDT
Received: from mail.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clr5l6dv0zDqlF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 05:21:31 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 852E84CBC9037;
 Tue,  1 Dec 2020 10:12:45 -0800 (PST)
Date: Tue, 01 Dec 2020 10:12:40 -0800 (PST)
Message-Id: <20201201.101240.2064813650347834623.davem@davemloft.net>
To: tlfalcon@linux.ibm.com
Subject: Re: [PATCH net v3 0/2] ibmvnic: Bug fixes for queue descriptor
 processing
From: David Miller <davem@davemloft.net>
In-Reply-To: <1606837931-22676-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1606837931-22676-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Tue, 01 Dec 2020 10:12:46 -0800 (PST)
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, kuba@kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>
Date: Tue,  1 Dec 2020 09:52:09 -0600

> This series resolves a few issues in the ibmvnic driver's
> RX buffer and TX completion processing. The first patch
> includes memory barriers to synchronize queue descriptor
> reads. The second patch fixes a memory leak that could
> occur if the device returns a TX completion with an error
> code in the descriptor, in which case the respective socket
> buffer and other relevant data structures may not be freed
> or updated properly.
> 
> v3: Correct length of Fixes tags, requested by Jakub Kicinski
> 
> v2: Provide more detailed comments explaining specifically what
>     reads are being ordered, suggested by Michael Ellerman

Series applied, thanks!
