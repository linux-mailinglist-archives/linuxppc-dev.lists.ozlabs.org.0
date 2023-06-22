Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067973A0A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 14:15:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hnaboYie;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmzpS5xNnz30PN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hnaboYie;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmznZ3fvlz30BM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 22:14:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmznY1RHFz4x04;
	Thu, 22 Jun 2023 22:14:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687436066;
	bh=VyK+T7wpYZieXhcDB/H+1KJ1YxNx6190VxkOIlmBktI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hnaboYieOfnnuNB8OHVEabPqrovQFXHSe6l2zxpfBrXLYGFjlm8ZAWrxhhS7y1Vap
	 0LtUYWtUif9PeV4IJlza3hqmWjOAA6FDMPe82TRMsPXMHygXkmmy0nLi0PGTZogalO
	 cP9U+cgif/Co9lGKBZO64O/wkTk9rYnW1J+5KH6+xnoZK/A3PZuzsOa0GtIffF+K87
	 W/1TMd+p4WA6T31KCxfkPzYI0Qu7AOxq6j+d1yaoH8/0ZONecNmkI6LCOL+V3Bf/eG
	 kxGSgTH5KZQ+wXxPjI98JWHeAJnyudGZqhd6tx1eq7I/kwj3q3rDhPob6NCpGP5NEV
	 8nHc9uYWGeTrg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour
 <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] cpu/SMT: Allow enabling partial SMT states via sysfs
In-Reply-To: <87legb7tdz.ffs@tglx>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
 <20230615154635.13660-8-ldufour@linux.ibm.com> <87legb7tdz.ffs@tglx>
Date: Thu, 22 Jun 2023 22:14:24 +1000
Message-ID: <87sfajofrz.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Gleixner <tglx@linutronix.de> writes:
> On Thu, Jun 15 2023 at 17:46, Laurent Dufour wrote:
>>  
>> -	if (ctrlval != cpu_smt_control) {
>> +	orig_threads = cpu_smt_num_threads;
>> +	cpu_smt_num_threads = num_threads;
>> +
>> +	if (num_threads > orig_threads) {
>> +		ret = cpuhp_smt_enable();
>> +	} else if (num_threads < orig_threads) {
>> +		ret = cpuhp_smt_disable(ctrlval);
>> +	} else if (ctrlval != cpu_smt_control) {
>>  		switch (ctrlval) {
>>  		case CPU_SMT_ENABLED:
>>  			ret = cpuhp_smt_enable();
>
> This switch() is still as pointless as in the previous version.
>
> OFF -> ON, ON -> OFF, ON -> FORCE_OFF are covered by the num_threads
> comparisons.
>
> So the only case where (ctrlval != cpu_smt_control) is relevant is the
> OFF -> FORCE_OFF transition because in that case the number of threads
> is not changing.
>
>           force_off = ctrlval != cpu_smt_control && ctrval == CPU_SMT_FORCE_DISABLED;
>
> 	  if (num_threads > orig_threads)
> 		  ret = cpuhp_smt_enable();
> 	  else if (num_threads < orig_threads || force_off)
> 		  ret = cpuhp_smt_disable(ctrlval);
>
> Should just work, no?

Yes, I think so.

I'll fold that in and do a respin of this series for 6.6 in the next
week or two.

cheers
