Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818DAC748
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 17:39:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QdrV2yGSzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 01:39:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Qdpj5rYPzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 01:37:29 +1000 (AEST)
Received: from localhost (unknown [88.214.184.0])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2D524152EFC42;
 Sat,  7 Sep 2019 08:37:15 -0700 (PDT)
Date: Sat, 07 Sep 2019 17:37:14 +0200 (CEST)
Message-Id: <20190907.173714.1400426487600521308.davem@davemloft.net>
To: julietk@linux.vnet.ibm.com
Subject: Re: [PATCH] net/ibmvnic: free reset work of removed device from queue
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190905213001.19818-1-julietk@linux.vnet.ibm.com>
References: <20190905213001.19818-1-julietk@linux.vnet.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 07 Sep 2019 08:37:16 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Thu,  5 Sep 2019 17:30:01 -0400

> Commit 36f1031c51a2 ("ibmvnic: Do not process reset during or after
>  device removal") made the change to exit reset if the driver has been
> removed, but does not free reset work items of the adapter from queue.
> 
> Ensure all reset work items are freed when breaking out of the loop early.
> 
> Fixes: 36f1031c51a2 ("ibmnvic: Do not process reset during or after
> device removal”)

Please do not break up Fixes: tags into mutliple lines, also please do
not put an empty line between the Fixes: tag and other tags like the
Signed-off-by:

> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>

Applied, thanks.
