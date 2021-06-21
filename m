Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E53AF838
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 00:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G83Vy6mlBz3btH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NOQy2Tft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NOQy2Tft; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G83VV09XTz2yQp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 08:05:03 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id g12so14659585qtb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XmftdvNnVpoXHzHAgTa8sZu70R84IxYVIUKyxPNyvDg=;
 b=NOQy2TftWpXN/to3jPDe8xZcvUMolRWpdTQBeNwDwRq5VUEbPBLGt9WXc2f1nye2ye
 yvfMXHUzP/rUPBPL41nVjaMhx7pb4+SWoJOx1v+qcLt2LJb9Cnqm4+3UijUcD4Bbgyef
 vTlNRlw4eRjF91S620HZo+zsFNEdv+Yibz9GgTmWVZmXk0IRMCGzna/W4T6VAtceHkjn
 aJ3iL1mQYqeMBetroyUPZUcnNgjq950Fl4gz/yn6vHuqrq0O8ZEQYkR57BcfjwS8CA+X
 lLqTWHtS9Ou58d6DTr32X9Y6irVP9FtCyrMacfi+PZcCxo6XSxDN84Uet6qqhiJwQv2U
 Mfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmftdvNnVpoXHzHAgTa8sZu70R84IxYVIUKyxPNyvDg=;
 b=Cn8Ih1qBiu25gXFE9op9jIWbU0FEA13fTXUd5OTeeQkNxs0Icoq8+MAa8Xlz07yBec
 Ys67D3EeZuUJcNa90dwxbJbp+DCTIQ/80tbNkNaJr2DW5+iuf7KHiXDf/wkuRXjMO67Q
 17TEdLNKLgXtZh3o4hy9GRyneehrHh0nShvmlJEjvT7onXhJOw+3Na4O1Ma2WhwM4arw
 +d9UwpZrM9T60ChZMHBSnkXV8sjMAtvqSAsmDYpX+Xfu9fTt5jlDavTW6zs3CAExzNGF
 F7CTLzrACCCibP3xoeLjLYSiTN2L6BB1TGPOx9lTxfwSBauMATUF9nYrgrXjkD4n10tf
 GwWg==
X-Gm-Message-State: AOAM533/7X1kdcbcUvmLQ1k1P6VQHpoX76pU3rgd2DIJ0e/OZxnP78ek
 qFhpWwiUEC8vZpmnOlYETFA=
X-Google-Smtp-Source: ABdhPJzB+WC+kfFDWQNXlE7tHgtnHC7N/Unuoa9r35kHkpjKXjWJucDLqjWOvUvXrlChEnviZBDMrg==
X-Received: by 2002:ac8:47c3:: with SMTP id d3mr700398qtr.29.1624313099846;
 Mon, 21 Jun 2021 15:04:59 -0700 (PDT)
Received: from [192.168.15.40] ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id s23sm317349qtq.2.2021.06.21.15.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 15:04:59 -0700 (PDT)
Subject: Re: [PATCH v4 7/7] powerpc/pseries: Add support for FORM2
 associativity
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <e500697d-1866-538c-eaff-613e04a92c93@gmail.com>
Date: Mon, 21 Jun 2021 19:02:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 dan.j.williams@intel.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/17/21 1:51 PM, Aneesh Kumar K.V wrote:
> PAPR interface currently supports two different ways of communicating resource
> grouping details to the OS. These are referred to as Form 0 and Form 1
> associativity grouping. Form 0 is the older format and is now considered
> deprecated. This patch adds another resource grouping named FORM2.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   Documentation/powerpc/associativity.rst   | 135 ++++++++++++++++++++
>   arch/powerpc/include/asm/firmware.h       |   3 +-
>   arch/powerpc/include/asm/prom.h           |   1 +
>   arch/powerpc/kernel/prom_init.c           |   3 +-
>   arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
>   arch/powerpc/platforms/pseries/firmware.c |   1 +
>   6 files changed, 286 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/powerpc/associativity.rst
> 
> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerpc/associativity.rst
> new file mode 100644
> index 000000000000..93be604ac54d
> --- /dev/null
> +++ b/Documentation/powerpc/associativity.rst
> @@ -0,0 +1,135 @@
> +============================
> +NUMA resource associativity
> +=============================
> +
> +Associativity represents the groupings of the various platform resources into
> +domains of substantially similar mean performance relative to resources outside
> +of that domain. Resources subsets of a given domain that exhibit better
> +performance relative to each other than relative to other resources subsets
> +are represented as being members of a sub-grouping domain. This performance
> +characteristic is presented in terms of NUMA node distance within the Linux kernel.
> +From the platform view, these groups are also referred to as domains.
> +
> +PAPR interface currently supports different ways of communicating these resource
> +grouping details to the OS. These are referred to as Form 0, Form 1 and Form2
> +associativity grouping. Form 0 is the older format and is now considered deprecated.
> +
> +Hypervisor indicates the type/form of associativity used via "ibm,arcitecture-vec-5 property".
> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage of Form 0 or Form 1.
> +A value of 1 indicates the usage of Form 1 associativity. For Form 2 associativity
> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
> +
> +Form 0
> +-----
> +Form 0 associativity supports only two NUMA distance (LOCAL and REMOTE).
> +
> +Form 1
> +-----
> +With Form 1 a combination of ibm,associativity-reference-points and ibm,associativity
> +device tree properties are used to determine the NUMA distance between resource groups/domains.
> +
> +The “ibm,associativity” property contains one or more lists of numbers (domainID)
> +representing the resource’s platform grouping domains.
> +
> +The “ibm,associativity-reference-points” property contains one or more list of numbers
> +(domainID index) that represents the 1 based ordinal in the associativity lists.
> +The list of domainID index represnets increasing hierachy of resource grouping.
> +
> +ex:
> +{ primary domainID index, secondary domainID index, tertiary domainID index.. }
> +
> +Linux kernel uses the domainID at the primary domainID index as the NUMA node id.
> +Linux kernel computes NUMA distance between two domains by recursively comparing
> +if they belong to the same higher-level domains. For mismatch at every higher
> +level of the resource group, the kernel doubles the NUMA distance between the
> +comparing domains.
> +
> +Form 2
> +-------
> +Form 2 associativity format adds separate device tree properties representing NUMA node distance
> +thereby making the node distance computation flexible. Form 2 also allows flexible primary
> +domain numbering. With numa distance computation now detached from the index value of
> +"ibm,associativity" property, Form 2 allows a large number of primary domain ids at the
> +same domainID index representing resource groups of different performance/latency characteristics.
> +
> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of byte 5 in the
> +"ibm,architecture-vec-5" property.
> +
> +"ibm,numa-lookup-index-table" property contains one or more list numbers representing
> +the domainIDs present in the system. The offset of the domainID in this property is considered
> +the domainID index.
> +
> +prop-encoded-array: The number N of the domainIDs encoded as with encode-int, followed by
> +N domainID encoded as with encode-int
> +
> +For ex:
> +ibm,numa-lookup-index-table =  {4, 0, 8, 250, 252}, domainID index for domainID 8 is 1.
> +
> +"ibm,numa-distance-table" property contains one or more list of numbers representing the NUMA
> +distance between resource groups/domains present in the system.
> +
> +prop-encoded-array: The number N of the distance values encoded as with encode-int, followed by
> +N distance values encoded as with encode-bytes. The max distance value we could encode is 255.
> +
> +For ex:
> +ibm,numa-lookup-index-table =  {3, 0, 8, 40}
> +ibm,numa-distance-table     =  {9, 10, 20, 80, 20, 10, 160, 80, 160, 10}
> +
> +  | 0    8   40
> +--|------------
> +  |
> +0 | 10   20  80
> +  |
> +8 | 20   10  160
> +  |
> +40| 80   160  10
> +
> +
> +"ibm,associativity" property for resources in node 0, 8 and 40
> +
> +{ 3, 6, 7, 0 }
> +{ 3, 6, 9, 8 }
> +{ 3, 6, 7, 40}
> +
> +With "ibm,associativity-reference-points"  { 0x3 }

With this configuration, would the following ibm,associativity arrays
also be valid?


{ 3, 0, 0, 0 }
{ 3, 0, 0, 8 }
{ 3, 0, 0, 40}

If yes, then we need a way to tell that the associativity domains assignment
are optional, and FORM2 relies solely on finding out the domainID of the
resource (0, 8 and 40) to retrieve the domainID index, and with this
index all performance metrics can be retrieved from the numa-* properties
(numa-distance-table, numa-bandwidth-table ...).

Retrieving the resource domainID is done by using ibm,associativity-reference-points.

This will allow the platform to implement FORM2 such as:

{ 1, 0 }
{ 1, 8 }
{ 1, 40 }
  
- ref-points: { 0x1 }

If the platform chooses to do so.


> +
> +Each resource (drcIndex) now also supports additional optional device tree properties.
> +These properties are marked optional because the platform can choose not to export
> +them and provide the system topology details using the earlier defined device tree
> +properties alone. The optional device tree properties are used when adding new resources
> +(DLPAR) and when the platform didn't provide the topology details of the domain which
> +contains the newly added resource during boot.
> +
> +"ibm,numa-lookup-index" property contains a number representing the domainID index to be used
> +when building the NUMA distance of the numa node to which this resource belongs. This can
> +be looked at as the index at which this new domainID would have appeared in
> +"ibm,numa-lookup-index-table" if the domain was present during boot. The domainID
> +of the new resource can be obtained from the existing "ibm,associativity" property. This
> +can be used to build distance information of a newly onlined NUMA node via DLPAR operation.
> +The value is 1 based array index value.
> +
> +prop-encoded-array: An integer encoded as with encode-int specifying the domainID index
> +
> +"ibm,numa-distance" property contains one or more list of numbers presenting the NUMA distance
> +from this resource domain to other resources.
> +
> +prop-encoded-array: The number N of the distance values encoded as with encode-int, followed by
> +N distance values encoded as with encode-bytes. The max distance value we could encode is 255.
> +
> +For ex:
> +ibm,associativity     = { 4, 5, 10, 50}
> +ibm,numa-lookup-index = { 4 }
> +ibm,numa-distance   =  {8, 160, 255, 80, 10, 160, 255, 80, 10}
> +
> +resulting in a new toplogy as below.
> +  | 0    8   40   50
> +--|------------------
> +  |
> +0 | 10   20  80   160
> +  |
> +8 | 20   10  160  255
> +  |
> +40| 80   160  10  80
> +  |
> +50| 160  255  80  10
> +

I see there is no mention of the special PAPR SCM handling. I saw in
one of the your replies of v1:

"Another option is to make sure that numa-distance-value is populated
such that PMEMB distance indicates it is closer to node0 when compared
to node1. ie, node_distance[40][0] < node_distance[40][1]. One could
possibly infer the grouping based on the distance value and not deepend
on ibm,associativity for that purpose."


Is that was we're supposed to do with PAPR SCM? I'm not sure how that
affects NVDIMM support in QEMU with FORM2.



Thanks,



Daniel



> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
> index 60b631161360..97a3bd9ffeb9 100644
> --- a/arch/powerpc/include/asm/firmware.h
> +++ b/arch/powerpc/include/asm/firmware.h
> @@ -53,6 +53,7 @@
>   #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
>   #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
>   #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
> +#define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
>   
>   #ifndef __ASSEMBLY__
>   
> @@ -73,7 +74,7 @@ enum {
>   		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
>   		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
>   		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
> -		FW_FEATURE_RPT_INVALIDATE,
> +		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY,
>   	FW_FEATURE_PSERIES_ALWAYS = 0,
>   	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
>   	FW_FEATURE_POWERNV_ALWAYS = 0,
> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
> index df9fec9d232c..5c80152e8f18 100644
> --- a/arch/powerpc/include/asm/prom.h
> +++ b/arch/powerpc/include/asm/prom.h
> @@ -149,6 +149,7 @@ extern int of_read_drc_info_cell(struct property **prop,
>   #define OV5_XCMO		0x0440	/* Page Coalescing */
>   #define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
>   #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
> +#define OV5_FORM2_AFFINITY	0x0520	/* Form2 NUMA affinity */
>   #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
>   #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
>   #define OV5_PFO_HW_RNG		0x1180	/* PFO Random Number Generator */
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 64b9593038a7..496fdac54c29 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1070,7 +1070,8 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
>   #else
>   		0,
>   #endif
> -		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN),
> +		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN) |
> +		OV5_FEAT(OV5_FORM2_AFFINITY),
>   		.bin_opts = OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
>   		.micro_checkpoint = 0,
>   		.reserved0 = 0,
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index d32729f235b8..5a7d94960fb7 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -56,12 +56,17 @@ static int n_mem_addr_cells, n_mem_size_cells;
>   
>   #define FORM0_AFFINITY 0
>   #define FORM1_AFFINITY 1
> +#define FORM2_AFFINITY 2
>   static int affinity_form;
>   
>   #define MAX_DISTANCE_REF_POINTS 4
>   static int max_associativity_domain_index;
>   static const __be32 *distance_ref_points;
>   static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
> +static int numa_distance_table[MAX_NUMNODES][MAX_NUMNODES] = {
> +	[0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = -1 }
> +};
> +static int numa_id_index_table[MAX_NUMNODES];
>   
>   /*
>    * Allocate node_to_cpumask_map based on number of available nodes
> @@ -166,6 +171,27 @@ static void unmap_cpu_from_node(unsigned long cpu)
>   }
>   #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
>   
> +/*
> + * With FORM2 if we are not using logical domain ids, we will find
> + * both primary and seconday domains with same value. Hence always
> + * start comparison from secondary domains
> + */
> +static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +{
> +	int dist = 0;
> +
> +	int i, index;
> +
> +	for (i = 1; i < max_associativity_domain_index; i++) {
> +		index = be32_to_cpu(distance_ref_points[i]);
> +		if (cpu1_assoc[index] == cpu2_assoc[index])
> +			break;
> +		dist++;
> +	}
> +
> +	return dist;
> +}
> +
>   static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>   {
>   	int dist = 0;
> @@ -178,7 +204,6 @@ static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>   			break;
>   		dist++;
>   	}
> -
>   	return dist;
>   }
>   
> @@ -186,8 +211,9 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>   {
>   	/* We should not get called with FORM0 */
>   	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
> -
> -	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
> +	if (affinity_form == FORM1_AFFINITY)
> +		return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
> +	return __cpu_form2_distance(cpu1_assoc, cpu2_assoc);
>   }
>   
>   /* must hold reference to node during call */
> @@ -201,7 +227,9 @@ int __node_distance(int a, int b)
>   	int i;
>   	int distance = LOCAL_DISTANCE;
>   
> -	if (affinity_form == FORM0_AFFINITY)
> +	if (affinity_form == FORM2_AFFINITY)
> +		return numa_distance_table[a][b];
> +	else if (affinity_form == FORM0_AFFINITY)
>   		return ((a == b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
>   
>   	for (i = 0; i < max_associativity_domain_index; i++) {
> @@ -303,15 +331,116 @@ static void initialize_form1_numa_distance(struct device_node *node)
>   
>   /*
>    * Used to update distance information w.r.t newly added node.
> + * ibm,numa-lookup-index -> 4
> + * ibm,numa-distance -> {5, 20, 40, 60, 80, 10 }
>    */
>   void update_numa_distance(struct device_node *node)
>   {
> +	int i, nid, other_nid, other_nid_index = 0;
> +	const __be32 *numa_indexp;
> +	const __u8  *numa_distancep;
> +	int numa_index, max_numa_index, numa_distance;
> +
>   	if (affinity_form == FORM0_AFFINITY)
>   		return;
>   	else if (affinity_form == FORM1_AFFINITY) {
>   		initialize_form1_numa_distance(node);
>   		return;
>   	}
> +	/* FORM2 affinity  */
> +
> +	nid = of_node_to_nid_single(node);
> +	if (nid == NUMA_NO_NODE)
> +		return;
> +
> +	/* Already initialized */
> +	if (numa_distance_table[nid][nid] != -1)
> +		return;
> +	/*
> +	 * update node distance if not already populated.
> +	 */
> +	numa_distancep = of_get_property(node, "ibm,numa-distance", NULL);
> +	if (!numa_distancep)
> +		return;
> +
> +	numa_indexp = of_get_property(node, "ibm,numa-lookup-index", NULL);
> +	if (!numa_indexp)
> +		return;
> +
> +	numa_index = of_read_number(numa_indexp, 1);
> +	/*
> +	 * update the numa_id_index_table. Device tree look at index table as
> +	 * 1 based array indexing.
> +	 */
> +	numa_id_index_table[numa_index - 1] = nid;
> +
> +	max_numa_index = of_read_number((const __be32 *)numa_distancep, 1);
> +	VM_WARN_ON(max_numa_index != 2 * numa_index);
> +	/* Skip the size which is encoded int */
> +	numa_distancep += sizeof(__be32);
> +
> +	/*
> +	 * First fill the distance information from other node to this node.
> +	 */
> +	other_nid_index = 0;
> +	for (i = 0; i < numa_index; i++) {
> +		numa_distance = numa_distancep[i];
> +		other_nid = numa_id_index_table[other_nid_index++];
> +		numa_distance_table[other_nid][nid] = numa_distance;
> +	}
> +
> +	other_nid_index = 0;
> +	for (; i < max_numa_index; i++) {
> +		numa_distance = numa_distancep[i];
> +		other_nid = numa_id_index_table[other_nid_index++];
> +		numa_distance_table[nid][other_nid] = numa_distance;
> +	}
> +}
> +
> +/*
> + * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
> + * ibm,numa-distance-table = { N, 1, 2, 4, 5, 1, 6, .... N elements}
> + */
> +static void initialize_form2_numa_distance_lookup_table(struct device_node *root)
> +{
> +	const __u8 *numa_dist_table;
> +	const __be32 *numa_lookup_index;
> +	int numa_dist_table_length;
> +	int max_numa_index, distance_index;
> +	int i, curr_row = 0, curr_column = 0;
> +
> +	numa_lookup_index = of_get_property(root, "ibm,numa-lookup-index-table", NULL);
> +	max_numa_index = of_read_number(&numa_lookup_index[0], 1);
> +
> +	/* first element of the array is the size and is encode-int */
> +	numa_dist_table = of_get_property(root, "ibm,numa-distance-table", NULL);
> +	numa_dist_table_length = of_read_number((const __be32 *)&numa_dist_table[0], 1);
> +	/* Skip the size which is encoded int */
> +	numa_dist_table += sizeof(__be32);
> +
> +	pr_debug("numa_dist_table_len = %d, numa_dist_indexes_len = %d \n",
> +		 numa_dist_table_length, max_numa_index);
> +
> +	for (i = 0; i < max_numa_index; i++)
> +		/* +1 skip the max_numa_index in the property */
> +		numa_id_index_table[i] = of_read_number(&numa_lookup_index[i + 1], 1);
> +
> +
> +	VM_WARN_ON(numa_dist_table_length != max_numa_index * max_numa_index);
> +
> +	for (distance_index = 0; distance_index < numa_dist_table_length; distance_index++) {
> +		int nodeA = numa_id_index_table[curr_row];
> +		int nodeB = numa_id_index_table[curr_column++];
> +
> +		numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index];
> +
> +		pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
> +		if (curr_column >= max_numa_index) {
> +			curr_row++;
> +			/* reset the column */
> +			curr_column = 0;
> +		}
> +	}
>   }
>   
>   static int __init find_primary_domain_index(void)
> @@ -324,6 +453,9 @@ static int __init find_primary_domain_index(void)
>   	 */
>   	if (firmware_has_feature(FW_FEATURE_OPAL)) {
>   		affinity_form = FORM1_AFFINITY;
> +	} else if (firmware_has_feature(FW_FEATURE_FORM2_AFFINITY)) {
> +		dbg("Using form 2 affinity\n");
> +		affinity_form = FORM2_AFFINITY;
>   	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
>   		dbg("Using form 1 affinity\n");
>   		affinity_form = FORM1_AFFINITY;
> @@ -368,8 +500,17 @@ static int __init find_primary_domain_index(void)
>   
>   		index = of_read_number(&distance_ref_points[1], 1);
>   	} else {
> +		/*
> +		 * Both FORM1 and FORM2 affinity find the primary domain details
> +		 * at the same offset.
> +		 */
>   		index = of_read_number(distance_ref_points, 1);
>   	}
> +	/*
> +	 * If it is FORM2 also initialize the distance table here.
> +	 */
> +	if (affinity_form == FORM2_AFFINITY)
> +		initialize_form2_numa_distance_lookup_table(root);
>   
>   	/*
>   	 * Warn and cap if the hardware supports more than
> diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
> index 5d4c2bc20bba..f162156b7b68 100644
> --- a/arch/powerpc/platforms/pseries/firmware.c
> +++ b/arch/powerpc/platforms/pseries/firmware.c
> @@ -123,6 +123,7 @@ vec5_fw_features_table[] = {
>   	{FW_FEATURE_PRRN,		OV5_PRRN},
>   	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
>   	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},
> +	{FW_FEATURE_FORM2_AFFINITY,	OV5_FORM2_AFFINITY},
>   };
>   
>   static void __init fw_vec5_feature_init(const char *vec5, unsigned long len)
> 
