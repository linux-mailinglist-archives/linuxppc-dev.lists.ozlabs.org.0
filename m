Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C567F45DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 13:21:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SaTxnKiv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb0j31bd9z3dKp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 23:21:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SaTxnKiv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb0hB74z0z2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:20:42 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sb0h72N02z4xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:20:39 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sb0h72JdVz4xhY; Wed, 22 Nov 2023 23:20:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SaTxnKiv;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Sb0h65mv2z4xdZ
	for <linuxppc-dev@ozlabs.org>; Wed, 22 Nov 2023 23:20:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 098BFB82767;
	Wed, 22 Nov 2023 12:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E539C433C8;
	Wed, 22 Nov 2023 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700655635;
	bh=RA8kda6xE3FUHTcnihsAtTZ45gi3G0kAP9x9H9ji3G8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SaTxnKiv3WU13DbvYeW1Bp3mAOK0SbNl2wjQbvtTb6Dj8W6RaAP99cUdXttjEaJsJ
	 W+j4r3OSjb1e0dbgMpup6Cv5DBQDuKh5+eXVdoy5pnPEQ15SLn1B6GqYott8STVTrA
	 WIbLyn0R6U8tNvx3xhN9GTpYucne2wjIZwcpn+b5AjWwVl1eSgjw0J+3TDRzW47fM0
	 Ao6CA0cZSXSJnHB8ACf/cEkAebNpDsW1WeTLr9XIg5NraJijqfcRxYy/ebjOp03NlL
	 nTMWWqCAB8wSHC3P8IEWc0b6Tp5nguB3k1iOAuBq7BK11X9C2MkDBYkiY5bC7lqC3O
	 Y56rBTTXKnh8g==
Message-ID: <47a119c1-05e9-47fb-9cc7-85aa7e1e4ae7@kernel.org>
Date: Wed, 22 Nov 2023 17:50:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
 <87fs0yjrjf.fsf@mail.lhotse>
 <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@kernel.org>
In-Reply-To: <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/22/23 4:05 PM, Sourabh Jain wrote:
> Hello Michael,
> 
> 
> On 22/11/23 10:47, Michael Ellerman wrote:
>> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
>> ...
>>> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
>>> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
>>> crash kernel and fadump kernel will be same version?
>> How sure are we of that?
>>
>> Don't we go through grub when we boot into the 2nd kernel. And so
>> couldn't it choose to boot a different kernel, for whatever reason.
>>
>> I don't think we need to support different pt_reg / cpumask sizes, but
>> requiring the exact same kernel version is too strict I think.
> Agree.
>>
>> But maybe I'm wrong. Would be good to hear what distro folks think.
> 
> How about checking fadump crash info header compatibility in the following way?
> 
> static bool is_fadump_header_compatible(struct fadump_crash_info_header *fdh)
> {
>     if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
>         pr_err("Old magic number, can't process the dump.");
>         return false;
>     }
> 
>     if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
>         pr_err("Fadump header is corrupted.");
>         return false;
>     }
> 
>     /*
>      * If the kernel version of the first/crashed kernel and the second/fadump
>      * kernel is not same, then only collect the dump if the size of all
>      * non-primitive type members of the fadump header is the same across kernels.
>      */
>     if (strcmp(fdh->kernel_version, init_uts_ns.name.release)) {
>         if (fdh->pt_regs_sz != sizeof(struct pt_regs) || fdh->cpu_mask_sz != sizeof(struct cpumask)) {
>             pr_err("Fadump header size mismatch.\n")
>             return false;
>         } else
>             pr_warn("Kernel version mismatch; dump data is unreliable.\n");
>     }
> 

You also want a fdh->version check? I am still not sure you need the kernel_version check. IMHO that is too strict
and can hit that check where you have kexec kernel which is not installed in /boot crashing? 


>     return true;
> }
> 
> And the new fadump crash info header will be: As suggested by Hari.
> 
> /* fadump crash info structure */
> struct fadump_crash_info_header {
>     u64        magic_number;
> +  u32        version;
>     u32        crashing_cpu;
>     u64        elfcorehdr_addr;
> +  u64        elfcorehdr_size;
> +  u64        vmcoreinfo_raddr;
> +  u64        vmcoreinfo_size;
> +  u8          kernel_version[__NEW_UTS_LEN + 1];
> +  u32        pt_regs_sz;
>     struct pt_regs    regs;
> +  u32        cpu_mask_sz;
>     struct cpumask    cpu_mask;
> };
> 
> Thanks,
> Sourabh Jain

