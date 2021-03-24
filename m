Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F44347876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 13:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F56t36G3lz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 23:26:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=goNjsgxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=goNjsgxu; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F56sf3YTvz300r
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 23:26:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F56sW00v6z9sWm;
 Wed, 24 Mar 2021 23:26:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616588767;
 bh=zn71pgqow00k/WEKKDLdPSzZSu3TPEpAVVpuNBxkfvs=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=goNjsgxu1V91XU9VGxOMj+hdOjNfUa9p/m8//Y3PL/ZVRgZMfFYEQRNijCHbqWMVE
 lA7luQe+S9Ni+qGymtkm6Hkhc5T1WWGiIuSmwa5mfPvuQl606GXTvX08/WQcCebh8I
 xOlxmJ+J1bfOx6BgXb1WmKJ0ysnecMNrSILeRMqfgFqVbMfajQJTXobAV6dfPl61l1
 nJQAu0ZbyEzfFRsWclaYC2vqhMX61WnV5TshN9fWiK3BgojnuaBxWeT4iFAnTH5ag8
 YWhqD0o5o3O3TPiAL/Faa+4AU1IC1GgK/E5vETUcu92WjcYrIxqNk62rg8Y6GUVVXj
 Ef8tuVwjyoLeQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
In-Reply-To: <d2217b4e-718b-674d-c6a0-2cb69e3fd81c@csgroup.eu>
References: <20210320122227.345427-1-mpe@ellerman.id.au>
 <d2217b4e-718b-674d-c6a0-2cb69e3fd81c@csgroup.eu>
Date: Wed, 24 Mar 2021 23:26:01 +1100
Message-ID: <87k0pwhh5y.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 20/03/2021 =C3=A0 13:22, Michael Ellerman a =C3=A9crit=C2=A0:
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> call_do_irq() and call_do_softirq() are simple enough to be
>> worth inlining.
>>=20
>> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
>> also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
>
> We don't have the ksp_limit anymore, I forgot to remove the above text.

No worries, I'll edit it when I apply it.

>> This is inspired from S390 arch. Several other arches do more or
>> less the same. The way sparc arch does seems odd thought.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>=20
>> v2: no change.
>> v3: no change.
>> v4:
>> - comment reminding the purpose of the inline asm block.
>> - added r2 as clobbered reg
>> v5:
>> - Limiting the change to PPC32 for now.
>> - removed r2 from the clobbered regs list (on PPC32 r2 points to current=
 all the time)
>> - Removed patch 1 and merged ksp_limit handling in here.
>> v6:
>> - Rebase on top of merge-test (ca6e327fefb2).
>> - Remove the ksp_limit stuff as it's doesn't exist anymore.
>>=20
>> v7:
>> mpe:
>> - Enable for 64-bit too. This all in-kernel code calling in-kernel
>>    code, and must use the kernel TOC.
>
> Great.
>
>> - Use named parameters for the inline asm.
>
> Hmm. It is the first time we use named parameters in powerpc assembly, is=
n't it ?

Not quite the first.

See load_unaligned_zeropad().

And also my soon to be merged code in:
  http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210211135130.347=
4832-5-mpe@ellerman.id.au/

> I saw when investigating userspace access that x86 is using named paramet=
ers widely.

Yeah I'd like us to use it more, I think it helps readability a lot.

> Wondering, how would the below look like with named parameters (from __pu=
t_user_asm2_goto) ?
>
> 	stw%X1 %L0, %L1

Not sure, possibly that's too complicated for it :)

cheers
