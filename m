Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28CF36EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:23:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478BbS65GWzF0Pt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 05:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478BW868BJzDrMC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 05:19:16 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA7I7LCm099844
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 Nov 2019 13:19:13 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w4pm250v7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 13:19:13 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 7 Nov 2019 18:19:10 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Nov 2019 18:19:02 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA7IJ1dU44105970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Nov 2019 18:19:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E2024C046;
 Thu,  7 Nov 2019 18:19:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D9F4C044;
 Thu,  7 Nov 2019 18:19:00 +0000 (GMT)
Received: from pic2.home (unknown [9.145.15.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Nov 2019 18:18:59 +0000 (GMT)
Subject: Re: [PATCH 07/10] ocxl: Save the device serial number in ocxl_fn
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-8-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 7 Nov 2019 19:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025044721.16617-8-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110718-0016-0000-0000-000002C1AD4F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110718-0017-0000-0000-000033233106
Message-Id: <11327e5f-bc88-620e-f119-495eb7d4b02f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=777 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911070167
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
Cc: Oscar Salvador <osalvador@suse.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/10/2019 à 06:47, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch retrieves the serial number of the card and makes it available
> to consumers of the ocxl driver via the ocxl_fn struct.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---


Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   drivers/misc/ocxl/config.c | 46 ++++++++++++++++++++++++++++++++++++++
>   include/misc/ocxl.h        |  1 +
>   2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index fb0c3b6f8312..a9203c309365 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -71,6 +71,51 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
>   	return 0;
>   }
>   
> +/**
> + * Find a related PCI device (function 0)
> + * @device: PCI device to match
> + *
> + * Returns a pointer to the related device, or null if not found
> + */
> +static struct pci_dev *get_function_0(struct pci_dev *dev)
> +{
> +	unsigned int devfn = PCI_DEVFN(PCI_SLOT(dev->devfn), 0); // Look for function 0
> +
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus),
> +					dev->bus->number, devfn);
> +}
> +
> +static void read_serial(struct pci_dev *dev, struct ocxl_fn_config *fn)
> +{
> +	u32 low, high;
> +	int pos;
> +
> +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DSN);
> +	if (pos) {
> +		pci_read_config_dword(dev, pos + 0x04, &low);
> +		pci_read_config_dword(dev, pos + 0x08, &high);
> +
> +		fn->serial = low | ((u64)high) << 32;
> +
> +		return;
> +	}
> +
> +	if (PCI_FUNC(dev->devfn) != 0) {
> +		struct pci_dev *related = get_function_0(dev);
> +
> +		if (!related) {
> +			fn->serial = 0;
> +			return;
> +		}
> +
> +		read_serial(related, fn);
> +		pci_dev_put(related);
> +		return;
> +	}
> +
> +	fn->serial = 0;
> +}
> +
>   static void read_pasid(struct pci_dev *dev, struct ocxl_fn_config *fn)
>   {
>   	u16 val;
> @@ -208,6 +253,7 @@ int ocxl_config_read_function(struct pci_dev *dev, struct ocxl_fn_config *fn)
>   	int rc;
>   
>   	read_pasid(dev, fn);
> +	read_serial(dev, fn);
>   
>   	rc = read_dvsec_tl(dev, fn);
>   	if (rc) {
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 6f7c02f0d5e3..9843051c3c5b 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -46,6 +46,7 @@ struct ocxl_fn_config {
>   	int dvsec_afu_info_pos; /* offset of the AFU information DVSEC */
>   	s8 max_pasid_log;
>   	s8 max_afu_index;
> +	u64 serial;
>   };
>   
>   enum ocxl_endian {
> 

