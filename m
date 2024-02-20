Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3CC85BC52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:38:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mEpjkilI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfJqR2T0Wz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mEpjkilI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfJpl0LLyz3bc2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708432686;
	bh=P6pspKMSUiBPqehuo4l4sTkvDeLQOEpdMc3/Dl9GdWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mEpjkilIM5K9w7i1FpX7pruxwF5/zZaED8AdkCYEWTb9lMPfvR0kIByvw9riRiGnP
	 ryH926ZoR/Q760B7X/8PtusHjXA940hrM1ExTQuvEpZu6wJJNo6022NbucraQ+xQfK
	 Z3iZdtbh7HiR3woPEeQDs7V54IkNdFjWqcGmT96bV2LcvlOrJynRqRw/KiAO9rGLU0
	 3eL+Oj6WA5alKU3Gkzs6V48VIWeIk5pEdpjbcyNQnEZ9ZkySdACjrVL1492A+BZfqK
	 EXVvOSBGfO8t7H3xMyNpKUoMmwftN6FNIq59yA1VIaXpLF0Eyi+wncmlKt8YlDlOCD
	 o/RNRSnm5AZfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfJpk5l05z4wnr;
	Tue, 20 Feb 2024 23:38:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/hv-gpci: Fix the hcall return value checks in
 single_gpci_request function
In-Reply-To: <20240131112600.121482-1-kjain@linux.ibm.com>
References: <20240131112600.121482-1-kjain@linux.ibm.com>
Date: Tue, 20 Feb 2024 23:38:06 +1100
Message-ID: <87bk8bb9ap.fsf@mail.lhotse>
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, akanksha@linux.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Running event hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
> in one of the system throws below error:
>
>  ---Logs---
>  # perf list | grep hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles
>   hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=?/[Kernel PMU event]
>
>
>  # perf stat -v -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
> Using CPUID 00800200
> Control descriptor is not initialized
> Warning:
> hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event is not supported by the kernel.
> failed to read counter hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>
>  Performance counter stats for 'system wide':
>
>    <not supported>      hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>
>        2.000700771 seconds time elapsed
>
> The above error is because of the hcall failure as required
> permission "Enable Performance Information Collection" is not set.
> Based on current code, single_gpci_request function did not check the
> error type incase hcall fails and by default returns EINVAL. But we can
> have other reasons for hcall failures like H_AUTHORITY/H_PARAMETER for which
> we need to act accordingly.
> Fix this issue by adding new checks in the single_gpci_request function.
>
> Result after fix patch changes:
>
>  # perf stat -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
> Error:
> No permission to enable hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event.
>
> Fixes: 220a0c609ad1 ("powerpc/perf: Add support for the hv gpci (get performance counter info) interface")
> Reported-by: Akanksha J N <akanksha@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-gpci.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 27f18119fda1..101060facd81 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -695,7 +695,17 @@ static unsigned long single_gpci_request(u32 req, u32 starting_index,
>  
>  	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
>  			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
> -	if (ret) {
> +
> +	/*
> +	 * ret value as 'H_PARAMETER' corresponds to 'GEN_BUF_TOO_SMALL',

Don't we expect H_PARAMETER if any parameter value is incorrect?

> +	 * which means that the current buffer size cannot accommodate
> +	 * all the information and a partial buffer returned.

I don't see how we can infer that H_PARAMETER means the buffer is too
small and accessing the first entry is OK?

cheers

> +	 * Since in this function we are only accessing data for a given starting index,
> +	 * we don't need to accommodate whole data and can get required count by
> +	 * accessing very first entry.
> +	 * Hence hcall fails only incase the ret value is other than H_SUCCESS or H_PARAMETER.
> +	 */
> +	if (ret && (ret != H_PARAMETER)) {
>  		pr_devel("hcall failed: 0x%lx\n", ret);
>  		goto out;
>  	}
