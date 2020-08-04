Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7A23C1D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 00:17:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLpyk1jHvzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:17:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLnyc0CXNzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 07:32:07 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074LVXf4002217; Tue, 4 Aug 2020 17:32:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qbe5q2mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 17:31:59 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 074LVxp0003523;
 Tue, 4 Aug 2020 17:31:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qbe5q2mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 17:31:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074LEeGI002984;
 Tue, 4 Aug 2020 21:31:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 32n0192cs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 21:31:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 074LVr1c23003574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 21:31:53 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46646BE053;
 Tue,  4 Aug 2020 21:31:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0153BE04F;
 Tue,  4 Aug 2020 21:31:55 +0000 (GMT)
Received: from oc3560204572.ibm.com (unknown [9.85.148.242])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 21:31:55 +0000 (GMT)
Message-ID: <79336403760b0c9b913cc5c36594aa72e1870182.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/7] powerpc/pseries/iommu: Update call to ibm,
 query-pe-dma-windows
From: David Dai <zdai@linux.vnet.ibm.com>
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Date: Tue, 04 Aug 2020 16:31:55 -0500
In-Reply-To: <20200716071658.467820-3-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-3-leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> > From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can make the
> > number of
> 
> outputs from "ibm,query-pe-dma-windows" go from 5 to 6.
> 
> This change of output size is meant to expand the address size of
> largest_available_block PE TCE from 32-bit to 64-bit, which ends up
> shifting page_size and migration_capable.
> 
> This ends up requiring the update of
> ddw_query_response->largest_available_block from u32 to u64, and
> manually
> assigning the values from the buffer into this struct, according to
> output size.
> 
> Also, a routine was created for helping reading the ddw extensions as
> suggested by LoPAR: First reading the size of the extension array
> from
> index 0, checking if the property exists, and then returning it's
> value.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 91 +++++++++++++++++++++++-
> --
>  1 file changed, 81 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c
> index ac0d6376bdad..1a933c4e8bba 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -47,6 +47,12 @@ enum {
>  	DDW_APPLICABLE_SIZE
>  };
>  
> +enum {
> +	DDW_EXT_SIZE = 0,
> +	DDW_EXT_RESET_DMA_WIN = 1,
> +	DDW_EXT_QUERY_OUT_SIZE = 2
> +};
> +
>  static struct iommu_table_group *iommu_pseries_alloc_group(int node)
>  {
>  	struct iommu_table_group *table_group;
> @@ -342,7 +348,7 @@ struct direct_window {
>  /* Dynamic DMA Window support */
>  struct ddw_query_response {
>  	u32 windows_available;
> -	u32 largest_available_block;
> +	u64 largest_available_block;
>  	u32 page_size;
>  	u32 migration_capable;
>  };
> @@ -877,14 +883,62 @@ static int find_existing_ddw_windows(void)
>  }
>  machine_arch_initcall(pseries, find_existing_ddw_windows);
>  
> +/**
> + * ddw_read_ext - Get the value of an DDW extension
> + * @np:		device node from which the extension value is
> to be read.
> + * @extnum:	index number of the extension.
> + * @value:	pointer to return value, modified when extension is
> available.
> + *
> + * Checks if "ibm,ddw-extensions" exists for this node, and get the
> value
> + * on index 'extnum'.
> + * It can be used only to check if a property exists, passing value
> == NULL.
> + *
> + * Returns:
> + *	0 if extension successfully read
> + *	-EINVAL if the "ibm,ddw-extensions" does not exist,
> + *	-ENODATA if "ibm,ddw-extensions" does not have a value, and
> + *	-EOVERFLOW if "ibm,ddw-extensions" does not contain this
> extension.
> + */
> +static inline int ddw_read_ext(const struct device_node *np, int
> extnum,
> +			       u32 *value)
> +{
> +	static const char propname[] = "ibm,ddw-extensions";
> +	u32 count;
> +	int ret;
> +
> +	ret = of_property_read_u32_index(np, propname, DDW_EXT_SIZE,
> &count);
> +	if (ret)
> +		return ret;
> +
> +	if (count < extnum)
> +		return -EOVERFLOW;
> +
> +	if (!value)
> +		value = &count;
> +
> +	return of_property_read_u32_index(np, propname, extnum, value);
> +}
> +
>  static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
> -			struct ddw_query_response *query)
> +		     struct ddw_query_response *query,
> +		     struct device_node *parent)
>  {
>  	struct device_node *dn;
>  	struct pci_dn *pdn;
> -	u32 cfg_addr;
> +	u32 cfg_addr, ext_query, query_out[5];
>  	u64 buid;
> -	int ret;
> +	int ret, out_sz;
> +
> +	/*
> +	 * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule
> how many
> +	 * output parameters ibm,query-pe-dma-windows will have,
> ranging from
> +	 * 5 to 6.
> +	 */
> +	ret = ddw_read_ext(parent, DDW_EXT_QUERY_OUT_SIZE, &ext_query);
> +	if (!ret && ext_query == 1)
> +		out_sz = 6;
> +	else
> +		out_sz = 5;
>  
>  	/*
>  	 * Get the config address and phb buid of the PE window.
> @@ -897,11 +951,28 @@ static int query_ddw(struct pci_dev *dev, const
> u32 *ddw_avail,
>  	buid = pdn->phb->buid;
>  	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
>  
> -	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, 5, (u32
> *)query,
> +	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, out_sz,
> query_out,
>  			cfg_addr, BUID_HI(buid), BUID_LO(buid));
> -	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
> -		" returned %d\n", ddw_avail[DDW_QUERY_PE_DMA_WIN],
> cfg_addr,
> -		 BUID_HI(buid), BUID_LO(buid), ret);
> +	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x
> returned %d\n",
> +		 ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr,
> BUID_HI(buid),
> +		 BUID_LO(buid), ret);
> +
> +	switch (out_sz) {
> +	case 5:
> +		query->windows_available = query_out[0];
> +		query->largest_available_block = query_out[1];
> +		query->page_size = query_out[2];
> +		query->migration_capable = query_out[3];
> +		break;
> +	case 6:
> +		query->windows_available = query_out[0];
> +		query->largest_available_block = ((u64)query_out[1] <<
> 32) |
> +						 query_out[2];
> +		query->page_size = query_out[3];
> +		query->migration_capable = query_out[4];
> +		break;
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1049,7 +1120,7 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>  	 * of page sizes: supported and supported for migrate-dma.
>  	 */
>  	dn = pci_device_to_OF_node(dev);
> -	ret = query_ddw(dev, ddw_avail, &query);
> +	ret = query_ddw(dev, ddw_avail, &query, pdn);
>  	if (ret != 0)
>  		goto out_failed;
>  
> @@ -1077,7 +1148,7 @@ static u64 enable_ddw(struct pci_dev *dev,
> struct device_node *pdn)
>  	/* check largest block * page size > max memory hotplug addr */
>  	max_addr = ddw_memory_hotplug_max();
>  	if (query.largest_available_block < (max_addr >> page_shift)) {
> -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with
> %u "
> +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with
> %llu "
>  			  "%llu-sized pages\n",
> max_addr,  query.largest_available_block,
>  			  1ULL << page_shift);
>  		goto out_failed;
Tested-by: David Dai <zdai@linux.vnet.ibm.com>

