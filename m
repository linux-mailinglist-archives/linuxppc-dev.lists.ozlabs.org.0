Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4A241F29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 19:27:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BR0C00dFhzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 03:27:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CDC9DinV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BR08k4pB2zDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 03:25:19 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07BHDMkv090865; Tue, 11 Aug 2020 13:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HyLHnK6FD4SyK6sPlQ+898grA3/mkQQaDf94D2rAktI=;
 b=CDC9DinVq2QM5JpfrpsBh4ZsRP6K+bD95Fpjn2KuE8CYRGIRPaAkSnDvtfDqJdp4V5tg
 yN7JoTML4+fruhpJLKLldTnH4mE/LOoqeUYQsjA9ViPkAymIPj7PeoMwMa1wzaNuE4Eo
 JBQGt5aJlEcZpU+jEPymOYhVBxeParHKRPFmrOKW/iDBGXkGsdXj0DotVPcUnRCvL6sG
 jPowwY/DoJjidrRm+kv91LjwYM5s0G/Vg9y9DUQtlY26BL3B9k2fxdAVk8JWx97l3U/u
 X7dCzv0Kuc68cT1rPOyOSmY7AKwFrdpMrDHC3oD8luuCi4PV4ZCPPAoEHIgTwD3m42zM 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32uvjawgmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 13:25:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07BHFqoU097851;
 Tue, 11 Aug 2020 13:25:15 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32uvjawgkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 13:25:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07BHLmMW017551;
 Tue, 11 Aug 2020 17:25:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32skahbkfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 17:25:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07BHPBmj21037418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Aug 2020 17:25:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5888CA4057;
 Tue, 11 Aug 2020 17:25:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C41A405B;
 Tue, 11 Aug 2020 17:25:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.14.231])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Aug 2020 17:25:10 +0000 (GMT)
Subject: Re: [PATCH 2/2 v2] powerpc/powernv: Enable and setup PCI P2P
To: "Oliver O'Halloran" <oohall@gmail.com>, Max Gurtovoy <maxg@mellanox.com>
References: <20200430131520.51211-1-maxg@mellanox.com>
 <20200430131520.51211-2-maxg@mellanox.com>
 <CAOSf1CGv=0bwShzzK5zP3dtKg=RxeTFvq52j-Vi4GDfZ4UpBJA@mail.gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <56e60f7e-115b-c699-b5fa-c6026785649a@linux.ibm.com>
Date: Tue, 11 Aug 2020 19:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CGv=0bwShzzK5zP3dtKg=RxeTFvq52j-Vi4GDfZ4UpBJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_15:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008110115
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
Cc: vladimirk@mellanox.com, Carol L Soto <clsoto@us.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, shlomin@mellanox.com,
 israelr@mellanox.com, idanw@mellanox.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 aneela@mellanox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/08/2020 à 09:35, Oliver O'Halloran a écrit :
> On Thu, Apr 30, 2020 at 11:15 PM Max Gurtovoy <maxg@mellanox.com> wrote:
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
>> index 57d3a6a..9ecc576 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -3706,18 +3706,208 @@ static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
>>          }
>>   }
>>
>> +#ifdef CONFIG_PCI_P2PDMA
>> +static DEFINE_MUTEX(p2p_mutex);
>> +
>> +static bool pnv_pci_controller_owns_addr(struct pci_controller *hose,
>> +                                        phys_addr_t addr, size_t size)
>> +{
>> +       int i;
>> +
>> +       /*
>> +        * It seems safe to assume the full range is under the same PHB, so we
>> +        * can ignore the size.
>> +        */
>> +       for (i = 0; i < ARRAY_SIZE(hose->mem_resources); i++) {
>> +               struct resource *res = &hose->mem_resources[i];
>> +
>> +               if (res->flags && addr >= res->start && addr < res->end)
>> +                       return true;
>> +       }
>> +       return false;
>> +}
>> +
>> +/*
>> + * find the phb owning a mmio address if not owned locally
>> + */
>> +static struct pnv_phb *pnv_pci_find_owning_phb(struct pci_dev *pdev,
>> +                                              phys_addr_t addr, size_t size)
>> +{
>> +       struct pci_controller *hose;
>> +
>> +       /* fast path */
>> +       if (pnv_pci_controller_owns_addr(pdev->bus->sysdata, addr, size))
>> +               return NULL;
> 
> Do we actually need this fast path? It's going to be slow either way.
> Also if a device is doing p2p to another device under the same PHB
> then it should not be happening via the root complex. Is this a case
> you've tested?


The "fast path" comment is misleading and we should rephrase. The point 
is to catch if we're mapping a resource under the same PHB, in which 
case we don't modify the PHB configuration. So we need to catch it 
early, but it's not a fast path.
If the 2 devices are under the same PHB, the code above shouldn't do 
anything. So I guess behavior depends on the underlying bridge? We'll 
need another platform than witherspoon to test it. Probably worth checking.


>> +       list_for_each_entry(hose, &hose_list, list_node) {
>> +               struct pnv_phb *phb = hose->private_data;
>> +
>> +               if (phb->type != PNV_PHB_NPU_NVLINK &&
>> +                   phb->type != PNV_PHB_NPU_OCAPI) {
>> +                       if (pnv_pci_controller_owns_addr(hose, addr, size))
>> +                               return phb;
>> +               }
>> +       }
>> +       return NULL;
>> +}
>> +
>> +static u64 pnv_pci_dma_dir_to_opal_p2p(enum dma_data_direction dir)
>> +{
>> +       if (dir == DMA_TO_DEVICE)
>> +               return OPAL_PCI_P2P_STORE;
>> +       else if (dir == DMA_FROM_DEVICE)
>> +               return OPAL_PCI_P2P_LOAD;
>> +       else if (dir == DMA_BIDIRECTIONAL)
>> +               return OPAL_PCI_P2P_LOAD | OPAL_PCI_P2P_STORE;
>> +       else
>> +               return 0;
>> +}
>> +
>> +static int pnv_pci_ioda_enable_p2p(struct pci_dev *initiator,
>> +                                  struct pnv_phb *phb_target,
>> +                                  enum dma_data_direction dir)
>> +{
>> +       struct pci_controller *hose;
>> +       struct pnv_phb *phb_init;
>> +       struct pnv_ioda_pe *pe_init;
>> +       u64 desc;
>> +       int rc;
>> +
>> +       if (!opal_check_token(OPAL_PCI_SET_P2P))
>> +               return -ENXIO;
>> +
> 
>> +       hose = pci_bus_to_host(initiator->bus);
>> +       phb_init = hose->private_data;
> 
> You can use the pci_bus_to_pnvhb() helper
> 
>> +
>> +       pe_init = pnv_ioda_get_pe(initiator);
>> +       if (!pe_init)
>> +               return -ENODEV;
>> +
>> +       if (!pe_init->tce_bypass_enabled)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * Configuring the initiator's PHB requires to adjust its TVE#1
>> +        * setting. Since the same device can be an initiator several times for
>> +        * different target devices, we need to keep a reference count to know
>> +        * when we can restore the default bypass setting on its TVE#1 when
>> +        * disabling. Opal is not tracking PE states, so we add a reference
>> +        * count on the PE in linux.
>> +        *
>> +        * For the target, the configuration is per PHB, so we keep a
>> +        * target reference count on the PHB.
>> +        */
> 
> This irks me a bit because configuring the DMA address limits for the
> TVE is the kernel's job. What we really should be doing is using
> opal_pci_map_pe_dma_window_real() to set the bypass-mode address limit
> for the TVE to something large enough to hit the MMIO ranges rather
> than having set_p2p do it as a side effect. Unfortunately, for some
> reason skiboot doesn't implement support for enabling 56bit addressing
> using opal_pci_map_pe_dma_window_real() and we do need to support
> older kernel's which used this stuff so I guess we're stuck with it
> for now. It'd be nice if we could fix this in the longer term
> though...


OK. We'd need more than a 56-bit opal_pci_map_pe_dma_window_real() 
though, there's also a queue setting change on the target PHB.

   Fred


>> +       mutex_lock(&p2p_mutex);
>> +
>> +       desc = OPAL_PCI_P2P_ENABLE | pnv_pci_dma_dir_to_opal_p2p(dir);
>> +       /* always go to opal to validate the configuration */
>> +       rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id, desc,
>> +                             pe_init->pe_number);
>> +       if (rc != OPAL_SUCCESS) {
>> +               rc = -EIO;
>> +               goto out;
>> +       }
>> +
>> +       pe_init->p2p_initiator_count++;
>> +       phb_target->p2p_target_count++;
>> +
>> +       rc = 0;
>> +out:
>> +       mutex_unlock(&p2p_mutex);
>> +       return rc;
>> +}
>> +
>> +static int pnv_pci_dma_map_resource(struct pci_dev *pdev,
>> +                                   phys_addr_t phys_addr, size_t size,
>> +                                   enum dma_data_direction dir)
>> +{
>> +       struct pnv_phb *target_phb;
>> +
>> +       target_phb = pnv_pci_find_owning_phb(pdev, phys_addr, size);
>> +       if (!target_phb)
>> +               return 0;
>> +
>> +       return pnv_pci_ioda_enable_p2p(pdev, target_phb, dir);
>> +}
>> +
>> +static int pnv_pci_ioda_disable_p2p(struct pci_dev *initiator,
>> +               struct pnv_phb *phb_target)
>> +{
>> +       struct pci_controller *hose;
>> +       struct pnv_phb *phb_init;
>> +       struct pnv_ioda_pe *pe_init;
>> +       int rc;
>> +
>> +       if (!opal_check_token(OPAL_PCI_SET_P2P))
>> +               return -ENXIO;
> 
> This should probably have a WARN_ON() since we can't hit this path
> unless the initial map succeeds.
> 
>> +       hose = pci_bus_to_host(initiator->bus);
>> +       phb_init = hose->private_data;
> 
> pci_bus_to_pnvhb()
> 
>> +       pe_init = pnv_ioda_get_pe(initiator);
>> +       if (!pe_init)
>> +               return -ENODEV;
>> +
>> +       mutex_lock(&p2p_mutex);
>> +
>> +       if (!pe_init->p2p_initiator_count || !phb_target->p2p_target_count) {
>> +               rc = -EINVAL;
>> +               goto out;
>> +       }
>> +
>> +       if (--pe_init->p2p_initiator_count == 0)
>> +               pnv_pci_ioda2_set_bypass(pe_init, true);
>> +
>> +       if (--phb_target->p2p_target_count == 0) {
>> +               rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id,
>> +                                     0, pe_init->pe_number);
>> +               if (rc != OPAL_SUCCESS) {
>> +                       rc = -EIO;
>> +                       goto out;
>> +               }
>> +       }
>> +
>> +       rc = 0;
>> +out:
>> +       mutex_unlock(&p2p_mutex);
>> +       return rc;
>> +}
>> +
>> +static void pnv_pci_dma_unmap_resource(struct pci_dev *pdev,
>> +                                      dma_addr_t addr, size_t size,
>> +                                      enum dma_data_direction dir)
>> +{
>> +       struct pnv_phb *target_phb;
>> +       int rc;
>> +
>> +       target_phb = pnv_pci_find_owning_phb(pdev, addr, size);
>> +       if (!target_phb)
>> +               return;
>> +
>> +       rc = pnv_pci_ioda_disable_p2p(pdev, target_phb);
>> +       if (rc)
>> +               dev_err(&pdev->dev, "Failed to undo PCI peer-to-peer setup for address %llx: %d\n",
>> +                       addr, rc);
> 
> Use pci_err() or pe_err().
> 
