Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357155AA8DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJqbH0Xl3z3bkx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MHJKQ5Gf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJqZh6Dymz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 17:40:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MHJKQ5Gf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJqZd3SdQz4xD3;
	Fri,  2 Sep 2022 17:40:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662104428;
	bh=NeXxW+9N3skjzMTPgfxhJL+s6krkN3MaKG4hR660B9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MHJKQ5Gf3tD/Q0iRbZUR791dPvFcchhyDYV0jW4eUA5CgfJfqEi8c4W+LkBrjKYKm
	 Z6qUzfVyde6/yg1ZSq6uq/B7sw95CECvhvmQMls0b3KSucxlYYpW4AODGdTm8oAsg7
	 8YpQyASHlKdtSoj1JhDVZeTdWrBJzVvCTTeLfyAg1Mx8vrYoDLPJrj8hmAhqj7FP4a
	 QRoD1IBnPdviiQQ0udUQW5B6NUCRVXhKgXtNE2XYlEBKHVt5IxkraTkxGjS+zcTvEa
	 txTDdC9VpA3LgQTj/ZH7ZLYogv06GbRmXQqUmpHvnfTGYVbCjT4S0LWC0AimKVlc2I
	 5wENMGMy0f6XA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy
 <sv@linux.ibm.com>
Subject: Re: [PATCH v2 07/16] powerpc: Skip objtool from running on VDSO files
In-Reply-To: <YxEFxJk+2fog+oRx@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-8-sv@linux.ibm.com>
 <YxEFxJk+2fog+oRx@hirez.programming.kicks-ass.net>
Date: Fri, 02 Sep 2022 17:40:24 +1000
Message-ID: <87r10uteaf.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Mon, Aug 29, 2022 at 11:22:14AM +0530, Sathvika Vasireddy wrote:
>> Do not run objtool on VDSO files, by using
>> OBJECT_FILES_NON_STANDARD
>> 
>> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/vdso/Makefile | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
>> index 096b0bf1335f..a49a0d6a1c53 100644
>> --- a/arch/powerpc/kernel/vdso/Makefile
>> +++ b/arch/powerpc/kernel/vdso/Makefile
>> @@ -102,3 +102,5 @@ quiet_cmd_vdso64ld_and_check = VDSO64L $@
>>        cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
>>  quiet_cmd_vdso64as = VDSO64A $@
>>        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
>> +
>> +OBJECT_FILES_NON_STANDARD := y
>
> Just to clarify; your linker script will place the VDSO in .rodata or a
> similar !.text section, right?

Not the linker script, but we incbin it into .data.

See arch/powerpc/kernel/vdso64_wrapper.S

cheers
