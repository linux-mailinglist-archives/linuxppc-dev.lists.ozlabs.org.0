Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA110C3BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 06:33:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NmWZ4DyjzDqyP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NmTb3qrFzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 16:31:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="XngVSCZN"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47NmTZ1fn6z9sP3;
 Thu, 28 Nov 2019 16:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574919090;
 bh=ZPov+v3E1/if62cEwMcoaXP+xa0mA1xp0953REZRHZU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XngVSCZN8JLigCgG1Xqra6cXB+GhAo/bpStfTmekNAxNXYBSmC+glmd8ZG+wl/uuh
 AMmUt93vc4zORMGddjKK71657Z5vnMihzgNiGkO1O5M5SYq1CgpcngvRDXHlte5Ma8
 b9ra29w2CAda48twEpVFUN3ukSOUTtdQKNT67nrOhjOi76yXQ2I7O5O2z5b0eF98rJ
 TTaCkO/elH18c64gJAyVcpYAGsRxF1+EHnJJgFJU+uv2c7imJM9hS1co6Bs+hxtZrK
 bFh+yV8ZdFrBaGbNGnrNMpbagr+GUqjCnQuQJFapxFm4Xmot5Fb126mHrdGam11JO2
 sFOmDnJ54fSzw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 4/8] powerpc/vdso32: inline __get_datapage()
In-Reply-To: <dd5e359b-5864-f8e3-876a-ec606b51eb65@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
 <9c9fe32df8633e6ba8e670274dc3eef82a1b5a65.1572342582.git.christophe.leroy@c-s.fr>
 <874kywbrjv.fsf@mpe.ellerman.id.au> <871ru0beke.fsf@mpe.ellerman.id.au>
 <dd5e359b-5864-f8e3-876a-ec606b51eb65@c-s.fr>
Date: Thu, 28 Nov 2019 16:31:27 +1100
Message-ID: <87sgm8zhw0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 22/11/2019 =C3=A0 07:38, Michael Ellerman a =C3=A9crit=C2=A0:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>> __get_datapage() is only a few instructions to retrieve the
>>>> address of the page where the kernel stores data to the VDSO.
>>>>
>>>> By inlining this function into its users, a bl/blr pair and
>>>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>>>
>>>> The improvement is noticeable (about 55 nsec/call on an 8xx)
>>>>
>>>> vdsotest before the patch:
>>>> gettimeofday:    vdso: 731 nsec/call
>>>> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
>>>> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>>>>
>>>> vdsotest after the patch:
>>>> gettimeofday:    vdso: 677 nsec/call
>>>> clock-gettime-realtime-coarse:    vdso: 613 nsec/call
>>>> clock-gettime-monotonic-coarse:    vdso: 690 nsec/call
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>
>>> This doesn't build with gcc 4.6.3:
>>>
>>>    /linux/arch/powerpc/kernel/vdso32/gettimeofday.S: Assembler messages:
>>>    /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:41: Error: unsuppor=
ted relocation against __kernel_datapage_offset
>>>    /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:86: Error: unsuppor=
ted relocation against __kernel_datapage_offset
>>>    /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:213: Error: unsuppo=
rted relocation against __kernel_datapage_offset
>>>    /linux/arch/powerpc/kernel/vdso32/gettimeofday.S:247: Error: unsuppo=
rted relocation against __kernel_datapage_offset
>>>    make[4]: *** [arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1
>>=20
>> Actually I guess it's binutils, which is v2.22 in this case.
>>=20
>> Needed this:
>>=20
>> diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/inc=
lude/asm/vdso_datapage.h
>> index 12785f72f17d..0048db347ddf 100644
>> --- a/arch/powerpc/include/asm/vdso_datapage.h
>> +++ b/arch/powerpc/include/asm/vdso_datapage.h
>> @@ -117,7 +117,7 @@ extern struct vdso_data *vdso_data;
>>   .macro get_datapage ptr, tmp
>>   	bcl	20, 31, .+4
>>   	mflr	\ptr
>> -	addi	\ptr, \ptr, __kernel_datapage_offset - (.-4)
>> +	addi	\ptr, \ptr, (__kernel_datapage_offset - (.-4))@l
>>   	lwz	\tmp, 0(\ptr)
>>   	add	\ptr, \tmp, \ptr
>>   .endm
>>=20
>
> Are you still planning to getting this series merged ? Do you need any=20
> help / rebase / re-spin ?

Not sure. I'll possibly send a 2nd pull request next week with it
included.

cheers
