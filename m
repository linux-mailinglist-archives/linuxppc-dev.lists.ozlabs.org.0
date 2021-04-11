Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4335B256
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ4Gp72Cxz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ4GT1bJ9z2yQt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:07:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJ4GJ1fsmz9ttx3;
 Sun, 11 Apr 2021 10:07:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ljg_kRftYD3T; Sun, 11 Apr 2021 10:07:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJ4GJ0nTvz9ttx2;
 Sun, 11 Apr 2021 10:07:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F05A58B770;
 Sun, 11 Apr 2021 10:07:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LJGONsb_Ell9; Sun, 11 Apr 2021 10:07:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 482B48B75B;
 Sun, 11 Apr 2021 10:07:06 +0200 (CEST)
Subject: Re: [PATCH 00/16] Enable VAS and NX-GZIP support on powerVM
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, mpe@ellerman.id.au,
 herbert@gondor.apana.org.au, npiggin@gmail.com
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bfeef945-5843-074b-a861-af881ae06964@csgroup.eu>
Date: Sun, 11 Apr 2021 10:07:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 11/04/2021 à 02:27, Haren Myneni a écrit :
> 
> This patch series enables VAS / NX-GZIP on powerVM which allows
> the user space to do copy/paste with the same existing interface
> that is available on powerNV.

Can you explain (here and in patch 1 at least) what VAS and NX means ?
Is that Vector Addition System ? Is that Virtual Address Space ?
(https://en.wikipedia.org/wiki/VAS)

> 
> VAS Enablement:
> - Get all VAS capabilities using H_QUERY_VAS_CAPABILITIES that are
>    available in the hypervisor. These capabilities tells OS which
>    type of features (credit types such as Default and Quality of
>    Service (QoS)). Also gives specific capabilities for each credit
>    type: Maximum window credits, Maximum LPAR credits, Target credits
>    in that parition (varies from max LPAR credits based DLPAR
>    operation), whether supports user mode COPY/PASTE and etc.
> - Register LPAR VAS operations such as open window. get paste
>    address and close window with the current VAS user space API.
> - Open window operation - Use H_ALLOCATE_VAS_WINDOW HCALL to open
>    window and H_MODIFY_VAS_WINDOW HCALL to setup the window with LPAR
>    PID and etc.
> - mmap to paste address returned in H_ALLOCATE_VAS_WINDOW HCALL
> - To close window, H_DEALLOCATE_VAS_WINDOW HCALL is used to close in
>    the hypervisor.
> 
> NX Enablement:
> - Get NX capabilities from the the hypervisor which provides Maximum
>    buffer length in a single GZIP request, recommended minimum
>    compression / decompression lengths.
> - Register to VAS to enable user space VAS API
> 
> Main feature differences with powerNV implementation:
> - Each VAS window will be configured with a number of credits which
>    means that many requests can be issues simultaniously on that
>    window. On powerNV, 1K credits are configured per window.
>    Whereas on powerVM, the hypervisor allows 1 credit per window
>    at present.
> - The hypervisor introduced 2 different types of credits: Default -
>    Uses normal priority FIFO and Quality of Service (QoS) - Uses high
>    priority FIFO. On powerVM, VAS/NX HW resources are shared across
>    LPARs. The total number of credits available on a system depends
>    on cores configured. We may see more credits are assigned across
>    the system than the NX HW resources can handle. So to avoid NX HW
>    contention, pHyp introduced QoS credits which can be configured
>    by system administration with HMC API. Then the total number of
>    available default credits on LPAR varies based on QoS credits
>    configured.
> - On powerNV, windows are allocated on a specific VAS instance
>    and the user space can select VAS instance with the open window
>    ioctl. Since VAS instances can be shared across partitions on
>    powerVM, the hypervisor manages window allocations on different
>    VAS instances. So H_ALLOCATE_VAS_WINDOW allows to select by domain
>    indentifiers (H_HOME_NODE_ASSOCIATIVITY values by cpu). By default
>    the hypervisor selects VAS instance closer to CPU resources that the
>    parition uses. So vas_id in ioctl interface is ignored on powerVM
>    except vas_id=-1 which is used to allocate window based on CPU that
>    the process is executing. This option is needed for process affinity
>    to NUMA node.
> 
>    The existing applications that linked with libnxz should work as
>    long as the job request length is restricted to
>    req_max_processed_len.
> 
>    Tested the following patches on P10 successfully with test cases
>    given: https://github.com/libnxz/power-gzip
> 
>    Note: The hypervisor supports user mode NX from p10 onwards. Linux
> 	supports user mode VAS/NX on P10 only with radix page tables.
> 
> Patches 1- 4:   Make the code that is needed for both powerNV and
>                  powerVM to powerpc platform independent.
> Patch5:         Modify vas-window struct to support both and the
>                  related changes.
> Patch 6:        Define HCALL and the related VAS/NXGZIP specific
>                  structs.
> Patch 7:        Define QoS credit flag in window open ioctl
> Patch 8:        Implement Allocate, Modify and Deallocate HCALLs
> Patch 9:        Retrieve VAS capabilities from the hypervisor
> Patch 10;       Implement window operations and integrate with API
> Patch 11:       Setup IRQ and NX fault handling
> Patch 12;       Add sysfs interface to expose VAS capabilities
> Patch 13 - 14:  Make the code common to add NX-GZIP enablement
> Patch 15:       Get NX capabilities from the hypervisor
> patch 16;       Add sysfs interface to expose NX capabilities
> 
> Haren Myneni (16):
>    powerpc/powernv/vas: Rename register/unregister functions
>    powerpc/vas: Make VAS API powerpc platform independent
>    powerpc/vas: Create take/drop task reference functions
>    powerpc/vas: Move update_csb/dump_crb to platform independent
>    powerpc/vas:  Define and use common vas_window struct
>    powerpc/pseries/vas: Define VAS/NXGZIP HCALLs and structs
>    powerpc/vas: Define QoS credit flag to allocate window
>    powerpc/pseries/vas: Implement allocate/modify/deallocate HCALLS
>    powerpc/pseries/vas: Implement to get all capabilities
>    powerpc/pseries/vas: Integrate API with open/close windows
>    powerpc/pseries/vas: Setup IRQ and fault handling
>    powerpc/pseries/vas: sysfs interface to export capabilities
>    crypto/nx: Rename nx-842-pseries file name to nx-common-pseries
>    crypto/nx: Register and unregister VAS interface
>    crypto/nx: Get NX capabilities for GZIP coprocessor type
>    crypto/nx: sysfs interface to export NX capabilities
> 
>   arch/powerpc/Kconfig                          |  15 +
>   arch/powerpc/include/asm/hvcall.h             |   7 +
>   arch/powerpc/include/asm/vas.h                | 122 +++-
>   arch/powerpc/include/uapi/asm/vas-api.h       |   6 +-
>   arch/powerpc/kernel/Makefile                  |   1 +
>   arch/powerpc/kernel/vas-api.c                 | 485 +++++++++++++
>   arch/powerpc/platforms/powernv/Kconfig        |  14 -
>   arch/powerpc/platforms/powernv/Makefile       |   2 +-
>   arch/powerpc/platforms/powernv/vas-api.c      | 278 --------
>   arch/powerpc/platforms/powernv/vas-debug.c    |  12 +-
>   arch/powerpc/platforms/powernv/vas-fault.c    | 155 +---
>   arch/powerpc/platforms/powernv/vas-trace.h    |   6 +-
>   arch/powerpc/platforms/powernv/vas-window.c   | 250 ++++---
>   arch/powerpc/platforms/powernv/vas.h          |  42 +-
>   arch/powerpc/platforms/pseries/Makefile       |   1 +
>   arch/powerpc/platforms/pseries/vas-sysfs.c    | 173 +++++
>   arch/powerpc/platforms/pseries/vas.c          | 674 ++++++++++++++++++
>   arch/powerpc/platforms/pseries/vas.h          |  98 +++
>   drivers/crypto/nx/Makefile                    |   2 +-
>   drivers/crypto/nx/nx-common-powernv.c         |   6 +-
>   .../{nx-842-pseries.c => nx-common-pseries.c} | 135 ++++
>   21 files changed, 1885 insertions(+), 599 deletions(-)
>   create mode 100644 arch/powerpc/kernel/vas-api.c
>   delete mode 100644 arch/powerpc/platforms/powernv/vas-api.c
>   create mode 100644 arch/powerpc/platforms/pseries/vas-sysfs.c
>   create mode 100644 arch/powerpc/platforms/pseries/vas.c
>   create mode 100644 arch/powerpc/platforms/pseries/vas.h
>   rename drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} (90%)
> 
