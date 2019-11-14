Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A9FC25C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:11:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DG1x6pg1zDrdk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxM715BzF4ln
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxM5mVHz9sNT; Thu, 14 Nov 2019 20:07:35 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 4e706af3cd8e1d0503c25332b30cad33c97ed442
In-Reply-To: <20190502210907.42375-1-gwalbon@linux.ibm.com>
To: Gustavo Walbon <gwalbon@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] Fix wrong message when RFI Flush is disable
Message-Id: <47DFxM5mVHz9sNT@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:35 +1100 (AEDT)
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
Cc: mikey@neuling.org, maurosr@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, diana.craciun@nxp.com, paulus@samba.org, leitao@debian.org,
 msuchanek@suse.de, gwalbon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-02 at 21:09:07 UTC, Gustavo Walbon wrote:
> From: "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>
> 
> The issue was showing "Mitigation" message via sysfs whatever the state of
> "RFI Flush", but it should show "Vulnerable" when it is disabled.
> 
> If you have "L1D private" feature enabled and not "RFI Flush" you are
> vulnerable to meltdown attacks.
> 
> "RFI Flush" is the key feature to mitigate the meltdown whatever the
> "L1D private" state.
> 
> SEC_FTR_L1D_THREAD_PRIV is a feature for Power9 only.
> 
> So the message should be as the truth table shows.
> CPU | L1D private | RFI Flush |                   sysfs               |
> ----| ----------- | --------- | ------------------------------------- |
>  P9 |    False    |   False   | Vulnerable
>  P9 |    False    |   True    | Mitigation: RFI Flush
>  P9 |    True     |   False   | Vulnerable: L1D private per thread
>  P9 |    True     |   True    | Mitigation: RFI Flush, L1D private per
>     |             |           | thread
>  P8 |    False    |   False   | Vulnerable
>  P8 |    False    |   True    | Mitigation: RFI Flush
> 
> Output before this fix:
>  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
>  Mitigation: RFI Flush, L1D private per thread
>  # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
>  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
>  Mitigation: L1D private per thread
> 
> Output after fix:
>  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
>  Mitigation: RFI Flush, L1D private per thread
>  # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
>  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
>  Vulnerable: L1D private per thread
> 
> Link: https://github.com/linuxppc/issues/issues/243
> 
> Signed-off-by: Gustavo L. F. Walbon <gwalbon@linux.ibm.com>
> Signed-off-by: Mauro S. M. Rodrigues <maurosr@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4e706af3cd8e1d0503c25332b30cad33c97ed442

cheers
