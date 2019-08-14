Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 220528D135
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 12:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467mWS4BZxzDqxd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 20:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467mTl050qzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 467mTk2Bg5z9sDB; Wed, 14 Aug 2019 20:46:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467mTj4qzZz9sNC;
 Wed, 14 Aug 2019 20:46:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 2/7] powerpc/kernel: Add ucall_norets() ultravisor call
 handler
In-Reply-To: <20190808040555.2371-3-cclaudio@linux.ibm.com>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-3-cclaudio@linux.ibm.com>
Date: Wed, 14 Aug 2019 20:46:15 +1000
Message-ID: <87wofgqb2g.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
> new file mode 100644
> index 000000000000..de9133e45d21
> --- /dev/null
> +++ b/arch/powerpc/kernel/ucall.S
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Generic code to perform an ultravisor call.
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#include <asm/ppc_asm.h>
> +#include <asm/export.h>
> +
> +_GLOBAL(ucall_norets)
> +EXPORT_SYMBOL_GPL(ucall_norets)
> +	mfcr	r0
> +	stw	r0,8(r1)
> +
> +	sc	2		/* Invoke the ultravisor */
> +
> +	lwz	r0,8(r1)
> +	mtcrf	0xff,r0
> +	blr			/* Return r3 =3D status */

Paulus points that we shouldn't need to save CR here. Our caller will
have already saved it if it needed to, and we don't use CR in this
function so we don't need to save it.

That's assuming the Ultravisor follows the hcall ABI in which CR2-4 are
non-volatile (PAPR =C2=A7 14.5.3).

I know plpar_hcall_norets() does save CR, but it shouldn't need to, that
seems to be historical. aka. no one knows why it does it but it always
has.

cheers
