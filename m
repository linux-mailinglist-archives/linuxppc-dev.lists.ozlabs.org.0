Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5C43C455
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfLQs5CFPz2yxV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 18:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LoM/iEff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LoM/iEff; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfLQ91T5Mz2xXJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 18:47:43 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so1424471pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Bfl1s+SVPwM2F8tulvmDK7sMDHbg0YQOdQjG+pkGxkI=;
 b=LoM/iEffz3T+KpL/h3842b55Q/ev9EvT/gTrLLwUaChYiAXoP/c91RR5EGXgwITC07
 6kymjsl/LHol+ENlhQT9rzVquPRL2+NORn7O8ov2DXRPljin6wLTXck3/s5HrLTHTJqL
 2ZFEZOvTljTIJrxUgpGK5l0ybCz5wVQ9Qh3vsIRxFW6DCBPAFWX7ctLTQfea0apz5q71
 8B/818KyadJMJHGHW6slPXWms3PEeaZp6b7apMWpmSxu8H1DNUYbpGDd/U3lX35S8cCs
 zRTmLgNDxvXmwr7AuGjoygBqLlJxev3ZFvdiIxPcO48bKQGJyMvlxHt4LnRNry1ZtyXs
 aWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Bfl1s+SVPwM2F8tulvmDK7sMDHbg0YQOdQjG+pkGxkI=;
 b=cLguhjJ0DhlnkKWfmu7PzQYFm2DHphF+Pg532RG9Xh/8AJlOcYNdxgWhiHGIvI9+8U
 Ao8QppC7rNFZK7NLLlm3xfpTag85zb+7AW+iJA9sU21CYKd6KLxHwE2WtgkN4/wneySe
 gf2mDWjvquVeN83hiEPN5k1XX/2x7nnZb6wJFTW/9a+4dEmWU1/O8S74d6Z9WOp6uhVQ
 W+xIL5CGeMCw2V78IWaCTniMP3fdaFo4OjvjKxKstxIz4ED8i4zF/PnPQ74ZU8lX13ue
 92byorAbgxZuW3yE3Ng/87nTyvEQn6kdSsAK/PpGq/xTLJltxAWgLWlFMx9amcJ7t1D8
 aK7w==
X-Gm-Message-State: AOAM533jM4Tkl1vw7zSHpgt9LFGLK0nvIVGKGJUTfEGWTDmpzArukGdc
 1UDbTsrjRArQIG9V01O22xc=
X-Google-Smtp-Source: ABdhPJwha7L6AZRIP9jADHyDi0n6/8upyQW/VhplIg8/MAE8mPcvQniEa6y4dgy5RLT90sqKGkQq1A==
X-Received: by 2002:a17:902:6bc3:b0:13f:8e99:ce74 with SMTP id
 m3-20020a1709026bc300b0013f8e99ce74mr26642968plt.29.1635320860047; 
 Wed, 27 Oct 2021 00:47:40 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id x40sm10168325pfh.188.2021.10.27.00.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:47:39 -0700 (PDT)
Date: Wed, 27 Oct 2021 17:47:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: instruction storage exception handling
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jacques de Laval
 <jacques.delaval@protonmail.com>, Scott Wood <oss@buserror.net>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
In-Reply-To: <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1635318932.od1ierwsis.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 27, 2021 3:51 pm:
>=20
>=20
> Le 27/10/2021 =C3=A0 07:25, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of October 27, 2021 3:00 pm:
>>>
>>>
>>> Le 27/10/2021 =C3=A0 06:10, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Jacques de Laval's message of October 26, 2021 6:07 am:
>>>>> Hi,
>>>>>
>>>>> We are trying to upgrade kernel from 5.10 to 5.14.11. We have a Frees=
cale/NXP
>>>>> T1023 SOC with two e5500 cores, and are running in 32-bit mode:
>>>>>
>>>>> 	CONFIG_PPC32=3Dy
>>>>> 	# CONFIG_PPC64 is not set
>>>>>
>>>>> 	#
>>>>> 	# Processor support
>>>>> 	#
>>>>> 	# CONFIG_PPC_BOOK3S_32 is not set
>>>>> 	CONFIG_PPC_85xx=3Dy
>>>>> 	# CONFIG_PPC_8xx is not set
>>>>> 	# CONFIG_40x is not set
>>>>> 	# CONFIG_44x is not set
>>>>> 	CONFIG_GENERIC_CPU=3Dy
>>>>> 	# CONFIG_E5500_CPU is not set
>>>>> 	# CONFIG_E6500_CPU is not set
>>>>> 	CONFIG_E500=3Dy
>>>>> 	CONFIG_PPC_E500MC=3Dy
>>>>> 	CONFIG_PPC_FPU_REGS=3Dy
>>>>> 	CONFIG_PPC_FPU=3Dy
>>>>> 	CONFIG_FSL_EMB_PERFMON=3Dy
>>>>> 	CONFIG_FSL_EMB_PERF_EVENT=3Dy
>>>>> 	CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy
>>>>> 	CONFIG_BOOKE=3Dy
>>>>> 	CONFIG_FSL_BOOKE=3Dy
>>>>> 	CONFIG_PPC_FSL_BOOK3E=3Dy
>>>>> 	CONFIG_PTE_64BIT=3Dy
>>>>> 	CONFIG_PHYS_64BIT=3Dy
>>>>> 	CONFIG_PPC_MMU_NOHASH=3Dy
>>>>> 	CONFIG_PPC_BOOK3E_MMU=3Dy
>>>>> 	# CONFIG_PMU_SYSFS is not set
>>>>> 	CONFIG_SMP=3Dy
>>>>> 	CONFIG_NR_CPUS=3D2
>>>>> 	CONFIG_PPC_DOORBELL=3Dy
>>>>> 	# end of Processor support
>>>>>
>>>>> We compile using 32-bit Bootlin PPC toolchain:
>>>>>
>>>>> 	powerpc-e500mc glibc bleeding-edge 2020.08-1.
>>>>>
>>>>> When booting, and starting PID 1 we sometimes get a hang. Nothing but=
 our init
>>>>> process is running, and for debugging purposes our init currently loo=
ks like
>>>>> this:
>>>>>
>>>>> 	int main(int argc, char *argv[]){
>>>>> 		for (int i =3D 0; ; i++) {
>>>>> 			FILE *fp =3D fopen("/dev/kmsg", "w");
>>>>> 			if (fp) {
>>>>> 				fprintf(fp, "%d\n", i);
>>>>> 				fclose(fp);
>>>>> 			}
>>>>> 			sleep(1);
>>>>> 		}
>>>>> 		return 0;
>>>>> 	}
>>>>>
>>>>> When the hangup occur we don't get any output at all from our PID 1.
>>>>> The last output is from the kernel:
>>>>>
>>>>> 	Run /sbin/init as init process
>>>>> 	  with arguments:
>>>>> 	    /sbin/init
>>>>> 	  with environment:
>>>>> 	    HOME=3D/
>>>>> 	    TERM=3Dlinux
>>>>> 	    kgdboc=3DttyS0,115200
>>>>>
>>>>> When issuing a backtrace on all active cpus we can see that the kerne=
l is
>>>>> handling an instruction storage exception:
>>>>>
>>>>> 	sysrq: Show backtrace of all active CPUs
>>>>> 	sysrq: CPU0:
>>>>> 	CPU: 0 PID: 1 Comm: init Not tainted 5.14.11 #1
>>>>> 	NIP:  c02aac78 LR: c02aac2c CTR: 00000000
>>>>> 	REGS: c1907d40 TRAP: 0500   Not tainted  (5.14.11)
>>>>> 	MSR:  00029002 <CE,EE,ME>  CR: 82244284  XER: 20000000
>>>>> 	GPR00: 0000000f c1907e20 c1910000 0065a000 000001d0 01100cca c1907e8=
4 0000000c
>>>>> 	GPR08: d39a8000 000001d3 0000000c c1907f10 42244284 00000000 0074051=
4 bfb71670
>>>>> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff=
1 b7c1c478
>>>>> 	GPR24: 00708558 00701698 d3994040 00029002 c1907f20 0065a238 0000035=
5 d39a2790
>>>>> 	NIP [c02aac78] handle_mm_fault+0xf8/0x11f0
>>>>> 	LR [c02aac2c] handle_mm_fault+0xac/0x11f0
>>>>> 	Call Trace:
>>>>> 	[c1907e20] [c02aac10] handle_mm_fault+0x90/0x11f0 (unreliable)
>>>>> 	[c1907ec0] [c003078c] ___do_page_fault+0x26c/0x780
>>>>> 	[c1907ef0] [c0030cd4] do_page_fault+0x34/0x100
>>>>> 	[c1907f10] [c0000988] InstructionStorage+0x108/0x120
>>>>> 	--- interrupt: 400 at 0x65a238
>>>>> 	NIP:  0065a238 LR: 0052f26c CTR: 0052f260
>>>>> 	REGS: c1907f20 TRAP: 0400   Not tainted  (5.14.11)
>>>>> 	MSR:  0002d002 <CE,EE,PR,ME>  CR: 42242284  XER: 00000000
>>>>> 	GPR00: b7be9914 bfb71620 b7c203a0 8c008000 0070400d b7c182a0 000b826=
0 0052f260
>>>>> 	GPR08: 0047d448 0052f260 0000000a 00000003 42242284 00000000 0074051=
4 bfb71670
>>>>> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff=
1 b7c1c478
>>>>> 	GPR24: 00708558 00701698 00700000 00000015 b7c1c2b0 00707e20 b7c1b8a=
8 bfb71660
>>>>> 	NIP [0065a238] 0x65a238
>>>>> 	LR [0052f26c] 0x52f26c
>>>>> 	--- interrupt: 400
>>>>> 	Instruction dump:
>>>>> 	60a500c0 811f0020 57aa6cfa 813f0000 57a30026 809f004c 81080024 7d29e=
850
>>>>> 	90a1002c 5529a33e 93c10038 7d244a14 <90610034> 7d485215 91210030 41c=
203dc
>>>>>
>>>>> We have also observed that the CPU is continuously servicing the same=
 interrupt
>>>>> (north of 140k times per sec), it is not deadlocked.
>>>>>
>>>>> We have not yet been able to reproduce this behavior under QEMU syste=
m
>>>>> emulation.
>>>>>
>>>>> When bisecting between 5.10 and 5.14.11 we can see that this behavior=
 started
>>>>> with commit a01a3f2ddbcda83e8572787c0ec1dcbeba86915a:
>>>>>
>>>>> 	powerpc: remove arguments from fault handler functions
>>>>
>>>> Thank you for the excellent work to investigate and report this.
>>>>
>>>>>
>>>>> Our best guess that the instruction storage exception is not properly=
 handled
>>>>> and the kernel is never able to recover from the page fault, but we d=
on't
>>>>> really know how to proceed. Does anyone have any suggestions or insig=
hts?
>>>>
>>>> Before my patch, zero was passed to the page fault error code, after
>>>> my patch it passes the contents of ESR SPR.
>>>>
>>>> It looks like the BookE instruction access interrupt does not set ESR
>>>> (except for BO interrupts maybe?) so you're getting what was in the ES=
R
>>>> register from a previous interrupt, and maybe if that was a store then
>>>> access_error won't cause a segfault because is_exec is true so that
>>>> test bails out early, then it might just keep retrying the interrupt.
>>>>
>>>> That could explain why you don't always see the same thing.
>>>>
>>>> Now previous code still saved ESR in regs->esr/dsisr for some reason.
>>>> I can't quite see why that should have been necessary though. Does
>=20
> According to the e500 Reference Manual, on ISI:
>=20
> BO is set if the instruction fetch caused a byte-ordering exception;=20
> otherwise cleared. *All* other defined ESR bits are *cleared*.

You're right. In that case it shouldn't change anything unless there
was a BO fault. I'm not sure what the problem is then. Guessing based
on the NIP and instructions, it looks like it's probably got the correct=20
user address that it's storing into vmf on the stack, so it has got past=20
the access checks so my theory would be wrong anyway.

Must be something simple but I can't see it yet.=20

Thanks,
Nick
