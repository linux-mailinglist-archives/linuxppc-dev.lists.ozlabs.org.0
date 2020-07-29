Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4D231F93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 15:50:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGw033xyfzDq9y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 23:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGvxN2mSczDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 23:47:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dYPqJdCE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGvxM2fYqz9sRK;
 Wed, 29 Jul 2020 23:47:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596030455;
 bh=GaTHvhFdf26Dk+QiL2pveJ88cVeSI5t3KlOCfti+NC8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dYPqJdCEv0p2JZ7098lT5cx+NsbsB8sfJ/6BuAe2bUV9OHkK2Y8k5sq8VhKFFDyk/
 +Lmj4CzCjmqF5Q16G4FSyQDdSyNjHMpfdE/TnoL+Eupo+FW18r34w4hVyzGeeb4HVN
 MQFfKfQPmARExnTxcsCudgF7LYTCa/wAPKbwFVcOTXLDO7YBqgEF9wYZTAx002gmWt
 32xVFHgscWGcGGp41mHhPL7/fYMNV/Cktn8TFXAgWjJ4caWt0Z5ZPfkw/IcJZIam5e
 8XArYp2SrP8gE8sC1acTQCYNhIFxTEsb4T3H2NmGncTLhXF/200CXeYb/MV1FCdmoF
 Sm+LSFmNPDK/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v2] selftests: powerpc: Fix online CPU selection
In-Reply-To: <20200609073733.997643-1-sandipan@linux.ibm.com>
References: <20200609073733.997643-1-sandipan@linux.ibm.com>
Date: Wed, 29 Jul 2020 23:47:31 +1000
Message-ID: <87r1su5t70.fsf@mpe.ellerman.id.au>
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
Cc: srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com,
 nasastry@in.ibm.com, harish@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> The size of the CPU affinity mask must be large enough for
> systems with a very large number of CPUs. Otherwise, tests
> which try to determine the first online CPU by calling
> sched_getaffinity() will fail. This makes sure that the size
> of the allocated affinity mask is dependent on the number of
> CPUs as reported by get_nprocs().
>
> Fixes: 3752e453f6ba ("selftests/powerpc: Add tests of PMU EBBs")
> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
> ---
> Previous versions can be found at:
> v1: https://lore.kernel.org/linuxppc-dev/20200608144212.985144-1-sandipan@linux.ibm.com/
>
> Changes in v2:
> - Added NULL check for the affinity mask as suggested by Kamalesh.
> - Changed "cpu set" to "CPU affinity mask" in the commit message.

This sometimes breaks, eg:

  # ./count_instructions 
  test: count_instructions
  tags: git_version:v5.8-rc2-327-g9a1d992a7eb7
  sched_getaffinity: Invalid argument
  [FAIL] Test FAILED on line 123
  failure: count_instructions


This system has a messed up SMT setup, but the old code was able to cope
with it:

  # ppc64_cpu --info
  Core   0:    0*    1*    2     3     4     5     6     7  
  Core   1:    8     9    10*   11*   12    13    14    15  
  Core   2:   16    17    18    19    20    21    22    23  
  Core   3:   24    25    26    27    28    29    30    31  
  Core   4:   32    33    34    35    36    37    38    39  
  Core   5:   40    41    42    43    44    45    46    47  
  Core   6:   48    49    50    51    52    53    54    55  
  Core   7:   56    57    58    59    60    61    62    63  
  Core   8:   64    65    66    67    68    69    70    71  
  Core   9:   72    73    74    75    76    77    78    79  
  Core  10:   80    81    82    83    84    85    86    87  
  Core  11:   88    89    90    91    92    93    94    95  
  Core  12:   96    97    98    99   100*  101*  102*  103* 
  Core  13:  104*  105*  106*  107*  108*  109*  110*  111* 
  Core  14:  112*  113*  114*  115*  116*  117*  118*  119* 
  Core  15:  120   121   122   123   124   125   126   127  
  Core  16:  128   129   130   131   132   133   134   135  
  Core  17:  136   137   138   139   140   141   142   143  
  Core  18:  144   145   146   147   148   149   150   151  
  Core  19:  152   153   154   155   156   157   158   159 

cheers
