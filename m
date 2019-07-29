Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53678BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 14:44:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xzrs5LhPzDqBb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 22:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xzpX3tTgzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 22:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45xzpX0Ftvz9s7T;
 Mon, 29 Jul 2019 22:41:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Use nid as fallback for chip_id
In-Reply-To: <1562062765-31104-1-git-send-email-srikar@linux.vnet.ibm.com>
References: <1562062765-31104-1-git-send-email-srikar@linux.vnet.ibm.com>
Date: Mon, 29 Jul 2019 22:41:55 +1000
Message-ID: <87lfwhypv0.fsf@concordia.ellerman.id.au>
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
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> One of the uses of chip_id is to find out all cores that are part of the same
> chip. However ibm,chip_id property is not present in device-tree of PowerVM
> Lpars. Hence lscpu output shows one core per socket and multiple cores.
>
> Before the patch.
> # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1
> Socket(s):           16
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
>
> # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
> -1
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/prom.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 7159e791a70d..0b8918b43580 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -867,18 +867,24 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
>   * @cpu: The logical cpu number.
>   *
>   * Return the value of the ibm,chip-id property corresponding to the given
> - * logical cpu number. If the chip-id can not be found, returns -1.
> + * logical cpu number. If the chip-id can not be found, return nid.
> + *
>   */
>  int cpu_to_chip_id(int cpu)
>  {
>  	struct device_node *np;
> +	int chip_id = -1;
>  
>  	np = of_get_cpu_node(cpu, NULL);
>  	if (!np)
>  		return -1;
>  
> +	chip_id = of_get_ibm_chip_id(np);
> +	if (chip_id == -1)
> +		chip_id = of_node_to_nid(np);
> +
>  	of_node_put(np);
> -	return of_get_ibm_chip_id(np);
> +	return chip_id;
>  }

A nid is not a chip-id.

This obviously happens to work for the case you've identified above but
it's not something I'm happy to merge in general.

We could do a similar change in the topology code, but I'd probably like
it to be restricted to when we're running under PowerVM and there are no
chip-ids found at all.

I'm also not clear how it will interact with migration.

cheers
