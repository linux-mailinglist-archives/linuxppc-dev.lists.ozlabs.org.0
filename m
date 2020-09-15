Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C023D26ADE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:45:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYc01cwzzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 05:45:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYYW19WmzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 05:43:07 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 9299113678364;
 Tue, 15 Sep 2020 12:26:08 -0700 (PDT)
Date: Tue, 15 Sep 2020 12:42:54 -0700 (PDT)
Message-Id: <20200915.124254.1657521903825160294.davem@davemloft.net>
To: npiggin@gmail.com
Subject: Re: [PATCH v2 3/4] sparc64: remove mm_cpumask clearing to fix
 kthread_use_mm race
From: David Miller <davem@davemloft.net>
In-Reply-To: <1600139445.qwycwjuwdq.astroid@bobo.none>
References: <20200914045219.3736466-4-npiggin@gmail.com>
 <20200914.125942.5644261129883859.davem@davemloft.net>
 <1600139445.qwycwjuwdq.astroid@bobo.none>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Tue, 15 Sep 2020 12:26:09 -0700 (PDT)
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
Cc: axboe@kernel.dk, linux-arch@vger.kernel.org, peterz@infradead.org,
 aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 15 Sep 2020 13:24:07 +1000

> Excerpts from David Miller's message of September 15, 2020 5:59 am:
>> From: Nicholas Piggin <npiggin@gmail.com>
>> Date: Mon, 14 Sep 2020 14:52:18 +1000
>> 
>>  ...
>>> The basic fix for sparc64 is to remove its mm_cpumask clearing code. The
>>> optimisation could be effectively restored by sending IPIs to mm_cpumask
>>> members and having them remove themselves from mm_cpumask. This is more
>>> tricky so I leave it as an exercise for someone with a sparc64 SMP.
>>> powerpc has a (currently similarly broken) example.
>>> 
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> 
>> Sad to see this optimization go away, but what can I do:
>> 
>> Acked-by: David S. Miller <davem@davemloft.net>
>> 
> 
> Thanks Dave, any objection if we merge this via the powerpc tree
> to keep the commits together?

No objection.
