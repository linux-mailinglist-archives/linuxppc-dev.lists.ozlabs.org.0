Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48D17B309
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:39:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTJc0fmkzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3D2QvTzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3C69lmz9sSW; Fri,  6 Mar 2020 11:27:35 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e7214ae9d85aa325c9f3cb34bf4fad7f112861d7
In-Reply-To: <20200129135301.24739-2-srikar@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v6 1/5] powerpc/vphn: Check for error from hcall_vphn
Message-Id: <48YT3C69lmz9sSW@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:35 +1100 (AEDT)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-01-29 at 13:52:57 UTC, Srikar Dronamraju wrote:
> There is no value in unpacking associativity, if
> H_HOME_NODE_ASSOCIATIVITY hcall has returned an error.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e7214ae9d85aa325c9f3cb34bf4fad7f112861d7

cheers
