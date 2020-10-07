Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA028584B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 07:58:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5kCK0NXkzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 16:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5k9g6rTFzDqB7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 16:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RMxxfWIg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5k9g2W4hz9sSG;
 Wed,  7 Oct 2020 16:56:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602050199;
 bh=4fuWDigsRGvfFAX9Wylr16jfrxZcWj+lq7FzJQnfwg4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RMxxfWIg+VF+ujDcY7ZZ4nlauNl2+IAv96MVMG0hiS/Xic9usad1fW8leS6aFJKyH
 O+cE/zOhlHD/m3M3hhZflxDJl+gUeSHuDVYvJdYG/vltCIKM7EvmvfywWHJgPFx4Oq
 atGXEQr9bNouNruMirp1GpRARtJmAqzH5R8dLqNX9oeFQohnVGdY4SCTYt3Lp8BYkI
 tLBEZ2N92wqIqoqpvaMCUzvPQrkYk1CqP2ry7gxcJAoUfdGM4H9dLGogRi4aX4kYS6
 GqL9rFuLm8Yumw8YWRpI+uOWSw4qel1254/6zdbb7AsDxO1YB+S8kD4yCo9XcV5Knb
 ZPZHejNtEhfGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] powerpc/memhotplug: Make lmb size 64bit
In-Reply-To: <87pn7lxe5k.fsf@linux.ibm.com>
References: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
 <20200806162329.276534-3-aneesh.kumar@linux.ibm.com>
 <87pn7lxe5k.fsf@linux.ibm.com>
Date: Wed, 07 Oct 2020 16:56:36 +1100
Message-ID: <878sci37fv.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> @@ -322,12 +322,16 @@ static int pseries_remove_mem_node(struct device_node *np)
>>  	/*
>>  	 * Find the base address and size of the memblock
>>  	 */
>> -	regs = of_get_property(np, "reg", NULL);
>> -	if (!regs)
>> +	prop = of_get_property(np, "reg", NULL);
>> +	if (!prop)
>>  		return ret;
>>  
>> -	base = be64_to_cpu(*(unsigned long *)regs);
>> -	lmb_size = be32_to_cpu(regs[3]);
>> +	/*
>> +	 * "reg" property represents (addr,size) tuple.
>> +	 */
>> +	base = of_read_number(prop, mem_addr_cells);
>> +	prop += mem_addr_cells;
>> +	lmb_size = of_read_number(prop, mem_size_cells);
>
> Would of_n_size_cells() and of_n_addr_cells() work here?

Yes that should work and be cleaner.

cheers
