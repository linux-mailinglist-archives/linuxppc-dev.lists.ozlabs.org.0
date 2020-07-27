Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE722E6F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:52:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFX816y1rzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWb40p4lzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWb25p3jz9sTk; Mon, 27 Jul 2020 17:26:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 mpe@ellerman.id.au
In-Reply-To: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
References: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v5 00/10] powerpc/watchpoint: Enable 2nd DAWR on baremetal
 and powervm
Message-Id: <159583477476.602200.17205445120834427421.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:54 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr, miltonm@us.ibm.com, rogealve@br.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, oleg@redhat.com, paulus@samba.org, jolsa@kernel.org,
 jniethe5@gmail.com, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jul 2020 14:38:03 +0530, Ravi Bangoria wrote:
> Last series[1] was to add basic infrastructure support for more than
> one watchpoint on Book3S powerpc. This series actually enables the 2nd
> DAWR for baremetal and powervm. Kvm guest is still not supported.
> 
> v4: https://lore.kernel.org/r/20200717040958.70561-1-ravi.bangoria@linux.ibm.com
> 
> v4->v5:
>  - Using hardcoded values instead of macros HBP_NUM_ONE and HBP_NUM_TWO.
>    Comment above HBP_NUM_MAX changed to explain it's value.
>  - Included CPU_FTR_DAWR1 into CPU_FTRS_POWER10
>  - Using generic function feat_enable() instead of
>    feat_enable_debug_facilities_v31() to enable CPU_FTR_DAWR1.
>  - ISA still includes 512B boundary in match criteria. But that's a
>    documentation mistake. Mentioned about this in the last patch.
>  - Rebased to powerpc/next
>  - Added Jordan's Reviewed-by/Tested-by tags
> 
> [...]

Applied to powerpc/next.

[01/10] powerpc/watchpoint: Fix 512 byte boundary limit
        https://git.kernel.org/powerpc/c/3190ecbfeeb2ab17778887ce3fa964615d6460fd
[02/10] powerpc/watchpoint: Fix DAWR exception constraint
        https://git.kernel.org/powerpc/c/f6780ce619f8daa285760302d56e95892087bd1f
[03/10] powerpc/watchpoint: Fix DAWR exception for CACHEOP
        https://git.kernel.org/powerpc/c/f3c832f1350bcf1e6906113ee3168066f4235dbe
[04/10] powerpc/watchpoint: Enable watchpoint functionality on power10 guest
        https://git.kernel.org/powerpc/c/8f460a8175e6d85537d581734e9fa7ef97036b1a
[05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
        https://git.kernel.org/powerpc/c/dc1cedca54704d336c333b5398daaf13b23e391b
[06/10] powerpc/watchpoint: Set CPU_FTR_DAWR1 based on pa-features bit
        https://git.kernel.org/powerpc/c/8f45ca3f8b87c4810674fbfe65de6d041ee0baee
[07/10] powerpc/watchpoint: Rename current H_SET_MODE DAWR macro
        https://git.kernel.org/powerpc/c/6f3fe297f95134e9b2386dae0067bf530e1ddca0
[08/10] powerpc/watchpoint: Guest support for 2nd DAWR hcall
        https://git.kernel.org/powerpc/c/03f3e54abd95061ea11bdb4eedbe3cab6553704f
[09/10] powerpc/watchpoint: Return available watchpoints dynamically
        https://git.kernel.org/powerpc/c/deb2bd9bcc8428d4b65b6ba640ba8b57c1b20b17
[10/10] powerpc/watchpoint: Remove 512 byte boundary
        https://git.kernel.org/powerpc/c/3f31e49dc4588d396023028791e36c23235e1334

cheers
