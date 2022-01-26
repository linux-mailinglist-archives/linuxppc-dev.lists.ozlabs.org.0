Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED249CE0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 16:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkSCh1y8Vz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 02:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1123 seconds by postgrey-1.36 at boromir;
 Thu, 27 Jan 2022 02:22:44 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkSC86LkVz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 02:22:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 100C2DA2FBA9;
 Wed, 26 Jan 2022 16:03:53 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 16:03:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b3672a58-b76e-4071-81b6-fd5eea322dc7,
 98CE5217A5203725B09B15E66DA88D7242EF3032) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cf6ac499-4190-cbe5-255c-f9edf07a4786@kaod.org>
Date: Wed, 26 Jan 2022 16:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Nicholas Piggin <npiggin@gmail.com>
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1b7176c1-4070-4d1e-8970-656bb3e91524
X-Ovh-Tracer-Id: 7122442813882403808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfedugdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtjeeffedvvedtffevjeeitdejgeeiueejhfffkeffgeeghedvleffuedvjeeftdenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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

On 1/26/22 15:16, Miguel Ojeda wrote:
> Hi PPC folks,
> 
> Our ppc64le CI deterministically triggers a hard lockup / hang under
> QEMU since v5.17-rc1 (upgrading from v5.16).
> 
> Bisecting points to 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable
> MSR[EE] in irq handlers unless perf is in use").

Indeed. I could reproduce.

Could you please send the QEMU command line and the full dmesg ? and
possibly open an issue on :

   https://gitlab.com/qemu-project/qemu/-/issues/

I guess it's a QEMU modeling issue.

Thanks,

C.


> 
> Cheers,
> Miguel
> 
> [   16.328310] watchdog: CPU 1 detected hard LOCKUP on other CPUs 0
> [   16.328955] watchdog: CPU 1 TB:16743325700, last SMP heartbeat
> TB:8453096925 (16191ms ago)
> [   16.330786] watchdog: CPU 0 Hard LOCKUP
> [   16.331078] watchdog: CPU 0 TB:16744720354, last heartbeat
> TB:8453109168 (16194ms ago)
> [   16.331295] Kernel panic - not syncing: Hard LOCKUP
> [   16.331312] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc2+ #28
> [   16.331729] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.16.0-rc2+ #28
> [   16.332294] NIP:  c000000000009784 LR: c00000000034ee60 CTR: c0000000000096e0
> [   16.332339] REGS: c00000001ff87d60 TRAP: 0100   Not tainted  (5.16.0-rc2+)
> [   16.332410] MSR:  8000000000001031 <SF
> [   16.332520] Call Trace:
> [   16.334429] ,ME,IR,DR,LE>  CR: 24000088  XER: 20040000
> [   16.334770] CFAR: c00000000000977c IRQMASK: 3
> [   16.334770] GPR00: c00000000034ee60 c00000000111f590
> c00000000111f400 0000000000008002
> [   16.334770] GPR04: 0000000000000001 c00000000113f400
> c00000000106f400 c00000000110f400
> [   16.334770] GPR08: c0000000003af400 0000000024000088
> c00000000111f8a0 c000000000011d00
> [   16.334770] GPR12: 8000000000009033 c0000000011d0000
> 0000000000000000 0000000000000000
> [   16.334770] GPR16: c00000000110ab90 c0000000010722f0
> c000000001142100 0000000000000001
> [   16.334770] GPR20: 0000000000000000 000000000000000a
> ffffffff00049233 c0000000010722a8
> [   16.334770] GPR24: 0000000000000282 c000000001076580
> c000000001143a00 0000000004200002
> [   16.334770] GPR28: c0000000010b0480 c0000000010722a8
> c0000000003b6cfa 00000000015e0000
> [   16.334464] [c0000000062675c0] [c0000000003283e0] dump_stack_lvl+0x78/0xb8
> [   16.335274] NIP [c000000000009784] decrementer_common_virt+0xa4/0x210
> [   16.336451]  (unreliable)
> [   16.335629] LR [c00000000034ee60] __do_softirq+0xe0/0x2c4
> [   16.336658] [c000000006267600] [c00000000009378c] panic+0x150/0x3a4
> [   16.336797] Call Trace:
> [   16.337294]
> [   16.336809] [c00000000111f590] [c00000000000c6d8]
> interrupt_return_srr_kernel+0x8/0xec (unreliable)
> [   16.337615] [c00000000111f8a0] [c0000000000d2b24]
> trigger_load_balance+0x94/0x480
> [   16.337863] [c00000000111f8d0] [c00000000034ee60] __do_softirq+0xe0/0x2c4
> [   16.338079] [c00000000111f9c0] [c00000000009b018] irq_exit+0xa8/0x130
> [   16.338225] [c00000000111fa00] [c00000000001b590] timer_interrupt+0x1b0/0x200
> [   16.338496] [c00000000111fa60] [c0000000000098e8]
> decrementer_common_virt+0x208/0x210
> [   16.338803] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> [   16.339089] NIP:  c000000000072a48 LR: c000000000074d04 CTR: c000000000074c60
> [   16.339103] REGS: c00000000111fad0 TRAP: 0900   Not tainted  (5.16.0-rc2+)
> [   16.339117] MSR:  8000000002009033 <SF,VEC,EE,ME
> [   16.337355] [c0000000062676b0] [c000000000092d78] nmi_panic+0x78/0x90
> [   16.339231] ,IR,DR,RI,LE>  CR: 22000888  XER: 00000000
> [   16.339354] CFAR: c000000000074d00 IRQMASK: 0
> [   16.339354] GPR00: 0000000022000888
> [   16.340017]
> [   16.340120] [c000000006267710] [c000000000027650]
> watchdog_smp_panic+0x420/0x4e0
> [   16.340441] [c000000006267800] [c00000000002717c]
> watchdog_timer_fn+0xac/0x160
> [   16.340804] c00000000111fd70 c00000000111f400
> [   16.340715] [c000000006267840] [c0000000001202d8] __run_hrtimer+0xc8/0x190
> [   16.341234] 0000000000000000
> [   16.341234] GPR04: 0000000000000001 c00000000106f400
> 0000000000000000 0000000001f40000
> [   16.341234] GPR08: 001908b100000000 00000000000002ea
> 0000000000000000 000000000000006b
> [   16.341234] GPR12: c000000000074c60 c0000000011d0000
> 0000000000000000 0000000000000000
> [   16.341234] GPR16: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   16.341234] GPR20: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   16.341234] GPR24:
> [   16.341779]
> [   16.342182] c00000000113f400 0000000000000001 c000000001145928
> 0000000000000001
> [   16.342182] GPR28: c0000000010717a0 c000000001071798
> c0000000010b0480 00000000015e0000
> [   16.342160] [c000000006267890] [c00000000011f300]
> hrtimer_run_queues+0x150/0x1c0
> [   16.342276] NIP [c000000000072a48] plpar_hcall_norets_notrace+0x18/0x2c
> [   16.342783]
> [   16.342820] [c000000006267910] [c00000000011cf58]
> update_process_times+0x88/0x110
> [   16.343127] [c000000006267960] [c00000000012dbc8]
> tick_nohz_handler+0xd8/0x150
> [   16.344080] [c0000000062679a0] [c00000000001b570] timer_interrupt+0x190/0x200
> [   16.344439] [c000000006267a00] [c0000000000098e8]
> decrementer_common_virt+0x208/0x210
> [   16.342542] LR [c000000000074d04] pseries_lpar_idle+0xa4/0x160
> [   16.347000] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> [   16.347224] --- interrupt: 900
> [   16.347525] NIP:  c000000000072a48 LR: c000000000074d04 CTR: c000000000074c60
> [   16.347637] REGS: c000000006267a70 TRAP: 0900   Not tainted  (5.16.0-rc2+)
> [   16.347716] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE
> [   16.347269] [c00000000111fd70] [c00000000111fdc0] .TOC.+0x9c0/0xc00
> [   16.347871] >  CR: 22000048  XER: 00000000
> [   16.347910] CFAR: c000000000074d00 IRQMASK: 0
> [   16.347910] GPR00: 0000000022000048 c000000006267d10
> c00000000111f400 0000000000000000
> [   16.347910] GPR04: 0000000000000001
> [   16.348004]  (unreliable)
> [   16.348331] c00000000106f400 0000000000000800 0000000000007b26
> [   16.348331] GPR08: 0005204180000000 0000000000000000
> 0000000000000000 000000000000002c
> [   16.348331] GPR12: c000000000074c60 c00000001ffe4d00
> [   16.348347] [c00000000111fdf0] [c0000000000179a4] arch_cpu_idle+0x74/0x110
> [   16.348453] c000000001145a28 c00000000118f400
> [   16.348453] GPR16: c000000001070488 c0000000011458d0
> c0000000011458d8 0000000000000001
> [   16.348453] GPR20: c00000000118f400 0000000000000000
> 0000000000000000 0000000000000002
> [   16.348749]
> [   16.349107]
> [   16.349107] GPR24: c00000000113f400 0000000000000002
> c000000001145928 0000000000000001
> [   16.349107] GPR28: c0000000010717a0 c000000001071798
> c0000000061aa200 c00000000003d350
> [   16.349137] [c00000000111fe30] [c00000000034e28c] default_idle_call+0x4c/0x90
> [   16.349398] NIP [c000000000072a48] plpar_hcall_norets_notrace+0x18/0x2c
> [   16.349562]
> [   16.349771] [c00000000111fe50] [c0000000000d0b40] do_idle+0x110/0x1d0
> [   16.349946] [c00000000111feb0] [c0000000000d0c34] cpu_startup_entry+0x34/0x50
> [   16.350175] [c00000000111fee0] [c000000000011180] rest_init+0xe0/0x110
> [   16.350307] [c00000000111ff10] [c0000000010046e8] start_kernel+0x3ac/0x424
> [   16.350910] [c00000000111ff90] [c00000000000d560] start_here_common+0x1c/0x3c
> [   16.351302] Instruction dump:
> [   16.351659] 4182000c 39400001 48000008 894d0932 714a0001 39400008
> 408223b4 718a4000
> [   16.351782] 7c2a0b78 3821fcf0 41c20008 e82d0910 <0981fcf0> f92101a0
> f9610170 f9810178
> [   16.350674] LR [c000000000074d04] pseries_lpar_idle+0xa4/0x160
> [   16.352526] Oops: Unrecoverable System Reset, sig: 6 [#1]
> [   16.353142] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2 pSeries
> [   16.353575] --- interrupt: 900
> [   16.353629] [c000000006267d10] [c0000000000159fc]
> __switch_to+0x1cc/0x290 (unreliable)
> [   16.353954] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc2+ #28
> [   16.353890] [c000000006267d90] [c0000000000179a4] arch_cpu_idle+0x74/0x110
> [   16.354193] NIP:  c000000000009784 LR: c00000000034ee60 CTR: c0000000000096e0
> [   16.354350] REGS: c00000001ff87d60 TRAP: 0100   Not tainted  (5.16.0-rc2+)
> [   16.354497] MSR:  8000000000001031 <SF,ME,IR
> [   16.354351] [c000000006267dd0] [c00000000034e28c] default_idle_call+0x4c/0x90
> [   16.354774] [c000000006267df0] [c0000000000d0b40] do_idle+0x110/0x1d0
> [   16.355001] [c000000006267e50] [c0000000000d0c34] cpu_startup_entry+0x34/0x50
> [   16.355318] [c000000006267e80] [c00000000003e6d0]
> start_secondary+0xc30/0x1060
> [   16.355597] [c000000006267f90] [c00000000000ce54]
> start_secondary_prolog+0x10/0x14
> 

