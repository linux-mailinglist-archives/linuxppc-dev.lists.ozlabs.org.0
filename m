Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33617B33E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:57:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTjz2ZHBzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3W1p1fzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3S1cFqz9sSm; Fri,  6 Mar 2020 11:27:47 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: fcdb524d440d6326c286006e16f252b40ba4fd6a
In-Reply-To: <20200214080606.26872-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/kernel/sysfs: Refactor current sysfs.c
Message-Id: <48YT3S1cFqz9sSm@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:47 +1100 (AEDT)
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
Cc: nasastry@in.ibm.com, kjain@linux.ibm.com,
 Madhavan Srinivasan <maddy@linux.ibm.com>, maddy@linux.vnet.ibm.com,
 anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-02-14 at 08:06:05 UTC, Kajol Jain wrote:
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
> 
> An attempt to refactor the current sysfs.c file.
> To start with a big chuck of macro #defines and dscr
> functions are moved to start of the file. Secondly,
> HAS_ #define macros are cleanup based on CONFIG_ options
> 
> Finally new HAS_ macro added:
> 1. HAS_PPC_PA6T (for PA6T) to separate out non-PMU SPRs.
> 2. HAS_PPC_PMC56 to separate out PMC SPR's from HAS_PPC_PMC_CLASSIC
>    which come under CONFIG_PPC64.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/fcdb524d440d6326c286006e16f252b40ba4fd6a

cheers
