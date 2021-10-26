Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2F43BE63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 02:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf8Mp6cJVz3bW6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 11:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=se4ZybIK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.43.16;
 helo=mail-4316.protonmail.ch; envelope-from=jacques.delaval@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=se4ZybIK; 
 dkim-atps=neutral
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf6MG3T6Bz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 09:44:24 +1100 (AEDT)
Date: Tue, 26 Oct 2021 22:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1635288258;
 bh=7mh+yRGm0Ll17hBydFN6FTmsl/25+MFSFPV9MlOqmqM=;
 h=Date:To:From:Reply-To:Subject:From;
 b=se4ZybIKS1WFhjFFSbqJZ4N0xNRGx4pMy41b9t6BItXymuHgC5ava3y0dQDZjqlWx
 wI4mcBObSrInQZ6pvDz1XMs/HfjC2CtvVQ0KBgaI/clfm8RA+nEQg63grLjiSLdvIL
 SjSdBh2Q4P+cjVSuobbLYn0dO4TKcAUrqiKY5BZM=
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Jacques de Laval <jacques.delaval@protonmail.com>
Subject: instruction storage exception handling
Message-ID: <XS2up7EmqjWK3SbUBtL3cq25HCO00uUexzFgVS6obyanopFOzx-bsG5sluPQy9Oofb_0CQ9bGlNBPbgsI4OjhszdiQWgHTauauaanOFldNY=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Wed, 27 Oct 2021 11:14:31 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

We are trying to upgrade kernel from 5.10 to 5.14.11. We have a Freescale/N=
XP
T1023 SOC with two e5500 cores, and are running in 32-bit mode:

=09CONFIG_PPC32=3Dy
=09# CONFIG_PPC64 is not set

=09#
=09# Processor support
=09#
=09# CONFIG_PPC_BOOK3S_32 is not set
=09CONFIG_PPC_85xx=3Dy
=09# CONFIG_PPC_8xx is not set
=09# CONFIG_40x is not set
=09# CONFIG_44x is not set
=09CONFIG_GENERIC_CPU=3Dy
=09# CONFIG_E5500_CPU is not set
=09# CONFIG_E6500_CPU is not set
=09CONFIG_E500=3Dy
=09CONFIG_PPC_E500MC=3Dy
=09CONFIG_PPC_FPU_REGS=3Dy
=09CONFIG_PPC_FPU=3Dy
=09CONFIG_FSL_EMB_PERFMON=3Dy
=09CONFIG_FSL_EMB_PERF_EVENT=3Dy
=09CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy
=09CONFIG_BOOKE=3Dy
=09CONFIG_FSL_BOOKE=3Dy
=09CONFIG_PPC_FSL_BOOK3E=3Dy
=09CONFIG_PTE_64BIT=3Dy
=09CONFIG_PHYS_64BIT=3Dy
=09CONFIG_PPC_MMU_NOHASH=3Dy
=09CONFIG_PPC_BOOK3E_MMU=3Dy
=09# CONFIG_PMU_SYSFS is not set
=09CONFIG_SMP=3Dy
=09CONFIG_NR_CPUS=3D2
=09CONFIG_PPC_DOORBELL=3Dy
=09# end of Processor support

We compile using 32-bit Bootlin PPC toolchain:

=09powerpc-e500mc glibc bleeding-edge 2020.08-1.

When booting, and starting PID 1 we sometimes get a hang. Nothing but our i=
nit
process is running, and for debugging purposes our init currently looks lik=
e
this:

=09int main(int argc, char *argv[]){
=09=09for (int i =3D 0; ; i++) {
=09=09=09FILE *fp =3D fopen("/dev/kmsg", "w");
=09=09=09if (fp) {
=09=09=09=09fprintf(fp, "%d\n", i);
=09=09=09=09fclose(fp);
=09=09=09}
=09=09=09sleep(1);
=09=09}
=09=09return 0;
=09}

When the hangup occur we don't get any output at all from our PID 1.
The last output is from the kernel:

=09Run /sbin/init as init process
=09  with arguments:
=09    /sbin/init
=09  with environment:
=09    HOME=3D/
=09    TERM=3Dlinux
=09    kgdboc=3DttyS0,115200

When issuing a backtrace on all active cpus we can see that the kernel is
handling an instruction storage exception:

=09sysrq: Show backtrace of all active CPUs
=09sysrq: CPU0:
=09CPU: 0 PID: 1 Comm: init Not tainted 5.14.11 #1
=09NIP:  c02aac78 LR: c02aac2c CTR: 00000000
=09REGS: c1907d40 TRAP: 0500   Not tainted  (5.14.11)
=09MSR:  00029002 <CE,EE,ME>  CR: 82244284  XER: 20000000
=09GPR00: 0000000f c1907e20 c1910000 0065a000 000001d0 01100cca c1907e84 00=
00000c
=09GPR08: d39a8000 000001d3 0000000c c1907f10 42244284 00000000 00740514 bf=
b71670
=09GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7=
c1c478
=09GPR24: 00708558 00701698 d3994040 00029002 c1907f20 0065a238 00000355 d3=
9a2790
=09NIP [c02aac78] handle_mm_fault+0xf8/0x11f0
=09LR [c02aac2c] handle_mm_fault+0xac/0x11f0
=09Call Trace:
=09[c1907e20] [c02aac10] handle_mm_fault+0x90/0x11f0 (unreliable)
=09[c1907ec0] [c003078c] ___do_page_fault+0x26c/0x780
=09[c1907ef0] [c0030cd4] do_page_fault+0x34/0x100
=09[c1907f10] [c0000988] InstructionStorage+0x108/0x120
=09--- interrupt: 400 at 0x65a238
=09NIP:  0065a238 LR: 0052f26c CTR: 0052f260
=09REGS: c1907f20 TRAP: 0400   Not tainted  (5.14.11)
=09MSR:  0002d002 <CE,EE,PR,ME>  CR: 42242284  XER: 00000000
=09GPR00: b7be9914 bfb71620 b7c203a0 8c008000 0070400d b7c182a0 000b8260 00=
52f260
=09GPR08: 0047d448 0052f260 0000000a 00000003 42242284 00000000 00740514 bf=
b71670
=09GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7=
c1c478
=09GPR24: 00708558 00701698 00700000 00000015 b7c1c2b0 00707e20 b7c1b8a8 bf=
b71660
=09NIP [0065a238] 0x65a238
=09LR [0052f26c] 0x52f26c
=09--- interrupt: 400
=09Instruction dump:
=0960a500c0 811f0020 57aa6cfa 813f0000 57a30026 809f004c 81080024 7d29e850
=0990a1002c 5529a33e 93c10038 7d244a14 <90610034> 7d485215 91210030 41c203d=
c

We have also observed that the CPU is continuously servicing the same inter=
rupt
(north of 140k times per sec), it is not deadlocked.

We have not yet been able to reproduce this behavior under QEMU system
emulation.

When bisecting between 5.10 and 5.14.11 we can see that this behavior start=
ed
with commit a01a3f2ddbcda83e8572787c0ec1dcbeba86915a:

=09powerpc: remove arguments from fault handler functions

Our best guess that the instruction storage exception is not properly handl=
ed
and the kernel is never able to recover from the page fault, but we don't
really know how to proceed. Does anyone have any suggestions or insights?

Regards,
Jacques de Laval
