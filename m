Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB9789E86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 14:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466b3q0R3dzDqJm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 22:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466b1R4SVPzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 22:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 466b1Q0FR7z9sN6;
 Mon, 12 Aug 2019 22:36:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 08/16] powerpc/pseries/svm: Use shared memory for
 LPPACA structures
In-Reply-To: <20190806052237.12525-9-bauerman@linux.ibm.com>
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
 <20190806052237.12525-9-bauerman@linux.ibm.com>
Date: Mon, 12 Aug 2019 22:36:11 +1000
Message-ID: <875zn2sgqs.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>
> LPPACA structures need to be shared with the host. Hence they need to be in
> shared memory. Instead of allocating individual chunks of memory for a
> given structure from memblock, a contiguous chunk of memory is allocated
> and then converted into shared memory. Subsequent allocation requests will
> come from the contiguous chunk which will be always shared memory for all
> structures.
>
> While we are able to use a kmem_cache constructor for the Debug Trace Log,
> LPPACAs are allocated very early in the boot process (before SLUB is
> available) so we need to use a simpler scheme here.
>
> Introduce helper is_svm_platform() which uses the S bit of the MSR to tell
> whether we're running as a secure guest.
>
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/svm.h | 26 ++++++++++++++++++++
>  arch/powerpc/kernel/paca.c     | 43 +++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
> new file mode 100644
> index 000000000000..fef3740f46a6
> --- /dev/null
> +++ b/arch/powerpc/include/asm/svm.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * SVM helper functions
> + *
> + * Copyright 2019 Anshuman Khandual, IBM Corporation.

Are we sure this copyright date is correct?

cheers
