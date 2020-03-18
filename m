Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0E189FAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 16:32:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jDYV36xvzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 02:32:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jDP67084zDqCq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 02:24:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48jDP61l6Gz8svd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 02:24:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48jDP55vbzz9sST; Thu, 19 Mar 2020 02:24:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48jDP50fRnz9sPF
 for <linuxppc-dev@ozlabs.org>; Thu, 19 Mar 2020 02:24:56 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IF2kio011821
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 11:24:55 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8adbm50-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 11:24:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <svaidy@linux.ibm.com>;
 Wed, 18 Mar 2020 15:24:52 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 15:24:50 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IFOnS351773446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 15:24:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 130324C044;
 Wed, 18 Mar 2020 15:24:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53E154C058;
 Wed, 18 Mar 2020 15:24:47 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.107.162])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Mar 2020 15:24:47 +0000 (GMT)
Date: Wed, 18 Mar 2020 20:54:41 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v5 3/3] powerpc/powernv: Parse device tree, population of
 SPR support
References: <20200317141018.42380-1-psampat@linux.ibm.com>
 <20200317141018.42380-4-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200317141018.42380-4-psampat@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20031815-0008-0000-0000-0000035F6A76
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031815-0009-0000-0000-00004A80C551
Message-Id: <20200318152441.GC5273@drishya.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=1 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180072
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
Reply-To: svaidy@linux.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, psampat@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Pratik Rajesh Sampat <psampat@linux.ibm.com> [2020-03-17 19:40:18]:

> Parse the device tree for nodes self-save, self-restore and populate
> support for the preferred SPRs based what was advertised by the device
> tree.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Reviewed-by: Ram Pai <linuxram@us.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

>
> ---
>  .../bindings/powerpc/opal/power-mgt.txt       | 10 +++
>  arch/powerpc/platforms/powernv/idle.c         | 78 +++++++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt b/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
> index 9d619e955576..093cb5fe3d2d 100644
> --- a/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
> +++ b/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
> @@ -116,3 +116,13 @@ otherwise. The length of all the property arrays must be the same.
>  	which of the fields of the PMICR are set in the corresponding
>  	entries in ibm,cpu-idle-state-pmicr. This is an optional
>  	property on POWER8 and is absent on POWER9.
> +
> +- self-restore:
> + Array of unsigned 64-bit values containing a property for sprn-mask
> + with each bit indicating the index of the supported SPR for the
> + functionality. This is an optional property for both Power8 and Power9
> +
> +- self-save:
> +  Array of unsigned 64-bit values containing a property for sprn-mask
> +  with each bit indicating the index of the supported SPR for the
> +  functionality. This is an optional property for both Power8 and Power9
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 97aeb45e897b..c39111b338ff 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1436,6 +1436,81 @@ static void __init pnv_probe_idle_states(void)
>  		supported_cpuidle_states |= pnv_idle_states[i].flags;
>  }
>  
> +/*
> + * Extracts and populates the self save or restore capabilities
> + * passed from the device tree node
> + */
> +static int extract_save_restore_state_dt(struct device_node *np, int type)
> +{
> +	int nr_sprns = 0, i, bitmask_index;
> +	u64 *temp_u64;
> +	u64 bit_pos;
> +
> +	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
> +	if (nr_sprns <= 0)
> +		return -EINVAL;
> +	temp_u64 = kcalloc(nr_sprns, sizeof(u64), GFP_KERNEL);
> +	if (of_property_read_u64_array(np, "sprn-bitmask",
> +				       temp_u64, nr_sprns)) {
> +		pr_warn("cpuidle-powernv: failed to find registers in DT\n");
> +		kfree(temp_u64);
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Populate acknowledgment of support for the sprs in the global vector
> +	 * gotten by the registers supplied by the firmware.
> +	 * The registers are in a bitmask, bit index within
> +	 * that specifies the SPR
> +	 */
> +	for (i = 0; i < nr_preferred_sprs; i++) {
> +		bitmask_index = BIT_WORD(preferred_sprs[i].spr);
> +		bit_pos = BIT_MASK(preferred_sprs[i].spr);
> +		if ((temp_u64[bitmask_index] & bit_pos) == 0) {
> +			if (type == SELF_RESTORE_TYPE)
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_RESTORE_STRICT;
> +			else
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_SAVE_STRICT;
> +			continue;
> +		}
> +		if (type == SELF_RESTORE_TYPE) {
> +			preferred_sprs[i].supported_mode |=
> +				SELF_RESTORE_STRICT;
> +		} else {
> +			preferred_sprs[i].supported_mode |=
> +				SELF_SAVE_STRICT;
> +		}
> +	}
> +
> +	kfree(temp_u64);
> +	return 0;
> +}
> +
> +static int pnv_parse_deepstate_dt(void)
> +{
> +	struct device_node *np;
> +	int rc = 0, i;
> +
> +	/* Self restore register population */
> +	np = of_find_compatible_node(NULL, NULL, "ibm,opal-self-restore");
> +	if (np) {
> +		rc = extract_save_restore_state_dt(np, SELF_RESTORE_TYPE);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	/* Self save register population */
> +	np = of_find_compatible_node(NULL, NULL, "ibm,opal-self-save");
> +	if (!np) {
> +		for (i = 0; i < nr_preferred_sprs; i++)
> +			preferred_sprs[i].supported_mode &= ~SELF_SAVE_STRICT;
> +	} else {
> +		rc = extract_save_restore_state_dt(np, SELF_SAVE_TYPE);
> +	}
> +	of_node_put(np);
> +	return rc;
> +}
> +
>  /*
>   * This function parses device-tree and populates all the information
>   * into pnv_idle_states structure. It also sets up nr_pnv_idle_states
> @@ -1584,6 +1659,9 @@ static int __init pnv_init_idle_states(void)
>  		return rc;
>  	pnv_probe_idle_states();
>  
> +	rc = pnv_parse_deepstate_dt();
> +	if (rc)
> +		return rc;
>  	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
>  		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
>  			power7_fastsleep_workaround_entry = false;
> -- 

Thanks Michael for the detailed review and feedback. Your review
comments have been addressed by Pratik.

--Vaidy

