Return-Path: <linuxppc-dev+bounces-17709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF+pINr2p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:09:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1451FD477
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:09:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQn1L4XlRz3c5f;
	Wed, 04 Mar 2026 20:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772615382;
	cv=none; b=mK6/CsoWPJnFF75dDfMRBwX596Tr5hwBolR+6a3YId/Amc3W/xEP8/ASeb6RIw2hqUP264HiaiBCmrBCQUkGV15kV1gATGIeaeNaUsB62zTuLbVsj74JSpzxquDpyENcOMkZ9qxtoSwPD/lsCSC36b8PRvZMw6rSI+E8AMeGq3LZE85KHluvv0QO4p+8svITpJWDRTSNM87fz65p8XGoobjPFzq8/CvE7kjoxjAf+aAgZYN9ceyrUGb5GKNBACi6r1o10Z3RvdoldyIsnUsto3dXKsxziWwgnPjgWSGHlsn71KfbzJfUj8HuhEKnTPUlACZFo4aErfQhSoZ5YDRuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772615382; c=relaxed/relaxed;
	bh=bf6Jrd2glLBARvo4qTlBn9dmpgmf3FbqfUEPkdBzr9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cA7pX9bk5XcDITAXvtfUuC03ujrFDlmGBRXGWquwfXBUV03P55Caey0Bz019cfwJnYcwTT5j6eARjtO9vv+hX1GyJFsTglQKqkS5IrE7m2evmJGNw0ueNJChmXHIQom19j8EyXNcPRlg3osCToL+TaJD6De9rcQ5O4Jibwq3CWnG1mkGSwvBpas6Ygy4tAVOhX+VDextyhUVXTSHgkQ54PSauuhfbSz0PpDp511rPzcQRhbjgt/Xff8zeMyx5BL9Mx8P+gB/IZlJV5qqjfrdYwvzWh+AJgu6wF9xLJgoNsyFtpBlAkxV08HZFmj4vMrS3onKGAHYf8wolsTgRcHpdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pMBbKSFW; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pMBbKSFW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQn1K6GnDz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:09:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B10396057A;
	Wed,  4 Mar 2026 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05BBC19423;
	Wed,  4 Mar 2026 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615379;
	bh=q+2F3WUwzo88U+l/P+mQvKhmPYhLgLIReOm9O+Rm82M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pMBbKSFW05wRd/QFBHktyYjvbaZBPT+tThzOTDHri1FMprTjyuKoQ4jN6e65ntHiE
	 dlQdKHsaXIjEjIPXReFptvmTVLkhmDNo5c0GRwZBERh348gGwuWJpOsIgkfVcL5jJ3
	 i/qmQrUuiKm5cpu+UffgiGFLD1MVFP9xlsHPb2+NquBL/LxqAyLSSBhG5f3xjkVtrG
	 1z5aDsEIoEaAGFpjx2DUMN/i1qOSXLAUcvoHO+XbMiWJbnVgoOrYFnR0y0YmxP1buZ
	 /C1blNCzHuG4pe04XQ5lrZ/iEmNZ0DcHm8eCqlFw15eqv8UUZVc5j8105imFU9QcYg
	 hkd43nIJzueyQ==
Message-ID: <727cad61-9df9-473b-9a79-f70ad1cd4e3e@kernel.org>
Date: Wed, 4 Mar 2026 10:09:36 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 10/10] powerpc: Add MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <c57b1c00145a2db1a1b4feec94cfc2917e4877af.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <c57b1c00145a2db1a1b4feec94cfc2917e4877af.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0B1451FD477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17709-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> Similar to CPU_FTRS_[POSSIBLE|ALWAYS], let's also print
> MMU_FTRS_[ALWAYS|ALWAYS]. This has some useful data to capture during
> bootup.

The patch subject is misleading, should be something like:

powerpc: Print MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS at startup

With that fixed, Reviewed-by: Christophe Leroy (CS GROUP) 
<chleroy@kernel.org>



> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/kernel/setup-common.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index cb5b73adc250..002b312eb7e9 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -866,6 +866,10 @@ static __init void print_system_info(void)
>   		cur_cpu_spec->cpu_user_features,
>   		cur_cpu_spec->cpu_user_features2);
>   	pr_info("mmu_features      = 0x%08x\n", cur_cpu_spec->mmu_features);
> +	pr_info("  possible        = 0x%016lx\n",
> +		(unsigned long)MMU_FTRS_POSSIBLE);
> +	pr_info("  always          = 0x%016lx\n",
> +		(unsigned long)MMU_FTRS_ALWAYS);
>   #ifdef CONFIG_PPC64
>   	pr_info("firmware_features = 0x%016lx\n", powerpc_firmware_features);
>   #ifdef CONFIG_PPC_BOOK3S
> --
> 2.53.0
> 


