Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4C11E1AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:08:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z5wW5LgGzDrCN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 21:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z5t51YqBzDrCF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 21:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="sE3izP+S"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47Z5t50LfNz9sPc; Fri, 13 Dec 2019 21:06:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Z5t41bQVz9sPK;
 Fri, 13 Dec 2019 21:06:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576231596;
 bh=NeAHb1eiw8bCoBFLlJ6KF9HZgOdANH3SvOXm2Ry8VfA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sE3izP+S3soAtt3Etn5ohBckswdJD5LG4WO+FLgF9DyeV9AFq9JzEU39WhXyNMqme
 tdk5L07Rr0SjH+j6lEaxv47k5WKPIOHHx51vhvyLLn35f5CSrhKyaNJGXTXSgf/suU
 Ajy9gzK6F8DASuhTfXfQmhHdbhK6ixZxqs2cFf1OLhyhD5C4kEOkbNEjsdJqWZrB74
 PrVcxdBgZxQn4VvQ5WjxdlhpYP7qpCVKxLRTtihSA1cIDk132A/re+0GLXHMUSEIaU
 ldz1QS0qtqLs7TOtEVjtOUm3pdwQ7MaskrlsUb6qlBSzmoNu9+e9yFi5z7fNkCJ3dl
 YbWIgksjx/u+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
In-Reply-To: <20191213050755.GA23839@linux.vnet.ibm.com>
References: <20191213035036.6913-1-mpe@ellerman.id.au>
 <20191213050755.GA23839@linux.vnet.ibm.com>
Date: Fri, 13 Dec 2019 21:06:32 +1100
Message-ID: <87y2vgo7yv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: juri.lelli@redhat.com, ego@linux.vnet.ibm.com, pauld@redhat.com,
 parth@linux.ibm.com, Ihor.Pasichnyk@ibm.com, linuxppc-dev@ozlabs.org,
 longman@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2019-12-13 14:50:35]:
>
>> Waiman Long suggested using static_keys.
>> 
>> Fixes: 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted vCPUs")
>> Cc: stable@vger.kernel.org # v4.18+
>> Reported-by: Parth Shah <parth@linux.ibm.com>
>> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
>> Tested-by: Juri Lelli <juri.lelli@redhat.com>
>> Acked-by: Waiman Long <longman@redhat.com>
>> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Acked-by: Phil Auld <pauld@redhat.com>
>> Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
>> Tested-by: Parth Shah <parth@linux.ibm.com>
>> [mpe: Move the key and setting of the key to pseries/setup.c]
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/spinlock.h    | 4 +++-
>>  arch/powerpc/platforms/pseries/setup.c | 7 +++++++
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>> 
>
> Tested with your version of the patch and its working as expected

Thanks, I took the values below and put them in the changelog for the
patched case.

cheers

> Latency percentiles (usec)
>         50.0th: 45
>         75.0th: 63
>         90.0th: 74
>         95.0th: 78
>         *99.0th: 82
>         99.5th: 83
>         99.9th: 86
>         min=0, max=96
> Latency percentiles (usec)
>         50.0th: 46
>         75.0th: 64
>         90.0th: 75
>         95.0th: 79
>         *99.0th: 83
>         99.5th: 85
>         99.9th: 91
>         min=0, max=117
> Latency percentiles (usec)
>         50.0th: 46
>         75.0th: 64
>         90.0th: 75
>         95.0th: 79
>         *99.0th: 83
>         99.5th: 84
>         99.9th: 90
>         min=0, max=95
> Latency percentiles (usec)
>         50.0th: 47
>         75.0th: 65
>         90.0th: 75
>         95.0th: 79
>         *99.0th: 84
>         99.5th: 85
>         99.9th: 90
>         min=0, max=117
> Latency percentiles (usec)
>         50.0th: 45
>         75.0th: 64
>         90.0th: 75
>         95.0th: 79
>         *99.0th: 82
>         99.5th: 83
>         99.9th: 93
>         min=0, max=111
>
>
> -- 
> Thanks and Regards
> Srikar Dronamraju
