Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF743C12A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 06:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfFcD2TLLz2yK4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:11:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gtuR5WRU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gtuR5WRU; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfFbZ6VN1z2xDl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 15:10:32 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id gn3so1110460pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 21:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=P7OYnjKQKjcAl/FGEdyrmIgHkGBoYkgVaZRZWjIGp1U=;
 b=gtuR5WRUo4FVv5+FPc2OOT8nWetzPwILmKD9GxUkIn62YBrThyuQRnakB2mU8Vl1mK
 eF11nevRpcsWtkyYMAitpdsmjeWTaYbdwbmL2F3yFZ/IENG8tkF6lYkjGOZzA3ayKhIj
 3DwwC8tnZ95D49lFDNpScVKdcA0YKMjkAugrSSp6mLEz/+knn6C0bN7InVtiiatPBZJL
 46vTpTkkieIR1ZM2A3uBsRANwOOqgmXxiqPeN/ihlxo+gTXye5/+ogVnDe9BbozsVjT3
 /EhdlCtKwsEAf162OVD12XkKzMoyj3kdGa4R8XSwyPF2UMlLs99lftsD+WyiP21Ow9E8
 Etdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=P7OYnjKQKjcAl/FGEdyrmIgHkGBoYkgVaZRZWjIGp1U=;
 b=wpwRNZkoG2UHNM6FldrNvuvgV2LRqGCNvA58GJGhpUUqaPocz6oO9B55oyUTCU5JWK
 PW/haLNnYjU4fRNO8u8sUuNefzuiAgqtynSRDx75G9LqsOiEZZHah01uJL9HJS+Y2+QN
 mfey2EDPus9VyTH3oEVMRQLnrAIIkWfP6DfiXx/CKVka7TI4vQ6h2VoBGEBXVCl2zkqv
 EnjVPQQyjwzx5+6camdVR87GyaR+ttTBdVYBBLqTQopNO9yQEM9wzBkno4gGC3Hn6OKH
 S7S6J1y4UP4ZckYwYIFhkF63ZzKHQ1eDmRlw8gcDpnStZH6yJ34+gmmr5RXrvWI7dpAN
 QY5w==
X-Gm-Message-State: AOAM531nLcvYos4Stear5PpZocrZNLvfpn/C7Yfp4tR/WtRGinTw6ds/
 xIPTG1dCjXayJMs40enarqDQNtAV+Bw=
X-Google-Smtp-Source: ABdhPJzZciwaQXrpTFgyyqcEawNFmGIZH09wfO4m+/yBJ7eZNH8Bg4awGIihEbFqWjKbsiNGFr49EA==
X-Received: by 2002:a17:902:cacb:b0:140:4649:6720 with SMTP id
 y11-20020a170902cacb00b0014046496720mr18459052pld.4.1635307830722; 
 Tue, 26 Oct 2021 21:10:30 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id u10sm9810670pfk.211.2021.10.26.21.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:10:30 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:10:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: instruction storage exception handling
To: Jacques de Laval <jacques.delaval@protonmail.com>, "To: Scott Wood"
 <oss@buserror.net>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
In-Reply-To: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
MIME-Version: 1.0
Message-Id: <1635306738.0z8wt7619v.astroid@bobo.none>
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

Excerpts from Jacques de Laval's message of October 26, 2021 6:07 am:
> Hi,
>=20
> We are trying to upgrade kernel from 5.10 to 5.14.11. We have a Freescale=
/NXP
> T1023 SOC with two e5500 cores, and are running in 32-bit mode:
>=20
> 	CONFIG_PPC32=3Dy
> 	# CONFIG_PPC64 is not set
>=20
> 	#
> 	# Processor support
> 	#
> 	# CONFIG_PPC_BOOK3S_32 is not set
> 	CONFIG_PPC_85xx=3Dy
> 	# CONFIG_PPC_8xx is not set
> 	# CONFIG_40x is not set
> 	# CONFIG_44x is not set
> 	CONFIG_GENERIC_CPU=3Dy
> 	# CONFIG_E5500_CPU is not set
> 	# CONFIG_E6500_CPU is not set
> 	CONFIG_E500=3Dy
> 	CONFIG_PPC_E500MC=3Dy
> 	CONFIG_PPC_FPU_REGS=3Dy
> 	CONFIG_PPC_FPU=3Dy
> 	CONFIG_FSL_EMB_PERFMON=3Dy
> 	CONFIG_FSL_EMB_PERF_EVENT=3Dy
> 	CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy
> 	CONFIG_BOOKE=3Dy
> 	CONFIG_FSL_BOOKE=3Dy
> 	CONFIG_PPC_FSL_BOOK3E=3Dy
> 	CONFIG_PTE_64BIT=3Dy
> 	CONFIG_PHYS_64BIT=3Dy
> 	CONFIG_PPC_MMU_NOHASH=3Dy
> 	CONFIG_PPC_BOOK3E_MMU=3Dy
> 	# CONFIG_PMU_SYSFS is not set
> 	CONFIG_SMP=3Dy
> 	CONFIG_NR_CPUS=3D2
> 	CONFIG_PPC_DOORBELL=3Dy
> 	# end of Processor support
>=20
> We compile using 32-bit Bootlin PPC toolchain:
>=20
> 	powerpc-e500mc glibc bleeding-edge 2020.08-1.
>=20
> When booting, and starting PID 1 we sometimes get a hang. Nothing but our=
 init
> process is running, and for debugging purposes our init currently looks l=
ike
> this:
>=20
> 	int main(int argc, char *argv[]){
> 		for (int i =3D 0; ; i++) {
> 			FILE *fp =3D fopen("/dev/kmsg", "w");
> 			if (fp) {
> 				fprintf(fp, "%d\n", i);
> 				fclose(fp);
> 			}
> 			sleep(1);
> 		}
> 		return 0;
> 	}
>=20
> When the hangup occur we don't get any output at all from our PID 1.
> The last output is from the kernel:
>=20
> 	Run /sbin/init as init process
> 	  with arguments:
> 	    /sbin/init
> 	  with environment:
> 	    HOME=3D/
> 	    TERM=3Dlinux
> 	    kgdboc=3DttyS0,115200
>=20
> When issuing a backtrace on all active cpus we can see that the kernel is
> handling an instruction storage exception:
>=20
> 	sysrq: Show backtrace of all active CPUs
> 	sysrq: CPU0:
> 	CPU: 0 PID: 1 Comm: init Not tainted 5.14.11 #1
> 	NIP:  c02aac78 LR: c02aac2c CTR: 00000000
> 	REGS: c1907d40 TRAP: 0500   Not tainted  (5.14.11)
> 	MSR:  00029002 <CE,EE,ME>  CR: 82244284  XER: 20000000
> 	GPR00: 0000000f c1907e20 c1910000 0065a000 000001d0 01100cca c1907e84 00=
00000c
> 	GPR08: d39a8000 000001d3 0000000c c1907f10 42244284 00000000 00740514 bf=
b71670
> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7=
c1c478
> 	GPR24: 00708558 00701698 d3994040 00029002 c1907f20 0065a238 00000355 d3=
9a2790
> 	NIP [c02aac78] handle_mm_fault+0xf8/0x11f0
> 	LR [c02aac2c] handle_mm_fault+0xac/0x11f0
> 	Call Trace:
> 	[c1907e20] [c02aac10] handle_mm_fault+0x90/0x11f0 (unreliable)
> 	[c1907ec0] [c003078c] ___do_page_fault+0x26c/0x780
> 	[c1907ef0] [c0030cd4] do_page_fault+0x34/0x100
> 	[c1907f10] [c0000988] InstructionStorage+0x108/0x120
> 	--- interrupt: 400 at 0x65a238
> 	NIP:  0065a238 LR: 0052f26c CTR: 0052f260
> 	REGS: c1907f20 TRAP: 0400   Not tainted  (5.14.11)
> 	MSR:  0002d002 <CE,EE,PR,ME>  CR: 42242284  XER: 00000000
> 	GPR00: b7be9914 bfb71620 b7c203a0 8c008000 0070400d b7c182a0 000b8260 00=
52f260
> 	GPR08: 0047d448 0052f260 0000000a 00000003 42242284 00000000 00740514 bf=
b71670
> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7=
c1c478
> 	GPR24: 00708558 00701698 00700000 00000015 b7c1c2b0 00707e20 b7c1b8a8 bf=
b71660
> 	NIP [0065a238] 0x65a238
> 	LR [0052f26c] 0x52f26c
> 	--- interrupt: 400
> 	Instruction dump:
> 	60a500c0 811f0020 57aa6cfa 813f0000 57a30026 809f004c 81080024 7d29e850
> 	90a1002c 5529a33e 93c10038 7d244a14 <90610034> 7d485215 91210030 41c203d=
c
>=20
> We have also observed that the CPU is continuously servicing the same int=
errupt
> (north of 140k times per sec), it is not deadlocked.
>=20
> We have not yet been able to reproduce this behavior under QEMU system
> emulation.
>=20
> When bisecting between 5.10 and 5.14.11 we can see that this behavior sta=
rted
> with commit a01a3f2ddbcda83e8572787c0ec1dcbeba86915a:
>=20
> 	powerpc: remove arguments from fault handler functions

Thank you for the excellent work to investigate and report this.

>=20
> Our best guess that the instruction storage exception is not properly han=
dled
> and the kernel is never able to recover from the page fault, but we don't
> really know how to proceed. Does anyone have any suggestions or insights?

Before my patch, zero was passed to the page fault error code, after
my patch it passes the contents of ESR SPR.

It looks like the BookE instruction access interrupt does not set ESR=20
(except for BO interrupts maybe?) so you're getting what was in the ESR
register from a previous interrupt, and maybe if that was a store then
access_error won't cause a segfault because is_exec is true so that
test bails out early, then it might just keep retrying the interrupt.

That could explain why you don't always see the same thing.

Now previous code still saved ESR in regs->esr/dsisr for some reason.
I can't quite see why that should have been necessary though. Does
this patch solve it for you?

Thanks,
Nick
--


diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_bo=
oke.h
index e5503420b6c6..0e7cdc8716eb 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -467,10 +467,11 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
=20
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
 	START_EXCEPTION(InstructionStorage)				      \
-	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
-	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
+	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);			      \
+	li	r5,0;							      \
+	mfspr	r5,SPRN_ESR;		/* Store 0 in regs->esr (dsisr) */    \
 	stw	r5,_ESR(r11);						      \
-	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
+	stw	r12, _DEAR(r11);	/* Set regs->dear (dar) */	      \
 	prepare_transfer_to_handler;					      \
 	bl	do_page_fault;						      \
 	b	interrupt_return
