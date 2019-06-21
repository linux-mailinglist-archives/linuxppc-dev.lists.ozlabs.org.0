Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2EC4E369
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 11:23:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VYBs3TSLzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 19:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VY9871z7zDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 19:21:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5L99n7G114657
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 05:21:45 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8t5vx5w5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 05:21:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Fri, 21 Jun 2019 10:21:42 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Jun 2019 10:21:40 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5L9Ldbk59506730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 09:21:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DFFA42049;
 Fri, 21 Jun 2019 09:21:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDCBA42045;
 Fri, 21 Jun 2019 09:21:38 +0000 (GMT)
Received: from pic2.home (unknown [9.145.83.243])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jun 2019 09:21:38 +0000 (GMT)
Subject: Re: [PATCH 2/4] powerpc/powernv: remove the unused tunneling exports
To: "Oliver O'Halloran" <oohall@gmail.com>, Christoph Hellwig <hch@lst.de>
References: <20190523074924.19659-1-hch@lst.de>
 <20190523074924.19659-3-hch@lst.de>
 <CAOSf1CFu_T=7weW0eagzjTc8474ntVx1uCKdQh8sX85bfaPxCQ@mail.gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Fri, 21 Jun 2019 11:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CFu_T=7weW0eagzjTc8474ntVx1uCKdQh8sX85bfaPxCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-MC
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062109-0020-0000-0000-0000034C21B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062109-0021-0000-0000-0000219F80AF
Message-Id: <048e1242-a6ea-5d56-dc9a-e16f9eedf6d9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210077
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/06/2019 à 03:47, Oliver O'Halloran a écrit :
> On Thu, May 23, 2019 at 5:51 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> These have been unused ever since they've been added to the kernel.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   arch/powerpc/include/asm/pnv-pci.h        |  4 --
>>   arch/powerpc/platforms/powernv/pci-ioda.c |  4 +-
>>   arch/powerpc/platforms/powernv/pci.c      | 71 -----------------------
>>   arch/powerpc/platforms/powernv/pci.h      |  1 -
>>   4 files changed, 3 insertions(+), 77 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
>> index 9fcb0bc462c6..1ab4b0111abc 100644
>> --- a/arch/powerpc/include/asm/pnv-pci.h
>> +++ b/arch/powerpc/include/asm/pnv-pci.h
>> @@ -27,12 +27,8 @@ extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
>>   extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
>>                                     struct opal_msg *msg);
>>
>> -extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
>> -extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
>>   extern int pnv_pci_set_tunnel_bar(struct pci_dev *dev, uint64_t addr,
>>                                    int enable);
>> -extern int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid,
>> -                                     u32 *pid, u32 *tid);
> 
> IIRC as-notify was for CAPI which has an in-tree driver (cxl). Fred or
> Andrew (+cc), what's going on with this? Will it ever see the light of
> day?


The as-notify can be used in both CAPI mode and PCI mode. In capi mode, 
it's integrated in the capi protocol, so the cxl driver doesn't need to 
do extra setup, compared to what's already done to activate capi.
As mentioned in a previous iteration of that patchset, those APIs are to 
be used by the Mellanox CX5 driver. The in-tree driver is always a step 
behind their latest, but word is they are working on upstreaming those 
interactions.

   Fred

>>   int pnv_phb_to_cxl_mode(struct pci_dev *dev, uint64_t mode);
>>   int pnv_cxl_ioda_msi_setup(struct pci_dev *dev, unsigned int hwirq,
>>                             unsigned int virq);
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
>> index 126602b4e399..6b0caa2d0425 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -54,6 +54,8 @@
>>   static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
>>                                                "NPU_OCAPI" };
>>
>> +static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
>> +
>>   void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>>                              const char *fmt, ...)
>>   {
>> @@ -2360,7 +2362,7 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
>>          return 0;
>>   }
>>
>> -void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
>> +static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
>>   {
>>          uint16_t window_id = (pe->pe_number << 1 ) + 1;
>>          int64_t rc;
>> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
>> index 8d28f2932c3b..fc69f5611020 100644
>> --- a/arch/powerpc/platforms/powernv/pci.c
>> +++ b/arch/powerpc/platforms/powernv/pci.c
>> @@ -868,54 +868,6 @@ struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
>>   }
>>   EXPORT_SYMBOL(pnv_pci_get_phb_node);
>>
>> -int pnv_pci_enable_tunnel(struct pci_dev *dev, u64 *asnind)
>> -{
>> -       struct device_node *np;
>> -       const __be32 *prop;
>> -       struct pnv_ioda_pe *pe;
>> -       uint16_t window_id;
>> -       int rc;
>> -
>> -       if (!radix_enabled())
>> -               return -ENXIO;
>> -
>> -       if (!(np = pnv_pci_get_phb_node(dev)))
>> -               return -ENXIO;
>> -
>> -       prop = of_get_property(np, "ibm,phb-indications", NULL);
>> -       of_node_put(np);
>> -
>> -       if (!prop || !prop[1])
>> -               return -ENXIO;
>> -
>> -       *asnind = (u64)be32_to_cpu(prop[1]);
>> -       pe = pnv_ioda_get_pe(dev);
>> -       if (!pe)
>> -               return -ENODEV;
>> -
>> -       /* Increase real window size to accept as_notify messages. */
>> -       window_id = (pe->pe_number << 1 ) + 1;
>> -       rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id, pe->pe_number,
>> -                                            window_id, pe->tce_bypass_base,
>> -                                            (uint64_t)1 << 48);
>> -       return opal_error_code(rc);
>> -}
>> -EXPORT_SYMBOL_GPL(pnv_pci_enable_tunnel);
>> -
>> -int pnv_pci_disable_tunnel(struct pci_dev *dev)
>> -{
>> -       struct pnv_ioda_pe *pe;
>> -
>> -       pe = pnv_ioda_get_pe(dev);
>> -       if (!pe)
>> -               return -ENODEV;
>> -
>> -       /* Restore default real window size. */
>> -       pnv_pci_ioda2_set_bypass(pe, true);
>> -       return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(pnv_pci_disable_tunnel);
>> -
>>   int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>>   {
>>          __be64 val;
>> @@ -970,29 +922,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>>   }
>>   EXPORT_SYMBOL_GPL(pnv_pci_set_tunnel_bar);
>>
>> -#ifdef CONFIG_PPC64    /* for thread.tidr */
>> -int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid, u32 *pid,
>> -                              u32 *tid)
>> -{
>> -       struct mm_struct *mm = NULL;
>> -
>> -       if (task == NULL)
>> -               return -EINVAL;
>> -
>> -       mm = get_task_mm(task);
>> -       if (mm == NULL)
>> -               return -EINVAL;
>> -
>> -       *pid = mm->context.id;
>> -       mmput(mm);
>> -
>> -       *tid = task->thread.tidr;
>> -       *lpid = mfspr(SPRN_LPID);
>> -       return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(pnv_pci_get_as_notify_info);
>> -#endif
>> -
>>   void pnv_pci_shutdown(void)
>>   {
>>          struct pci_controller *hose;
>> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
>> index 4f11c077af62..469c24463247 100644
>> --- a/arch/powerpc/platforms/powernv/pci.h
>> +++ b/arch/powerpc/platforms/powernv/pci.h
>> @@ -195,7 +195,6 @@ extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
>>   extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
>>   extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
>>   extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
>> -extern void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
>>   extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
>>                  __u64 window_size, __u32 levels);
>>   extern int pnv_eeh_post_init(void);
>> --
>> 2.20.1
>>
> 

