Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4B216323
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 02:48:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B13hf4jTNzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 10:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B13b10D5czDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 10:43:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QUWAF8LC; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B13b00rSmz8tXZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 10:43:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B13Zz6BtTz9sRW; Tue,  7 Jul 2020 10:43:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QUWAF8LC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B13Zz1FkYz9sRR
 for <linuxppc-dev@ozlabs.org>; Tue,  7 Jul 2020 10:43:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594082612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmJ7C85eBCHqi3uCC4lh1tP3/MpQ+1OZkBVEhNoxOsY=;
 b=QUWAF8LCnzJ9c8e1qQ0bzXZXh0CgD2WEjH8GGG0HHpzXnLa5sNJovHUWlpqm2Xudgky9+W
 I7x9+5wKI3yiyliVtgjoUr/Ly6sDRC2XDwacR1dn1B7m/RUKDiVei1OrxQdU5ReYvjf0I7
 7Af28aLGw/QB6sk80P2inDRhfc6aFuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-2DeQi2riNRmXcyNFLYANkA-1; Mon, 06 Jul 2020 20:43:28 -0400
X-MC-Unique: 2DeQi2riNRmXcyNFLYANkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5F1107ACCA;
 Tue,  7 Jul 2020 00:43:26 +0000 (UTC)
Received: from [10.72.8.24] (ovpn-8-24.pek2.redhat.com [10.72.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0145D9F3;
 Tue,  7 Jul 2020 00:43:18 +0000 (UTC)
Subject: Re: [PATCH v2 00/12] ppc64: enable kdump support for kexec_file_load
 syscall
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
From: piliu <piliu@redhat.com>
Message-ID: <4b63d9d1-b460-cfbe-55d1-0944b2e2c743@redhat.com>
Date: Tue, 7 Jul 2020 08:43:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kexec-ml <kexec@lists.infradead.org>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/03/2020 03:53 AM, Hari Bathini wrote:
> This patch series enables kdump support for kexec_file_load system
> call (kexec -s -p) on PPC64. The changes are inspired from kexec-tools
> code but heavily modified for kernel consumption. There is scope to
> expand purgatory to verify sha256 digest along with other improvements
> in purgatory code. Will deal with those changes in a separate patch
> series later.
> 
> The first patch adds a weak arch_kexec_locate_mem_hole() function to
> override locate memory hole logic suiting arch needs. There are some
> special regions in ppc64 which should be avoided while loading buffer
> & there are multiple callers to kexec_add_buffer making it complicated
> to maintain range sanity and using generic lookup at the same time.
> 
> The second patch marks ppc64 specific code within arch/powerpc/kexec
> and arch/powerpc/purgatory to make the subsequent code changes easy
> to understand.
> 
> The next patch adds helper function to setup different memory ranges
> needed for loading kdump kernel, booting into it and exporting the
> crashing kernel's elfcore.
> 
> The fourth patch overrides arch_kexec_locate_mem_hole() function to
> locate memory hole for kdump segments by accounting for the special
> memory regions, referred to as excluded memory ranges, and sets
> kbuf->mem when a suitable memory region is found.
> 
> The fifth patch moves walk_drmem_lmbs() out of .init section with
> a few changes to reuse it for setting up kdump kernel's usable memory
> ranges. The next patch uses walk_drmem_lmbs() to look up the LMBs
> and set linux,drconf-usable-memory & linux,usable-memory properties
> in order to restrict kdump kernel's memory usage.
> 
> The seventh patch adds relocation support for the purgatory. Patch 8
> helps setup the stack for the purgatory. The next patch setups up
> backup region as a segment while loading kdump kernel and teaches
> purgatory to copy it from source to destination.
> 
> Patch 10 builds the elfcore header for the running kernel & passes
> the info to kdump kernel via "elfcorehdr=" parameter to export as
> /proc/vmcore file. The next patch sets up the memory reserve map
> for the kexec kernel and also claims kdump support for kdump as
> all the necessary changes are added.
> 
> The last patch fixes a lookup issue for `kexec -l -s` case when
> memory is reserved for crashkernel.
> 
> Tested the changes successfully on P8, P9 lpars, couple of OpenPOWER
> boxes and a simulator.
> 
> Changes in v2:
> * Introduced arch_kexec_locate_mem_hole() for override and dropped
>   weak arch_kexec_add_buffer().
> * Addressed warnings reported by lkp.
> * Added patch to address kexec load issue when memory is reserved
>   for crashkernel.
> * Used the appropriate license header for the new files added.
> * Added an option to merge ranges to minimize reallocations while
>   adding memory ranges.
> * Dropped within_crashkernel parameter for add_opal_mem_range() &
>   add_rtas_mem_range() functions as it is not really needed.
> 
> ---
> 
> Hari Bathini (12):
>       kexec_file: allow archs to handle special regions while locating memory hole
>       powerpc/kexec_file: mark PPC64 specific code
>       powerpc/kexec_file: add helper functions for getting memory ranges
>       ppc64/kexec_file: avoid stomping memory used by special regions
>       powerpc/drmem: make lmb walk a bit more flexible
>       ppc64/kexec_file: restrict memory usage of kdump kernel
>       ppc64/kexec_file: add support to relocate purgatory
>       ppc64/kexec_file: setup the stack for purgatory
>       ppc64/kexec_file: setup backup region for kdump kernel
>       ppc64/kexec_file: prepare elfcore header for crashing kernel
>       ppc64/kexec_file: add appropriate regions for memory reserve map
>       ppc64/kexec_file: fix kexec load failure with lack of memory hole
> 
> 
>  arch/powerpc/include/asm/crashdump-ppc64.h |   15 
>  arch/powerpc/include/asm/drmem.h           |    9 
>  arch/powerpc/include/asm/kexec.h           |   35 +
>  arch/powerpc/include/asm/kexec_ranges.h    |   18 
>  arch/powerpc/include/asm/purgatory.h       |   11 
>  arch/powerpc/kernel/prom.c                 |   13 
>  arch/powerpc/kexec/Makefile                |    2 
>  arch/powerpc/kexec/elf_64.c                |   35 +
>  arch/powerpc/kexec/file_load.c             |   78 +
>  arch/powerpc/kexec/file_load_64.c          | 1509 ++++++++++++++++++++++++++++
>  arch/powerpc/kexec/ranges.c                |  397 +++++++
>  arch/powerpc/mm/drmem.c                    |   87 +-
>  arch/powerpc/mm/numa.c                     |   13 
>  arch/powerpc/purgatory/Makefile            |   28 -
>  arch/powerpc/purgatory/purgatory_64.c      |   36 +
>  arch/powerpc/purgatory/trampoline.S        |  117 --
>  arch/powerpc/purgatory/trampoline_64.S     |  175 +++
>  include/linux/kexec.h                      |   29 -
>  kernel/kexec_file.c                        |   16 
>  19 files changed, 2413 insertions(+), 210 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
>  create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
>  create mode 100644 arch/powerpc/include/asm/purgatory.h
>  create mode 100644 arch/powerpc/kexec/file_load_64.c
>  create mode 100644 arch/powerpc/kexec/ranges.c
>  create mode 100644 arch/powerpc/purgatory/purgatory_64.c
>  delete mode 100644 arch/powerpc/purgatory/trampoline.S
>  create mode 100644 arch/powerpc/purgatory/trampoline_64.S
> 
Tested-by: Pingfan Liu <piliu@redhat.com>

