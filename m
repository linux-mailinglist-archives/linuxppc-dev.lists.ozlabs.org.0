Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912523C1D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 00:20:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLq2W6y4rzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zdai@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLnzw09WTzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 07:33:15 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074L3dFB172009; Tue, 4 Aug 2020 17:33:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qdvetq27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 17:33:06 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 074LULxg043451;
 Tue, 4 Aug 2020 17:33:06 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qdvetq1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 17:33:06 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074LFiA1017154;
 Tue, 4 Aug 2020 21:33:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 32n0193faf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 21:33:05 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 074LX1GD11338472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 21:33:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2827ABE058;
 Tue,  4 Aug 2020 21:33:04 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B557CBE04F;
 Tue,  4 Aug 2020 21:33:02 +0000 (GMT)
Received: from oc3560204572.ibm.com (unknown [9.85.148.242])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 21:33:02 +0000 (GMT)
Message-ID: <e6c3c5a8d565d8a75c0fffc5811d487719b916a0.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 4/7] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: David Dai <zdai@linux.vnet.ibm.com>
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Date: Tue, 04 Aug 2020 16:33:02 -0500
In-Reply-To: <20200716071658.467820-5-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-5-leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 suspectscore=2 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040144
X-Mailman-Approved-At: Wed, 05 Aug 2020 08:14:00 +1000
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

On Thu, 2020-07-16 at 04:16 -0300, Leonardo Bras wrote:
> On LoPAR "DMA Window Manipulation Calls", it's recommended to remove
> the
> default DMA window for the device, before attempting to configure a
> DDW,
> in order to make the maximum resources available for the next DDW to
> be
> created.
> 
> This is a requirement for using DDW on devices in which hypervisor
> allows only one DMA window.
> 
> If setting up a new DDW fails anywhere after the removal of this
> default DMA window, it's needed to restore the default DMA window.
> For this, an implementation of ibm,reset-pe-dma-windows rtas call is
> needed:
> 
> Platforms supporting the DDW option starting with LoPAR level 2.7
> implement
> ibm,ddw-extensions. The first extension available (index 2) carries
> the
> token for ibm,reset-pe-dma-windows rtas call, which is used to
> restore
> the default DMA window for a device, if it has been deleted.
> 
> It does so by resetting the TCE table allocation for the PE to it's
> boot time value, available in "ibm,dma-window" device tree node.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 73 +++++++++++++++++++++++-
> --
>  1 file changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c
> index 4e33147825cc..fc8d0555e2e9 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1066,6 +1066,38 @@ static phys_addr_t
> ddw_memory_hotplug_max(void)
>  	return max_addr;
>  }
>  
> +/*
> + * Platforms supporting the DDW option starting with LoPAR level 2.7
> implement
> + * ibm,ddw-extensions, which carries the rtas token for
> + * ibm,reset-pe-dma-windows.
> + * That rtas-call can be used to restore the default DMA window for
> the device.
> + */
> +static void reset_dma_window(struct pci_dev *dev, struct device_node
> *par_dn)
> +{
> +	int ret;
> +	u32 cfg_addr, reset_dma_win;
> +	u64 buid;
> +	struct device_node *dn;
> +	struct pci_dn *pdn;
> +
> +	ret = ddw_read_ext(par_dn, DDW_EXT_RESET_DMA_WIN,
> &reset_dma_win);
> +	if (ret)
> +		return;
> +
> +	dn = pci_device_to_OF_node(dev);
> +	pdn = PCI_DN(dn);
> +	buid = pdn->phb->buid;
> +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> +
> +	ret = rtas_call(reset_dma_win, 3, 1, NULL, cfg_addr,
> BUID_HI(buid),
> +			BUID_LO(buid));
> +	if (ret)
> +		dev_info(&dev->dev,
> +			 "ibm,reset-pe-dma-windows(%x) %x %x %x
> returned %d ",
> +			 reset_dma_win, cfg_addr, BUID_HI(buid),
> BUID_LO(buid),
> +			 ret);
> +}
> +
>  /*
>   * If the PE supports dynamic dma windows, and there is space for a
> table
>   * that can map all pages in a linear offset, then setup such a
> table,
> @@ -1090,6 +1122,7 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>  	struct property *win64;
>  	struct dynamic_dma_window_prop *ddwprop;
>  	struct failed_ddw_pdn *fpdn;
> +	bool default_win_removed = false;
>  
>  	mutex_lock(&direct_window_init_mutex);
>  
> @@ -1133,14 +1166,38 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>  	if (ret != 0)
>  		goto out_failed;
>  
> +	/*
> +	 * If there is no window available, remove the default DMA
> window,
> +	 * if it's present. This will make all the resources available
> to the
> +	 * new DDW window.
> +	 * If anything fails after this, we need to restore it, so also
> check
> +	 * for extensions presence.
> +	 */
>  	if (query.windows_available == 0) {
> -		/*
> -		 * no additional windows are available for this device.
> -		 * We might be able to reallocate the existing window,
> -		 * trading in for a larger page size.
> -		 */
> -		dev_dbg(&dev->dev, "no free dynamic windows");
> -		goto out_failed;
> +		struct property *default_win;
> +		int reset_win_ext;
> +
> +		default_win = of_find_property(pdn, "ibm,dma-window",
> NULL);
> +		if (!default_win)
> +			goto out_failed;
> +
> +		reset_win_ext = ddw_read_ext(pdn,
> DDW_EXT_RESET_DMA_WIN, NULL);
> +		if (reset_win_ext)
> +			goto out_failed;
> +
> +		remove_dma_window(pdn, ddw_avail, default_win);
> +		default_win_removed = true;
> +
> +		/* Query again, to check if the window is available */
> +		ret = query_ddw(dev, ddw_avail, &query, pdn);
> +		if (ret != 0)
> +			goto out_failed;
> +
> +		if (query.windows_available == 0) {
> +			/* no windows are available for this device. */
> +			dev_dbg(&dev->dev, "no free dynamic windows");
> +			goto out_failed;
> +		}
>  	}
>  	if (query.page_size & 4) {
>  		page_shift = 24; /* 16MB */
> @@ -1231,6 +1288,8 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>  	kfree(win64);
>  
>  out_failed:
> +	if (default_win_removed)
> +		reset_dma_window(dev, pdn);
>  
>  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
>  	if (!fpdn)
Tested-by: David Dai <zdai@linux.vnet.ibm.com>

