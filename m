Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA412578F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 00:15:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dW7f0TbYzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 10:15:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dW5X0l5NzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 10:13:19 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIMwhdm017280; Wed, 18 Dec 2019 18:13:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy7ubjyrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 18:13:07 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBIN8qCp069434;
 Wed, 18 Dec 2019 18:13:07 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy7ubjyr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 18:13:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBINCOOG015411;
 Wed, 18 Dec 2019 23:13:06 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2wvqc73vdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 23:13:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBIND50e39190880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 23:13:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 000DA6A04F;
 Wed, 18 Dec 2019 23:13:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B76D6A04D;
 Wed, 18 Dec 2019 23:13:04 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 23:13:04 +0000 (GMT)
Subject: Re: [PATCH 04/14] powerpc/vas: Setup IRQ mapping and register port
 for each window
From: Haren Myneni <haren@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
In-Reply-To: <CAOSf1CEvZ32xC71siuyfUQEcQ4yLoDtj2jGoc3jrmsHc0jD+Vw@mail.gmail.com>
References: <1574816731.13250.9.camel@hbabu-laptop>
 <CAOSf1CEvZ32xC71siuyfUQEcQ4yLoDtj2jGoc3jrmsHc0jD+Vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Dec 2019 15:13:01 -0800
Message-ID: <1576710781.12797.10.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=2 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180172
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
Cc: Device Tree <devicetree@vger.kernel.org>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-12-18 at 18:18 +1100, Oliver O'Halloran wrote:
> On Wed, Nov 27, 2019 at 12:07 PM Haren Myneni <haren@linux.vnet.ibm.com> wrote:
> >
> > *snip*
> >
> > @@ -36,7 +62,18 @@ static int init_vas_instance(struct platform_device *pdev)
> >                 return -ENODEV;
> >         }
> >
> > -       if (pdev->num_resources != 4) {
> > +       rc = of_property_read_u64(dn, "ibm,vas-port", &port);
> > +       if (rc) {
> > +               pr_err("No ibm,vas-port property for %s?\n", pdev->name);
> > +               /* No interrupts property */
> > +               nresources = 4;
> > +       }
> > +
> > +       /*
> > +        * interrupts property is available with 'ibm,vas-port' property.
> > +        * 4 Resources and 1 IRQ if interrupts property is available.
> > +        */
> > +       if (pdev->num_resources != nresources) {
> >                 pr_err("Unexpected DT configuration for [%s, %d]\n",
> >                                 pdev->name, vasid);
> >                 return -ENODEV;
> 
> Right, so adding the IRQ in firmware will break the VAS driver in
> existing kernels since it changes the resource count. This is IMO a
> bug in the VAS driver that you should fix, but it does mean we need to
> think twice about having firmware assign an interrupt at boot.

Correct, Hence added vas-user-space nvram switch in skiboot.  

> 
> I had a closer look at this series and I'm not convinced that any
> firmware changes are actually required either. We already have OPAL
> calls for allocating an hwirq for the kernel to use and for getting
> the IRQ's XIVE trigger port (see pnv_ocxl_alloc_xive_irq() for an
> example). Why not use those here too? Doing so would allow us to
> assign interrupts to individual windows too which might be useful for
> the windows used by the kernel.

Thanks for the pointer. like using pnv_ocxl_alloc_xive_irq(), we can
disregard FW change. BTW, VAS fault handling is needed only for user
space VAS windows. 

 int vas_alloc_xive_irq(u32 chipid, u32 *irq, u64 *trigger_addr)
{
        __be64 flags, trigger_page;
        u32 hwirq;
        s64 rc;

        hwirq = opal_xive_allocate_irq_raw(chipid);
        if (hwirq < 0)
                return -ENOENT;

        rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page,
NULL,
                                NULL);
        if (rc || !trigger_page) {
                xive_native_free_irq(hwirq);
                return -ENOENT;
        }

        *irq = hwirq;
        *trigger_addr = be64_to_cpu(trigger_page);
        return 0;
}

We can have common function for VAS and cxl except per chip IRQ
allocation is needed for each VAS instance. I will post patch-set with
this change.

Thanks
Haren


