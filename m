Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED206C0EB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 11:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg9s52bx4z3cMH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 21:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.59.253; helo=7.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2350 seconds by postgrey-1.36 at boromir; Mon, 20 Mar 2023 21:26:33 AEDT
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net [188.165.59.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg9rT56XCz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 21:26:31 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F1A262885B;
	Mon, 20 Mar 2023 09:47:14 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 20 Mar
 2023 10:47:14 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-95G001ddd99d05-2901-4ea5-a978-791736c006f1,
                    F0E6F0E3EAC8DE216C47088D2AA2F9E7F08C2096) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <62fc117d-45a2-9aea-1a2f-973181395430@kaod.org>
Date: Mon, 20 Mar 2023 10:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [kvm-unit-tests v2 09/10] powerpc: Support powernv machine with
 QEMU TCG
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <kvm@vger.kernel.org>
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-10-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230320070339.915172-10-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: cdb752b5-9f0a-46c2-9086-8071876d5310
X-Ovh-Tracer-Id: 3144075492277324707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfejteeugfeffeehudevkeduheegfeejieekueettddthfegtddtgfdvjedvjeenucffohhmrghinhepohhprghlqdgtrghllhhsrdhssgdptghsthgrrhhtieegrdhssgenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nick,

On 3/20/23 08:03, Nicholas Piggin wrote:
> This is a basic first pass at powernv support using OPAL (skiboot)
> firmware.
> 
> The ACCEL is a bit clunky, now defaulting to tcg for powernv machine.
> It also does not yet run in the run_tests.sh batch process, more work
> is needed to exclude certain tests (e.g., rtas) and adjust parameters
> (e.g., increase memory size) to allow powernv to work. For now it
> can run single test cases.

Why do you need to load OPAL ? for the shutdown ? because the UART ops
could be done directly using MMIOs on the LPC IO space.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/ppc_asm.h   |  5 +++
>   lib/powerpc/asm/processor.h | 14 ++++++++
>   lib/powerpc/hcall.c         |  4 +--
>   lib/powerpc/io.c            | 33 ++++++++++++++++--
>   lib/powerpc/io.h            |  6 ++++
>   lib/powerpc/processor.c     | 10 ++++++
>   lib/powerpc/setup.c         | 10 ++++--
>   lib/ppc64/asm/opal.h        | 11 ++++++
>   lib/ppc64/opal-calls.S      | 46 +++++++++++++++++++++++++
>   lib/ppc64/opal.c            | 67 +++++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.ppc64      |  2 ++
>   powerpc/cstart64.S          |  7 ++++
>   powerpc/run                 | 30 ++++++++++++++---
>   13 files changed, 234 insertions(+), 11 deletions(-)
>   create mode 100644 lib/ppc64/asm/opal.h
>   create mode 100644 lib/ppc64/opal-calls.S
>   create mode 100644 lib/ppc64/opal.c
> 
> diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
> index 6299ff5..5eec9d3 100644
> --- a/lib/powerpc/asm/ppc_asm.h
> +++ b/lib/powerpc/asm/ppc_asm.h
> @@ -36,7 +36,12 @@
>   #endif /* __BYTE_ORDER__ */
>   
>   /* Machine State Register definitions: */
> +#define MSR_LE_BIT	0
>   #define MSR_EE_BIT	15			/* External Interrupts Enable */
> +#define MSR_HV_BIT	60			/* Hypervisor mode */
>   #define MSR_SF_BIT	63			/* 64-bit mode */
>   
> +#define SPR_HSRR0	0x13A
> +#define SPR_HSRR1	0x13B
> +
>   #endif /* _ASMPOWERPC_PPC_ASM_H */
> diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> index ebfeff2..8084787 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -3,12 +3,26 @@
>   
>   #include <libcflat.h>
>   #include <asm/ptrace.h>
> +#include <asm/ppc_asm.h>
>   
>   #ifndef __ASSEMBLY__
>   void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
>   void do_handle_exception(struct pt_regs *regs);
>   #endif /* __ASSEMBLY__ */
>   
> +/*
> + * If this returns true on PowerNV / OPAL machines which run in hypervisor
> + * mode. False on pseries / PAPR machines that run in guest mode.
> + */
> +static inline bool machine_is_powernv(void)
> +{
> +	uint64_t msr;
> +
> +	asm volatile ("mfmsr %[msr]" : [msr] "=r" (msr));
> +
> +	return !!(msr & (1ULL << MSR_HV_BIT));
> +}
> +
>   static inline uint64_t get_tb(void)
>   {
>   	uint64_t tb;
> diff --git a/lib/powerpc/hcall.c b/lib/powerpc/hcall.c
> index 711cb1b..37e52f5 100644
> --- a/lib/powerpc/hcall.c
> +++ b/lib/powerpc/hcall.c
> @@ -25,7 +25,7 @@ int hcall_have_broken_sc1(void)
>   	return r3 == (unsigned long)H_PRIVILEGE;
>   }
>   
> -void putchar(int c)
> +void papr_putchar(int c)
>   {
>   	unsigned long vty = 0;		/* 0 == default */
>   	unsigned long nr_chars = 1;
> @@ -34,7 +34,7 @@ void putchar(int c)
>   	hcall(H_PUT_TERM_CHAR, vty, nr_chars, chars);
>   }
>   
> -int __getchar(void)
> +int __papr_getchar(void)
>   {
>   	register unsigned long r3 asm("r3") = H_GET_TERM_CHAR;
>   	register unsigned long r4 asm("r4") = 0; /* 0 == default vty */
> diff --git a/lib/powerpc/io.c b/lib/powerpc/io.c
> index a381688..a3a64ce 100644
> --- a/lib/powerpc/io.c
> +++ b/lib/powerpc/io.c
> @@ -9,13 +9,39 @@
>   #include <asm/spinlock.h>
>   #include <asm/rtas.h>
>   #include <asm/setup.h>
> +#include <asm/processor.h>
>   #include "io.h"
>   
>   static struct spinlock print_lock;
>   
> +struct opal {
> +	uint64_t base;
> +	uint64_t entry;
> +};
> +extern struct opal opal;
> +
> +void putchar(int c)
> +{
> +	if (machine_is_powernv())
> +		opal_putchar(c);
> +	else
> +		papr_putchar(c);
> +}
> +
> +int __getchar(void)
> +{
> +	if (machine_is_powernv())
> +		return __opal_getchar();
> +	else
> +		return __papr_getchar();
> +}
> +
>   void io_init(void)
>   {
> -	rtas_init();
> +	if (machine_is_powernv())
> +		opal_init();
> +	else
> +		rtas_init();
>   }
>   
>   void puts(const char *s)
> @@ -38,7 +64,10 @@ void exit(int code)
>   // FIXME: change this print-exit/rtas-poweroff to chr_testdev_exit(),
>   //        maybe by plugging chr-testdev into a spapr-vty.
>   	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
> -	rtas_power_off();
> +	if (machine_is_powernv())
> +		opal_power_off();
> +	else
> +		rtas_power_off();
>   	halt(code);
>   	__builtin_unreachable();
>   }
> diff --git a/lib/powerpc/io.h b/lib/powerpc/io.h
> index d4f21ba..a2aed7b 100644
> --- a/lib/powerpc/io.h
> +++ b/lib/powerpc/io.h
> @@ -8,6 +8,12 @@
>   #define _POWERPC_IO_H_
>   
>   extern void io_init(void);
> +extern void opal_init(void);
> +extern void opal_power_off(void);
>   extern void putchar(int c);
> +extern void opal_putchar(int c);
> +extern void papr_putchar(int c);
> +extern int __opal_getchar(void);
> +extern int __papr_getchar(void);
>   
>   #endif
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index e77a240..06f6db3 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -61,6 +61,16 @@ void sleep_tb(uint64_t cycles)
>   {
>   	uint64_t start, end, now;
>   
> +	if (machine_is_powernv()) {
> +		/*
> +		 * Could use 'stop' to sleep here which would be interesting.
> +		 * stop with ESL=0 should be simple enough, ESL=1 would require
> +		 * SRESET based wakeup which is more involved.
> +		 */
> +		delay(cycles);
> +		return;
> +	}
> +
>   	start = now = get_tb();
>   	end = start + cycles;
>   
> diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> index 1be4c03..f327540 100644
> --- a/lib/powerpc/setup.c
> +++ b/lib/powerpc/setup.c
> @@ -18,6 +18,7 @@
>   #include <argv.h>
>   #include <asm/setup.h>
>   #include <asm/page.h>
> +#include <asm/processor.h>
>   #include <asm/hcall.h>
>   #include "io.h"
>   
> @@ -97,12 +98,13 @@ static void cpu_init(void)
>   	tb_hz = params.tb_hz;
>   
>   	/* Interrupt Endianness */
> -
> +	if (!machine_is_powernv()) {
>   #if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> -        hcall(H_SET_MODE, 1, 4, 0, 0);
> +		hcall(H_SET_MODE, 1, 4, 0, 0);
>   #else
> -        hcall(H_SET_MODE, 0, 4, 0, 0);
> +		hcall(H_SET_MODE, 0, 4, 0, 0);
>   #endif
> +	}
>   }
>   
>   static void mem_init(phys_addr_t freemem_start)
> @@ -195,6 +197,8 @@ void setup(const void *fdt)
>   		freemem += initrd_size;
>   	}
>   
> +	opal_init();
> +

This opal_init() call seems redundant with io_init().

C.

>   	/* call init functions */
>   	cpu_init();
>   
> diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
> new file mode 100644
> index 0000000..243a3c6
> --- /dev/null
> +++ b/lib/ppc64/asm/opal.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASMPPC64_HCALL_H_
> +#define _ASMPPC64_HCALL_H_
> +
> +#define OPAL_SUCCESS				0
> +
> +#define OPAL_CONSOLE_WRITE			1
> +#define OPAL_CONSOLE_READ			2
> +#define OPAL_CEC_POWER_DOWN			5
> +
> +#endif
> diff --git a/lib/ppc64/opal-calls.S b/lib/ppc64/opal-calls.S
> new file mode 100644
> index 0000000..1833358
> --- /dev/null
> +++ b/lib/ppc64/opal-calls.S
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2016 IBM Corporation.
> + */
> +
> +#include <asm/ppc_asm.h>
> +
> +	.text
> +	.globl opal_call
> +opal_call:
> +	mr	r0,r3
> +	mr	r3,r4
> +	mr	r4,r5
> +	mr	r5,r6
> +	mr	r6,r7
> +	mflr	r11
> +	std	r11,16(r1)
> +	mfcr	r12
> +	stw	r12,8(r1)
> +	mr	r13,r2
> +
> +	/* Set opal return address */
> +	LOAD_REG_ADDR(r11, opal_return)
> +	mtlr	r11
> +	mfmsr	r12
> +
> +	/* switch to BE when we enter OPAL */
> +	li	r11,(1 << MSR_LE_BIT)
> +	andc	r12,r12,r11
> +	mtspr	SPR_HSRR1,r12
> +
> +	/* load the opal call entry point and base */
> +	LOAD_REG_ADDR(r11, opal)
> +	ld	r12,8(r11)
> +	ld	r2,0(r11)
> +	mtspr	SPR_HSRR0,r12
> +	hrfid
> +
> +opal_return:
> +	FIXUP_ENDIAN
> +	mr	r2,r13;
> +	lwz	r11,8(r1);
> +	ld	r12,16(r1)
> +	mtcr	r11;
> +	mtlr	r12
> +	blr
> diff --git a/lib/ppc64/opal.c b/lib/ppc64/opal.c
> new file mode 100644
> index 0000000..515e9ab
> --- /dev/null
> +++ b/lib/ppc64/opal.c
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * OPAL call helpers
> + */
> +#include <asm/opal.h>
> +#include <libcflat.h>
> +#include <libfdt/libfdt.h>
> +#include <devicetree.h>
> +//libfdt_env.h>
> +#include <asm/io.h>
> +#include "../powerpc/io.h"
> +
> +struct opal {
> +	uint64_t base;
> +	uint64_t entry;
> +} opal;
> +
> +void opal_init(void)
> +{
> +	const struct fdt_property *prop;
> +	int node, len;
> +
> +	node = fdt_path_offset(dt_fdt(), "/ibm,opal");
> +	if (node < 0) {
> +		return;// node;
> +	}
> +
> +	prop = fdt_get_property(dt_fdt(), node, "opal-base-address", &len);
> +	if (!prop)
> +		return;// len;
> +	opal.base = fdt64_to_cpu(*(uint64_t *)prop->data);
> +
> +	prop = fdt_get_property(dt_fdt(), node, "opal-entry-address", &len);
> +	if (!prop)
> +		return;// len;
> +	opal.entry = fdt64_to_cpu(*(uint64_t *)prop->data);
> +}
> +
> +extern int64_t opal_call(int64_t token, int64_t arg1, int64_t arg2, int64_t arg3);
> +
> +extern void opal_power_off(void)
> +{
> +	opal_call(OPAL_CEC_POWER_DOWN, 0, 0, 0);
> +}
> +
> +void opal_putchar(int c)
> +{
> +	unsigned long vty = 0;		/* 0 == default */
> +	unsigned long nr_chars = cpu_to_be64(1);
> +	char ch = c;
> +
> +	opal_call(OPAL_CONSOLE_WRITE, (int64_t)vty, (int64_t)&nr_chars, (int64_t)&ch);
> +}
> +
> +int __opal_getchar(void)
> +{
> +	unsigned long vty = 0;		/* 0 == default */
> +	unsigned long nr_chars = cpu_to_be64(1);
> +	char ch;
> +	int rc;
> +
> +	rc = opal_call(OPAL_CONSOLE_READ, (int64_t)vty, (int64_t)&nr_chars, (int64_t)&ch);
> +	if (rc != OPAL_SUCCESS)
> +		return -1;
> +
> +	return ch;
> +}
> diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> index b0ed2b1..06a7cf6 100644
> --- a/powerpc/Makefile.ppc64
> +++ b/powerpc/Makefile.ppc64
> @@ -17,6 +17,8 @@ cstart.o = $(TEST_DIR)/cstart64.o
>   reloc.o  = $(TEST_DIR)/reloc64.o
>   
>   OBJDIRS += lib/ppc64
> +cflatobjs += lib/ppc64/opal.o
> +cflatobjs += lib/ppc64/opal-calls.o
>   
>   # ppc64 specific tests
>   tests = $(TEST_DIR)/spapr_vpa.elf
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index 069d991..b5b3ec7 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -92,6 +92,13 @@ start:
>   	sync
>   	isync
>   
> +	/* powernv machine does not check broken_sc1 */
> +	mfmsr	r3
> +	li	r4,1
> +	sldi	r4,r4,MSR_HV_BIT
> +	and.	r3,r3,r4
> +	bne	1f
> +
>   	/* patch sc1 if needed */
>   	bl	hcall_have_broken_sc1
>   	cmpwi	r3, 0
> diff --git a/powerpc/run b/powerpc/run
> index ee38e07..2ec3df8 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -1,5 +1,14 @@
>   #!/usr/bin/env bash
>   
> +get_qemu_machine ()
> +{
> +	if [ "$MACHINE" ]; then
> +		echo $MACHINE
> +	else
> +		echo pseries
> +	fi
> +}
> +
>   if [ -z "$KUT_STANDALONE" ]; then
>   	if [ ! -f config.mak ]; then
>   		echo "run ./configure && make first. See ./configure -h"
> @@ -12,17 +21,30 @@ fi
>   ACCEL=$(get_qemu_accelerator) ||
>   	exit $?
>   
> +MACHINE=$(get_qemu_machine) ||
> +	exit $?
> +
> +if [ "$MACHINE" = "powernv" ] && [ "$ACCEL" = "kvm" ]; then
> +	echo "powernv machine does not support KVM. ACCEL=tcg must be specified."
> +	exit 2
> +fi
> +
>   qemu=$(search_qemu_binary) ||
>   	exit $?
>   
> -if ! $qemu -machine '?' 2>&1 | grep 'pseries' > /dev/null; then
> -	echo "$qemu doesn't support pSeries ('-machine pseries'). Exiting."
> +if ! $qemu -machine '?' 2>&1 | grep $MACHINE > /dev/null; then
> +	echo "$qemu doesn't support '-machine $MACHINE'. Exiting."
>   	exit 2
>   fi
>   
> -M='-machine pseries'
> +M="-machine $MACHINE"
>   M+=",accel=$ACCEL"
> -command="$qemu -nodefaults $M -bios $FIRMWARE"
> +B=""
> +if [ "$MACHINE" = "pseries" ] ; then
> +	B+="-bios $FIRMWARE"
> +fi
> +
> +command="$qemu -nodefaults $M $B"
>   command+=" -display none -serial stdio -kernel"
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   

