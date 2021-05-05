Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D03733C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 04:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZh4s3xJWz2yyF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 12:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UFtWPfgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UFtWPfgS; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZh4N3Ph1z2y6N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 12:49:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZh4F3T61z9sPf;
 Wed,  5 May 2021 12:49:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620182942;
 bh=5vrcSM0ixcwaHD0yeHQUi9JWRUmMrBtg1tGWwTNXDls=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UFtWPfgSNFPTEa/1Z3PpnYkneUBVFoW2BGsZpo82fkSpmJl3JO1tp9Nin89FWMTag
 UI8MqaDJD7nNxZ/FHF7+F3d4wxqU94CqEIOe7s9kdasu3NPz1nLpPfSSM7nqTielM2
 62i56mnJcSB5H4jTFDFKDLg+Ib+86MaBkeAi+wGagfKNn5EF6/G2ESOBGRouOifb25
 Eovi/ybgnihLwY3i+djS3U1skke2j0LceQVTyngni10kjoAG2OffddiwSxwE1A/7Fj
 pauk9tSJGoPMOklZQ5dSPtGvkFVQ/Kzr8n1CkNqC/5wjnvAMhm/kDzi1ASIO4LSuX3
 TU4DLZAHsGP2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix crashes when toggling stf barrier
In-Reply-To: <878s4uf79w.fsf@linux.ibm.com>
References: <20210504134250.890401-1-mpe@ellerman.id.au>
 <878s4uf79w.fsf@linux.ibm.com>
Date: Wed, 05 May 2021 12:48:57 +1000
Message-ID: <87zgx999pi.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, anton@samba.org, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> -void do_stf_barrier_fixups(enum stf_barrier_type types)
>> +static int __do_stf_barrier_fixups(void *data)
>>  {
>> +	enum stf_barrier_type types = (enum stf_barrier_type)data;
>> +
>>  	do_stf_entry_barrier_fixups(types);
>>  	do_stf_exit_barrier_fixups(types);
>> +
>> +	return 0;
>> +}
>> +
>> +void do_stf_barrier_fixups(enum stf_barrier_type types)
>> +{
>> +	/*
>> +	 * The call to the fallback entry flush, and the fallback/sync-ori exit
>> +	 * flush can not be safely patched in/out while other CPUs are executing
>> +	 * them. So call __do_stf_barrier_fixups() on one CPU while all other CPUs
>> +	 * spin in the stop machine core with interrupts hard disabled.
>> +	 */
>> +	stop_machine_cpuslocked(__do_stf_barrier_fixups, (void *)types, NULL);
>
> Would it be preferable to avoid the explicit casts:
>
> 	stop_machine_cpuslocked(__do_stf_barrier_fixups, &types, NULL);
>
> ...
>
> static int __do_stf_barrier_fixups(void *data)
> {
> 	enum stf_barrier_type *types = data;
>
>  	do_stf_entry_barrier_fixups(*types);
>  	do_stf_exit_barrier_fixups(*types);
>
> ?

Yes.

That will also avoid the pesky issue of undefined behaviour :facepalm:

> post_mobility_fixup() does cpus_read_unlock() before calling
> pseries_setup_security_mitigations(), I think that will need to be
> changed?

I don't think so.

I'm using stop_machine_cpuslocked() but that's because I'm a goose and
forgot to switch to stop_machine() after I reworked the code to not take
cpus_read_lock() by hand. I really shouldn't send patches after 11pm.

I don't think it's important to keep the cpus lock held from where we
take it in post_mobility_fixup(). If some CPUs come or go between there
and here that's fine.

I'll send a v2.

cheers
