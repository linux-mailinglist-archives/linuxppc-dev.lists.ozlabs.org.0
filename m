Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8FF4020
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 06:51:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Tsw3CLqzF6ld
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478Tqm3xM6zF6k8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 16:49:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA85kkOM109199
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 8 Nov 2019 00:49:37 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5252gpev-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 00:49:37 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 8 Nov 2019 05:49:34 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Nov 2019 05:49:30 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA85ms8x28180780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 05:48:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 646A311C04A;
 Fri,  8 Nov 2019 05:49:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4DA311C04C;
 Fri,  8 Nov 2019 05:49:25 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.217.215])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Nov 2019 05:49:25 +0000 (GMT)
Date: Thu, 7 Nov 2019 21:49:22 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-2-git-send-email-linuxram@us.ibm.com>
 <1572902923-8096-3-git-send-email-linuxram@us.ibm.com>
 <87k18c56ej.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k18c56ej.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19110805-0016-0000-0000-000002C1CC24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110805-0017-0000-0000-0000332351B9
Message-Id: <20191108054922.GH5201@oc0525413822.ibm.com>
Subject: RE: [RFC v1 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for Secure
 VMs aswell.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-08_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=939 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080057
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 07, 2019 at 09:26:28PM +1100, Michael Ellerman wrote:
> Ram Pai <linuxram@us.ibm.com> writes:
> > This enables IOMMU support for pseries Secure VMs.
> 
> Can you give us some more explanation please?

Yes. Will do. 

The simple explanation is -- it was a mistake. We should 
not have disabled IOMMU ops for secure guests. Though it enabled
us to use virtio devices, with the help of some additional patches to
the virtio subsystem; in hindsight, we should not have disabled IOMMU
ops for secure VMs  :-(. 

RP



> 
> This is basically a revert of commit:
>   edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests")
> 
> But neglects to remove the now unnecessary include of svm.h.
> 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 07f0847..189717b 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -1333,15 +1333,7 @@ void iommu_init_early_pSeries(void)
> >  	of_reconfig_notifier_register(&iommu_reconfig_nb);
> >  	register_memory_notifier(&iommu_mem_nb);
> >  
> > -	/*
> > -	 * Secure guest memory is inacessible to devices so regular DMA isn't
> > -	 * possible.
> > -	 *
> > -	 * In that case keep devices' dma_map_ops as NULL so that the generic
> > -	 * DMA code path will use SWIOTLB to bounce buffers for DMA.
> 
> Please explain what has changed to make this no longer necessary.
> 
> cheers
> 
> > -	 */
> > -	if (!is_secure_guest())
> > -		set_pci_dma_ops(&dma_iommu_ops);
> > +	set_pci_dma_ops(&dma_iommu_ops);
> >  }
> >  
> >  static int __init disable_multitce(char *str)
> > -- 
> > 1.8.3.1

-- 
Ram Pai

