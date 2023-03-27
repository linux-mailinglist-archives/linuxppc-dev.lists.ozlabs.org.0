Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D96CAF06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pljs73BJMz3chy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 06:42:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.33.105.233; helo=2.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 11978 seconds by postgrey-1.36 at boromir; Tue, 28 Mar 2023 06:42:23 AEDT
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net [178.33.105.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pljrb2S3sz3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 06:42:20 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 14AA02AB66;
	Mon, 27 Mar 2023 16:06:57 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 18:06:57 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-99G003f272ab9f-64c6-4114-8d7c-8cea46af14a8,
                    A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ef5bb38f-772d-9ef3-b387-a6f7723e1706@kaod.org>
Date: Mon, 27 Mar 2023 18:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [kvm-unit-tests v3 12/13] powerpc: Support powernv machine with
 QEMU TCG
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <kvm@vger.kernel.org>
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-13-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230327124520.2707537-13-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d2c56c3a-2798-4302-9baf-922df3ece07f
X-Ovh-Tracer-Id: 13772289139134204835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeffeelheduhefhhfegjedvueeutedvieekudehudejieeuffdtfeeuteeigedtkeenucffohhmrghinhepohhprghlqdgtrghllhhsrdhssgdptghsthgrrhhtieegrdhssgenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
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

On 3/27/23 14:45, Nicholas Piggin wrote:
> This is a basic first pass at powernv support using OPAL (skiboot)
> firmware.
> 
> The ACCEL is a bit clunky, defaulting to kvm for powernv machine, which
> isn't right and has to be manually overridden. It also does not yet run
> in the run_tests.sh batch process, more work is needed to exclude
> certain tests (e.g., rtas) and adjust parameters (e.g., increase memory
> size) to allow powernv to work. For now it can run single test cases.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>



> ---
> Since v2:
> - Don't call opal_init() twice [Cedric review]
> - Added BMC device to machine (helps with power-off and getting through
>    BIOS with fewer error messages).
> - Set machine to little-endian mode with OPAL call if built LE.
> - Poll OPAL after making power-off call so IPMI state machine runs and
>    it actually powers off QEMU properly.
> 
>   lib/powerpc/asm/ppc_asm.h   |  5 +++
>   lib/powerpc/asm/processor.h | 10 +++++
>   lib/powerpc/hcall.c         |  4 +-
>   lib/powerpc/io.c            | 27 +++++++++++++-
>   lib/powerpc/io.h            |  6 +++
>   lib/powerpc/processor.c     | 10 +++++
>   lib/powerpc/setup.c         |  8 ++--
>   lib/ppc64/asm/opal.h        | 15 ++++++++
>   lib/ppc64/opal-calls.S      | 46 +++++++++++++++++++++++
>   lib/ppc64/opal.c            | 74 +++++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.ppc64      |  2 +
>   powerpc/cstart64.S          |  7 ++++
>   powerpc/run                 | 35 ++++++++++++++++--
>   13 files changed, 238 insertions(+), 11 deletions(-)
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
> index 4ad6612..9b318c3 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -3,6 +3,7 @@
>   
>   #include <libcflat.h>
>   #include <asm/ptrace.h>
> +#include <asm/ppc_asm.h>
>   
>   #ifndef __ASSEMBLY__
>   void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
> @@ -43,6 +44,15 @@ static inline void mtmsr(uint64_t msr)
>   	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
>   }
>   
> +/*
> + * This returns true on PowerNV / OPAL machines which run in hypervisor
> + * mode. False on pseries / PAPR machines that run in guest mode.
> + */
> +static inline bool machine_is_powernv(void)
> +{
> +	return !!(mfmsr() & (1ULL << MSR_HV_BIT));
> +}
> +
>   static inline uint64_t get_tb(void)
>   {
>   	return mfspr(SPR_TB);
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
> index a381688..ab7bb84 100644
> --- a/lib/powerpc/io.c
> +++ b/lib/powerpc/io.c
> @@ -9,13 +9,33 @@
>   #include <asm/spinlock.h>
>   #include <asm/rtas.h>
>   #include <asm/setup.h>
> +#include <asm/processor.h>
>   #include "io.h"
>   
>   static struct spinlock print_lock;
>   
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
> +		assert(!opal_init());
> +	else
> +		rtas_init();
>   }
>   
>   void puts(const char *s)
> @@ -38,7 +58,10 @@ void exit(int code)
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
> index d4f21ba..943bf14 100644
> --- a/lib/powerpc/io.h
> +++ b/lib/powerpc/io.h
> @@ -8,6 +8,12 @@
>   #define _POWERPC_IO_H_
>   
>   extern void io_init(void);
> +extern int opal_init(void);
> +extern void opal_power_off(void);
>   extern void putchar(int c);
> +extern void opal_putchar(int c);
> +extern void papr_putchar(int c);
> +extern int __opal_getchar(void);
> +extern int __papr_getchar(void);
>   
>   #endif
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index 411e013..58b67d1 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -78,6 +78,16 @@ void sleep_tb(uint64_t cycles)
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
> index 1be4c03..dd758db 100644
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
> diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
> new file mode 100644
> index 0000000..7b1299f
> --- /dev/null
> +++ b/lib/ppc64/asm/opal.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASMPPC64_HCALL_H_
> +#define _ASMPPC64_HCALL_H_
> +
> +#define OPAL_SUCCESS				0
> +
> +#define OPAL_CONSOLE_WRITE			1
> +#define OPAL_CONSOLE_READ			2
> +#define OPAL_CEC_POWER_DOWN			5
> +#define OPAL_POLL_EVENTS			10
> +#define OPAL_REINIT_CPUS			70
> +# define OPAL_REINIT_CPUS_HILE_BE		(1 << 0)
> +# define OPAL_REINIT_CPUS_HILE_LE		(1 << 1)
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
> index 0000000..84ab97b
> --- /dev/null
> +++ b/lib/ppc64/opal.c
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * OPAL call helpers
> + */
> +#include <asm/opal.h>
> +#include <libcflat.h>
> +#include <libfdt/libfdt.h>
> +#include <devicetree.h>
> +#include <asm/io.h>
> +#include "../powerpc/io.h"
> +
> +struct opal {
> +	uint64_t base;
> +	uint64_t entry;
> +} opal;
> +
> +extern int64_t opal_call(int64_t token, int64_t arg1, int64_t arg2, int64_t arg3);
> +
> +int opal_init(void)
> +{
> +	const struct fdt_property *prop;
> +	int node, len;
> +
> +	node = fdt_path_offset(dt_fdt(), "/ibm,opal");
> +	if (node < 0)
> +		return -1;
> +
> +	prop = fdt_get_property(dt_fdt(), node, "opal-base-address", &len);
> +	if (!prop)
> +		return -1;
> +	opal.base = fdt64_to_cpu(*(uint64_t *)prop->data);
> +
> +	prop = fdt_get_property(dt_fdt(), node, "opal-entry-address", &len);
> +	if (!prop)
> +		return -1;
> +	opal.entry = fdt64_to_cpu(*(uint64_t *)prop->data);
> +
> +#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> +	if (opal_call(OPAL_REINIT_CPUS, OPAL_REINIT_CPUS_HILE_LE, 0, 0) != OPAL_SUCCESS)
> +		return -1;
> +#endif
> +
> +	return 0;
> +}
> +
> +extern void opal_power_off(void)
> +{
> +	opal_call(OPAL_CEC_POWER_DOWN, 0, 0, 0);
> +	while (true)
> +		opal_call(OPAL_POLL_EVENTS, 0, 0, 0);
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
> index 0592e03..2c82cd9 100644
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
> index ee38e07..f4ddd39 100755
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
> @@ -12,17 +21,35 @@ fi
>   ACCEL=$(get_qemu_accelerator) ||
>   	exit $?
>   
> +MACHINE=$(get_qemu_machine) ||
> +	exit $?
> +
> +if [[ "$MACHINE" == "powernv"* ]] && [ "$ACCEL" = "kvm" ]; then
> +	echo "PowerNV machine does not support KVM. ACCEL=tcg must be specified."
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
> +if [[ "$MACHINE" == "pseries"* ]] ; then
> +	B+="-bios $FIRMWARE"
> +fi
> +
> +D=""
> +if [[ "$MACHINE" == "powernv"* ]] ; then
> +	D+="-device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10"
> +fi
> +
> +command="$qemu -nodefaults $M $B $D"
>   command+=" -display none -serial stdio -kernel"
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   

