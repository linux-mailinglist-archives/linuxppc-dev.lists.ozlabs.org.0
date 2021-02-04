Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABF30EA7D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 03:56:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWNVn4MnVzDwsF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 13:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWNSx74smzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 13:55:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o8w30guu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWNSx4BcXz9sxS;
 Thu,  4 Feb 2021 13:55:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612407313;
 bh=fA4J315qru3JWszbOgCdBj3iDqmC0xgqI9sXV+JWxxA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o8w30guuwFeT4y4FeEDCgpJBQAEtaUdQkyfHSgLgBJ8d3B0qKJz4Pz2E0DpfFN4/K
 YdrXosFaBRtOawx6+GeVIE6dSkHs2MoVk4af3313pkSfsdMwH3xgp+9Fo7eVjlUPnW
 mGCvMuMN6jols/628wHFlZ2HbVTJelfFV7MA+YNEvWRayiYAIjozuiNEwRyiCWDXX9
 UWM/v4M/qD//xOkxf+7Sana0UDyNUqKZkOfNCrfsfiB+fhL88/AGmzXIbghYix5HJ9
 g56sojftnie6MohZtV7gJ5MTcbGtgyp7LJyTBqivroRDCY++KpqW+L6pWTlNXyeYNX
 5a4lYoc+n522Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Record counter overflow always if
 SAMPLE_IP is unset
In-Reply-To: <1612342484-1404-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612342484-1404-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Thu, 04 Feb 2021 13:55:10 +1100
Message-ID: <87pn1gpmnl.fsf@mpe.ellerman.id.au>
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> While sampling for marked events, currently we record the sample only
> if the SIAR valid bit of Sampled Instruction Event Register (SIER) is
> set. SIAR_VALID bit is used for fetching the instruction address from
> Sampled Instruction Address Register(SIAR). But there are some usecases,
> where the user is interested only in the PMU stats at each counter
> overflow and the exact IP of the overflow event is not required.
> Dropping SIAR invalid samples will fail to record some of the counter
> overflows in such cases.
>
> Example of such usecase is dumping the PMU stats (event counts)
> after some regular amount of instructions/events from the userspace
> (ex: via ptrace). Here counter overflow is indicated to userspace via
> signal handler, and captured by monitoring and enabling I/O
> signaling on the event file descriptor. In these cases, we expect to
> get sample/overflow indication after each specified sample_period.
>
> Perf event attribute will not have PERF_SAMPLE_IP set in the
> sample_type if exact IP of the overflow event is not requested. So
> while profiling if SAMPLE_IP is not set, just record the counter overflow
> irrespective of SIAR_VALID check.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/core-book3s.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 28206b1fe172..bb4828a05e4d 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2166,10 +2166,16 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
>  	 * address even when freeze on supervisor state (kernel) is set in
>  	 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
>  	 * these cases.
> +	 *
> +	 * If address is not requested in the sample
> +	 * via PERF_SAMPLE_IP, just record that sample
> +	 * irrespective of SIAR valid check.
>  	 */
> -	if (event->attr.exclude_kernel && record)
> -		if (is_kernel_addr(mfspr(SPRN_SIAR)))
> +	if (event->attr.exclude_kernel && record) {
> +		if (is_kernel_addr(mfspr(SPRN_SIAR)) && (event->attr.sample_type & PERF_SAMPLE_IP))
>  			record = 0;
> +	} else if (!record && !(event->attr.sample_type & PERF_SAMPLE_IP))
> +		record = 1;

This seems wrong, you're assuming that record was set previously to
= siar_valid(), but it may be that record is still 0 from the
initialisation and we weren't going to record.

Don't we need something more like this?

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 9fd06010e8b6..e4e8a017d339 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2136,7 +2136,12 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			left += period;
 			if (left <= 0)
 				left = period;
-			record = siar_valid(regs);
+
+			if (event->attr.sample_type & PERF_SAMPLE_IP)
+				record = siar_valid(regs);
+			else
+				record = 1;
+
 			event->hw.last_period = event->hw.sample_period;
 		}
 		if (left < 0x80000000LL)
@@ -2154,9 +2159,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
 	 * these cases.
 	 */
-	if (event->attr.exclude_kernel && record)
-		if (is_kernel_addr(mfspr(SPRN_SIAR)))
-			record = 0;
+	if (event->attr.exclude_kernel &&
+	    (event->attr.sample_type & PERF_SAMPLE_IP) &&
+	    is_kernel_addr(mfspr(SPRN_SIAR)))
+		record = 0;
 
 	/*
 	 * Finally record data if requested.



cheers
