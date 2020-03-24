Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F2191BBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 22:09:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n3lT6lS5zDqBH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 08:09:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n3j31BQrzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 08:07:02 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OL4NB8125869; Tue, 24 Mar 2020 17:06:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0pfc39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 17:06:36 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02OL4b4W127722;
 Tue, 24 Mar 2020 17:06:36 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0pfc2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 17:06:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02OL5lBG009991;
 Tue, 24 Mar 2020 21:06:35 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw237wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 21:06:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02OL6YbN32047558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 21:06:34 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A49AEAE064;
 Tue, 24 Mar 2020 21:06:34 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB369AE062;
 Tue, 24 Mar 2020 21:06:33 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2020 21:06:33 +0000 (GMT)
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
From: Haren Myneni <haren@linux.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
In-Reply-To: <7793f6d4-770b-5fd0-f177-651130c0ff53@kaod.org>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
 <7793f6d4-770b-5fd0-f177-651130c0ff53@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2020 14:06:01 -0700
Message-ID: <1585083961.10664.1.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_07:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240105
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
Cc: mikey@neuling.org, Frederic Bonnard <FREDERIC@fr.ibm.com>,
 herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-24 at 15:48 +0100, Cédric Le Goater wrote:
> On 3/19/20 7:14 AM, Haren Myneni wrote:
> > 
> > Alloc IRQ and get trigger port address for each VAS instance. Kernel
> > register this IRQ per VAS instance and sets this port for each send
> > window. NX interrupts the kernel when it sees page fault.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/powernv/vas.c | 34 ++++++++++++++++++++++++++++------
> >  arch/powerpc/platforms/powernv/vas.h |  2 ++
> >  2 files changed, 30 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
> > index ed9cc6d..168ab68 100644
> > --- a/arch/powerpc/platforms/powernv/vas.c
> > +++ b/arch/powerpc/platforms/powernv/vas.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of.h>
> >  #include <asm/prom.h>
> > +#include <asm/xive.h>
> >  
> >  #include "vas.h"
> >  
> > @@ -25,10 +26,12 @@
> >  
> >  static int init_vas_instance(struct platform_device *pdev)
> >  {
> > -	int rc, cpu, vasid;
> > -	struct resource *res;
> > -	struct vas_instance *vinst;
> >  	struct device_node *dn = pdev->dev.of_node;
> > +	struct vas_instance *vinst;
> > +	uint32_t chipid, irq;
> > +	struct resource *res;
> > +	int rc, cpu, vasid;
> > +	uint64_t port;
> >  
> >  	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
> >  	if (rc) {
> > @@ -36,6 +39,12 @@ static int init_vas_instance(struct platform_device *pdev)
> >  		return -ENODEV;
> >  	}
> >  
> > +	rc = of_property_read_u32(dn, "ibm,chip-id", &chipid);
> > +	if (rc) {
> > +		pr_err("No ibm,chip-id property for %s?\n", pdev->name);
> > +		return -ENODEV;
> > +	}
> > +
> >  	if (pdev->num_resources != 4) {
> >  		pr_err("Unexpected DT configuration for [%s, %d]\n",
> >  				pdev->name, vasid);
> > @@ -69,9 +78,22 @@ static int init_vas_instance(struct platform_device *pdev)
> >  
> >  	vinst->paste_win_id_shift = 63 - res->end;
> >  
> > -	pr_devel("Initialized instance [%s, %d], paste_base 0x%llx, "
> > -			"paste_win_id_shift 0x%llx\n", pdev->name, vasid,
> > -			vinst->paste_base_addr, vinst->paste_win_id_shift);
> > +	rc = xive_native_alloc_get_irq_info(chipid, &irq, &port);
> > +	if (rc)
> > +		return rc;
> > +
> > +	vinst->virq = irq_create_mapping(NULL, irq);
> > +	if (!vinst->virq) {
> > +		pr_err("Inst%d: Unable to map global irq %d\n",
> > +				vinst->vas_id, irq);
> > +		return -EINVAL;
> > +	}
> > +
> > +	vinst->irq_port = port;
> 
> 
> I would prefer something like this : 
> 
> 	hwirq = xive_native_alloc_irq_on_chip(chip_id);
> 
> 	vinst->virq = irq_create_mapping(NULL, hwirq);
>  	if (!vinst->virq) {
> 		...
> 	}
> 
> 	{
> 		struct irq_data *d = irq_get_irq_data(vinst->virq);
> 		struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
> 
> 		vinst->irq_port = xd->trig_page;
> 	}
> 
> 
> and dump xive_native_alloc_get_irq_info().

Thanks Cedric, I will remove patch which adds this function. 

> 
> C.
> 


