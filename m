Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BB436EBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb4jf3q7Hz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RNbeQsbH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb4hz4mpDz2xXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 11:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RNbeQsbH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb4hx73Wmz4xfH;
 Fri, 22 Oct 2021 11:19:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634861954;
 bh=t4tC2wY2mkf3s1U2MpUSmL1j57aZ2E4tZL9X1YWIqVg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RNbeQsbH+ODB4Y22fFSEuzLP6VZK8osooAOvO8/pCC2iRmKU+RkD+upB+Fv7eMSGn
 Whf26NqOXZ2z+m5pW/EXwSR8leBFje+7Uujl+YdtND3drwPGTWeAC2i9SqlSEs5CKu
 CHLtO/Mh0YNbK1e4WbwJzVbbgWaxZuWk3gp3+zBT6m6iW2lI+SmBqBFyOmpK+m6kNB
 RS0qIi9a/7LsexDEOXs1h4TOhX7AGHqLumJRdaEElq2yNvcowqzamvtBDzEwGm/5jd
 mvkz/7vE84UhH+SSpwg/AlGvECjWkkLeFrO2Rhm0afSK3OOO4IBAJc1hvFTGc77AMp
 zNscUzkhDwzlQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
In-Reply-To: <87lf2mxpov.fsf@linux.ibm.com>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87lf2mxpov.fsf@linux.ibm.com>
Date: Fri, 22 Oct 2021 11:19:10 +1100
Message-ID: <874k99di81.fsf@mpe.ellerman.id.au>
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> During Live Partition Migration (LPM), it is observed that perf
>> counter values reports zero post migration completion. However
>> 'perf stat' with workload continues to show counts post migration
>> since PMU gets disabled/enabled during sched switches. But incase
>> of system/cpu wide monitoring, zero counts were reported with 'perf
>> stat' after migration completion.
>>
>> Example:
>>  ./perf stat -e r1001e -I 1000
>>            time             counts unit events
>>      1.001010437         22,137,414      r1001e
>>      2.002495447         15,455,821      r1001e
>> <<>> As seen in next below logs, the counter values shows zero
>>         after migration is completed.
>> <<>>
>>     86.142535370    129,392,333,440      r1001e
>>     87.144714617                  0      r1001e
>>     88.146526636                  0      r1001e
>>     89.148085029                  0      r1001e
>
> Confirmed in my environment:
>
>     51.099987985            300,338      cache-misses
>     52.101839374            296,586      cache-misses
>     53.116089796            263,150      cache-misses
>     54.117949249            232,290      cache-misses
>     55.602029375     68,700,421,711      cache-misses
>     56.610073969                  0      cache-misses
>     57.614732000                  0      cache-misses
>
> I wonder what it means that there is a very unlikely huge value before
> the counter stops working -- I believe your example has this phenomenon
> too.

AFAICS the patch is not reading the PMC values before the migration, so
I suspect we're losing some counts just before the migration and then
the delta is going negative somewhere, leading to an implausibly large
count.

cheers
