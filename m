Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A82222F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 14:54:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6vNX5RSWzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 22:54:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vDP1vb2zDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:47:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vDP0wsfz9sTF; Thu, 16 Jul 2020 22:47:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200619070113.16696-1-sathnaga@linux.vnet.ibm.com>
References: <20200619070113.16696-1-sathnaga@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/pseries/svm: Remove unwanted check for
 shared_lppaca_size
Message-Id: <159490364667.3801815.6147810158620423747.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:47:49 +1000 (AEST)
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
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jun 2020 12:31:13 +0530, Satheesh Rajendran wrote:
> Early secure guest boot hits the below crash while booting with
> vcpus numbers aligned with page boundary for PAGE size of 64k
> and LPPACA size of 1k i.e 64, 128 etc, due to the BUG_ON assert
> for shared_lppaca_total_size equal to shared_lppaca_size,
> 
>  [    0.000000] Partition configured for 64 cpus.
>  [    0.000000] CPU maps initialized for 1 thread per core
>  [    0.000000] ------------[ cut here ]------------
>  [    0.000000] kernel BUG at arch/powerpc/kernel/paca.c:89!
>  [    0.000000] Oops: Exception in kernel mode, sig: 5 [#1]
>  [    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/svm: Fix incorrect check for shared_lppaca_size
      https://git.kernel.org/powerpc/c/b710d27bf72068b15b2f0305d825988183e2ff28

cheers
