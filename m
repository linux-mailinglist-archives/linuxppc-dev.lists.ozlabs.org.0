Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDC1D36EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 18:49:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NHYS1hlQzDqsL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 02:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHWT4wl6zDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 02:47:00 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EGXYCj038668
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 12:46:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310t9nn61n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 12:46:56 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EGYapf042112
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 12:46:55 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310t9nn61c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 12:46:55 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EGjhkT023682;
 Thu, 14 May 2020 16:46:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3100ubr49f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 16:46:55 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04EGkqvT28246454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 16:46:52 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6CC2C6057;
 Thu, 14 May 2020 16:46:52 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B401C6055;
 Thu, 14 May 2020 16:46:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 16:46:52 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 14 May 2020 11:46:52 -0500
From: wenxiong <wenxiong@linux.vnet.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: powerpc/pci: [PATCH 1/1]: PCIE PHB reset
In-Reply-To: <20200512052825.GA9115@osmium>
References: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
 <20200512052825.GA9115@osmium>
Message-ID: <e51f25855bd4256a550ce12521b98b4a@linux.vnet.ibm.com>
X-Sender: wenxiong@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_05:2020-05-14,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 cotscore=-2147483648 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140142
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
Cc: brking@linux.vnet.ibm.com, oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
 wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-12 00:28, Sam Bobroff wrote:
> On Thu, May 07, 2020 at 08:10:37AM -0500, wenxiong@linux.vnet.ibm.com 
> wrote:
>> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>> 
>> Several device drivers hit EEH(Extended Error handling) when 
>> triggering
>> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
>> in pci general code. PHB reset stop all PCI transactions from previous
>> kernel. We have tested the patch in several enviroments:
>> - direct slot adapters
>> - adapters under the switch
>> - a VF adapter in PowerVM
>> - a VF adapter/adapter in KVM guest.
>> 
>> Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> 
> Hi Wen Xiong,
> 
> I saw Oliver's review and I think he's covered the main issues I was
> going to raise:
> - This will run and produce some spurious errors on powernv. (I think
>   distros do compile in both pseries and powernv.)
> - There's a bit of code duplication but it's probably OK for this 
> patch.
> 

Hi Oliver and Sam,

Yes. Thanks for reviewing the code. I will keep some code duplication 
for now until Oliver re-work the EEH code. I am going to fix several 
minor things in error code patch.

Thanks,
Wendy

> I have a few other minor comments, below:
> 
>> ---
>>  arch/powerpc/platforms/pseries/pci.c | 153 
>> +++++++++++++++++++++++++++
>>  1 file changed, 153 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/pci.c 
>> b/arch/powerpc/platforms/pseries/pci.c
>> index 911534b89c85..aac7f00696d2 100644
>> --- a/arch/powerpc/platforms/pseries/pci.c
>> +++ b/arch/powerpc/platforms/pseries/pci.c
>> @@ -11,6 +11,8 @@
>>  #include <linux/kernel.h>
>>  #include <linux/pci.h>
>>  #include <linux/string.h>
>> +#include <linux/crash_dump.h>
>> +#include <linux/delay.h>
>> 
>>  #include <asm/eeh.h>
>>  #include <asm/pci-bridge.h>
>> @@ -354,3 +356,154 @@ int pseries_root_bridge_prepare(struct 
>> pci_host_bridge *bridge)
>> 
>>  	return 0;
>>  }
>> +
>> +/**
>> + * pseries_get_pdn_addr - Retrieve PHB address
>> + * @pe: EEH PE
>> + *
>> + * Retrieve the assocated PHB address. Actually, there're 2 RTAS
>> + * function calls dedicated for the purpose. We need implement
>> + * it through the new function and then the old one. Besides,
>> + * you should make sure the config address is figured out from
>> + * FDT node before calling the function.
>> + *
>> + */
>> +static int pseries_get_pdn_addr(struct pci_controller *phb)
>> +{
>> +	int ret = -1;
>> +	int rets[3];
>> +	int ibm_get_config_addr_info;
>> +	int ibm_get_config_addr_info2;
>> +	int config_addr = 0;
>> +	struct pci_dn *root_pdn, *pdn;
>> +
>> +	ibm_get_config_addr_info2   = 
>> rtas_token("ibm,get-config-addr-info2");
>> +	ibm_get_config_addr_info    = 
>> rtas_token("ibm,get-config-addr-info");
>> +
>> +	root_pdn = PCI_DN(phb->dn);
>> +	pdn = list_first_entry(&root_pdn->child_list, struct pci_dn, list);
>> +	config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
>> +
>> +	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
>> +		/*
>> +		 * First of all, we need to make sure there has one PE
>> +		 * associated with the device. Otherwise, PE address is
>> +		 * meaningless.
>> +		 */
> 
> This comment might be better if it explained how using option=0
> with ibm_get_config_addr tests the PE.
> 
>> +		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
>> +			config_addr, BUID_HI(pdn->phb->buid),
>> +			BUID_LO(pdn->phb->buid), 1);
>> +		if (ret || (rets[0] == 0)) {
>> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
>> +				"option=%d config_addr=%x\n",
>> +				__func__, pdn->phb->global_number, 1, rets[0]);
>> +			return -1;
>> +		}
>> +
>> +		/* Retrieve the associated PE config address */
>> +		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
>> +			config_addr, BUID_HI(pdn->phb->buid),
>> +			BUID_LO(pdn->phb->buid), 0);
>> +		if (ret) {
>> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
>> +				"option=%d config_addr=%x\n",
>> +				__func__, pdn->phb->global_number, 0, rets[0]);
>> +			return -1;
>> +		}
>> +		return rets[0];
>> +	}
>> +
>> +	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
>> +		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
>> +			config_addr, BUID_HI(pdn->phb->buid),
>> +			BUID_LO(pdn->phb->buid), 0);
>> +		if (ret || rets[0]) {
>> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
>> +				"config_addr=%x\n",
>> +				__func__, pdn->phb->global_number, rets[0]);
>> +			return -1;
>> +		}
>> +		return rets[0];
>> +	}
>> +
>> +	return ret;
> Can this ever return anything other than 0?
> 
>> +}
>> +
>> +static int __init pseries_phb_reset(void)
>> +{
>> +	struct pci_controller *phb;
>> +	int config_addr;
>> +	int ibm_set_slot_reset;
>> +	int ibm_configure_pe;
>> +	int ret;
>> +
>> +	if (is_kdump_kernel() || reset_devices) {
>> +		pr_info("Issue PHB reset ...\n");
>> +		ibm_set_slot_reset = rtas_token("ibm,set-slot-reset");
>> +		ibm_configure_pe = rtas_token("ibm,configure-pe");
>> +
>> +		if (ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE ||
>> +				ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
>> +			pr_info("%s: EEH functionality not supported\n",
>> +				__func__);
>> +		}
>> +
>> +		list_for_each_entry(phb, &hose_list, list_node) {
>> +			config_addr = pseries_get_pdn_addr(phb);
>> +			if (config_addr == -1)
>> +				continue;
>> +
>> +			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
>> +				config_addr, BUID_HI(phb->buid),
>> +				BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
>> +
>> +			/* If fundamental-reset not supported, try hot-reset */
>> +			if (ret == -8)
>> +				ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
>> +					config_addr, BUID_HI(phb->buid),
>> +					BUID_LO(phb->buid), EEH_RESET_HOT);
>> +
>> +			if (ret) {
>> +				pr_err("%s: fail with rtas_call fundamental reset=%d\n",
>> +					__func__, ret);
> 
> This error might be a bit confusing, since it's not clear if the result
> came from the fundamental or hot-reset.
> 
>> +				continue;
>> +			}
>> +		}
>> +		msleep(EEH_PE_RST_SETTLE_TIME);
>> +
>> +		list_for_each_entry(phb, &hose_list, list_node) {
>> +			config_addr = pseries_get_pdn_addr(phb);
>> +			if (config_addr == -1)
>> +				continue;
>> +
>> +			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
>> +				config_addr, BUID_HI(phb->buid),
>> +				BUID_LO(phb->buid), EEH_RESET_DEACTIVATE);
>> +			if (ret) {
>> +				pr_err("%s: fail with rtas_call deactive=%d\n",
>> +					__func__, ret);
>> +				continue;
>> +			}
>> +		}
>> +		msleep(EEH_PE_RST_SETTLE_TIME);
>> +
>> +		list_for_each_entry(phb, &hose_list, list_node) {
>> +			config_addr = pseries_get_pdn_addr(phb);
>> +			if (config_addr == -1)
>> +				continue;
>> +
>> +			ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
>> +				config_addr, BUID_HI(phb->buid),
>> +				BUID_LO(phb->buid));
>> +			if (ret) {
>> +				pr_err("%s: fail with rtas_call configure_pe =%d\n",
>> +					__func__, ret);
> 
> These errors might be more useful if they indicated which PHB caused 
> the
> error.
> 
>> +				continue;
>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +postcore_initcall(pseries_phb_reset);
>> +
>> --
>> 2.18.1
>> 
