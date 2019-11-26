Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23510A60D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 22:34:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mxy565zXzDqmb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 08:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mxcv0lX6zDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 08:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Mxct6M0rz8t0Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 08:19:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Mxct5JgFz9sRQ; Wed, 27 Nov 2019 08:19:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Mxct2q7Tz9sRH
 for <linuxppc-dev@ozlabs.org>; Wed, 27 Nov 2019 08:19:55 +1100 (AEDT)
Received: from localhost (c-73-35-209-67.hsd1.wa.comcast.net [73.35.209.67])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D9EF914CED4B3;
 Tue, 26 Nov 2019 13:19:45 -0800 (PST)
Date: Tue, 26 Nov 2019 13:19:45 -0800 (PST)
Message-Id: <20191126.131945.1705488455872187863.davem@davemloft.net>
To: tlfalcon@linux.ibm.com
Subject: Re: [PATCH net v2 0/4] ibmvnic: Harden device commands and queries
From: David Miller <davem@davemloft.net>
In-Reply-To: <1574723576-27553-1-git-send-email-tlfalcon@linux.ibm.com>
References: <20191125112359.7a468352@cakuba.hsd1.ca.comcast.net>
 <1574723576-27553-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 26 Nov 2019 13:19:46 -0800 (PST)
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
Cc: jakub.kicinski@netronome.com, julietk@linux.vnet.ibm.com,
 netdev@vger.kernel.org, dnbanerg@us.ibm.com, linuxppc-dev@ozlabs.org,
 brking@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>
Date: Mon, 25 Nov 2019 17:12:52 -0600

> This patch series fixes some shortcomings with the current
> VNIC device command implementation. The first patch fixes
> the initialization of driver completion structures used
> for device commands. Additionally, all waits for device
> commands are bounded with a timeout in the event that the
> device does not respond or becomes inoperable. Finally,
> serialize queries to retain the integrity of device return
> codes.
> 
> Changes in v2:
> 
>  - included header comment for ibmvnic_wait_for_completion
>  - removed open-coded loop in patch 3/4, suggested by Jakub
>  - ibmvnic_wait_for_completion accepts timeout value in milliseconds
>    instead of jiffies
>  - timeout calculations cleaned up and completed before wait loop
>  - included missing mutex_destroy calls, suggested by Jakub
>  - included comment before mutex declaration

Series applied, thanks.
