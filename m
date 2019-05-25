Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD22A230
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 02:57:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459lFs0BWPzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 10:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459lBc6XbQzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 10:54:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 459lBc534sz9sBK; Sat, 25 May 2019 10:54:48 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b59bd3527fe3c1939340df558d7f9d568fc9f882
X-Patchwork-Hint: ignore
In-Reply-To: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv: Return for invalid IMC domain 
Message-Id: <459lBc534sz9sBK@ozlabs.org>
Date: Sat, 25 May 2019 10:54:48 +1000 (AEST)
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
Cc: pavsubra@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-05-20 at 08:57:53 UTC, Anju T Sudhakar wrote:
> Currently init_imc_pmu() can be failed either because
> an IMC unit with invalid domain(i.e an IMC node not
> supported by the kernel) is attempted a pmu-registration
> or something went wrong while registering a valid IMC unit.
> In both the cases kernel provides a 'Registration failed'
> error message.
> 
> Example:
> Log message, when trace-imc node is not supported by the kernel, and the
> skiboot supports trace-imc node.
> 
> So for kernel, trace-imc node is now an unknown domain.
> 
> [    1.731870] nest_phb5_imc performance monitor hardware support registered
> [    1.731944] nest_powerbus0_imc performance monitor hardware support registered
> [    1.734458] thread_imc performance monitor hardware support registered
> [    1.734460] IMC Unknown Device type
> [    1.734462] IMC PMU (null) Register failed
> [    1.734558] nest_xlink0_imc performance monitor hardware support registered
> [    1.734614] nest_xlink1_imc performance monitor hardware support registered
> [    1.734670] nest_xlink2_imc performance monitor hardware support registered
> [    1.747043] Initialise system trusted keyrings
> [    1.747054] Key type blacklist registered
> 
> 
> To avoid ambiguity on the error message, return for invalid domain
> before attempting a pmu registration. 
> 
> Fixes: 8f95faaac56c1 (`powerpc/powernv: Detect and create IMC device`)
> Reported-by: Pavaman Subramaniyam <pavsubra@in.ibm.com>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/b59bd3527fe3c1939340df558d7f9d56

cheers
