Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007EF261F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 04:47:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477q972YjKzF5y8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 14:47:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477q731DRmzF5wR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 14:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 477q715m7yz9sPT; Thu,  7 Nov 2019 14:45:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 477q7157kFz9sPk; Thu,  7 Nov 2019 14:45:33 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c790c3d2b0ec5979d83451d0688d1cd07e23d8ba
In-Reply-To: <20190520105520.22274-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Add a test of spectre_v2 mitigations
Message-Id: <477q7157kFz9sPk@ozlabs.org>
Date: Thu,  7 Nov 2019 14:45:33 +1100 (AEDT)
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
Cc: naveen.n.rao@linux.ibm.com, anton@samba.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-05-20 at 10:55:20 UTC, Michael Ellerman wrote:
> This test uses the PMU to count branch prediction hits/misses for a
> known loop, and compare the result to the reported spectre v2
> mitigation.
> 
> This gives us a way of sanity checking that the reported mitigation is
> actually in effect.
> 
> Sample output for some cases, eg:
> 
>   Power9:
>     sysfs reports: 'Vulnerable'
>      PM_BR_PRED_CCACHE: result        368 running/enabled 5792777124
>     PM_BR_MPRED_CCACHE: result        319 running/enabled 5792775546
>      PM_BR_PRED_PCACHE: result 2147483281 running/enabled 5792773128
>     PM_BR_MPRED_PCACHE: result  213604201 running/enabled 5792771640
>     Miss percent 9 %
>     OK - Measured branch prediction rates match reported spectre v2 mitigation.
...
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/c790c3d2b0ec5979d83451d0688d1cd07e23d8ba

cheers
