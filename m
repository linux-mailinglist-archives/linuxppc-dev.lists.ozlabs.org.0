Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CB1BDAD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:38:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxNK5gVKzDr3k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BxGB2NYyzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:33:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sFv2zLZ0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BxG91qHmz9sRY;
 Wed, 29 Apr 2020 21:33:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588159985;
 bh=Adj+fG8YDKfPDUE9InMCb5DttAUKu40s9AS5+byR6mY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sFv2zLZ0qaNXw6rVKpWVaCYMtoW69+gkf7dQD3mcQaYunRfoql/kCN/1uIFVVLKOR
 cfNlSqelh0VvtGgBtBr6K0kCbVpsuf/wFJ5Luc/1yRhF2dmVvYoUx2Vv+hf7KJMmnj
 xeFTEaHzRzVGsvxVWFJTFI7SOJU4MDXbR/CLjvQ53gq8hA14952XM2QUg7USjoey40
 Ez6JoRcK7p8dTSjID6dXpfbM1hgcF2KTXiaPvF1OAYfjzPPEaOGC0NvmPLfVWhGJep
 IMcmLX4OCQo3PfR23uyCeUYELFDWudw+WPcqjFkC5q0PyFQ6KnzzWlbTBA/ZUNuu/0
 KOA2UjNxrbTfA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH v7 3/5] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show processor details
In-Reply-To: <87d07qfrxb.fsf@mpe.ellerman.id.au>
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-4-kjain@linux.ibm.com>
 <87d07qfrxb.fsf@mpe.ellerman.id.au>
Date: Wed, 29 Apr 2020 21:33:21 +1000
Message-ID: <87a72ufrwe.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> To expose the system dependent parameter like total number of
>> sockets and numbers of chips per socket, patch adds two sysfs files.
>> "sockets" and "chips" are added to /sys/devices/hv_24x7/interface/
>> of the "hv_24x7" pmu.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>
> This should also add documentation under Documentation/ABI.

Ugh, sorry, you do that in the next patch :}

cheers
