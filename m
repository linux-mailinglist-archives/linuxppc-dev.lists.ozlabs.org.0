Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E6138C8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 08:57:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x5Xz3hyYzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 18:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x5Vp1MthzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 18:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47x5Vn5NYGz8tHB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 18:55:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47x5Vn4rVCz9sQp; Mon, 13 Jan 2020 18:55:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47x5Vn1mWpz9sPn
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 18:55:45 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D7qkXc013607
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 02:55:43 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvq4tpv5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 02:55:43 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <linuxram@us.ibm.com>;
 Mon, 13 Jan 2020 07:55:41 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 07:55:39 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00D7tbtW53149872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 07:55:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D3CA5204F;
 Mon, 13 Jan 2020 07:55:37 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.202.21])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id CA21F52051;
 Mon, 13 Jan 2020 07:55:35 +0000 (GMT)
Date: Sun, 12 Jan 2020 23:55:33 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [RESEND PATCH v2 3/3] powerpc/powernv: Parse device tree,
 population of SPR support
References: <cover.1578886602.git.psampat@linux.ibm.com>
 <26adc23c6e82d981c6a28470ec84f74443ee3221.1578886602.git.psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26adc23c6e82d981c6a28470ec84f74443ee3221.1578886602.git.psampat@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20011307-0016-0000-0000-000002DCD215
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011307-0017-0000-0000-0000333F5AEA
Message-Id: <20200113075533.GE5419@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_01:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130066
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
 pratik.sampat@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 13, 2020 at 09:15:09AM +0530, Pratik Rajesh Sampat wrote:
> Parse the device tree for nodes self-save, self-restore and populate
> support for the preferred SPRs based what was advertised by the device
> tree.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 104 ++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index d67d4d0b169b..e910ff40b7e6 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1429,6 +1429,107 @@ static void __init pnv_probe_idle_states(void)
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
> +	int rc = 0;
> +	u64 *temp_u64;
> +	const char *state_prop;
> +	u64 bit_pos;
> +
> +	state_prop = of_get_property(np, "status", NULL);
> +	if (!state_prop) {
> +		pr_warn("opal: failed to find the active value for self save/restore node");
> +		return -EINVAL;
> +	}
> +	if (strncmp(state_prop, "disabled", 8) == 0) {
> +		/*
> +		 * if the feature is not active, strip the preferred_sprs from
> +		 * that capability.
> +		 */
> +		if (type == SELF_RESTORE_TYPE) {
> +			for (i = 0; i < nr_preferred_sprs; i++) {
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_RESTORE_STRICT;
> +			}
> +		} else {
> +			for (i = 0; i < nr_preferred_sprs; i++) {
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_SAVE_STRICT;
> +			}
> +		}
> +		return 0;
> +	}
> +	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
> +	if (nr_sprns <= 0)
> +		return rc;
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
> +		bitmask_index = preferred_sprs[i].spr / 64;
> +		bit_pos = preferred_sprs[i].spr % 64;
> +		if ((temp_u64[bitmask_index] & (1UL << bit_pos)) == 0) {
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
> +	return rc;
> +}
> +
> +static int pnv_parse_deepstate_dt(void)
> +{
> +	struct device_node *np, *np1;
> +	int rc = 0;
> +
> +	/* Self restore register population */
> +	np = of_find_node_by_path("/ibm,opal/power-mgt/self-restore");
> +	if (!np) {
> +		pr_warn("opal: self restore Node not found");
> +	} else {
> +		rc = extract_save_restore_state_dt(np, SELF_RESTORE_TYPE);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	/* Self save register population */
> +	np1 = of_find_node_by_path("/ibm,opal/power-mgt/self-save");

'np' can be reused?  'np1' is not needed.


Otherwise looks good.

Reviewed-by: Ram Pai <linuxram@us.ibm.com>

RP

