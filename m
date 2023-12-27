Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1981EDD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 10:45:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vdJJWpNq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0Rb46SnFz3cNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 20:45:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0RZ922TSz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 20:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=EYqEc/M/WSwcxiNBKr0m1e/I6Ycu45sbz3WBfehS/o4=; b=vdJJWpNq5Ooj7mEjYoDXk9JwbX
	kbteHNRLiJi1aqEresXzzNajFj06KrHFFX1xS95RRyvXYZBp0/8rpub/+x7ESua+B/WfP/13w6B3g
	SPNkkITshFcRVjuYCk+1JjCHpqTOg+8Rf/0G11qdmx1pyIz4M9UfvnN76Oqv/vFVfU5+875KRYr90
	3ZPyrvJxokHE1hVrN9Og6jKutHHH60MHDzO3gQjKVTu/qtt9RC31AnhEp5PMMIn2wI0wsPtxwAGlN
	7lATkquU1v1nLa6iCdXXHAeuO1FKDiWRfzNlC8+m/r1wBKns1P3BMkNm1yUmXsEVLw5xsxF16kv3L
	12W99YtA==;
Received: from om126253129164.31.openmobile.ne.jp ([126.253.129.164] helo=[192.168.43.165])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rIQSl-002Z0v-RT; Wed, 27 Dec 2023 09:44:33 +0000
Message-ID: <3daebc86-abbf-4f37-8268-0e2a4fefede9@infradead.org>
Date: Wed, 27 Dec 2023 18:44:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
References: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
 <87zfxwjuxt.fsf@mail.lhotse>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <87zfxwjuxt.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 12/27/23 10:27, Michael Ellerman wrote:
> Geoff Levand <geoff@infradead.org> writes:
>> Commit 8c5fa3b5c4df3d071dab42b04b971df370d99354 (powerpc/64: Make ELFv2 the
>> default for big-endian builds), merged in Linux-6.5-rc1 changes the calling ABI
>> in a way that is incompatible with the current code for the PS3's LV1 hypervisor
>> calls.
> 
> I'll take this for now.
> 
> But medium term we would like to switch to only using ELFv2, so it would
> be good if we can work out what the actual problem is.

I've been looking into converting the LV1 hypercalls to v2.

>> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
>> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
>>
>> Fixes run time errors like these:
>>
>> 	BUG: Kernel NULL pointer dereference at 0x00000000
>> 	Faulting instruction address: 0xc000000000047cf0
>> 	Oops: Kernel access of bad area, sig: 11 [#1]
>>
>> 	Call Trace:
>> 	[c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
>> 	[c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
>> 	[c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8
> 
> That can't be the first hvcall we've done, there's one in
> ps3_setup_arch(). So I guess only some hcalls are failing?

I guess because ps3_create_spu has 7 input parameters and returns
6 parameters, so it hits some difference between V1 and V2 that
the other LV1 calls up to that point have not hit.

-Geoff
