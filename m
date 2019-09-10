Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8BAE1BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 03:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S6Bs4NxfzDqRq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S6893nHbzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:57:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A0vBxk092397
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 20:57:43 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uwxbu597p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 20:57:43 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 01:57:41 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 01:57:38 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8A0vCQD38207974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 00:57:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE7AF52051;
 Tue, 10 Sep 2019 00:57:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5DCE552050;
 Tue, 10 Sep 2019 00:57:36 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2725DA01D3;
 Tue, 10 Sep 2019 10:57:35 +1000 (AEST)
Subject: Re: [PATCH 05/11] powerpc/powernv/ioda: Find opencapi slot for a
 device node
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 10:57:35 +1000
In-Reply-To: <20190909154600.19917-6-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-6-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091000-0012-0000-0000-00000349331C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091000-0013-0000-0000-0000218394F5
Message-Id: <49f7cf15598ac5a95458461dc08bdca15e14f4f1.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100005
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-09 at 17:45 +0200, Frederic Barrat wrote:
> Unlike real PCI slots, opencapi slots are directly associated to
> the (virtual) opencapi PHB, there's no intermediate bridge. So when
> looking for a slot ID, we must start the search from the device node
> itself and not its parent.
> 
> Also, the slot ID is not attached to a specific bdfn, so let's build
> it from the PHB ID, like skiboot.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/pnv-pci.h   |  1 +
>  arch/powerpc/platforms/powernv/pci.c | 10 +++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pnv-pci.h
> b/arch/powerpc/include/asm/pnv-pci.h
> index edcb1fc50aeb..d0ee0ede5767 100644
> --- a/arch/powerpc/include/asm/pnv-pci.h
> +++ b/arch/powerpc/include/asm/pnv-pci.h
> @@ -15,6 +15,7 @@
>  #define PCI_SLOT_ID_PREFIX	(1UL << 63)
>  #define PCI_SLOT_ID(phb_id, bdfn)	\
>  	(PCI_SLOT_ID_PREFIX | ((uint64_t)(bdfn) << 16) | (phb_id))
> +#define PCI_PHB_SLOT_ID(phb_id)		(phb_id)
>  
>  extern int pnv_pci_get_slot_id(struct device_node *np, uint64_t
> *id);
>  extern int pnv_pci_get_device_tree(uint32_t phandle, void *buf,
> uint64_t len);
> diff --git a/arch/powerpc/platforms/powernv/pci.c
> b/arch/powerpc/platforms/powernv/pci.c
> index 6104418c9ad5..00a79f3c989f 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -48,13 +48,14 @@ int pnv_pci_get_slot_id(struct device_node *np,
> uint64_t *id)
>  		return -ENXIO;
>  
>  	bdfn = ((bdfn & 0x00ffff00) >> 8);
> -	while ((parent = of_get_parent(parent))) {
> +	for (parent = np; parent; parent = of_get_parent(parent)) {
>  		if (!PCI_DN(parent)) {
>  			of_node_put(parent);
>  			break;
>  		}
>  
> -		if (!of_device_is_compatible(parent, "ibm,ioda2-phb"))
> {
> +		if (!of_device_is_compatible(parent, "ibm,ioda2-phb")
> &&
> +		    !of_device_is_compatible(parent, "ibm,ioda2-npu2-
> opencapi-phb")) {
>  			of_node_put(parent);
>  			continue;
>  		}
> @@ -65,7 +66,10 @@ int pnv_pci_get_slot_id(struct device_node *np,
> uint64_t *id)
>  			return -ENXIO;
>  		}
>  
> -		*id = PCI_SLOT_ID(phbid, bdfn);
> +		if (of_device_is_compatible(parent, "ibm,ioda2-npu2-
> opencapi-phb"))
> +			*id = PCI_PHB_SLOT_ID(phbid);
> +		else
> +			*id = PCI_SLOT_ID(phbid, bdfn);
>  		return 0;
>  	}
>  

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

