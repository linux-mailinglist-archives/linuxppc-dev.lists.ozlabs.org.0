Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E3FBA16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:41:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CxNc3vv4zF7HV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CxL50VvYzF586
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 07:39:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADKbGZd137265; Wed, 13 Nov 2019 15:39:20 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8ndxgjet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 15:39:20 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xADKbIPA137697;
 Wed, 13 Nov 2019 15:39:20 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8ndxgje0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 15:39:19 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xADKZFhL010371;
 Wed, 13 Nov 2019 20:39:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2w5n36b5ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 20:39:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xADKdHih49873178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 20:39:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DACAAC059;
 Wed, 13 Nov 2019 20:39:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B808EAC060;
 Wed, 13 Nov 2019 20:39:16 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.87.158])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 13 Nov 2019 20:39:16 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv: Disable native PCIe port management
To: "Oliver O'Halloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191113094035.22394-1-oohall@gmail.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <5a12d199-fa1f-5a60-05d8-df9edffbc227@linux.ibm.com>
Date: Wed, 13 Nov 2019 12:39:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113094035.22394-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911130170
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
Cc: linux-pci@vger.kernel.org,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nothing but pedantic spelling and grammar nits of the commit log follow.

-Tyrel

On 11/13/19 1:40 AM, Oliver O'Halloran wrote:
> On PowerNV the PCIe topology is (currently) managed the powernv platform

s/the powernv/by the powernv

> code in cooperation with firmware. The PCIe-native service drivers bypass
> both and this can cause problems.
> 
> Historically this hasn't been a big deal since the only port service
> driver that saw much use was the AER driver. The AER driver relies
> a kernel service to report when errors occur rather than acting autonmously

s/a kernel/on a kernel
autonomously

> so it's fairly easy to ignore. On PowerNV (and pseries) AER events are
> handled through EEH, which ignores the AER service, so it's never been
> an issue.
> 
> Unfortunately, the hotplug port service driver (pciehp) does act
> autonomously and conflicts with the platform specific hotplug
> driver (pnv_php). The main issue is that pciehp claims the interrupt
> associated with the PCIe capability which in turn prevents pnv_php from
> claiming it.
> 
> This results in hotplug events being handled by pciehp which does not
> notify firmware when the PCIe topology changes, and does not setup/teardown
> the arch specific PCI device structures (pci_dn) when the topology changes.
> The end result is that hot-added devices cannot be enabled and hot-removed
> devices may not be fully torn-down on removal.
> 
> We can fix these problems by setting the "pcie_ports_disabled" flag during
> platform initialisation. The flag indicates the platform owns the PCIe
> ports which stops the portbus driver being registered.

s/being/from being

> 
> Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> Fixes: 66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> Sergey, just FYI. I'll try sort out the rest of the hotplug
> trainwreck in 5.6.
> 
> The Fixes: here is for the patch that added pnv_php in 4.8. It's been
> a problem since then, but wasn't noticed until people started testing
> it after the EEH fixes in commit 799abe283e51 ("powerpc/eeh: Clean up
> EEH PEs after recovery finishes") went in earlier in the 5.4 cycle.
> ---
>  arch/powerpc/platforms/powernv/pci.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 2825d00..ae62583 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -941,6 +941,23 @@ void __init pnv_pci_init(void)
> 
>  	pci_add_flags(PCI_CAN_SKIP_ISA_ALIGN);
> 
> +#ifdef CONFIG_PCIEPORTBUS
> +	/*
> +	 * On PowerNV PCIe devices are (currently) managed in cooperation
> +	 * with firmware. This isn't *strictly* required, but there's enough
> +	 * assumptions baked into both firmware and the platform code that
> +	 * it's unwise to allow the portbus services to be used.
> +	 *
> +	 * We need to fix this eventually, but for now set this flag to disable
> +	 * the portbus driver. The AER service isn't required since that AER
> +	 * events are handled via EEH. The pciehp hotplug driver can't work
> +	 * without kernel changes (and portbus binding breaks pnv_php). The
> +	 * other services also require some thinking about how we're going
> +	 * to integrate them.
> +	 */
> +	pcie_ports_disabled = true;
> +#endif
> +
>  	/* If we don't have OPAL, eg. in sim, just skip PCI probe */
>  	if (!firmware_has_feature(FW_FEATURE_OPAL))
>  		return;
> 

