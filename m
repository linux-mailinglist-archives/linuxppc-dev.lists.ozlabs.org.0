Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0826DB08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:05:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbJP6MtDzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:05:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSc0yMrzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSb2cRzz9sTS; Thu, 17 Sep 2020 21:27:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Finn Thain <fthain@telegraphics.com.au>
In-Reply-To: <cover.1599260540.git.fthain@telegraphics.com.au>
References: <cover.1599260540.git.fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/5] powerpc/tau: TAU driver fixes
Message-Id: <160034201293.3339803.8896975580715975741.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:27 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 05 Sep 2020 09:02:20 +1000, Finn Thain wrote:
> This patch series fixes various bugs in the Thermal Assist Unit driver.
> It was tested on 266 MHz and 292 MHz PowerBook G3 laptops.
> 
> 
> Finn Thain (5):
>   powerpc/tau: Use appropriate temperature sample interval
>   powerpc/tau: Convert from timer to workqueue
>   powerpc/tau: Remove duplicated set_thresholds() call
>   powerpc/tau: Check processor type before enabling TAU interrupt
>   powerpc/tau: Disable TAU between measurements
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/tau: Use appropriate temperature sample interval
      https://git.kernel.org/powerpc/c/66943005cc41f48e4d05614e8f76c0ca1812f0fd
[2/5] powerpc/tau: Convert from timer to workqueue
      https://git.kernel.org/powerpc/c/b1c6a0a10bfaf36ec82fde6f621da72407fa60a1
[3/5] powerpc/tau: Remove duplicated set_thresholds() call
      https://git.kernel.org/powerpc/c/420ab2bc7544d978a5d0762ee736412fe9c796ab
[4/5] powerpc/tau: Check processor type before enabling TAU interrupt
      https://git.kernel.org/powerpc/c/5e3119e15fed5b9a9a7e528665ff098a4a8dbdbc
[5/5] powerpc/tau: Disable TAU between measurements
      https://git.kernel.org/powerpc/c/e63d6fb5637e92725cf143559672a34b706bca4f

cheers
