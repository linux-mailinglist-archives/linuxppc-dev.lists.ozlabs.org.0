Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4365795
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 15:05:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kx9t3SCzzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 23:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kx0Z182CzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 22:57:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45kx0Y3LhPz9sNT; Thu, 11 Jul 2019 22:57:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45kx0X5VgRz9sNg;
 Thu, 11 Jul 2019 22:57:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v4 2/8] powerpc: Introduce FW_FEATURE_ULTRAVISOR
In-Reply-To: <20190628200825.31049-3-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-3-cclaudio@linux.ibm.com>
Date: Thu, 11 Jul 2019 22:57:15 +1000
Message-ID: <87k1cog250.fsf@concordia.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> new file mode 100644
> index 000000000000..e5009b0d84ea
> --- /dev/null
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Ultravisor definitions
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#ifndef _ASM_POWERPC_ULTRAVISOR_H
> +#define _ASM_POWERPC_ULTRAVISOR_H
> +
> +/* Internal functions */
> +extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
> +					 int depth, void *data);

Please don't use extern in new headers.

> diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
> new file mode 100644
> index 000000000000..dc6021f63c97
> --- /dev/null
> +++ b/arch/powerpc/kernel/ultravisor.c

Is there a reason this (and other later files) aren't in platforms/powernv ?

> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Ultravisor high level interfaces
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#include <linux/init.h>
> +#include <linux/printk.h>
> +#include <linux/string.h>
> +
> +#include <asm/ultravisor.h>
> +#include <asm/firmware.h>
> +
> +int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
> +					 int depth, void *data)
> +{
> +	if (depth != 1 || strcmp(uname, "ibm,ultravisor") != 0)
> +		return 0;

I know you're following the example of OPAL, but this is not the best
way to search for the ultravisor node.

It makes the location and name of the node part of the ABI, when there's
no need for it to be.

If instead you just scan the tree for a node that is *compatible* with
"ibm,ultravisor" (or whatever compatible string) then the node can be
placed any where in the tree and have any name, which gives us the most
flexibility in future to change the location of the device tree node.

cheers
