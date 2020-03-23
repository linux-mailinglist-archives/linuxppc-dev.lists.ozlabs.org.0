Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0E18F159
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:03:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m7hQ1MrvzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.111.220;
 helo=1.mo179.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo179.mail-out.ovh.net (1.mo179.mail-out.ovh.net
 [178.33.111.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m7d22PXKzDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:00:20 +1100 (AEDT)
Received: from player696.ha.ovh.net (unknown [10.110.171.173])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 596EE15DEAD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 10:00:15 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id 6D7A410BBF40E;
 Mon, 23 Mar 2020 08:59:54 +0000 (UTC)
Subject: Re: [PATCH v8 00/14] powerpc/vas: Page fault handling for user space
 NX requests
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <1584598120.9256.15237.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <90b664f6-7383-08c3-b255-ac157dcd8169@kaod.org>
Date: Mon, 23 Mar 2020 09:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598120.9256.15237.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8835780995880487929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegjedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 7:08 AM, Haren Myneni wrote:
> 
> On power9, Virtual Accelerator Switchboard (VAS) allows user space or
> kernel to communicate with Nest Accelerator (NX) directly using COPY/PASTE
> instructions. NX provides various functionalities such as compression,
> encryption and etc. But only compression (842 and GZIP formats) is
> supported in Linux kernel on power9.
> 
> 842 compression driver (drivers/crypto/nx/nx-842-powernv.c)
> is already included in Linux. Only GZIP support will be available from
> user space.
> 
> Applications can issue GZIP compression / decompression requests to NX with
> COPY/PASTE instructions. When NX is processing these requests, can hit
> fault on the request buffer (not in memory). It issues an interrupt and
> pastes fault CRB in fault FIFO. Expects kernel to handle this fault and
> return credits for both send and fault windows after processing.
> 
> This patch series adds IRQ and fault window setup, and NX fault handling:
> - Alloc IRQ and trigger port address, and configure IRQ per VAS instance.

Is the model similar to OCXL ? 

If so, I suppose that the IRQ for fault handling is allocated by skiboot,
exposed in the DT and automatically mapped in Linux when the driver is
loaded. 

Are there other interrupts ? Such as for job completion ?

Thanks,

C. 

> - Set port# for each window to generate an interrupt when noticed fault.
> - Set fault window and FIFO on which NX paste fault CRB.
> - Setup IRQ thread fault handler per VAS instance.
> - When receiving an interrupt, Read CRBs from fault FIFO and update
>   coprocessor_status_block (CSB) in the corresponding CRB with translation
>   failure (CSB_CC_TRANSLATION). After issuing NX requests, process polls
>   on CSB address. When it sees translation error, can touch the request
>   buffer to bring the page in to memory and reissue NX request.
> - If copy_to_user fails on user space CSB address, OS sends SEGV signal.
> 
> Tested these patches with NX-GZIP support and will be posting this series
> soon.
> 
> Patches 1 & 2: Define alloc IRQ and get port address per chip which are needed
>                to alloc IRQ per VAS instance.
> Patch 3: Define nx_fault_stamp on which NX writes fault status for the fault
>          CRB
> Patch 4: Alloc and setup IRQ and trigger port address for each VAS instance
> Patch 5: Setup fault window per each VAS instance. This window is used for
>          NX to paste fault CRB in FIFO.
> Patches 6 & 7: Setup threaded IRQ per VAS and register NX with fault window
>          ID and port number for each send window so that NX paste fault CRB
>          in this window.
> Patch 8: Reference to pid and mm so that pid is not used until window closed.
>          Needed for multi thread application where child can open a window
>          and can be used by parent later.
> Patches 9 and 10: Process CRBs from fault FIFO and notify tasks by
>          updating CSB or through signals.
> Patches 11 and 12: Return credits for send and fault windows after handling
>         faults.
> Patch 14:Fix closing send window after all credits are returned. This issue
>          happens only for user space requests. No page faults on kernel
>          request buffer.
> 
> Changelog:
> V2:
>   - Use threaded IRQ instead of own kernel thread handler
>   - Use pswid instead of user space CSB address to find valid CRB
>   - Removed unused macros and other changes as suggested by Christoph Hellwig
> 
> V3:
>   - Rebased to 5.5-rc2
>   - Use struct pid * instead of pid_t for vas_window tgid
>   - Code cleanup as suggested by Christoph Hellwig
> 
> V4:
>   - Define xive alloc and get IRQ info based on chip ID and use these
>     functions for IRQ setup per VAS instance. It eliminates skiboot
>     dependency as suggested by Oliver.
> 
> V5:
>   - Do not update CSB if the process is exiting (patch9)
> 
> V6:
>   - Add interrupt handler instead of default one and return IRQ_HANDLED
>     if the fault handling thread is already in progress. (Patch6)
>   - Use platform send window ID and CCW[0] bit to find valid CRB in
>     fault FIFO (Patch6).
>   - Return fault address to user space in BE and other changes as
>     suggested by Michael Neuling. (patch9)
>   - Rebased to 5.6-rc4
> 
> V7:
>   - Fix sparse warnings (patches 6,9 and 10)
> 
> V8:
>   - Move mm_context_remove_copro() before mmdrop() (patch8)
>   - Move barrier before csb.flags store and add WARN_ON_ONCE() checks (patch9)
> 
> Haren Myneni (14):
>   powerpc/xive: Define xive_native_alloc_irq_on_chip()
>   powerpc/xive: Define xive_native_alloc_get_irq_info()
>   powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
>   powerpc/vas: Alloc and setup IRQ and trigger port address
>   powerpc/vas: Setup fault window per VAS instance
>   powerpc/vas: Setup thread IRQ handler per VAS instance
>   powerpc/vas: Register NX with fault window ID and IRQ port value
>   powerpc/vas: Take reference to PID and mm for user space windows
>   powerpc/vas: Update CSB and notify process for fault CRBs
>   powerpc/vas: Print CRB and FIFO values
>   powerpc/vas: Do not use default credits for receive window
>   powerpc/vas: Return credits after handling fault
>   powerpc/vas: Display process stuck message
>   powerpc/vas: Free send window in VAS instance after credits returned
> 
>  arch/powerpc/include/asm/icswx.h            |  18 +-
>  arch/powerpc/include/asm/xive.h             |  11 +-
>  arch/powerpc/platforms/powernv/Makefile     |   2 +-
>  arch/powerpc/platforms/powernv/ocxl.c       |  20 +-
>  arch/powerpc/platforms/powernv/vas-debug.c  |   2 +-
>  arch/powerpc/platforms/powernv/vas-fault.c  | 332 ++++++++++++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-window.c | 185 ++++++++++++++--
>  arch/powerpc/platforms/powernv/vas.c        | 101 ++++++++-
>  arch/powerpc/platforms/powernv/vas.h        |  51 ++++-
>  arch/powerpc/sysdev/xive/native.c           |  29 ++-
>  10 files changed, 704 insertions(+), 47 deletions(-)
>  create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c
> 

