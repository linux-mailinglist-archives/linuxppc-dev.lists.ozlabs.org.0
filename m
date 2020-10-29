Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6F29DB8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 01:04:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM5Jg27CdzDqWF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 11:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LTYaALsC; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=c7noJt53; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM5GD0GMMzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 11:01:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603929708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TUZ6dDQwn0wEj7XRmQkFrwdAH8HqlgDOlYXF1sDMZs=;
 b=LTYaALsCkwEzrGmeteaLVlTi8m65hLN3J4IFANhPpMBieLcqn4lq8s1dMfSTYLqowfIozZ
 Zjxs8FuRv+ORIWmR4S+haRUgIAodL11X0K9i5obNji6ie+Cpb+QqZr67CUmQShyNy+h6x6
 /f5l108yLxJACNKN42ZJgGf66Cgk7C8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603929709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TUZ6dDQwn0wEj7XRmQkFrwdAH8HqlgDOlYXF1sDMZs=;
 b=c7noJt53IiXgm3pxyRAZm+x8AMP4FK+gZM7b06yoE9xjz54US4QWCH9YhaDh/TfqzinG14
 Y0QNLZ/UYNp5jneYjYALSoR0J1MjxeA1Prb6Y3jeqwJnE4iaFktK+u6IRovnnBp/5tlJJ1
 fYhyZkMWRjpfuFQJeVZOV8hNDRQIoO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-sqI62auCNZSammO79U46Aw-1; Wed, 28 Oct 2020 20:01:40 -0400
X-MC-Unique: sqI62auCNZSammO79U46Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19291018F61;
 Thu, 29 Oct 2020 00:01:38 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-144.rdu2.redhat.com [10.10.117.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39F6F5D9EF;
 Thu, 29 Oct 2020 00:01:31 +0000 (UTC)
Subject: Re: [PATCH 0/4] Powerpc: Better preemption for shared processor
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <da67d6ce-f120-f61a-19ff-0ae4f1f5dac0@redhat.com>
Date: Wed, 28 Oct 2020 20:01:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/28/20 8:35 AM, Srikar Dronamraju wrote:
> Currently, vcpu_is_preempted will return the yield_count for
> shared_processor. On a PowerVM LPAR, Phyp schedules at SMT8 core boundary
> i.e all CPUs belonging to a core are either group scheduled in or group
> scheduled out. This can be used to better predict non-preempted CPUs on
> PowerVM shared LPARs.
>
> perf stat -r 5 -a perf bench sched pipe -l 10000000 (lesser time is better)
>
> powerpc/next
>       35,107,951.20 msec cpu-clock                 #  255.898 CPUs utilized            ( +-  0.31% )
>          23,655,348      context-switches          #    0.674 K/sec                    ( +-  3.72% )
>              14,465      cpu-migrations            #    0.000 K/sec                    ( +-  5.37% )
>              82,463      page-faults               #    0.002 K/sec                    ( +-  8.40% )
>   1,127,182,328,206      cycles                    #    0.032 GHz                      ( +-  1.60% )  (66.67%)
>      78,587,300,622      stalled-cycles-frontend   #    6.97% frontend cycles idle     ( +-  0.08% )  (50.01%)
>     654,124,218,432      stalled-cycles-backend    #   58.03% backend cycles idle      ( +-  1.74% )  (50.01%)
>     834,013,059,242      instructions              #    0.74  insn per cycle
>                                                    #    0.78  stalled cycles per insn  ( +-  0.73% )  (66.67%)
>     132,911,454,387      branches                  #    3.786 M/sec                    ( +-  0.59% )  (50.00%)
>       2,890,882,143      branch-misses             #    2.18% of all branches          ( +-  0.46% )  (50.00%)
>
>             137.195 +- 0.419 seconds time elapsed  ( +-  0.31% )
>
> powerpc/next + patchset
>       29,981,702.64 msec cpu-clock                 #  255.881 CPUs utilized            ( +-  1.30% )
>          40,162,456      context-switches          #    0.001 M/sec                    ( +-  0.01% )
>               1,110      cpu-migrations            #    0.000 K/sec                    ( +-  5.20% )
>              62,616      page-faults               #    0.002 K/sec                    ( +-  3.93% )
>   1,430,030,626,037      cycles                    #    0.048 GHz                      ( +-  1.41% )  (66.67%)
>      83,202,707,288      stalled-cycles-frontend   #    5.82% frontend cycles idle     ( +-  0.75% )  (50.01%)
>     744,556,088,520      stalled-cycles-backend    #   52.07% backend cycles idle      ( +-  1.39% )  (50.01%)
>     940,138,418,674      instructions              #    0.66  insn per cycle
>                                                    #    0.79  stalled cycles per insn  ( +-  0.51% )  (66.67%)
>     146,452,852,283      branches                  #    4.885 M/sec                    ( +-  0.80% )  (50.00%)
>       3,237,743,996      branch-misses             #    2.21% of all branches          ( +-  1.18% )  (50.01%)
>
>              117.17 +- 1.52 seconds time elapsed  ( +-  1.30% )
>
> This is around 14.6% improvement in performance.
>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
>
> Srikar Dronamraju (4):
>    powerpc: Refactor is_kvm_guest declaration to new header
>    powerpc: Rename is_kvm_guest to check_kvm_guest
>    powerpc: Reintroduce is_kvm_guest
>    powerpc/paravirt: Use is_kvm_guest in vcpu_is_preempted
>
>   arch/powerpc/include/asm/firmware.h  |  6 ------
>   arch/powerpc/include/asm/kvm_guest.h | 25 +++++++++++++++++++++++++
>   arch/powerpc/include/asm/kvm_para.h  |  2 +-
>   arch/powerpc/include/asm/paravirt.h  | 18 ++++++++++++++++++
>   arch/powerpc/kernel/firmware.c       |  5 ++++-
>   arch/powerpc/platforms/pseries/smp.c |  3 ++-
>   6 files changed, 50 insertions(+), 9 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/kvm_guest.h
>
This patch series looks good to me and the performance is nice too.

Acked-by: Waiman Long <longman@redhat.com>

Just curious, is the performance mainly from the use of static_branch 
(patches 1 - 3) or from reducing call to yield_count_of().

Cheers,
Longman

