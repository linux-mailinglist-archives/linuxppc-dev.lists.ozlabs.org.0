Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294E4F120
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 01:24:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Vvrs6FJXzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 09:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k8eIc50l"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vvpx6dYQzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 09:22:14 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so3707923plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=EjMfJbClHSrCJO9DGKsPRA3QLFDuQU5hRCsG+l3vSzI=;
 b=k8eIc50l0Y6+aPooGSUg6w2NC5YQKDQV1tZnjFZKEyLakw+hynTcbuoOAcNcVfaPhg
 mrv/eqekDdB1Eb02gnS9/13ctSg5voXpgJUkiJYBn8K/b7TMmrbuH0DlbYZNZo7gwwwI
 T3P+Nhormr+sXn4BrlggxDlHwvN5F6hTNgieMWxHNa5mpf0XZPqMYTEK19Dh3+9LH83y
 +1RwmcoDYV4/uJaj5Qy4/vy+VqLtTDNSAkdPlUX2rSOhm2XbmcZhw1HqPMsp6ZR12nw/
 z7MNWoNNtljztQksyINx3x4Te/4qzROvjCSsAnNM0Ts9Caek+AZmG7l27QFh2+WKVYpb
 GZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=EjMfJbClHSrCJO9DGKsPRA3QLFDuQU5hRCsG+l3vSzI=;
 b=I3s7iGtlMwKMODqmQoSdz8ptAihU9f5tigakh3OC+xTOb2ERdN3p2kGJEMC/5v6rrM
 FBwrbu4jwJR9Sna27irc0m2gtBk5gVqrgHo6q368ZK9A79AFANIdFp3XwcrmRE/SoUl+
 QGJaUhVL7k2PpL9zKiyG/T5nrwumDDfbIYdZnhC7/qwCrhESHwZOfHVFpUPSBN90afqz
 ov+AZghmAt+ZTR85+wfWl5PmtwpaAmdUhTITqpnc6LxZuo+nGbbBzZCYab3KsF0uM4g5
 4Pa16BMzL3Oxec0lyClc08NxWdJv/jVJ60j+PaD/RG7nS5YF+6QhBRhdrwcB/PhYbpEJ
 MmAA==
X-Gm-Message-State: APjAAAUhC8qSzueSPa5YienWnFuwe4ZDAVQyc61DJM1p1TbRuOHD1krT
 hEM6G0NhC5VqsnBLcFVL5BE=
X-Google-Smtp-Source: APXvYqzKRVJgm5cvXCA0pPOOOfNkm22Z5nNa+2VKZKMFrjSncH4b0gOGPYaSOIvn4eKDkYBjqGD9QA==
X-Received: by 2002:a17:902:2ae8:: with SMTP id
 j95mr92028353plb.276.1561159331700; 
 Fri, 21 Jun 2019 16:22:11 -0700 (PDT)
Received: from localhost ([1.144.140.34])
 by smtp.gmail.com with ESMTPSA id n17sm7241782pfq.182.2019.06.21.16.22.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 16:22:10 -0700 (PDT)
Date: Sat, 22 Jun 2019 09:21:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 11/13] powerpc/64s: Save r13 in machine_check_common_early
To: mahesh@linux.vnet.ibm.com, Santosh Sivaraj <santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
 <d6ae7dd59966ee1c7593b8fd936774c0b13e6dd4.1561020760.git.santosh@fossix.org>
 <20190621114725.xg6cogv4ecejz6pj@in.ibm.com>
In-Reply-To: <20190621114725.xg6cogv4ecejz6pj@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561158983.qtodmczmox.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar's on June 21, 2019 9:47 pm:
> On 2019-06-21 06:27:15 Fri, Santosh Sivaraj wrote:
>> From: Reza Arbab <arbab@linux.ibm.com>
>>=20
>> Testing my memcpy_mcsafe() work in progress with an injected UE, I get
>> an error like this immediately after the function returns:
>>=20
>> BUG: Unable to handle kernel data access at 0x7fff84dec8f8
>> Faulting instruction address: 0xc0080000009c00b0
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerN=
V
>> Modules linked in: mce(O+) vmx_crypto crc32c_vpmsum
>> CPU: 0 PID: 1375 Comm: modprobe Tainted: G           O      5.1.0-rc6 #2=
67
>> NIP:  c0080000009c00b0 LR: c0080000009c00a8 CTR: c000000000095f90
>> REGS: c0000000ee197790 TRAP: 0300   Tainted: G           O       (5.1.0-=
rc6)
>> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 8800282=
6  XER: 00040000
>> CFAR: c000000000095f8c DAR: 00007fff84dec8f8 DSISR: 40000000 IRQMASK: 0
>> GPR00: 000000006c6c6568 c0000000ee197a20 c0080000009c8400 ffffffffffffff=
f2
>> GPR04: c0080000009c02e0 0000000000000006 0000000000000000 c000000003c834=
c8
>> GPR08: 0080000000000000 776a6681b7fb5100 0000000000000000 c0080000009c01=
c8
>> GPR12: c000000000095f90 00007fff84debc00 000000004d071440 00000000000000=
00
>> GPR16: 0000000100000601 c0080000009e0000 c000000000c98dd8 c000000000c98d=
98
>> GPR20: c000000003bba970 c0080000009c04d0 c0080000009c0618 c0000000001e58=
20
>> GPR24: 0000000000000000 0000000000000100 0000000000000001 c000000003bba9=
58
>> GPR28: c0080000009c02e8 c0080000009c0318 c0080000009c02e0 00000000000000=
00
>> NIP [c0080000009c00b0] cause_ue+0xa8/0xe8 [mce]
>> LR [c0080000009c00a8] cause_ue+0xa0/0xe8 [mce]
>>=20
>> To fix, ensure that r13 is properly restored after an MCE.
>>=20
>> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/exceptions-64s.S | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 311f1392a2ec..932d8d05892c 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -265,6 +265,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>>  EXC_REAL_END(machine_check, 0x200, 0x100)
>>  EXC_VIRT_NONE(0x4200, 0x100)
>>  TRAMP_REAL_BEGIN(machine_check_common_early)
>> +	SET_SCRATCH0(r13)		/* save r13 */
>>  	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
>>  	/*
>>  	 * Register contents:
>=20
> We do save r13 before we call machine_check_common_early(). I don't
> think I understood clearly how this change fixes the issue you are
> seeing. What am I missing here ?
>=20
> Above change will push the paca pointer to scratch0 overwriting the
> original saved r13.
>=20
> EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
> 	/* This is moved out of line as it can be patched by FW, but
> 	 * some code path might still want to branch into the original
> 	 * vector
> 	 */
> 	SET_SCRATCH0(r13)		/* save r13 */
> 	EXCEPTION_PROLOG_0(PACA_EXMC)
> BEGIN_FTR_SECTION
> 	b	machine_check_common_early

Yep, from the stack trace, r13 is corrupted. So r13 must have got
corrupted before the machine check and this just happens to have
corrected it.

How does cause_ue work? It or memcpy_mcsafe must be corrupting
r13.

Thanks,
Nick

=
