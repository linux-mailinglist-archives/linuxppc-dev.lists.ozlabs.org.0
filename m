Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136A17B308
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:37:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTGZ2bD9zDqwf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:37:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3B6ZH6zDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3B5YRQz9sSV; Fri,  6 Mar 2020 11:27:34 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a05f0e5be4e81e4977d3f92aaf7688ee0cb7d5db
In-Reply-To: <20200129135121.24617-1-srikar@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc/smp: Use nid as fallback for package_id
Message-Id: <48YT3B5YRQz9sSV@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:34 +1100 (AEDT)
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-01-29 at 13:51:21 UTC, Srikar Dronamraju wrote:
> Package_id is to find out all cores that are part of the same chip. On
> PowerNV machines, package_id defaults to chip_id. However ibm,chip_id
> property is not present in device-tree of PowerVM Lpars. Hence lscpu
> output shows one core per socket and multiple cores.
> 
> To overcome this, use nid as the package_id on PowerVM Lpars.
> 
> Before the patch.
> ---------------
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1                           <----------------------
> Socket(s):           16                          <----------------------
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>  #
>  # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
>  -1
>  #
> 
> After the patch
> ---------------
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8			<------------------------------
> Core(s) per socket:  8			<------------------------------
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>  #
>  # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
>  0
>  #
> Now lscpu output is more in line with the system configuration.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a05f0e5be4e81e4977d3f92aaf7688ee0cb7d5db

cheers
