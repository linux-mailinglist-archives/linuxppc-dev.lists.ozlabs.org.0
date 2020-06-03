Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F971EC7BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 05:18:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cDdk0gp6zDqc8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 13:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cDbv6VlHzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 13:17:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D1YJ8z1j; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cDbv1XvHz9sT6;
 Wed,  3 Jun 2020 13:17:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591154235;
 bh=uintxDiAciJeRkXP2QAEgPNXQ1TlHkQqHNM+h3XDTJg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=D1YJ8z1jUmP7VPVEOtM2ePoCV/gTAwBb44vlUyvNv0J6GiU3GI7AddxKofUytBd2e
 XhW65lPAoqAPC+ghCKZSC+Lnh/tSks8oPOaAZ4RBNSGbggzBG47SxIkmnyqtmJaP+X
 TVst86QD2N5bsQ7RGR+ru1ZzZmDt5r6LVIMWWlu/LvIwdzEUsUU55drbgeAx/N0Pjt
 0XVMoxmQ2TobzpOoZZczPDIm1aCJhcNF7HLjSkCb9Quthz0YZV+kX9OT00aG0fjBJ1
 /xNSq+6fTqdVfIiCSa98Bb9Hxtv2Glo2Ghx1s5u+QXuCc7c12BOU5a+VMA4l048Qyt
 5uOFTpT4690BA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v2] selftests: powerpc: Add test for execute-disabled pkeys
In-Reply-To: <1eb388dc-0fde-64f3-9c05-7f9f2a398543@linux.ibm.com>
References: <20200527030342.13712-1-sandipan@linux.ibm.com>
 <87tuzzik8q.fsf@mpe.ellerman.id.au>
 <1eb388dc-0fde-64f3-9c05-7f9f2a398543@linux.ibm.com>
Date: Wed, 03 Jun 2020 13:17:41 +1000
Message-ID: <874krsj0ru.fsf@mpe.ellerman.id.au>
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> Hi Michael,
>
> Thanks for your suggestions. I had a few questions regarding some
> of them.
>
> On 29/05/20 7:18 am, Michael Ellerman wrote:
>>> [...]
>>> +
>>> +static void pkeyreg_set(unsigned long uamr)
>>> +{
>>> +	asm volatile("isync; mtspr	0xd, %0; isync;" : : "r"(uamr));
>>> +}
>> 
>> You can use mtspr() there, but you'll need to add the isync's yourself.
>> 
>
> Would it make sense to add a new macro that adds the CSI instructions?
> Something like this.

I guess. I'm not sure there's that many places that need it, it's just
the pkey tests I think.

I'd be more inclined to have a set_amr() helper that includes the
isyncs, rather than a generic mtspr() version.

> diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
> index 022c5076b2c5..d60f66380cad 100644
> --- a/tools/testing/selftests/powerpc/include/reg.h
> +++ b/tools/testing/selftests/powerpc/include/reg.h
> @@ -15,6 +15,10 @@
>  #define mtspr(rn, v)   asm volatile("mtspr " _str(rn) ",%0" : \
>                                     : "r" ((unsigned long)(v)) \
>                                     : "memory")
> +#define mtspr_csi(rn, v)       ({ \
> +                       asm volatile("isync; mtspr " _str(rn) ",%0; isync;" : \
> +                                   : "r" ((unsigned long)(v)) \
> +                                   : "memory"); })
>  
>  #define mb()           asm volatile("sync" : : : "memory");
>  #define barrier()      asm volatile("" : : : "memory");
>
>
> I also noticed that two of the ptrace-related pkey tests were also not
> using CSIs. I will fix those too.
>
>>> [...]
>>> +	/* The following two cases will avoid SEGV_PKUERR */
>>> +	ftype = -1;
>>> +	fpkey = -1;
>>> +
>>> +	/*
>>> +	 * Read an instruction word from the address when AMR bits
>>> +	 * are not set.
>> 
>> You should explain for people who aren't familiar with the ISA that "AMR
>> bits not set" means "read/write access allowed".
>> 
>>> +	 *
>>> +	 * This should not generate a fault as having PROT_EXEC
>>> +	 * implicitly allows reads. The pkey currently restricts
>> 
>> Whether PROT_EXEC implies read is not well defined (see the man page).
>> If you want to test this case I think you'd be better off specifying
>> PROT_EXEC | PROT_READ explicitly.
>> 
>
> But I guess specifying PROT_EXEC | PROT_READ defeats the purpose? I can
> tweak the passing condition though based on whether READ_IMPLIES_EXEC is
> set in the personality.
>
>> [...]
>>> +	FAIL_IF(faults != 0 || fcode != SEGV_ACCERR);
>>> +
>>> +	/* The following three cases will generate SEGV_PKUERR */
>>> +	ftype = PKEY_DISABLE_ACCESS;
>>> +	fpkey = pkey;
>>> +
>>> +	/*
>>> +	 * Read an instruction word from the address when AMR bits
>>> +	 * are set.
>>> +	 *
>>> +	 * This should generate a pkey fault based on AMR bits only
>>> +	 * as having PROT_EXEC implicitly allows reads.
>> 
>> Again would be better to specify PROT_READ IMHO.
>> 
>
> I can use a personality check here too.
>
>>> +	 */
>>> +	faults = 1;
>>> +	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
>>> +	printf("read from %p, pkey is execute-disabled, access-disabled\n",
>>> +	       (void *) faddr);
>>> +	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
>>> +	i = *faddr;
>>> +	FAIL_IF(faults != 0 || fcode != SEGV_PKUERR);
>>> +
>>> +	/*
>>> +	 * Write an instruction word to the address when AMR bits
>>> +	 * are set.
>>> +	 *
>>> +	 * This should generate two faults. First, a pkey fault based
>>> +	 * on AMR bits and then an access fault based on PROT_EXEC.
>>> +	 */
>>> +	faults = 2;
>> 
>> Setting faults to the expected value and decrementing it in the fault
>> handler is kind of weird.
>> 
>> I think it would be clearer if faults was just a zero-based counter of
>> how many faults we've taken, and then you test that it's == 2 below.
>> 
>>> +	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
>>> +	printf("write to %p, pkey is execute-disabled, access-disabled\n",
>>> +	       (void *) faddr);
>>> +	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
>>> +	*faddr = 0x60000000;	/* nop */
>>> +	FAIL_IF(faults != 0 || fcode != SEGV_ACCERR);
>> 
>> ie. FAIL_IF(faults != 2 || ... )
>> 
>
> Agreed, it is weird. IIRC, I did this to make sure that if the test
> kept getting repeated faults at the same address and exceeded the
> maximum number of expected faults i.e. it gets another fault when
> 'faults' is already zero, then the signal handler will attempt to
> let the program continue by giving all permissions to the page and
> also the pkey. Would it make sense to just rename 'faults' to
> something like 'remaining_faults'?

It seems like you've tried to make the code cope with a situation that
should not happen, and would indicate a bug if it did happen, in which
case I think it would be fine if the test just timed out.

But if you want to handle it that's up to you, renaming the variable
might help a bit.

cheers
