Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F218C1A7988
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:31:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491jxd3GnYzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491jtJ25gLzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:28:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 491jtH4KrJz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:28:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 491jtH391qz9sSy; Tue, 14 Apr 2020 21:28:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 491jtG5xdTz9sSt
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 21:28:54 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EB4jui015701; Tue, 14 Apr 2020 07:28:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30bad8m8g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 07:28:46 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03EB54Xc017625;
 Tue, 14 Apr 2020 07:28:45 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30bad8m8fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 07:28:45 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EBMULn030882;
 Tue, 14 Apr 2020 11:28:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 30b5h6g5ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:28:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EBShNI55116192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 11:28:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA42B78064;
 Tue, 14 Apr 2020 11:28:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2E797805E;
 Tue, 14 Apr 2020 11:28:42 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.109.81])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 11:28:42 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 72BE52E3019; Tue, 14 Apr 2020 12:38:20 +0530 (IST)
Date: Tue, 14 Apr 2020 12:38:20 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v6 4/4] Advertise the self-save and self-restore
 attributes in the device tree
Message-ID: <20200414070820.GC24277@in.ibm.com>
References: <20200326070917.12744-1-psampat@linux.ibm.com>
 <20200326070917.12744-5-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326070917.12744-5-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=2
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140092
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Pratik,

On Thu, Mar 26, 2020 at 12:39:17PM +0530, Pratik Rajesh Sampat wrote:
> Support for self save and self restore interface is advertised in the
> device tree, along with the list of SPRs it supports for each.
> 
> The Special Purpose Register identification is encoded in a 2048 bitmask
> structure, where each bit signifies the identification key of that SPR
> which is consistent with that of the POWER architecture set for that
> register.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  .../ibm,opal/power-mgt/self-restore.rst       |  27 ++++
>  .../ibm,opal/power-mgt/self-save.rst          |  27 ++++
>  hw/slw.c                                      | 116 ++++++++++++++++++
>  include/skiboot.h                             |   1 +
>  4 files changed, 171 insertions(+)
>  create mode 100644 doc/device-tree/ibm,opal/power-mgt/self-restore.rst
>  create mode 100644 doc/device-tree/ibm,opal/power-mgt/self-save.rst
> 
> diff --git a/doc/device-tree/ibm,opal/power-mgt/self-restore.rst b/doc/device-tree/ibm,opal/power-mgt/self-restore.rst
> new file mode 100644
> index 00000000..2a2269f7
> --- /dev/null
> +++ b/doc/device-tree/ibm,opal/power-mgt/self-restore.rst
> @@ -0,0 +1,27 @@
> +ibm,opal/power-mgt/self-restore device tree entries
> +===================================================
> +
> +This node exports the bitmask representing the special purpose registers that
> +the self-restore API currently supports.
> +
> +Example:
> +
> +.. code-block:: dts
> +
> +  self-restore {
> +        sprn-bitmask = <0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x42010000 0x0 0x0
> +                        0x20000 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x0 0x100000 0x900000 0x0 0x0 0x530000 0x0 0x0 0x0
> +                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x10000>;
> +        phandle = <0x1c7>;
> +  };
> +
> +sprn-bitmask
> +------------
> +
> +This property is a bitmask of of all the existing SPRs and if the SPR is
> +supported, the corresponding bit of the SPR number is set to 1.
> +The representation of the bits are left-right, i.e the MSB of the first
> +doubleword represants the 0th bit.
> diff --git a/doc/device-tree/ibm,opal/power-mgt/self-save.rst b/doc/device-tree/ibm,opal/power-mgt/self-save.rst
> new file mode 100644
> index 00000000..c367720e
> --- /dev/null
> +++ b/doc/device-tree/ibm,opal/power-mgt/self-save.rst
> @@ -0,0 +1,27 @@
> +ibm,opal/power-mgt/self-save device tree entries
> +===================================================
> +
> +This node exports the bitmask representing the special purpose registers that
> +the self-save API currently supports.
> +
> +Example:
> +
> +.. code-block:: dts
> +
> +  self-save {
> +        sprn-bitmask = <0x0 0x0 0x0 0x0 0x100000 0x0 0x0 0x0 0x42010000 0x0 0x0
> +                        0x20000 0x0 0x0 0x0 0x10000 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x0 0x0 0x100000 0x840000 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
> +                        0x0 0x10000>;
> +        phandle = <0x1c8>;
> +  };
> +
> +sprn-bitmask
> +------------
> +
> +This property is a bitmask of of all the existing SPRs and if the SPR is
> +supported, the corresponding bit of the SPR number is set to 1.
> +The representation of the bits are left-right, i.e the MSB of the first
> +doubleword represants the 0th bit.
> diff --git a/hw/slw.c b/hw/slw.c
> index 6a09cc2c..9d1fe2c5 100644
> --- a/hw/slw.c
> +++ b/hw/slw.c
> @@ -29,6 +29,7 @@
>  #include <sbe_xip_image.h>
> 
>  static uint32_t slw_saved_reset[0x100];
> +#define SPR_BITMAP_LENGTH	2048
> 
>  static bool slw_current_le = false;
> 
> @@ -750,6 +751,119 @@ static void slw_late_init_p9(struct proc_chip *chip)
>  	}
>  }
> 
> +/* Add device tree properties to determine self-save | restore */
> +void add_cpu_self_save_restore_properties(void)
> +{
> +	struct dt_node *self_restore, *self_save, *power_mgt;
> +	uint64_t *self_save_mask, *self_restore_mask;
> +	bool self_save_supported = true;
> +	uint64_t compVector = -1;
> +	struct proc_chip *chip;
> +	int i, rc;
> +
> +	const uint64_t self_restore_regs[] = {
> +		P8_SPR_HRMOR,
> +		P8_SPR_HMEER,
> +		P8_SPR_PMICR,
> +		P8_SPR_PMCR,
> +		P8_SPR_HID0,
> +		P8_SPR_HID1,
> +		P8_SPR_HID4,
> +		P8_SPR_HID5,
> +		P8_SPR_HSPRG0,
> +		P8_SPR_LPCR,
> +		P8_MSR_MSR
> +	};
> +
> +	const uint64_t self_save_regs[] = {
> +		P9_STOP_SPR_DAWR,
> +		P9_STOP_SPR_HSPRG0,
> +		P9_STOP_SPR_LDBAR,
> +		P9_STOP_SPR_LPCR,
> +		P9_STOP_SPR_PSSCR,
> +		P9_STOP_SPR_MSR,
> +		P9_STOP_SPR_HRMOR,
> +		P9_STOP_SPR_HMEER,
> +		P9_STOP_SPR_PMCR,
> +		P9_STOP_SPR_PTCR
> +	};
> +
> +	chip = next_chip(NULL);
> +	assert(chip);
> +	rc = proc_stop_api_discover_capability((void *) chip->homer_base,
> +					       &compVector);
> +	if (rc == STOP_SAVE_ARG_INVALID_IMG) {
> +		prlog(PR_DEBUG, "HOMER BASE INVALID\n");
> +		return;
> +	} else if (rc == STOP_SAVE_API_IMG_INCOMPATIBLE) {
> +		prlog(PR_DEBUG, "STOP API running incompatible versions\n");
> +		if ((compVector & SELF_RESTORE_VER_MISMATCH) == 0) {
> +			prlog(PR_DEBUG, "Self-save API unsupported\n");
> +			self_save_supported = false;
> +		}
> +	}
> +
> +	power_mgt = dt_find_by_path(dt_root, "/ibm,opal/power-mgt");
> +	if (!power_mgt) {
> +		prerror("OCC: dt node /ibm,opal/power-mgt not found\n");

The prerror/warning in this function should be prefixed with "SLW"
instead of "OCC" here. This function has nothing to do with OCC.


> +		return;
> +	}
> +
> +	self_restore = dt_new(power_mgt, "self-restore");
> +	if (!self_restore) {
> +		prerror("OCC: Failed to create self restore node");

Ditto.

> +		return;
> +	}
> +
> +	self_restore_mask = zalloc(SPR_BITMAP_LENGTH / 8);
> +	if (!self_restore_mask)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(self_restore_regs); i++) {
> +		int bitmask_idx = self_restore_regs[i] / 64;
> +		uint64_t bitmask_pos = self_restore_regs[i] % 64;
> +		self_restore_mask[bitmask_idx] |= 1ul << bitmask_pos;
> +	}
> +
> +	for (i = 0; i < (SPR_BITMAP_LENGTH / 64); i++) {
> +		self_restore_mask[i] = cpu_to_be64(self_restore_mask[i]);
> +	}
> +
> +	dt_add_property(self_restore, "sprn-bitmask", self_restore_mask,
> +			SPR_BITMAP_LENGTH / 8);
> +	dt_add_property_string(self_restore, "compatible",
> +			       "ibm,opal-self-restore");
> +	free(self_restore_mask);
> +
> +	if (proc_gen != proc_gen_p9 || !self_save_supported)

We need a 
prlog(PR_INFO, "SLW: self-save not supported on this platform");

?

> +		return;


> +
> +	self_save = dt_new(power_mgt, "self-save");
> +	if (!self_save) {
> +		prerror("OCC: Failed to create self save node");
> +		return;
> +	}
> +
> +	self_save_mask = zalloc(SPR_BITMAP_LENGTH / 8);
> +	if (!self_save_mask)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(self_save_regs); i++) {
> +		int bitmask_idx = self_save_regs[i] / 64;
> +		uint64_t bitmask_pos = self_save_regs[i] % 64;
> +		self_save_mask[bitmask_idx] |= 1ul << bitmask_pos;
> +	}
> +
> +	for (i = 0; i < (SPR_BITMAP_LENGTH / 64); i++) {
> +		self_save_mask[i] = cpu_to_be64(self_save_mask[i]);
> +	}
> +
> +	dt_add_property(self_save, "sprn-bitmask", self_save_mask,
> +			SPR_BITMAP_LENGTH / 8);
> +	dt_add_property_string(self_save, "compatible", "ibm,opal-self-save");
> +	free(self_save_mask);
> +}
> +
>  /* Add device tree properties to describe idle states */
>  void add_cpu_idle_state_properties(void)
>  {
> @@ -1563,4 +1677,6 @@ void slw_init(void)
>  		}
>  	}
>  	add_cpu_idle_state_properties();
> +	if (has_deep_states)
> +		add_cpu_self_save_restore_properties();
>  }
> diff --git a/include/skiboot.h b/include/skiboot.h
> index 9ced240e..d3631dea 100644
> --- a/include/skiboot.h
> +++ b/include/skiboot.h
> @@ -209,6 +209,7 @@ extern void early_uart_init(void);
>  extern void homer_init(void);
>  extern void slw_init(void);
>  extern void add_cpu_idle_state_properties(void);
> +extern void add_cpu_self_save_restore_properties(void);
>  extern void lpc_rtc_init(void);

Apart from these minor quibbles,

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> 
>  /* flash support */
> -- 
> 2.24.1
> 
