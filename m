Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D6854A20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 14:11:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NWTZ5gYh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZdqZ3nMgz3dmy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 00:11:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NWTZ5gYh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZdpp1q0Fz3cDr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 00:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707916222;
	bh=W4bh6zeWNGpD0BBIoda7elWgeAyduhIB3ol8ccRn4xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NWTZ5gYhbt1Dg49ncgDfishkZdekkdWBgY8gri3cr7iEF70qPy5t6QeSuwp/j6VZa
	 VC9zZjv6z8vMwyM/2ajhXsCDUmmbWi/gbW6/Rz8I/FPHjiKkU2qSiZUeWCEANjAVIB
	 D5VOS2ABUtBiiu41G9ehw+MlV6HHx8NpQ/5VG6nUnCpoS9mASwE954hoBHuKvHaWwM
	 hSWE5ap/2IDJNVddp+JClUevOnMK1ogXSpCc5AdVaaW3KoUiwa98gJ/PDjd4w/aSL9
	 E9nh3vXdWhNwam0yS8nIG5+DmPZlQl71H9s+mtJaCvttgsml3J1GALcs6tAMl2BVsb
	 BlfIqYXEoarhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TZdpk6NWRz4wcK;
	Thu, 15 Feb 2024 00:10:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 4/5] powerpc/smp: Factor out assign_threads()
In-Reply-To: <87frzgnyjh.fsf@kernel.org>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-4-mpe@ellerman.id.au> <87frzgnyjh.fsf@kernel.org>
Date: Thu, 15 Feb 2024 00:10:22 +1100
Message-ID: <87il2r6vk1.fsf@mail.lhotse>
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
Cc: Pingfan Liu <kernelfans@gmail.com>, Pingfan Liu <piliu@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
> ....
>   
>> +static int assign_threads(unsigned cpu, unsigned int nthreads, bool avail,
>>
>
> May be rename 'avail' to 'present'

Yeah, will do.

cheers

>> +                          const __be32 *hw_ids)
>> +{
>> +	for (int i = 0; i < nthreads && cpu < nr_cpu_ids; i++) {
>> +		__be32 hwid;
>> +
>> +		hwid = be32_to_cpu(hw_ids[i]);
>> +
>> +		DBG("    thread %d -> cpu %d (hard id %d)\n", i, cpu, hwid);
>> +
>> +		set_cpu_present(cpu, avail);
>> +		set_cpu_possible(cpu, true);
>> +		cpu_to_phys_id[cpu] = hwid;
>> +		cpu++;
>> +	}
>> +
>
> -aneesh
