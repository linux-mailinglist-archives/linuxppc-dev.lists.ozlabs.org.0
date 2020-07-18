Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDE224B37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 14:42:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B871k2kGdzDrP0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 22:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B86z90WvyzDrNL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 22:40:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=B6C6yFO8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B86z73yKWz9sRR;
 Sat, 18 Jul 2020 22:40:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595076036;
 bh=47LBnCPyXKwB+KStYuVH0eRhSaHYfD2Jm6Mq0Pm89jw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=B6C6yFO8JIaWqWyy80XKXY7ZchyFlbK3ojH06zfkIxqvHAvS5guIUrDEzjT2pMXyj
 r/sS5uC8/8elhBSb1QIgNnX89dFfJPZYGoFqPi3s2xqZXVy3dNuD7jhUKhr4gyZVom
 UK/nerX027qr30VvMhw/RZNTOQw7hk+cHubeXBMozwNQqxw2jrDQXbdPQqDgQahfwH
 /zQ+F3eW3DOgdqq7VI/54puegYzp99vlWfma88N9mgxgQ5oQbNKkgmhkcGjzxsDL/9
 wUsVBj+ZEa16lSS3/VNz7JcYlZTaQ+4L/8efm8+5yaviD6CvMFNNRRM0RwKUgD3k7x
 XlnnXq1MmB52g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bharata@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
In-Reply-To: <20200717042854.GL7902@in.ibm.com>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
 <20200716172713.GA4565@lca.pw> <1594950229.jn9ipe6td1.astroid@bobo.none>
 <1594953143.b8px5ir35m.astroid@bobo.none> <20200717042854.GL7902@in.ibm.com>
Date: Sat, 18 Jul 2020 22:40:34 +1000
Message-ID: <87pn8tt2rh.fsf@mpe.ellerman.id.au>
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
Cc: sfr@canb.auug.org.au, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:
> On Fri, Jul 17, 2020 at 12:44:00PM +1000, Nicholas Piggin wrote:
>> Excerpts from Nicholas Piggin's message of July 17, 2020 12:08 pm:
>> > Excerpts from Qian Cai's message of July 17, 2020 3:27 am:
>> >> On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
>> >>> Hypervisor may choose not to enable Guest Translation Shootdown Enable
>> >>> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
>> >>> permitted to use instructions like tblie and tlbsync directly, but is
>> >>> expected to make hypervisor calls to get the TLB flushed.
>> >>> 
>> >>> This series enables the TLB flush routines in the radix code to
>> >>> off-load TLB flushing to hypervisor via the newly proposed hcall
>> >>> H_RPT_INVALIDATE. 
>> >>> 
>> >>> To easily check the availability of GTSE, it is made an MMU feature.
>> >>> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
>> >>> handle GTSE as an optionally available feature and to not assume GTSE
>> >>> when radix support is available.
>> >>> 
>> >>> The actual hcall implementation for KVM isn't included in this
>> >>> patchset and will be posted separately.
>> >>> 
>> >>> Changes in v3
>> >>> =============
>> >>> - Fixed a bug in the hcall wrapper code where we were missing setting
>> >>>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
>> >>>   a full flush for the nested case.
>> >>> - s/psize_to_h_rpti/psize_to_rpti_pgsize
>> >>> 
>> >>> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@linux.ibm.com/T/#t
>> >>> 
>> >>> Bharata B Rao (2):
>> >>>   powerpc/mm: Enable radix GTSE only if supported.
>> >>>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
>> >>>     enabled
>> >>> 
>> >>> Nicholas Piggin (1):
>> >>>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
>> >>>     !GTSE
>> >> 
>> >> Reverting the whole series fixed random memory corruptions during boot on
>> >> POWER9 PowerNV systems below.
>> > 
>> > If I s/mmu_has_feature(MMU_FTR_GTSE)/(1)/g in radix_tlb.c, then the .o
>> > disasm is the same as reverting my patch.
>> > 
>> > Feature bits not being set right? PowerNV should be pretty simple, seems
>> > to do the same as FTR_TYPE_RADIX.
>> 
>> Might need this fix
>> 
>> ---
>> 
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 9cc49f265c86..54c9bcea9d4e 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -163,7 +163,7 @@ static struct ibm_pa_feature {
>>  	{ .pabyte = 0,  .pabit = 6, .cpu_features  = CPU_FTR_NOEXECUTE },
>>  	{ .pabyte = 1,  .pabit = 2, .mmu_features  = MMU_FTR_CI_LARGE_PAGE },
>>  #ifdef CONFIG_PPC_RADIX_MMU
>> -	{ .pabyte = 40, .pabit = 0, .mmu_features  = MMU_FTR_TYPE_RADIX },
>> +	{ .pabyte = 40, .pabit = 0, .mmu_features  = (MMU_FTR_TYPE_RADIX | MMU_FTR_GTSE) },
>>  #endif
>>  	{ .pabyte = 1,  .pabit = 1, .invert = 1, .cpu_features = CPU_FTR_NODSISRALIGN },
>>  	{ .pabyte = 5,  .pabit = 0, .cpu_features  = CPU_FTR_REAL_LE,
>
> Michael - Let me know if this should be folded into 1/3 and the complete
> series resent.

No it's already merged.

Please send a proper patch with a Fixes: tag and a change log that
explains the details.

cheers
