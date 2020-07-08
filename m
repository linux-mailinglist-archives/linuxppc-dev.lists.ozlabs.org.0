Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B552D21856F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:02:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xGP0q4NzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:02:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1xDX04zbzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 21:00:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BGXDUQ1D; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1xDV6387z9sRK;
 Wed,  8 Jul 2020 21:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594206042;
 bh=3kpd+xGOIzFzQnDoznNl8bpFvIbeWCBLNKrdYMwyh1o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BGXDUQ1Dm38H/Rkj9YWf5gU9zQTz0Ll+DLH71GX4Og5nanigFhYoPPRJAmJ36NgKu
 68uyZ2ecz8ULqg19nN7D2I3hPEVQRrvcrnrpYwCrn8ySoSF3VbGtGQrgufo8crNtxS
 7gfLsP2ziBoexLLcoD0kWSx4Wp7IoL9l2ethHbVjer/KH1UIXmP07tatRuoVEwrcbE
 uqXDzLeqhvAy0eUJ9Hxsj8rYzf+wTsKpAPTrC7k3GJjOVAq7ZpKQ9XhbvyHQdLLIqh
 ug/IZ7lop7OkLeD1a/HArMzxGtBOjFg6x/19YVCXBMSCVBHo5H0Ix/1Pjq3/jxg762
 p2w+O1GSV+stQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 01/10] powerpc/perf: Add support for ISA3.1 PMU SPRs
In-Reply-To: <1593595262-1433-2-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-2-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 21:02:55 +1000
Message-ID: <874kqi46cg.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
...
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index cd6a742..5c64bd3 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -39,10 +39,10 @@ struct cpu_hw_events {
>  	unsigned int flags[MAX_HWEVENTS];
>  	/*
>  	 * The order of the MMCR array is:
> -	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
> +	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
>  	 *  - 32-bit, MMCR0, MMCR1, MMCR2
>  	 */
> -	unsigned long mmcr[4];
> +	unsigned long mmcr[5];
>  	struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
>  	u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
>  	u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
...
> @@ -1310,6 +1326,10 @@ static void power_pmu_enable(struct pmu *pmu)
>  	if (!cpuhw->n_added) {
>  		mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
>  		mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
> +#ifdef CONFIG_PPC64
> +		if (ppmu->flags & PPMU_ARCH_310S)
> +			mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
> +#endif /* CONFIG_PPC64 */
>  		goto out_enable;
>  	}
>  
> @@ -1353,6 +1373,11 @@ static void power_pmu_enable(struct pmu *pmu)
>  	if (ppmu->flags & PPMU_ARCH_207S)
>  		mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
>  
> +#ifdef CONFIG_PPC64
> +	if (ppmu->flags & PPMU_ARCH_310S)
> +		mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
> +#endif /* CONFIG_PPC64 */

I don't think you need the #ifdef CONFIG_PPC64?

cheers
