Return-Path: <linuxppc-dev+bounces-14128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D87C52C92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 15:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d65mW6Vrqz2yvJ;
	Thu, 13 Nov 2025 01:45:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762958731;
	cv=none; b=BhQZfoiP4Tp41igt4pWkRwUXG22V8jJS5HiyIlUGM0fFJkBNFOhwgzVgepnF4Ac4hH94fi4KxjXi3eEzXu9iJTzyrMBAI1NgI3APCCf9BpZ3jGrVWRcdUclLgUHC6COgF86yCj2L+RTYp9FE/zSqOZ4xakmXfKFGiDOh3m/hVjiRTjC6iW5FD2ICaJy82skwtoA5K2NaEXSTfhUIoLwUWUNdF3FLsmmq1jbkOVht2aJoynkA/TEzkSIZPDDwZnwgc2jyYx55rglcwujr34enyFPvadQeB9KLNLjC5WQey/zntPcZE28h6IPRf8qpZ8b9TlmXOpFD8n+xrcArayjNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762958731; c=relaxed/relaxed;
	bh=bZvV6yp/BmWEdm2JPnMcNw7vKdM1hFdJtxfvRqNTrNA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=GGVmW3mS/Z0XZR6IIG2txrHf6OHrWSSrAljA7QHYshkDF7vlXRL3araTWjM8WxF0zC/qKlxn/ptd3xqBrRCIBq0B4Xk+3gavoVqkj78n143DW4Nx8IPCeBfcV2GhK/b93xwKVYudyQHH1GZ/htRH9e4+L8BGRqHL79jCgPnWRmOducvh5WLxxP9yD4At7AtO4VaScNI/n2R/Wo/24zgQWqZAVki7ap57fs7oJF5qmCxTZ3qLY5XRwWX/syIZhbhqqHCX9ohbVsypxGIXAeEGEA7WoIDEx7h1an0+gZTzxdT58YK6YBDHIa/fzuZ/r3C3LMf3k1xSk/ImguC3wVlw2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bG56vJ9Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bG56vJ9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d65mV4mJJz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 01:45:29 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4eba225b039so590661cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762958726; x=1763563526; darn=lists.ozlabs.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZvV6yp/BmWEdm2JPnMcNw7vKdM1hFdJtxfvRqNTrNA=;
        b=bG56vJ9Zuh1PaY5l2/dNcsDRmkgkzAqWrQvXTrPZ25l7G30BfbhzZPaWrSODtzlSuj
         ofg1hXa5T3gp0fqwGTw97Jd7ZaIgKlb9dKXb7G7d2fjpPoSnZiBVPKdTeIDFhIVCB3od
         ujb9dwBsNDfCePy3zri8n8trLaiHHbyRllj/VhIGiR/DBpfI9LIqf0J27mWT2vIAqGm1
         q125k/v5ycudCOps71qRHNeaMn0q51dXdpHLy0Spufr1x8rIkx3ExpPHAHebI7JkhVT8
         nfGlHm7UZ49Y8xd/8LcBDaF5E4+T4Z1V4CYN5Qxy3YTUC8xx2cj66bER9u3Kcn5ovdLN
         K3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958726; x=1763563526;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZvV6yp/BmWEdm2JPnMcNw7vKdM1hFdJtxfvRqNTrNA=;
        b=vdnmvp//IvW6QCGsb4yym+GQunEcRiM30Cs7fWtf2Dmu9UX9aTTLwpux8nt0I8JN6C
         sps57eUUoLBdVUS++uOtRE0lZWGxf+s8JfZCsFe4bpKVFuueEfOxrY3KwzVyjfCX5McS
         e8cyKhZCbD99pfG4LzWVaPVxwcuyQvKY/5TdgYHobix8C5CxoUqjo3xebQMx94X2JFXF
         MU6eoL8d5bVREBAY37EIMi097nfZ/62qDo8UrDhU4aKwWU80kTMNAVdIFVWEOiX9r4Y6
         oJb9qhkeAay98nL4PInhjxGyVE3fufwzJ9suDtpInSXf9aewuan3+vcmI3ctd5+WKz7d
         pbKA==
X-Gm-Message-State: AOJu0YxFxAplJpNX9zgux+iHHMmQW+cFnlsdl5TaaFzWJZLIgsSGrFf1
	t/crsLX8A8xcMhTlykKEhpbtvCjvSlxsHaaBbVTHahgMQS4hNR0YVIMOKZLSfw==
X-Gm-Gg: ASbGncsqoW/i2HhpRiXrl2qoZQKfTCSnxh4m2vsjJW6KpmMr32Bgvzkd0/BnklOsL7o
	iDNlnzGzW3z8KYUxUHDGsalUOnWCmVa0+JpugiZIeKwkMwX7kAARmZWtBLu/C7rjN5QUi0v/Yz0
	ZIaqNRCQ36XHW+6nUStp1e25i7zSeCwB1M4h/uphPlS3LvCsDS5TyH54BIv2cbWpLCo+ZSocBta
	JkmVV7++vM0u3/eO51teaaRqS/e6YSyl1Ptxwaao/JZ5sgDUIfzf7sIgvyEcZ/01hw91CLQODiM
	CzOmJfJyjCXm+X11TmYFe9EXwUsRvJnlL+ZnLeR7bp6C/Mqqgrwa6V1VQZCm7coNEQsU5WSmwUP
	AUY53GN/3Kv9e172jBkjqLPZN3eHv7hnnkjIJogefzflcePonCTpxnJUAS9+dBNLGLJvNqDsu62
	Z3rBKP/vhvc0zu/jfcIIseAk+DULAYj45lqg3RWDE5lmHwEA==
X-Google-Smtp-Source: AGHT+IH4csBCBi5dFGdd8NhRihzPydM5RIi1sq0rt6BuIZBCaEFn+cGaJmGz9jbq6MW7oGRA2pjrFQ==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr26551121cf.5.1762958725774;
        Wed, 12 Nov 2025 06:45:25 -0800 (PST)
Received: from smtpclient.apple (ec2-3-87-7-19.compute-1.amazonaws.com. [3.87.7.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b75896sm92293996d6.49.2025.11.12.06.45.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:45:25 -0800 (PST)
From: Mohammad Amin Nili <manili.devteam@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: =?utf-8?Q?=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Kernel_ha?=
 =?utf-8?Q?lts_after_Radix_MMU_init_on_booting_Linux_on_Zynq_version_of_Mi?=
 =?utf-8?Q?crowatt?=
Message-Id: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
Date: Wed, 12 Nov 2025 09:45:22 -0500
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.120.0.1.15)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear PPC64 Kernel Developers,

Hi all,

I'm trying to redo the Microwatt project on my own ZCU104 evaluation =
board
(Zynq US+). The main goal is to expose PS-side peripherals (specifically
the UART0 and LPDDR4 memory) to the PL-side Microwatt via the AXI4 bus =
and
MMIO. For simplicity, I'll call this whole project 'Zynqwatt'.

I successfully managed to boot and execute both `Hello World` and
`MicroPython` on my Zynqwatt. Here's what I've done so far:

1. I removed almost every peripheral except the `XICS` from the `SoC`
   module.
2. I routed all addresses to a `WB2AXI` bridge so that the Zynq's =
PS-side
   memory/MMIO space is completely accessible by the PL-side =
`Microwatt`.
3. I booted up my PS (Arm Cortex-A53) and let the Arm's `FSBL` =
initialize
   almost all of the PS peripherals (e.g. UART, LPDDR4, etc.).
4. I copied my program from the SD card (`Hello World` or `MicroPython`)
   into a fixed location of the PS DRAM using the Arm.
5. I released the `Microwatt` reset signal.
6. I parked the Arm processor.
7. The system worked successfully.

However, booting Linux seems to be a whole different story! Here's what
I've done so far to boot Linux on my Zynqwatt platform:

1. I=E2=80=99ve written a simple **bootloader** that runs on the =
Zynq=E2=80=99s Arm core.
   Its job is to read the kernel image =E2=80=94 =
`dtbImage.microwatt.elf` =E2=80=94 from
   the SD card and relocate it to the proper PS-side memory according to
   the ELF header information.

2. The bootloader **releases the Microwatt reset signal**, and Microwatt
   starts executing a super simple =E2=80=9Chello world=E2=80=9D =
bootloader. This minimal
   program just prints a `Welcome` message and jumps to the kernel start
   address (usually at `0x01700000`). Here is the log of this stage:

```
Zynq MP First Stage Boot Loader=20
Release 2025.1   Nov  9 2025  -  19:22:42
PMU-FW is not running, certain applications may not be supported.
Downloading bootloader to the DRAM...
Successfully downloaded bootloader to the DRAM at 0x20000000!
Downloading Linux ELF file to the DRAM...
Starting ELF read from SD card...
Initializing SDPS driver...
SDPS driver and card initialized successfully.
Reading 7340032 bytes from sector offset 0 to address 0x30000000
ELF file read from SD card successfully.
Successfully downloaded ELF file to the DRAM at 0x30000000!
Extracting Linux ELF file to the DRAM...
Successfully extracted ELF file to the DRAM!
Configuring Microwatt for booting...
Successfully configured Microwatt!
Booting up Microwatt from bootloader at 0x20000000...
--------------------------------------------------


   .oOOo.    =20
 ."      ".=20
 ;  .mw.  ;   Microwatt, it works.
  . '  ' .   =20
   \ || /   =20
    ;..;     =20
    ;..;     =20
    `ww'     =20


Function <my_printf> is located at 0x00001354.
Executing: *(0x01700000) --> 0x480000d0.
Press any key to continue...

```

3. The **kernel wrapper** tries to read the DTB and decompress the =
gzipped
   kernel into `0x00000000`:

```
zImage starting: loaded at 0x0000000001700000 (sp: 0x0000000001b1beb0)
Allocating 0x16c5144 bytes for kernel...
Decompressing (0x0000000000000000 <- =
0x0000000001714000:0x0000000001b19fa2)...
Done! Decompressed 0x16c5144 bytes

Linux/PowerPC load: earlycon earlyprintk debug loglevel=3D9
Finalizing device tree... flat tree at 0x1b1cc80
```

4. The kernel successfully decompresses and hands control over to
   `arch/powerpc/kernel/head_64.S`. This is exactly where I=E2=80=99m =
stuck. Here=E2=80=99s
   the relevant log output:

```
Linux/PowerPC load: earlycon earlyprintk debug loglevel=3D9
Finalizing device tree... flat tree at 0x1b1cc80
[    0.000000] printk: legacy bootconsole [udbg0] enabled
[    0.000000] ioremap() called early from of_setup_earlycon+0xd0/0x2d4. =
Use early_ioremap() instead
[    0.000000] earlycon: earlycon_map: Couldn't map 0x00000000ff000000
[    0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000 (options '')
[    0.000000] printk: legacy bootconsole [cdns0] enabled
[    0.000000] dt-cpu-ftrs: setup for ISA 3100
[    0.000000] dt-cpu-ftrs: final cpu/mmu features =3D =
0x00040083800bb181 0x20005040
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000001800000 =
with 2.00 MiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000001800000-0x0000000010000000 =
with 2.00 MiB pages
[    0.000000] radix-mmu: Initializing Radix MMU
```

NOTE: As you know, the `earlycon` driver depends on calling `ioremap`
in `drivers/tty/serial/earlycon.c:L47` to get the virtual address of its
`mapbase/membase`, which is later used by the main console driver (e.g.
`cdns,uart-r1p12`). During the very early boot phase, `ioremap` returns
`0x00000000` because it is called before `early_init_mmu` and
`early_ioremap_setup` in the `early_setup` of
`arch/powerpc/kernel/setup_64.S`.

For debugging purposes, I hardcoded it to return the **physical =
address**
`0xFF000000` =E2=80=94 which corresponds to the Zynq PS-side UART0.

5. =46rom what I can tell, **the system crashes or loses console output
immediately after the MMU is activated** =E2=80=94 specifically right =
after the
call to `RFI_TO_KERNEL` in `arch/powerpc/kernel/head_64.S:L1019`.

6. To test my assumption, I tried **disabling the MMU** by inserting the
following lines around `head_64.S:L1019`:

```
	LOAD_REG_ADDR(r3, start_here_common)
	ld	r4,PACAKMSR(r13)
//*****************************************************
	li	r5, -49
	and	r4, r4, r5
//*****************************************************
	mtspr	SPRN_SRR0,r3
	mtspr	SPRN_SRR1,r4
	RFI_TO_KERNEL
	b	.	/* prevent speculative execution */
```

The result was:

```
[    0.000000] printk: legacy bootconsole [udbg0] enabled
[    0.000000] ioremap() called early from earlycon_map+0x20/0x6c. Use =
early_ioremap() instead
[    0.000000] earlycon: earlycon_map: Couldn't map 0x00000000ff000000
[    0.000000] earlycon: Temporarily mapped it to 0x00000000ff000000
[    0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000 (options '')
[    0.000000] printk: legacy bootconsole [cdns0] enabled
[    0.000000] dt-cpu-ftrs: setup for ISA 3100
[    0.000000] dt-cpu-ftrs: final cpu/mmu features =3D =
0x00040083800bb181 0x20005040
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000001800000 =
with 2.00 MiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000001800000-0x0000000010000000 =
with 2.00 MiB pages
[    0.000000] radix-mmu: Initializing Radix MMU
[    0.000000] Linux version 6.18.0-rc3-00007-gfd57572253bc-dirty =
(manili@manili) (powerpc64le-linux-gcc.br_real (Buildroot =
2021.11-18033-g83947c7bb6) 14.3.0, GNU ld (GNU Binutils) 2.43.1) #124 =
Sun Nov  9 23:46:11 EST 2025
[    0.000000] Hardware name: microwatt Microwatt 0x630000 microwatt
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     =3D 0x10000000
[    0.000000] dcache_bsize      =3D 0x40
[    0.000000] icache_bsize      =3D 0x40
[    0.000000] cpu_features      =3D 0x00040083800bb181
[    0.000000]   possible        =3D 0x003ffbebcb5fb185
[    0.000000]   always          =3D 0x0000000380008181
[    0.000000] cpu_user_features =3D 0xcc002102 0x8c940000
[    0.000000] mmu_features      =3D 0x20005040
[    0.000000] firmware_features =3D 0x0000000000000000
[    0.000000] vmalloc start     =3D 0xc008000000000000
[    0.000000] IO start          =3D 0xc00a000000000000
[    0.000000] vmemmap start     =3D 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 100 locations
[    0.000000] Top of RAM: 0x10000000, Total RAM: 0x10000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem =
0x0000000000000000-0x000000000fffffff]
```

So unlike the previous logs, it looks like the kernel continues the boot
process after `radix-mmu: Initializing Radix MMU`, but this time halts =
at
`Initmem setup...` because the MMU is off (I guess).

7. Here=E2=80=99s my current DTS configuration. I=E2=80=99ve kept it as =
**simple and close
to Microwatt=E2=80=99s default** as possible:

```
/dts-v1/;
#include <dt-bindings/gpio/gpio.h>

/ {
	#size-cells =3D <0x02>;
	#address-cells =3D <0x02>;
	model =3D "microwatt";
	compatible =3D "microwatt-soc";

	aliases {
		serial0 =3D &UART0;
	};

	reserved-memory {
		#size-cells =3D <0x02>;
		#address-cells =3D <0x02>;
		ranges;
	};

	memory@0 {
		device_type =3D "memory";
		reg =3D <0x00000000 0x00000000 0x00000000 0x10000000>;
	};

	clocks {
		sys_clk: litex_sys_clk {
			#clock-cells =3D <0>;
			compatible =3D "fixed-clock";
			clock-frequency =3D <100000000>;
		};
	};

	cpus {
		#size-cells =3D <0x00>;
		#address-cells =3D <0x01>;

		ibm,powerpc-cpu-features {
			display-name =3D "Microwatt";
			isa =3D <3100>;
			device_type =3D "cpu-features";
			compatible =3D "ibm,powerpc-cpu-features";

			mmu-radix {
				isa =3D <3000>;
				usable-privilege =3D <6>;
				os-support =3D <0>;
			};

			little-endian {
				isa =3D <0>;
				usable-privilege =3D <7>;
				os-support =3D <0>;
				hwcap-bit-nr =3D <1>;
			};

			cache-inhibited-large-page {
				isa =3D <0>;
				usable-privilege =3D <6>;
				os-support =3D <0>;
			};

			fixed-point-v3 {
				isa =3D <3000>;
				usable-privilege =3D <7>;
			};

			no-execute {
				isa =3D <0x00>;
				usable-privilege =3D <2>;
				os-support =3D <0>;
			};

			floating-point {
				hfscr-bit-nr =3D <0>;
				hwcap-bit-nr =3D <27>;
				isa =3D <0>;
				usable-privilege =3D <7>;
				hv-support =3D <1>;
				os-support =3D <0>;
			};

			prefixed-instructions {
				hfscr-bit-nr =3D <13>;
				fscr-bit-nr =3D <13>;
				isa =3D <3010>;
				usable-privilege =3D <7>;
				os-support =3D <1>;
				hv-support =3D <1>;
			};

			tar {
				hfscr-bit-nr =3D <8>;
				fscr-bit-nr =3D <8>;
				isa =3D <2070>;
				usable-privilege =3D <7>;
				os-support =3D <1>;
				hv-support =3D <1>;
				hwcap-bit-nr =3D <58>;
			};

			control-register {
				isa =3D <0>;
				usable-privilege =3D <7>;
			};

			system-call-vectored {
				isa =3D <3000>;
				usable-privilege =3D <7>;
				os-support =3D <1>;
				fscr-bit-nr =3D <12>;
				hwcap-bit-nr =3D <52>;
			};
		};

		PowerPC,Microwatt@0 {
			i-cache-sets =3D <2>;
			ibm,dec-bits =3D <64>;
			reservation-granule-size =3D <64>;
			clock-frequency =3D <100000000>;
			timebase-frequency =3D <100000000>;
			i-tlb-sets =3D <1>;
			ibm,ppc-interrupt-server#s =3D <0>;
			i-cache-block-size =3D <64>;
			d-cache-block-size =3D <64>;
			d-cache-sets =3D <2>;
			i-tlb-size =3D <64>;
			cpu-version =3D <0x990000>;
			status =3D "okay";
			i-cache-size =3D <0x1000>;
			ibm,processor-radix-AP-encodings =3D <0x0c =
0xa0000010 0x20000015 0x4000001e>;
			tlb-size =3D <0>;
			tlb-sets =3D <0>;
			device_type =3D "cpu";
			d-tlb-size =3D <128>;
			d-tlb-sets =3D <2>;
			reg =3D <0>;
			general-purpose;
			64-bit;
			d-cache-size =3D <0x1000>;
			ibm,chip-id =3D <0>;
			ibm,mmu-lpid-bits =3D <12>;
			ibm,mmu-pid-bits =3D <20>;
		};
	};

	soc {
		compatible =3D "simple-bus";
		#address-cells =3D <0x02>;
		#size-cells =3D <0x02>;
		ranges;

		interrupt-controller@c0004000 {
			compatible =3D "openpower,xics-presentation", =
"ibm,ppc-xicp";
			ibm,interrupt-server-ranges =3D <0x0 0x1>;
			reg =3D <0x0 0xc0004000 0x0 0x10>;
		};

		ICS: interrupt-controller@c0005000 {
			compatible =3D "openpower,xics-sources";
			interrupt-controller;
			interrupt-ranges =3D <0x10 0x10>;
			reg =3D <0x0 0xc0005000 0x0 0x100>;
			#address-cells =3D <0>;
			#size-cells =3D <0>;
			#interrupt-cells =3D <2>;
		};

		UART0: serial@ff000000 {
			device_type =3D "serial";
			compatible =3D "cdns,uart-r1p12";
			reg =3D <0x0 0xff000000 0x0 0x1000>;
			clock-frequency =3D <100000000>;
			current-speed =3D <115200>;
		};
	};

	chosen {
		bootargs =3D "earlycon earlyprintk debug loglevel=3D9";
		ibm,architecture-vec-5 =3D [19 00 10 00 00 00 00 00 00 =
00 00 00 00 00 00 00
					  00 00 00 00 00 00 00 00 40 00 =
40];
		stdout-path =3D &UART0;
	};
};
```

So, why is the MMU preventing the kernel from booting properly =E2=80=94 =
or at
least stopping the UART driver from accessing its mapped address at
`0xFF000000`? Could this be an issue specific to the **Cadence/Xilinx =
UART
driver**? Or am I missing something fundamental about how the MMU should
be configured in this setup?

Let me know if you need any other sources or data to share. I=E2=80=99ve =
tried
everything I can think of but still cannot figure out what=E2=80=99s =
wrong with my
kernel porting process. Any help would be much appreciated.

Bests, =20
Manili=

