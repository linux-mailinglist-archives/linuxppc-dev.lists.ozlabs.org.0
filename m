Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E940190535
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:31:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mfxm1H0DzDqyp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:31:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mfrm1dg1zDqxH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:27:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TtOjXcRf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mfrl0ZQCz9sQt;
 Tue, 24 Mar 2020 16:27:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585027639;
 bh=xWkRsJg9JoCxEBQ7l5A2tPM6SVV9uJeZLe7h8Jgld7E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TtOjXcRfwLyozpL1dulD+knVCZMWdcJS0Z2mOuBLmNkpxijjPt1Wsgyirzrf61t0O
 2PxirqMwTSf+W1ZvtwBUCDgwkrYkWfOf+a0Vkqj02Mb+ifGC15rXPYXchBT0tOK/gu
 Kx55GbZMG5+jq7xDDnwLoA6LS/Rzo2BrGSYTcWYekaVMfj9icFaNHky30fZJAxeADt
 mu28BjzRq+lBBr0/pCEO/gOYg9kWIuY2FoFQLcyaYMQgzs4gCM92JuTfdMV238vEKT
 0JOF6KS9Wa8C8ZhVhPau9G5erpC+reEdarp3eYs5/5APZCPH4YXjNuWxeavbWAnh9P
 99uetRQH6yb9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/pseries: Handle UE event for memcpy_mcsafe
In-Reply-To: <20200322160525.7624-1-ganeshgr@linux.ibm.com>
References: <20200322160525.7624-1-ganeshgr@linux.ibm.com>
Date: Tue, 24 Mar 2020 16:27:24 +1100
Message-ID: <87pnd2xqyr.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, santosh@fossix.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> If we hit UE at an instruction with a fixup entry, flag to
> ignore the event and set nip to continue execution at the
> fixup entry.

You don't explain why we would want to do that. Or what the consequences
are if we *don't* do it.

As such it's unclear if this is an important fix or just a nice-to-have.

> For powernv these changes are already made by
> commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")

We have masses of code that supposedly abstracts the MCE logic. How did
we end up in the situation where we're having to write the same fix
twice for different platforms?

cheers

> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Reviewed-by: Santosh S <santosh@fossix.org>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> V2: Fixes a trivial checkpatch error in commit msg.
> V3: Use proper subject prefix.
> ---
>  arch/powerpc/platforms/pseries/ras.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 43710b69e09e..58e2483fbb1a 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/reboot.h>
>  #include <linux/irq_work.h>
> +#include <linux/extable.h>
>  
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
> @@ -505,6 +506,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  	int initiator = rtas_error_initiator(errp);
>  	int severity = rtas_error_severity(errp);
>  	u8 error_type, err_sub_type;
> +	const struct exception_table_entry *entry;
>  
>  	if (initiator == RTAS_INITIATOR_UNKNOWN)
>  		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
> @@ -558,6 +560,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  	switch (mce_log->error_type) {
>  	case MC_ERROR_TYPE_UE:
>  		mce_err.error_type = MCE_ERROR_TYPE_UE;
> +		entry = search_kernel_exception_table(regs->nip);
> +		if (entry) {
> +			mce_err.ignore_event = true;
> +			regs->nip = extable_fixup(entry);
> +			disposition = RTAS_DISP_FULLY_RECOVERED;
> +		}
>  		switch (err_sub_type) {
>  		case MC_ERROR_UE_IFETCH:
>  			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
> -- 
> 2.17.2
