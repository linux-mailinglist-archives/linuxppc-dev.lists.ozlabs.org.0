Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D42431977F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:35:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcF006KJWzDx2T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf648PSzDwnY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DcDf56g0Jz9sS8; Fri, 12 Feb 2021 11:19:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf54gv9z9sVR; Fri, 12 Feb 2021 11:19:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <161243826811.119001.14083048209224609814.stgit@hbathini>
References: <161243826811.119001.14083048209224609814.stgit@hbathini>
Subject: Re: [PATCH] powerpc/kexec_file: fix FDT size estimation for kdump
 kernel
Message-Id: <161308904153.3606979.2063516658676565641.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:57 +1100 (AEDT)
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, stable@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 04 Feb 2021 17:01:10 +0530, Hari Bathini wrote:
> On systems with large amount of memory, loading kdump kernel through
> kexec_file_load syscall may fail with the below error:
> 
>     "Failed to update fdt with linux,drconf-usable-memory property"
> 
> This happens because the size estimation for kdump kernel's FDT does
> not account for the additional space needed to setup usable memory
> properties. Fix it by accounting for the space needed to include
> linux,usable-memory & linux,drconf-usable-memory properties while
> estimating kdump kernel's FDT size.

Applied to powerpc/next.

[1/1] powerpc/kexec_file: fix FDT size estimation for kdump kernel
      https://git.kernel.org/powerpc/c/2377c92e37fe97bc5b365f55cf60f56dfc4849f5

cheers
