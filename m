Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75315F029E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 04:13:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdv0v3h1hz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 12:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cp0mQabO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdv0L3CF5z2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 12:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cp0mQabO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mdv0L2PP8z4xGG;
	Fri, 30 Sep 2022 12:13:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664504002;
	bh=3MTX6hqy8nd5nyKxNiDOQkLAb1u8JfDwumbhwFaTYiE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Cp0mQabOQh7r8ZjaB5UzdBUMfXslOeCztPuNVp9/RYewPfUaCsHWtVvMXJvA3bcNH
	 UJJStYt6OAMLqEjhBGpE8Anu5hJdCO5DXufKGqgDdM5n2Vzh7jP1qfFeHikOI6hPMD
	 IogP8KGzRbcH2mAqJv8sCU0HPqpWkqceSOGBAIRV5EDYfh2hMjeSZ+GQaL5jwPhblD
	 OsFoiFdVOo3GwvKwnb6mtzC17NuVKtW3QOeJWPZ8tejOuVmqU2pNTQOB+LFuYsR74j
	 5HjlAA3z5XIRCWpA99MwHQI4qzXZpplKzfSC1MGGtRvxbAQm0OgV0lRAIBfIWWMv1O
	 FoHw1nWHV6GEw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/6] powerpc: Add hardware description string
In-Reply-To: <8735c9delr.fsf@linux.ibm.com>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
 <8735c9delr.fsf@linux.ibm.com>
Date: Fri, 30 Sep 2022 12:13:21 +1000
Message-ID: <87r0ztehj2.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Create a hardware description string, which we will use to record
>> various details of the hardware platform we are running on.
>>
>> Print the accumulated description at boot, and use it to set the generic
>> description which is printed in oopses.
>>
>> To begin with add ppc_md.name, aka the "machine description".
>>
>> Example output at boot with the full series applied:
>>
>>   Linux version 6.0.0-rc2-gcc-11.1.0-00199-g893f9007a5ce-dirty (michael@alpine1-p1) (powerpc64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #844 SMP Thu Sep 29 22:29:53 AEST 2022
>>   Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER8 (raw)' pvr:0x4d0200 lpvr:0xf000004 of:'SLOF,HEAD' machine:pSeries
>>   printk: bootconsole [udbg0] enabled
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/setup.h   |  2 ++
>>  arch/powerpc/kernel/setup-common.c | 19 ++++++++++++++++++-
>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> v2: Print the string at boot as suggested by Nathan.
>
> Thanks!
>
> I've booted the series on P8 and P9 LPARs:
>
> Hardware name: model:'IBM,8408-E8E' cpu:'POWER8E (raw)' pvr:0x4b0201 lpvr:0xf000004 of:'IBM,FW860.50 (SV860_146)' hv:'phyp' machine:pSeries
>
> Hardware name: model:'IBM,9040-MR9' cpu:'POWER9 (raw)' pvr:0x4e2102 lpvr:0xf000005 of:'IBM,FW950.01 (VM950_047)' hv:'phyp' machine:pSeries
>
> Not on objection but just an FYI: we're already very close to exceeding
> the arch description buffer's size on PowerVM. Both of the above are
> over 120 bytes.

Hmm yeah that's a good point.

I was tossing up whether the tags (model:, cpu: etc) are worth the space
they consume.

I erred on the side of keeping them because although I know what the raw
values mean, I figured other folks might not.

But given we are getting tight for space I might change my mind on that
and just use the values with no tags. It will make the value harder to
parse programmatically, but we will probably never do that anyway.

> It also occurs to me that we'll want to rebuild the arch description
> string after partition migration. Probably immediately after processing
> the device tree updates.

OK I hadn't thought of that.

It won't be entirely straight forward because the existing code wants to
build the value up incrementally, so we have as much info as possible at
any point during the boot.

But we can probably just have a pseries specific routine that
reconstructs the value in a similar format to the existing one after
migration.

cheers
