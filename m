Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20740D6494
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 16:03:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKzR5ZXXzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 01:03:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clombard@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sKw25NXNzDqhN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 01:00:50 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9EDuwQg145470
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 10:00:47 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vmqk0ptd3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 10:00:46 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Mon, 14 Oct 2019 15:00:44 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 15:00:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9EE0dQG51118156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 14:00:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8744A11C058;
 Mon, 14 Oct 2019 14:00:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4186E11C050;
 Mon, 14 Oct 2019 14:00:39 +0000 (GMT)
Received: from [9.134.167.65] (unknown [9.134.167.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 14:00:39 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/powernv: ocxl move SPA definition
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 fbarrat@linux.vnet.ibm.com, ajd@linux.ibm.com
References: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
 <20191009151109.13752-2-clombard@linux.vnet.ibm.com>
 <0101b090-30be-5470-912d-be29d3c9d3ac@linux.ibm.com>
From: christophe lombard <clombard@linux.vnet.ibm.com>
Date: Mon, 14 Oct 2019 16:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0101b090-30be-5470-912d-be29d3c9d3ac@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101414-0028-0000-0000-000003A9F05F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101414-0029-0000-0000-0000246C02C9
Message-Id: <ca5df65a-7fef-205e-89ca-f22a24fb82d7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140132
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/10/2019 12:17, Frederic Barrat wrote:
> 
>> diff --git a/arch/powerpc/platforms/powernv/ocxl.c 
>> b/arch/powerpc/platforms/powernv/ocxl.c
>> index 8c65aacda9c8..4d26cba12b63 100644
>> --- a/arch/powerpc/platforms/powernv/ocxl.c
>> +++ b/arch/powerpc/platforms/powernv/ocxl.c
>> @@ -12,11 +12,54 @@
>>   #define PNV_OCXL_PASID_BITS        15
>>   #define PNV_OCXL_PASID_MAX        ((1 << PNV_OCXL_PASID_BITS) - 1)
>>
>> -#define AFU_PRESENT (1 << 31)
>> -#define AFU_INDEX_MASK 0x3F000000
>> -#define AFU_INDEX_SHIFT 24
>> -#define ACTAG_MASK 0xFFF
>> +#define AFU_PRESENT    (1 << 31)
>> +#define AFU_INDEX_MASK    0x3F000000
>> +#define AFU_INDEX_SHIFT    24
>> +#define ACTAG_MASK     0xFFF
>> +
>> +#define SPA_PASID_BITS        15
>> +#define SPA_PASID_MAX        ((1 << SPA_PASID_BITS) - 1)
>> +#define SPA_PE_MASK        SPA_PASID_MAX
>> +#define SPA_SPA_SIZE_LOG    22 /* Each SPA is 4 Mb */
>> +#define SPA_PE_VALID        0x80000000
>> +
>> +#define SPA_CFG_SF        (1ull << (63-0))
>> +#define SPA_CFG_TA        (1ull << (63-1))
>> +#define SPA_CFG_HV        (1ull << (63-3))
>> +#define SPA_CFG_UV        (1ull << (63-4))
>> +#define SPA_CFG_XLAT_hpt    (0ull << (63-6)) /* Hashed page table 
>> (HPT) mode */
>> +#define SPA_CFG_XLAT_roh    (2ull << (63-6)) /* Radix on HPT mode */
>> +#define SPA_CFG_XLAT_ror    (3ull << (63-6)) /* Radix on Radix mode */
>> +#define SPA_CFG_PR        (1ull << (63-49))
>> +#define SPA_CFG_TC        (1ull << (63-54))
>> +#define SPA_CFG_DR        (1ull << (63-59))
>> +
>> +struct ocxl_process_element {
>> +    __be64 config_state;
>> +    __be32 reserved1[11];
>> +    __be32 lpid;
>> +    __be32 tid;
>> +    __be32 pid;
>> +    __be32 reserved2[10];
>> +    __be64 amr;
>> +    __be32 reserved3[3];
>> +    __be32 software_state;
>> +};
>> +
>> +struct spa {
>> +    struct ocxl_process_element *spa_mem;
>> +    int spa_order;
>> +};
>>
>> +struct platform_data {
>> +    struct spa *spa;
>> +    u64 phb_opal_id;
>> +    u32 bdfn;
>> +    void __iomem *dsisr;
>> +    void __iomem *dar;
>> +    void __iomem *tfc;
>> +    void __iomem *pe_handle;
>> +};
>>
>>   struct actag_range {
>>       u16 start;
>> @@ -369,7 +412,7 @@ int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long 
>> cap,
>>   }
>>   EXPORT_SYMBOL_GPL(pnv_ocxl_set_tl_conf);
>>
>> -int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq)
>> +static int get_xsl_irq(struct pci_dev *dev, int *hwirq)
>>   {
>>       int rc;
>>
>> @@ -381,19 +424,17 @@ int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, 
>> int *hwirq)
>>       }
>>       return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_get_xsl_irq);
>>
>> -void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
>> -            void __iomem *tfc, void __iomem *pe_handle)
>> +static void unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
>> +               void __iomem *tfc, void __iomem *pe_handle)
>>   {
>>       iounmap(dsisr);
>>       iounmap(dar);
>>       iounmap(tfc);
>>       iounmap(pe_handle);
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_xsl_regs);
>>
>> -int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
>> +static int map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
>>               void __iomem **dar, void __iomem **tfc,
>>               void __iomem **pe_handle)
>>   {
>> @@ -429,61 +470,144 @@ int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, 
>> void __iomem **dsisr,
>>       }
>>       return rc;
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_map_xsl_regs);
>>
>> -struct spa_data {
>> -    u64 phb_opal_id;
>> -    u32 bdfn;
>> -};
>> +static int alloc_spa(struct pci_dev *dev, struct platform_data *data)
>> +{
>> +    struct spa *spa;
>> +
>> +    spa = kzalloc(sizeof(struct spa), GFP_KERNEL);
>> +    if (!spa)
>> +        return -ENOMEM;
>> +
>> +    spa->spa_order = SPA_SPA_SIZE_LOG - PAGE_SHIFT;
>> +    spa->spa_mem = (struct ocxl_process_element *)
>> +        __get_free_pages(GFP_KERNEL | __GFP_ZERO, spa->spa_order);
>> +    if (!spa->spa_mem) {
>> +        dev_err(&dev->dev, "Can't allocate Shared Process Area\n");
>> +        kfree(spa);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    data->spa = spa;
>> +    dev_dbg(&dev->dev, "Allocated SPA for %x:%x:%x at %p\n",
>> +               pci_domain_nr(dev->bus), dev->bus->number,
>> +               PCI_SLOT(dev->devfn), spa->spa_mem);
> 
> 
> If using dev_dbg() then we get the domain, bus and device/fn for free as 
> part of the message prefix. Which leaves the SPA address, which may be 
> hidden with recent kernel changes since it's a pointer to a kernel 
> address (I haven't checked). I guess the message could be reworked. The 
> point was really to show that we're allocating a spa structure for the 
> link and help debugging any ref count issue.
> 

I think we can even delete this message as it is not very interesting to
be present.

> 
>> +
>> +    return 0;
>> +}
>> +
>> +static void free_spa(struct platform_data *data)
>> +{
>> +    struct spa *spa = data->spa;
>> +
>> +    if (spa && spa->spa_mem) {
>> +        free_pages((unsigned long) spa->spa_mem, spa->spa_order);
>> +        kfree(spa);
>> +        data->spa = NULL;
>> +    }
>> +}
>>
>> -int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
>> -        void **platform_data)
>> +int pnv_ocxl_platform_setup(struct pci_dev *dev, int PE_mask,
>> +                int *hwirq, void **platform_data)
>>   {
>>       struct pci_controller *hose = pci_bus_to_host(dev->bus);
>>       struct pnv_phb *phb = hose->private_data;
>> -    struct spa_data *data;
>> +    struct platform_data *data;
>> +    int xsl_irq;
>>       u32 bdfn;
>>       int rc;
>>
>> -    data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +    data = kzalloc(sizeof(struct platform_data), GFP_KERNEL);
>>       if (!data)
>>           return -ENOMEM;
>>
>> +    rc = alloc_spa(dev, data);
>> +    if (rc) {
>> +        kfree(data);
>> +        return rc;
>> +    }
>> +
>> +    rc = get_xsl_irq(dev, &xsl_irq);
>> +    if (rc) {
>> +        free_spa(data);
>> +        kfree(data);
>> +        return rc;
>> +    }
>> +
>> +    rc = map_xsl_regs(dev, &data->dsisr, &data->dar, &data->tfc,
>> +              &data->pe_handle);
>> +    if (rc) {
>> +        free_spa(data);
>> +        kfree(data);
>> +        return rc;
>> +    }
>> +
>>       bdfn = (dev->bus->number << 8) | dev->devfn;
>> -    rc = opal_npu_spa_setup(phb->opal_id, bdfn, virt_to_phys(spa_mem),
>> +    rc = opal_npu_spa_setup(phb->opal_id, bdfn,
>> +                virt_to_phys(data->spa->spa_mem),
>>                   PE_mask);
>>       if (rc) {
>>           dev_err(&dev->dev, "Can't setup Shared Process Area: %d\n", 
>> rc);
>> +        unmap_xsl_regs(data->dsisr, data->dar, data->tfc,
>> +                   data->pe_handle);
>> +        free_spa(data);
>>           kfree(data);
>>           return rc;
>>       }
>>       data->phb_opal_id = phb->opal_id;
>>       data->bdfn = bdfn;
>>       *platform_data = (void *) data;
>> +
>> +    *hwirq = xsl_irq;
>>       return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_spa_setup);
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_setup);
>>
>> -void pnv_ocxl_spa_release(void *platform_data)
>> +void pnv_ocxl_read_xsl_regs(void *platform_data, u64 *dsisr, u64 *dar,
>> +                u64 *pe_handle, int *pid)
> 
> 
> Could we have the word "fault" appearing in the function name? I think 
> it helps a bit readability. read_xsl_fault_info() ?
> 
> 

right. I don't remember why I choose this name :-)
May be we could also use this one: pnv_ocxl_get_fault_state() to be
consistent with the PAPR document.

H_OCAPI_GET_FAULT_STATE
This HCALL is used to retrieve fault information from an OpenCAPI
device.

> 
>>   {
>> -    struct spa_data *data = (struct spa_data *) platform_data;
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>> +    struct ocxl_process_element *pe;
>> +
>> +    *dsisr = in_be64(data->dsisr);
>> +    *dar = in_be64(data->dar);
>> +    *pe_handle = in_be64(data->pe_handle) & SPA_PE_MASK;
>> +
>> +    pe = data->spa->spa_mem + *pe_handle;
>> +    *pid = be32_to_cpu(pe->pid);
>> +}
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_read_xsl_regs);
>> +
>> +void pnv_ocxl_write_xsl_tfc(void *platform_data, u64 tfc)
>> +{
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>> +
>> +    out_be64(data->tfc, tfc);
>> +}
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_write_xsl_tfc);
> 
> 
> Same as above. Something like "ack fault" is more descriptive than 
> "write tfc"
> 

right. pnv_ocxl_handle_fault() ?

H_OCAPI_HANDLE_FAULT
This HCALL is used to respond to an OpenCAPI fault.

> 
>> +
>> +void pnv_ocxl_platform_release(void *platform_data)
>> +{
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>>       int rc;
>>
>>       rc = opal_npu_spa_setup(data->phb_opal_id, data->bdfn, 0, 0);
>>       WARN_ON(rc);
>> +    unmap_xsl_regs(data->dsisr, data->dar, data->tfc, data->pe_handle);
>> +    free_spa(data);
>>       kfree(data);
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_release);
>>
>> -int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int 
>> pe_handle)
>> +int pnv_ocxl_remove_pe_from_cache(void *platform_data, int pe_handle)
>>   {
>> -    struct spa_data *data = (struct spa_data *) platform_data;
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>>       int rc;
>>
>>       rc = opal_npu_spa_clear_cache(data->phb_opal_id, data->bdfn, 
>> pe_handle);
>>       return rc;
>>   }
>> -EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_remove_pe_from_cache);
> 
> 
> 
> We should be able to call opal_npu_spa_clear_cache() internally within 
> that file when removing or updating a SPA entry now. So we don't need to 
> export that function any more.
> 
> 

I will do that and check if there is no side effect.

> 
>>
>>   int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr)
>>   {
>> @@ -513,3 +637,100 @@ void pnv_ocxl_free_xive_irq(u32 irq)
>>       xive_native_free_irq(irq);
>>   }
>>   EXPORT_SYMBOL_GPL(pnv_ocxl_free_xive_irq);
>> +
>> +static u64 calculate_cfg_state(u32 lpid, bool kernel)
>> +{
>> +    u64 state;
>> +
>> +    state = SPA_CFG_DR;
>> +    if (mfspr(SPRN_LPCR) & LPCR_TC)
>> +        state |= SPA_CFG_TC;
>> +    if (radix_enabled())
>> +        state |= SPA_CFG_XLAT_ror;
>> +    else
>> +        state |= SPA_CFG_XLAT_hpt;
>> +    if (lpid == 0)
>> +        state |= SPA_CFG_HV;
>> +    if (kernel) {
>> +        if (mfmsr() & MSR_SF)
>> +            state |= SPA_CFG_SF;
>> +    } else {
>> +        state |= SPA_CFG_PR;
>> +        if (!test_tsk_thread_flag(current, TIF_32BIT))
>> +            state |= SPA_CFG_SF;
>> +    }
>> +    return state;
>> +}
>> +
>> +int pnv_ocxl_set_pe(void *platform_data, int lpid, int pasid, u32 pidr,
>> +            u32 tidr, u64 amr, int *pe_handle)
> 
> 
> When virtualized, will the pe_handle value bubble up all the way to the 
> guest? 

Right. With the current implementation, the pe_handle value is returned
as is to the guest because today we support only one guest.

What I'm afraid of is giving away information about the entry
> position in the SPA to a guest, in the case where we support multiple 
> guests one day.

When we will decide to support multiple guests we will have to share
all process elments to the guests and introduce virtual values.
The effort is not huge and already tested in an experimental code.

> 
> 
> 
>> +{
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>> +    struct spa *spa = data->spa;
>> +    struct ocxl_process_element *pe;
>> +
>> +    BUILD_BUG_ON(sizeof(struct ocxl_process_element) != 128);
>> +    if (pasid > SPA_PASID_MAX)
>> +        return -EINVAL;
>> +
>> +    *pe_handle = pasid & SPA_PE_MASK;
>> +    pe = spa->spa_mem + *pe_handle;
>> +
>> +    if (pe->software_state)
>> +        return -EBUSY;
>> +
>> +    memset(pe, 0, sizeof(struct ocxl_process_element));
>> +    pe->config_state = cpu_to_be64(calculate_cfg_state(lpid, pidr == 
>> 0));
>> +    pe->lpid = cpu_to_be32(lpid);
>> +    pe->pid = cpu_to_be32(pidr);
>> +    pe->tid = cpu_to_be32(tidr);
>> +    pe->amr = cpu_to_be64(amr);
>> +    pe->software_state = cpu_to_be32(SPA_PE_VALID);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_set_pe);
>> +
>> +int pnv_ocxl_update_pe(void *platform_data, int pasid, __u16 tid,
>> +               int *pe_handle
>> +{
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>> +    struct spa *spa = data->spa;
>> +    struct ocxl_process_element *pe;
>> +
>> +    if (pasid > SPA_PASID_MAX)
>> +        return -EINVAL;
>> +
>> +    *pe_handle = pasid & SPA_PE_MASK;
>> +    pe = spa->spa_mem + *pe_handle;
>> +    pe->tid = cpu_to_be32(tid);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_update_pe);
>> +
>> +int pnv_ocxl_remove_pe(void *platform_data, int pasid, u32 *pid,
>> +               u32 *tid, int *pe_handle)
> 
> 
> nitpick: I think with update_pe(), the pe_handle out argument is no 
> longer useful if we integrate the NPU cache clearing directly in the 
> function. It's not as easy with remove_pe(). What's a bit strange is 
> that the 2 functions don't return the same out arguments. It looks like 
> we could/should align them.
> 

ok, will do that.

> 
>> +{
>> +    struct platform_data *data = (struct platform_data *) platform_data;
>> +    struct spa *spa = data->spa;
>> +    struct ocxl_process_element *pe;
>> +
>> +    if (pasid > SPA_PASID_MAX)
>> +        return -EINVAL;
>> +
>> +    *pe_handle = pasid & SPA_PE_MASK;
>> +    pe = spa->spa_mem + *pe_handle;
>> +
>> +    if (!(be32_to_cpu(pe->software_state) & SPA_PE_VALID))
>> +        return -EINVAL;
>> +
>> +    *pid = be32_to_cpu(pe->pid);
>> +    *tid = be32_to_cpu(pe->tid);
>> +
>> +    memset(pe, 0, sizeof(struct ocxl_process_element));
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(pnv_ocxl_remove_pe);
>> +
>> diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
>> index 70f8f1c3929d..b9150da0ea6b 100644
>> --- a/drivers/misc/ocxl/afu_irq.c
>> +++ b/drivers/misc/ocxl/afu_irq.c
>> @@ -1,7 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0+
>>   // Copyright 2017 IBM Corp.
>>   #include <linux/interrupt.h>
>> -#include <asm/pnv-ocxl.h>
>>   #include "ocxl_internal.h"
>>   #include "trace.h"
>>
>> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
>> index 58d111afd9f6..85ba4d1b7be7 100644
>> --- a/drivers/misc/ocxl/link.c
>> +++ b/drivers/misc/ocxl/link.c
>> @@ -10,28 +10,8 @@
>>   #include "ocxl_internal.h"
>>   #include "trace.h"
>>
>> -
>> -#define SPA_PASID_BITS        15
>> -#define SPA_PASID_MAX        ((1 << SPA_PASID_BITS) - 1)
>> -#define SPA_PE_MASK        SPA_PASID_MAX
>> -#define SPA_SPA_SIZE_LOG    22 /* Each SPA is 4 Mb */
>> -
>> -#define SPA_CFG_SF        (1ull << (63-0))
>> -#define SPA_CFG_TA        (1ull << (63-1))
>> -#define SPA_CFG_HV        (1ull << (63-3))
>> -#define SPA_CFG_UV        (1ull << (63-4))
>> -#define SPA_CFG_XLAT_hpt    (0ull << (63-6)) /* Hashed page table 
>> (HPT) mode */
>> -#define SPA_CFG_XLAT_roh    (2ull << (63-6)) /* Radix on HPT mode */
>> -#define SPA_CFG_XLAT_ror    (3ull << (63-6)) /* Radix on Radix mode */
>> -#define SPA_CFG_PR        (1ull << (63-49))
>> -#define SPA_CFG_TC        (1ull << (63-54))
>> -#define SPA_CFG_DR        (1ull << (63-59))
>> -
>> -#define SPA_XSL_TF        (1ull << (63-3))  /* Translation fault */
>> -#define SPA_XSL_S        (1ull << (63-38)) /* Store operation */
>> -
>> -#define SPA_PE_VALID        0x80000000
>> -
>> +#define XSL_TF        (1ull << (63-3))  /* Translation fault */
>> +#define XSL_S        (1ull << (63-38)) /* Store operation */
>>
>>   struct pe_data {
>>       struct mm_struct *mm;
>> @@ -42,32 +22,6 @@ struct pe_data {
>>       struct rcu_head rcu;
>>   };
>>
>> -struct spa {
>> -    struct ocxl_process_element *spa_mem;
>> -    int spa_order;
>> -    struct mutex spa_lock;
>> -    struct radix_tree_root pe_tree; /* Maps PE handles to pe_data */
>> -    char *irq_name;
>> -    int virq;
>> -    void __iomem *reg_dsisr;
>> -    void __iomem *reg_dar;
>> -    void __iomem *reg_tfc;
>> -    void __iomem *reg_pe_handle;
>> -    /*
>> -     * The following field are used by the memory fault
>> -     * interrupt handler. We can only have one interrupt at a
>> -     * time. The NPU won't raise another interrupt until the
>> -     * previous one has been ack'd by writing to the TFC register
>> -     */
>> -    struct xsl_fault {
>> -        struct work_struct fault_work;
>> -        u64 pe;
>> -        u64 dsisr;
>> -        u64 dar;
>> -        struct pe_data pe_data;
>> -    } xsl_fault;
>> -};
>> -
>>   /*
>>    * A opencapi link can be used be by several PCI functions. We have
>>    * one link per device slot.
>> @@ -82,9 +36,26 @@ struct ocxl_link {
>>       int domain;
>>       int bus;
>>       int dev;
>> +    char *irq_name;
>> +    int virq;
>> +    struct mutex pe_lock;
>>       atomic_t irq_available;
>> -    struct spa *spa;
>>       void *platform_data;
>> +    struct radix_tree_root pe_tree; /* Maps PE handles to pe_data */
>> +
>> +    /*
>> +     * The following field are used by the memory fault
>> +     * interrupt handler. We can only have one interrupt at a
>> +     * time. The NPU won't raise another interrupt until the
>> +     * previous one has been ack'd by writing to the TFC register
>> +     */
>> +    struct xsl_fault {
>> +        struct work_struct fault_work;
>> +        u64 pe;
>> +        u64 dsisr;
>> +        u64 dar;
>> +        struct pe_data pe_data;
>> +    } xsl_fault;
>>   };
>>   static struct list_head links_list = LIST_HEAD_INIT(links_list);
>>   static DEFINE_MUTEX(links_list_lock);
>> @@ -95,18 +66,7 @@ enum xsl_response {
>>       RESTART,
>>   };
>>
>> -
>> -static void read_irq(struct spa *spa, u64 *dsisr, u64 *dar, u64 *pe)
>> -{
>> -    u64 reg;
>> -
>> -    *dsisr = in_be64(spa->reg_dsisr);
>> -    *dar = in_be64(spa->reg_dar);
>> -    reg = in_be64(spa->reg_pe_handle);
>> -    *pe = reg & SPA_PE_MASK;
>> -}
>> -
>> -static void ack_irq(struct spa *spa, enum xsl_response r)
>> +static void ack_irq(struct ocxl_link *link, enum xsl_response r)
>>   {
>>       u64 reg = 0;
>>
>> @@ -119,9 +79,11 @@ static void ack_irq(struct spa *spa, enum 
>> xsl_response r)
>>           WARN(1, "Invalid irq response %d\n", r);
>>
>>       if (reg) {
>> -        trace_ocxl_fault_ack(spa->spa_mem, spa->xsl_fault.pe,
>> -                spa->xsl_fault.dsisr, spa->xsl_fault.dar, reg);
>> -        out_be64(spa->reg_tfc, reg);
>> +        trace_ocxl_fault_ack(link->xsl_fault.pe,
>> +                     link->xsl_fault.dsisr,
>> +                     link->xsl_fault.dar,
>> +                     reg);
>> +        pnv_ocxl_write_xsl_tfc(link->platform_data, reg);
>>       }
>>   }
>>
>> @@ -132,7 +94,7 @@ static void xsl_fault_handler_bh(struct work_struct 
>> *fault_work)
>>       enum xsl_response r;
>>       struct xsl_fault *fault = container_of(fault_work, struct 
>> xsl_fault,
>>                       fault_work);
>> -    struct spa *spa = container_of(fault, struct spa, xsl_fault);
>> +    struct ocxl_link *link = container_of(fault, struct ocxl_link, 
>> xsl_fault);
>>
>>       int rc;
>>
>> @@ -160,7 +122,7 @@ static void xsl_fault_handler_bh(struct 
>> work_struct *fault_work)
>>            * just call hash_page_mm() here.
>>            */
>>           access = _PAGE_PRESENT | _PAGE_READ;
>> -        if (fault->dsisr & SPA_XSL_S)
>> +        if (fault->dsisr & XSL_S)
>>               access |= _PAGE_WRITE;
>>
>>           if (get_region_id(fault->dar) != USER_REGION_ID)
>> @@ -174,25 +136,21 @@ static void xsl_fault_handler_bh(struct 
>> work_struct *fault_work)
>>       r = RESTART;
>>   ack:
>>       mmput(fault->pe_data.mm);
>> -    ack_irq(spa, r);
>> +    ack_irq(link, r);
>>   }
>>
>>   static irqreturn_t xsl_fault_handler(int irq, void *data)
>>   {
>>       struct ocxl_link *link = (struct ocxl_link *) data;
>> -    struct spa *spa = link->spa;
>>       u64 dsisr, dar, pe_handle;
>>       struct pe_data *pe_data;
>> -    struct ocxl_process_element *pe;
>>       int pid;
>>       bool schedule = false;
>>
>> -    read_irq(spa, &dsisr, &dar, &pe_handle);
>> -    trace_ocxl_fault(spa->spa_mem, pe_handle, dsisr, dar, -1);
>> +    pnv_ocxl_read_xsl_regs(link->platform_data, &dsisr, &dar,
>> +                   &pe_handle, &pid);
>> +    trace_ocxl_fault(pe_handle, dsisr, dar, -1);
>>
>> -    WARN_ON(pe_handle > SPA_PE_MASK);
>> -    pe = spa->spa_mem + pe_handle;
>> -    pid = be32_to_cpu(pe->pid);
>>       /* We could be reading all null values here if the PE is being
>>        * removed while an interrupt kicks in. It's not supposed to
>>        * happen if the driver notified the AFU to terminate the
>> @@ -200,14 +158,14 @@ static irqreturn_t xsl_fault_handler(int irq, 
>> void *data)
>>        * acknowledging. But even if it happens, we won't find a
>>        * memory context below and fail silently, so it should be ok.
>>        */
>> -    if (!(dsisr & SPA_XSL_TF)) {
>> +    if (!(dsisr & XSL_TF)) {
>>           WARN(1, "Invalid xsl interrupt fault register %#llx\n", dsisr);
>> -        ack_irq(spa, ADDRESS_ERROR);
>> +        ack_irq(link, ADDRESS_ERROR);
>>           return IRQ_HANDLED;
>>       }
>>
>>       rcu_read_lock();
>> -    pe_data = radix_tree_lookup(&spa->pe_tree, pe_handle);
>> +    pe_data = radix_tree_lookup(&link->pe_tree, pe_handle);
>>       if (!pe_data) {
>>           /*
>>            * Could only happen if the driver didn't notify the
>> @@ -221,7 +179,7 @@ static irqreturn_t xsl_fault_handler(int irq, void 
>> *data)
>>            */
>>           rcu_read_unlock();
>>           pr_debug("Unknown mm context for xsl interrupt\n");
>> -        ack_irq(spa, ADDRESS_ERROR);
>> +        ack_irq(link, ADDRESS_ERROR);
>>           return IRQ_HANDLED;
>>       }
>>
>> @@ -232,56 +190,35 @@ static irqreturn_t xsl_fault_handler(int irq, 
>> void *data)
>>            */
>>           rcu_read_unlock();
>>           pr_warn("Unresolved OpenCAPI xsl fault in kernel context\n");
>> -        ack_irq(spa, ADDRESS_ERROR);
>> +        ack_irq(link, ADDRESS_ERROR);
>>           return IRQ_HANDLED;
>>       }
>>       WARN_ON(pe_data->mm->context.id != pid);
>>
>>       if (mmget_not_zero(pe_data->mm)) {
>> -            spa->xsl_fault.pe = pe_handle;
>> -            spa->xsl_fault.dar = dar;
>> -            spa->xsl_fault.dsisr = dsisr;
>> -            spa->xsl_fault.pe_data = *pe_data;
>> +            link->xsl_fault.pe = pe_handle;
>> +            link->xsl_fault.dar = dar;
>> +            link->xsl_fault.dsisr = dsisr;
>> +            link->xsl_fault.pe_data = *pe_data;
>>               schedule = true;
>>               /* mm_users count released by bottom half */
>>       }
>>       rcu_read_unlock();
>>       if (schedule)
>> -        schedule_work(&spa->xsl_fault.fault_work);
>> +        schedule_work(&link->xsl_fault.fault_work);
>>       else
>> -        ack_irq(spa, ADDRESS_ERROR);
>> +        ack_irq(link, ADDRESS_ERROR);
>>       return IRQ_HANDLED;
>>   }
>>
>> -static void unmap_irq_registers(struct spa *spa)
>> -{
>> -    pnv_ocxl_unmap_xsl_regs(spa->reg_dsisr, spa->reg_dar, spa->reg_tfc,
>> -                spa->reg_pe_handle);
>> -}
>> -
>> -static int map_irq_registers(struct pci_dev *dev, struct spa *spa)
>> -{
>> -    return pnv_ocxl_map_xsl_regs(dev, &spa->reg_dsisr, &spa->reg_dar,
>> -                &spa->reg_tfc, &spa->reg_pe_handle);
>> -}
>> -
>> -static int setup_xsl_irq(struct pci_dev *dev, struct ocxl_link *link)
>> +static int setup_xsl_irq(struct pci_dev *dev, struct ocxl_link *link,
>> +             int hwirq)
>>   {
>> -    struct spa *spa = link->spa;
>>       int rc;
>> -    int hwirq;
>>
>> -    rc = pnv_ocxl_get_xsl_irq(dev, &hwirq);
>> -    if (rc)
>> -        return rc;
>> -
>> -    rc = map_irq_registers(dev, spa);
>> -    if (rc)
>> -        return rc;
>> -
>> -    spa->irq_name = kasprintf(GFP_KERNEL, "ocxl-xsl-%x-%x-%x",
>> -                link->domain, link->bus, link->dev);
>> -    if (!spa->irq_name) {
>> +    link->irq_name = kasprintf(GFP_KERNEL, "ocxl-xsl-%x-%x-%x",
>> +                   link->domain, link->bus, link->dev);
>> +    if (!link->irq_name) {
>>           dev_err(&dev->dev, "Can't allocate name for xsl interrupt\n");
>>           rc = -ENOMEM;
>>           goto err_xsl;
>> @@ -290,17 +227,17 @@ static int setup_xsl_irq(struct pci_dev *dev, 
>> struct ocxl_link *link)
>>        * At some point, we'll need to look into allowing a higher
>>        * number of interrupts. Could we have an IRQ domain per link?
>>        */
>> -    spa->virq = irq_create_mapping(NULL, hwirq);
>> -    if (!spa->virq) {
>> +    link->virq = irq_create_mapping(NULL, hwirq);
>> +    if (!link->virq) {
>>           dev_err(&dev->dev,
>>               "irq_create_mapping failed for translation interrupt\n");
>>           rc = -EINVAL;
>>           goto err_name;
>>       }
>>
>> -    dev_dbg(&dev->dev, "hwirq %d mapped to virq %d\n", hwirq, 
>> spa->virq);
>> +    dev_dbg(&dev->dev, "hwirq %d mapped to virq %d\n", hwirq, 
>> link->virq);
>>
>> -    rc = request_irq(spa->virq, xsl_fault_handler, 0, spa->irq_name,
>> +    rc = request_irq(link->virq, xsl_fault_handler, 0, link->irq_name,
>>               link);
>>       if (rc) {
>>           dev_err(&dev->dev,
>> @@ -312,70 +249,26 @@ static int setup_xsl_irq(struct pci_dev *dev, 
>> struct ocxl_link *link)
>>       return 0;
>>
>>   err_mapping:
>> -    irq_dispose_mapping(spa->virq);
>> +    irq_dispose_mapping(link->virq);
>>   err_name:
>> -    kfree(spa->irq_name);
>> +    kfree(link->irq_name);
>>   err_xsl:
>> -    unmap_irq_registers(spa);
>>       return rc;
>>   }
>>
>>   static void release_xsl_irq(struct ocxl_link *link)
>>   {
>> -    struct spa *spa = link->spa;
>> -
>> -    if (spa->virq) {
>> -        free_irq(spa->virq, link);
>> -        irq_dispose_mapping(spa->virq);
>> -    }
>> -    kfree(spa->irq_name);
>> -    unmap_irq_registers(spa);
>> -}
>> -
>> -static int alloc_spa(struct pci_dev *dev, struct ocxl_link *link)
>> -{
>> -    struct spa *spa;
>> -
>> -    spa = kzalloc(sizeof(struct spa), GFP_KERNEL);
>> -    if (!spa)
>> -        return -ENOMEM;
>> -
>> -    mutex_init(&spa->spa_lock);
>> -    INIT_RADIX_TREE(&spa->pe_tree, GFP_KERNEL);
>> -    INIT_WORK(&spa->xsl_fault.fault_work, xsl_fault_handler_bh);
>> -
>> -    spa->spa_order = SPA_SPA_SIZE_LOG - PAGE_SHIFT;
>> -    spa->spa_mem = (struct ocxl_process_element *)
>> -        __get_free_pages(GFP_KERNEL | __GFP_ZERO, spa->spa_order);
>> -    if (!spa->spa_mem) {
>> -        dev_err(&dev->dev, "Can't allocate Shared Process Area\n");
>> -        kfree(spa);
>> -        return -ENOMEM;
>> -    }
>> -    pr_debug("Allocated SPA for %x:%x:%x at %p\n", link->domain, 
>> link->bus,
>> -        link->dev, spa->spa_mem);
>> -
>> -    link->spa = spa;
>> -    return 0;
>> -}
>> -
>> -static void free_spa(struct ocxl_link *link)
>> -{
>> -    struct spa *spa = link->spa;
>> -
>> -    pr_debug("Freeing SPA for %x:%x:%x\n", link->domain, link->bus,
>> -        link->dev);
>> -
>> -    if (spa && spa->spa_mem) {
>> -        free_pages((unsigned long) spa->spa_mem, spa->spa_order);
>> -        kfree(spa);
>> -        link->spa = NULL;
>> +    if (link->virq) {
>> +        free_irq(link->virq, link);
>> +        irq_dispose_mapping(link->virq);
>>       }
>> +    kfree(link->irq_name);
>>   }
>>
>>   static int alloc_link(struct pci_dev *dev, int PE_mask, struct 
>> ocxl_link **out_link)
>>   {
>>       struct ocxl_link *link;
>> +    int xsl_irq;
>>       int rc;
>>
>>       link = kzalloc(sizeof(struct ocxl_link), GFP_KERNEL);
>> @@ -387,18 +280,18 @@ static int alloc_link(struct pci_dev *dev, int 
>> PE_mask, struct ocxl_link **out_l
>>       link->bus = dev->bus->number;
>>       link->dev = PCI_SLOT(dev->devfn);
>>       atomic_set(&link->irq_available, MAX_IRQ_PER_LINK);
>> +    INIT_WORK(&link->xsl_fault.fault_work, xsl_fault_handler_bh);
>>
>> -    rc = alloc_spa(dev, link);
>> +    /* platform specific hook */
>> +    rc = pnv_ocxl_platform_setup(dev, PE_mask, &xsl_irq,
>> +                     &link->platform_data);
>>       if (rc)
>>           goto err_free;
>>
>> -    rc = setup_xsl_irq(dev, link);
>> -    if (rc)
>> -        goto err_spa;
>> +    mutex_init(&link->pe_lock);
>> +    INIT_RADIX_TREE(&link->pe_tree, GFP_KERNEL);
>>
>> -    /* platform specific hook */
>> -    rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
>> -                &link->platform_data);
>> +    rc = setup_xsl_irq(dev, link, xsl_irq);
>>       if (rc)
>>           goto err_xsl_irq;
>>
>> @@ -406,9 +299,7 @@ static int alloc_link(struct pci_dev *dev, int 
>> PE_mask, struct ocxl_link **out_l
>>       return 0;
>>
>>   err_xsl_irq:
>> -    release_xsl_irq(link);
>> -err_spa:
>> -    free_spa(link);
>> +    pnv_ocxl_platform_release(link->platform_data);
>>   err_free:
>>       kfree(link);
>>       return rc;
>> @@ -417,7 +308,6 @@ static int alloc_link(struct pci_dev *dev, int 
>> PE_mask, struct ocxl_link **out_l
>>   static void free_link(struct ocxl_link *link)
>>   {
>>       release_xsl_irq(link);
>> -    free_spa(link);
>>       kfree(link);
>>   }
>>
>> @@ -455,7 +345,7 @@ static void release_xsl(struct kref *ref)
>>
>>       list_del(&link->list);
>>       /* call platform code before releasing data */
>> -    pnv_ocxl_spa_release(link->platform_data);
>> +    pnv_ocxl_platform_release(link->platform_data);
>>       free_link(link);
>>   }
>>
>> @@ -469,52 +359,20 @@ void ocxl_link_release(struct pci_dev *dev, void 
>> *link_handle)
>>   }
>>   EXPORT_SYMBOL_GPL(ocxl_link_release);
>>
>> -static u64 calculate_cfg_state(bool kernel)
>> -{
>> -    u64 state;
>> -
>> -    state = SPA_CFG_DR;
>> -    if (mfspr(SPRN_LPCR) & LPCR_TC)
>> -        state |= SPA_CFG_TC;
>> -    if (radix_enabled())
>> -        state |= SPA_CFG_XLAT_ror;
>> -    else
>> -        state |= SPA_CFG_XLAT_hpt;
>> -    state |= SPA_CFG_HV;
>> -    if (kernel) {
>> -        if (mfmsr() & MSR_SF)
>> -            state |= SPA_CFG_SF;
>> -    } else {
>> -        state |= SPA_CFG_PR;
>> -        if (!test_tsk_thread_flag(current, TIF_32BIT))
>> -            state |= SPA_CFG_SF;
>> -    }
>> -    return state;
>> -}
>> -
>>   int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>>           u64 amr, struct mm_struct *mm,
>>           void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>>           void *xsl_err_data)
>>   {
>>       struct ocxl_link *link = (struct ocxl_link *) link_handle;
>> -    struct spa *spa = link->spa;
>> -    struct ocxl_process_element *pe;
>>       int pe_handle, rc = 0;
>>       struct pe_data *pe_data;
>>
>> -    BUILD_BUG_ON(sizeof(struct ocxl_process_element) != 128);
>> -    if (pasid > SPA_PASID_MAX)
>> -        return -EINVAL;
>> -
>> -    mutex_lock(&spa->spa_lock);
>> -    pe_handle = pasid & SPA_PE_MASK;
>> -    pe = spa->spa_mem + pe_handle;
>> -
>> -    if (pe->software_state) {
>> -        rc = -EBUSY;
>> +    mutex_lock(&link->pe_lock);
>> +    rc = pnv_ocxl_set_pe(link->platform_data, mfspr(SPRN_LPID), pasid,
>> +                 pidr, tidr, amr, &pe_handle);
>> +    if (rc)
> 
> 
> We should switch the order of the pe_data allocation and the call to add 
> the entry in the SPA. It makes reverting easier if the allocation fails. 
> In it's current form, this patch would leave a valid entry in the SPA.
> 

ok.

> Would slitting this patch in 2 (one part for the SPA handling, the other 
> for the translation fault interrupt) be possible without much suffering? 
> It would make the review easier. But since it's really only code 
> movement, I could live with it.

I will try to do that

Thanks for the review.

> 
>    Fred
> 

