Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571E235734
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:51:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMqV2ZkSzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:51:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT343j2zDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BKMT307FTz9sTR; Sun,  2 Aug 2020 23:35:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT23ScKz9sTX; Sun,  2 Aug 2020 23:35:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
Subject: Re: [PATCH v6 00/11] ppc64: enable kdump support for kexec_file_load
 syscall
Message-Id: <159637523806.42190.10916857383137134464.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:02 +1000 (AEST)
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, kernel test robot <lkp@intel.com>,
 Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Dave Young <dyoung@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, lkml <linux-kernel@vger.kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 17:08:44 +0530, Hari Bathini wrote:
> Sorry! There was a gateway issue on my system while posting v5, due to
> which some patches did not make it through. Resending...
> 
> This patch series enables kdump support for kexec_file_load system
> call (kexec -s -p) on PPC64. The changes are inspired from kexec-tools
> code but heavily modified for kernel consumption.
> 
> [...]

Applied to powerpc/next.

[01/11] kexec_file: Allow archs to handle special regions while locating memory hole
        https://git.kernel.org/powerpc/c/f891f19736bdf404845f97d8038054be37160ea8
[02/11] powerpc/kexec_file: Mark PPC64 specific code
        https://git.kernel.org/powerpc/c/19031275a5881233b4fc31b7dee68bf0b0758bbc
[03/11] powerpc/kexec_file: Add helper functions for getting memory ranges
        https://git.kernel.org/powerpc/c/180adfc532a83c1d74146449f7385f767d4b8059
[04/11] powerpc/kexec_file: Avoid stomping memory used by special regions
        https://git.kernel.org/powerpc/c/b8e55a3e5c208862eacded5aad822184f89f85d9
[05/11] powerpc/drmem: Make LMB walk a bit more flexible
        https://git.kernel.org/powerpc/c/adfefc609e55edc5dce18a68d1526af6d70aaf86
[06/11] powerpc/kexec_file: Restrict memory usage of kdump kernel
        https://git.kernel.org/powerpc/c/7c64e21a1c5a5bcd651d895b8faa68e9cdcc433d
[07/11] powerpc/kexec_file: Setup backup region for kdump kernel
        https://git.kernel.org/powerpc/c/1a1cf93c200581c72a3cd521e1e0a1a3b5d0077d
[08/11] powerpc/kexec_file: Prepare elfcore header for crashing kernel
        https://git.kernel.org/powerpc/c/cb350c1f1f867db16725f1bb06be033ece19e998
[09/11] powerpc/kexec_file: Add appropriate regions for memory reserve map
        https://git.kernel.org/powerpc/c/6ecd0163d36049b5f2435a8658f1320c9f3f2924
[10/11] powerpc/kexec_file: Fix kexec load failure with lack of memory hole
        https://git.kernel.org/powerpc/c/b5667d13be8d0928a02b46e0c6f7ab891d32f697
[11/11] powerpc/kexec_file: Enable early kernel OPAL calls
        https://git.kernel.org/powerpc/c/2e6bd221d96fcfd9bd1eed5cd9c008e7959daed7

cheers
