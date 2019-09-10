Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D0AE1C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 03:03:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S6Gs44RvzDqQG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:03:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S6Bk3zTmzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:59:58 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A0vNun141320
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 20:59:56 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uww6sqh8q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 20:59:56 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 01:59:54 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 01:59:52 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8A0xpv846792984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 00:59:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED6E3A4040;
 Tue, 10 Sep 2019 00:59:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D589A4057;
 Tue, 10 Sep 2019 00:59:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 00:59:50 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 15802A0226;
 Tue, 10 Sep 2019 10:59:49 +1000 (AEST)
Subject: Re: [PATCH 07/11] pci/hotplug/pnv-php: Improve error msg on power
 state change failure
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 10:59:49 +1000
In-Reply-To: <20190909154600.19917-8-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-8-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091000-4275-0000-0000-00000363A630
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091000-4276-0000-0000-00003875F7DB
Message-Id: <94ed317479764285102e90850ea9c4ab30fb9f2e.camel@au1.ibm.com>
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
> When changing the slot state, if opal hits an error and tells as such
> in the asynchronous reply, the warning "Wrong msg" is logged, which
> is
> rather confusing. Instead we can reuse the better message which is
> already used when we couldn't submit the asynchronous opal request
> initially.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c
> b/drivers/pci/hotplug/pnv_php.c
> index 5b5cbf1e636d..304bdbcdb77c 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -336,18 +336,19 @@ int pnv_php_set_slot_power_state(struct
> hotplug_slot *slot,
>  	ret = pnv_pci_set_power_state(php_slot->id, state, &msg);
>  	if (ret > 0) {
>  		if (be64_to_cpu(msg.params[1]) != php_slot->dn->phandle
> 	||
> -		    be64_to_cpu(msg.params[2]) != state			
> ||
> -		    be64_to_cpu(msg.params[3]) != OPAL_SUCCESS) {
> +		    be64_to_cpu(msg.params[2]) != state) {
>  			pci_warn(php_slot->pdev, "Wrong msg (%lld,
> %lld, %lld)\n",
>  				 be64_to_cpu(msg.params[1]),
>  				 be64_to_cpu(msg.params[2]),
>  				 be64_to_cpu(msg.params[3]));
>  			return -ENOMSG;
>  		}
> +		if (be64_to_cpu(msg.params[3]) != OPAL_SUCCESS) {
> +			ret = -ENODEV;
> +			goto error;
> +		}
>  	} else if (ret < 0) {
> -		pci_warn(php_slot->pdev, "Error %d powering %s\n",
> -			 ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on"
> : "off");
> -		return ret;
> +		goto error;
>  	}
>  
>  	if (state == OPAL_PCI_SLOT_POWER_OFF || state ==
> OPAL_PCI_SLOT_OFFLINE)
> @@ -356,6 +357,11 @@ int pnv_php_set_slot_power_state(struct
> hotplug_slot *slot,
>  		ret = pnv_php_add_devtree(php_slot);
>  
>  	return ret;
> +
> +error:
> +	pci_warn(php_slot->pdev, "Error %d powering %s\n",
> +		 ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" :
> "off");
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pnv_php_set_slot_power_state);
>  

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

