Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA80043C92A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:04:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfS6W3lplz3bP6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 23:04:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=G3eln1Qy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.133;
 helo=mail-40133.protonmail.ch; envelope-from=jacques.delaval@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=G3eln1Qy; 
 dkim-atps=neutral
X-Greylist: delayed 143747 seconds by postgrey-1.36 at boromir;
 Wed, 27 Oct 2021 23:03:59 AEDT
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfS5q1SCrz2xvr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 23:03:59 +1100 (AEDT)
Date: Wed, 27 Oct 2021 12:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1635336225;
 bh=820Vs+SQsLoXLPaRVN9FH4LQHrFkdWYY/0dUYHdw2L0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=G3eln1QyaKLU+xxGDhExzNOXR4o4AKgJtb2aipG32GDjhO8052nqzALtSena7T73C
 4ePJ11jpFg/a3ebTol8KMQRo8iwL6zKQLGTv8Mmhit1rO75ooaLowSo0pOZ08X2anx
 u10BjFLkJvUA0QrEnHfyNgRaeO6JvxkC8QQSd6xo=
To: Christophe Leroy <christophe.leroy@csgroup.eu>
From: Jacques de Laval <jacques.delaval@protonmail.com>
Subject: Re: instruction storage exception handling
Message-ID: <V0kJsLgxvO-1SWRhS-9Nbx1E6oXO6IAJDAYBUA_kieAbf5J8MOnrRzdAiCSl2KoRjztnI3LitFLsJstAOVnWZ-4PBzWmrpTiqIYnU7TRXyo=@protonmail.com>
In-Reply-To: <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
 <1635318932.od1ierwsis.astroid@bobo.none>
 <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Jacques de Laval <jacques.delaval@protonmail.com>
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, October 27th, 2021 at 9:52 AM, Christophe Leroy <christophe.l=
eroy@csgroup.eu> wrote:

> Le 27/10/2021 =C3=A0 09:47, Nicholas Piggin a =C3=A9crit=C2=A0:
>
> > Excerpts from Christophe Leroy's message of October 27, 2021 3:51 pm:
> >
> > > Le 27/10/2021 =C3=A0 07:25, Nicholas Piggin a =C3=A9crit=C2=A0:
> > >
> > > > Excerpts from Christophe Leroy's message of October 27, 2021 3:00 p=
m:
> > > >
> > > > > Le 27/10/2021 =C3=A0 06:10, Nicholas Piggin a =C3=A9crit=C2=A0:
> > > > >
> > > > > > Excerpts from Jacques de Laval's message of October 26, 2021 6:=
07 am:
> > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > We are trying to upgrade kernel from 5.10 to 5.14.11. We have=
 a Freescale/NXP
> > > > > > >
> > > > > > > T1023 SOC with two e5500 cores, and are running in 32-bit mod=
e:
> > > > > > >
> > > > > > > CONFIG_PPC32=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC64 is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > > > >
> > > > > > > Processor support
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_PPC_BOOK3S_32 is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_PPC_85xx=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_8xx is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_40x is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > > > >
> > > > > > > CONFIG_44x is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > > > >
> > > > > > > CONFIG_GENERIC_CPU=3Dy
> > > > > > >
> > > > > > > CONFIG_E5500_CPU is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_E6500_CPU is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_E500=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_E500MC=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_FPU_REGS=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_FPU=3Dy
> > > > > > >
> > > > > > > CONFIG_FSL_EMB_PERFMON=3Dy
> > > > > > >
> > > > > > > CONFIG_FSL_EMB_PERF_EVENT=3Dy
> > > > > > >
> > > > > > > CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy
> > > > > > >
> > > > > > > CONFIG_BOOKE=3Dy
> > > > > > >
> > > > > > > CONFIG_FSL_BOOKE=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_FSL_BOOK3E=3Dy
> > > > > > >
> > > > > > > CONFIG_PTE_64BIT=3Dy
> > > > > > >
> > > > > > > CONFIG_PHYS_64BIT=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_MMU_NOHASH=3Dy
> > > > > > >
> > > > > > > CONFIG_PPC_BOOK3E_MMU=3Dy
> > > > > > >
> > > > > > > CONFIG_PMU_SYSFS is not set
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > CONFIG_SMP=3Dy
> > > > > > >
> > > > > > > CONFIG_NR_CPUS=3D2
> > > > > > >
> > > > > > > CONFIG_PPC_DOORBELL=3Dy
> > > > > > >
> > > > > > > end of Processor support
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > > > >
> > > > > > > We compile using 32-bit Bootlin PPC toolchain:
> > > > > > >
> > > > > > > powerpc-e500mc glibc bleeding-edge 2020.08-1.
> > > > > > >
> > > > > > > When booting, and starting PID 1 we sometimes get a hang. Not=
hing but our init
> > > > > > >
> > > > > > > process is running, and for debugging purposes our init curre=
ntly looks like
> > > > > > >
> > > > > > > this:
> > > > > > >
> > > > > > > int main(int argc, char *argv[]){
> > > > > > >
> > > > > > > for (int i =3D 0; ; i++) {
> > > > > > >
> > > > > > > FILE *fp =3D fopen("/dev/kmsg", "w");
> > > > > > >
> > > > > > > if (fp) {
> > > > > > >
> > > > > > > fprintf(fp, "%d\n", i);
> > > > > > >
> > > > > > > fclose(fp);
> > > > > > >
> > > > > > > }
> > > > > > >
> > > > > > > sleep(1);
> > > > > > >
> > > > > > > }
> > > > > > >
> > > > > > > return 0;
> > > > > > >
> > > > > > > }
> > > > > > >
> > > > > > > When the hangup occur we don't get any output at all from our=
 PID 1.
> > > > > > >
> > > > > > > The last output is from the kernel:
> > > > > > >
> > > > > > > Run /sbin/init as init process
> > > > > > >
> > > > > > > with arguments:
> > > > > > >
> > > > > > > /sbin/init
> > > > > > >
> > > > > > > with environment:
> > > > > > >
> > > > > > > HOME=3D/
> > > > > > >
> > > > > > > TERM=3Dlinux
> > > > > > >
> > > > > > > kgdboc=3DttyS0,115200
> > > > > > >
> > > > > > > When issuing a backtrace on all active cpus we can see that t=
he kernel is
> > > > > > >
> > > > > > > handling an instruction storage exception:
> > > > > > >
> > > > > > > sysrq: Show backtrace of all active CPUs
> > > > > > >
> > > > > > > sysrq: CPU0:
> > > > > > >
> > > > > > > CPU: 0 PID: 1 Comm: init Not tainted 5.14.11 #1
> > > > > > >
> > > > > > > NIP: c02aac78 LR: c02aac2c CTR: 00000000
> > > > > > >
> > > > > > > REGS: c1907d40 TRAP: 0500 Not tainted (5.14.11)
> > > > > > >
> > > > > > > MSR: 00029002 <CE,EE,ME> CR: 82244284 XER: 20000000
> > > > > > >
> > > > > > > GPR00: 0000000f c1907e20 c1910000 0065a000 000001d0 01100cca =
c1907e84 0000000c
> > > > > > >
> > > > > > > GPR08: d39a8000 000001d3 0000000c c1907f10 42244284 00000000 =
00740514 bfb71670
> > > > > > >
> > > > > > > GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 =
0000fff1 b7c1c478
> > > > > > >
> > > > > > > GPR24: 00708558 00701698 d3994040 00029002 c1907f20 0065a238 =
00000355 d39a2790
> > > > > > >
> > > > > > > NIP [c02aac78] handle_mm_fault+0xf8/0x11f0
> > > > > > >
> > > > > > > LR [c02aac2c] handle_mm_fault+0xac/0x11f0
> > > > > > >
> > > > > > > Call Trace:
> > > > > > >
> > > > > > > [c1907e20] [c02aac10] handle_mm_fault+0x90/0x11f0 (unreliable=
)
> > > > > > >
> > > > > > > [c1907ec0] [c003078c] ___do_page_fault+0x26c/0x780
> > > > > > >
> > > > > > > [c1907ef0] [c0030cd4] do_page_fault+0x34/0x100
> > > > > > >
> > > > > > > [c1907f10] [c0000988] InstructionStorage+0x108/0x120
> > > > > > >
> > > > > > > --- interrupt: 400 at 0x65a238
> > > > > > >
> > > > > > > NIP: 0065a238 LR: 0052f26c CTR: 0052f260
> > > > > > >
> > > > > > > REGS: c1907f20 TRAP: 0400 Not tainted (5.14.11)
> > > > > > >
> > > > > > > MSR: 0002d002 <CE,EE,PR,ME> CR: 42242284 XER: 00000000
> > > > > > >
> > > > > > > GPR00: b7be9914 bfb71620 b7c203a0 8c008000 0070400d b7c182a0 =
000b8260 0052f260
> > > > > > >
> > > > > > > GPR08: 0047d448 0052f260 0000000a 00000003 42242284 00000000 =
00740514 bfb71670
> > > > > > >
> > > > > > > GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 =
0000fff1 b7c1c478
> > > > > > >
> > > > > > > GPR24: 00708558 00701698 00700000 00000015 b7c1c2b0 00707e20 =
b7c1b8a8 bfb71660
> > > > > > >
> > > > > > > NIP [0065a238] 0x65a238
> > > > > > >
> > > > > > > LR [0052f26c] 0x52f26c
> > > > > > >
> > > > > > > --- interrupt: 400
> > > > > > >
> > > > > > > Instruction dump:
> > > > > > >
> > > > > > > 60a500c0 811f0020 57aa6cfa 813f0000 57a30026 809f004c 8108002=
4 7d29e850
> > > > > > >
> > > > > > > 90a1002c 5529a33e 93c10038 7d244a14 <90610034> 7d485215 91210=
030 41c203dc
> > > > > > >
> > > > > > > We have also observed that the CPU is continuously servicing =
the same interrupt
> > > > > > >
> > > > > > > (north of 140k times per sec), it is not deadlocked.
> > > > > > >
> > > > > > > We have not yet been able to reproduce this behavior under QE=
MU system
> > > > > > >
> > > > > > > emulation.
> > > > > > >
> > > > > > > When bisecting between 5.10 and 5.14.11 we can see that this =
behavior started
> > > > > > >
> > > > > > > with commit a01a3f2ddbcda83e8572787c0ec1dcbeba86915a:
> > > > > > >
> > > > > > > powerpc: remove arguments from fault handler functions
> > > > > >
> > > > > > Thank you for the excellent work to investigate and report this=
.
> > > > > >
> > > > > > > Our best guess that the instruction storage exception is not =
properly handled
> > > > > > >
> > > > > > > and the kernel is never able to recover from the page fault, =
but we don't
> > > > > > >
> > > > > > > really know how to proceed. Does anyone have any suggestions =
or insights?
> > > > > >
> > > > > > Before my patch, zero was passed to the page fault error code, =
after
> > > > > >
> > > > > > my patch it passes the contents of ESR SPR.
> > > > > >
> > > > > > It looks like the BookE instruction access interrupt does not s=
et ESR
> > > > > >
> > > > > > (except for BO interrupts maybe?) so you're getting what was in=
 the ESR
> > > > > >
> > > > > > register from a previous interrupt, and maybe if that was a sto=
re then
> > > > > >
> > > > > > access_error won't cause a segfault because is_exec is true so =
that
> > > > > >
> > > > > > test bails out early, then it might just keep retrying the inte=
rrupt.
> > > > > >
> > > > > > That could explain why you don't always see the same thing.
> > > > > >
> > > > > > Now previous code still saved ESR in regs->esr/dsisr for some r=
eason.
> > > > > >
> > > > > > I can't quite see why that should have been necessary though. D=
oes
> > >
> > > According to the e500 Reference Manual, on ISI:
> > >
> > > BO is set if the instruction fetch caused a byte-ordering exception;
> > >
> > > otherwise cleared. All other defined ESR bits are cleared.
> >
> > You're right. In that case it shouldn't change anything unless there
> >
> > was a BO fault. I'm not sure what the problem is then. Guessing based
> >
> > on the NIP and instructions, it looks like it's probably got the correc=
t
> >
> > user address that it's storing into vmf on the stack, so it has got pas=
t
> >
> > the access checks so my theory would be wrong anyway.
> >
> > Must be something simple but I can't see it yet.
>
> Anyway, I think it is still worth doing the check with setting 0 in
>
> _ESR(r11), maybe the Reference Manual is wrong.
>
> So Jacques, please do the test anyway if you can.
>
> Thanks
>
> Christophe

I tested with the last patch from Nicholas, and with that I can not
reproduce the issue, so it seems like that solves it for my case and setup
at least.

Big thanks Christophe and Nicholas for looking in to this!

Thanks,
Jacques
