Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F111FED2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 10:07:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nZKv3Gk1zDrBn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:07:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nZJC0Qg4zDr9C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 18:06:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05I84GQo094657; Thu, 18 Jun 2020 04:05:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r1qbcnx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 04:05:26 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05I84Tsu095683;
 Thu, 18 Jun 2020 04:05:26 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r1qbcnwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 04:05:25 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05I84kMX000783;
 Thu, 18 Jun 2020 08:05:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 31r0dvr499-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 08:05:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05I85KSa50659410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 08:05:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2316A405C;
 Thu, 18 Jun 2020 08:05:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C8E3A405F;
 Thu, 18 Jun 2020 08:05:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.12.179])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 08:05:19 +0000 (GMT)
Subject: Re: [PATCH v2 02/12] ocxl: Change type of pasid to unsigned int
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-3-git-send-email-fenghua.yu@intel.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <972dc2cb-9643-53af-b11d-ebb56d96053d@linux.ibm.com>
Date: Thu, 18 Jun 2020 10:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592008893-9388-3-git-send-email-fenghua.yu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_04:2020-06-17,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 cotscore=-2147483648 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999
 impostorscore=0 adultscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180057
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
Cc: iommu@lists.linux-foundation.org, x86 <x86@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2020 à 02:41, Fenghua Yu a écrit :
> PASID is defined as "int" although it's a 20-bit value and shouldn't be
> negative int. To be consistent with type defined in iommu, define PASID
> as "unsigned int".


It looks like this patch was considered because of the use of 'pasid' in 
variable or function names. The ocxl driver only makes sense on powerpc 
and shouldn't compile on anything else, so it's probably useless in the 
context of that series.
The pasid here is defined by the opencapi specification 
(https://opencapi.org), it is borrowed from the PCI world and you could 
argue it could be an unsigned int. But then I think the patch doesn't go 
far enough. But considering it's not used on x86, I think this patch can 
be dropped.

   Fred



> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> v2:
> - Create this new patch to define PASID as "unsigned int" consistently in
>    ocxl (Thomas)
> 
>   drivers/misc/ocxl/config.c        |  3 ++-
>   drivers/misc/ocxl/link.c          |  6 +++---
>   drivers/misc/ocxl/ocxl_internal.h |  6 +++---
>   drivers/misc/ocxl/pasid.c         |  2 +-
>   drivers/misc/ocxl/trace.h         | 20 ++++++++++----------
>   include/misc/ocxl.h               |  6 +++---
>   6 files changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index c8e19bfb5ef9..22d034caed3d 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -806,7 +806,8 @@ int ocxl_config_set_TL(struct pci_dev *dev, int tl_dvsec)
>   }
>   EXPORT_SYMBOL_GPL(ocxl_config_set_TL);
>   
> -int ocxl_config_terminate_pasid(struct pci_dev *dev, int afu_control, int pasid)
> +int ocxl_config_terminate_pasid(struct pci_dev *dev, int afu_control,
> +				unsigned int pasid)
>   {
>   	u32 val;
>   	unsigned long timeout;
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 58d111afd9f6..931f6ae022db 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -492,7 +492,7 @@ static u64 calculate_cfg_state(bool kernel)
>   	return state;
>   }
>   
> -int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> +int ocxl_link_add_pe(void *link_handle, unsigned int pasid, u32 pidr, u32 tidr,
>   		u64 amr, struct mm_struct *mm,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data)
> @@ -572,7 +572,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_add_pe);
>   
> -int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
> +int ocxl_link_update_pe(void *link_handle, unsigned int pasid, __u16 tid)
>   {
>   	struct ocxl_link *link = (struct ocxl_link *) link_handle;
>   	struct spa *spa = link->spa;
> @@ -608,7 +608,7 @@ int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
>   	return rc;
>   }
>   
> -int ocxl_link_remove_pe(void *link_handle, int pasid)
> +int ocxl_link_remove_pe(void *link_handle, unsigned int pasid)
>   {
>   	struct ocxl_link *link = (struct ocxl_link *) link_handle;
>   	struct spa *spa = link->spa;
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 345bf843a38e..3ca982ba7472 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -41,7 +41,7 @@ struct ocxl_afu {
>   	struct ocxl_afu_config config;
>   	int pasid_base;
>   	int pasid_count; /* opened contexts */
> -	int pasid_max; /* maximum number of contexts */
> +	unsigned int pasid_max; /* maximum number of contexts */
>   	int actag_base;
>   	int actag_enabled;
>   	struct mutex contexts_lock;
> @@ -69,7 +69,7 @@ struct ocxl_xsl_error {
>   
>   struct ocxl_context {
>   	struct ocxl_afu *afu;
> -	int pasid;
> +	unsigned int pasid;
>   	struct mutex status_mutex;
>   	enum ocxl_context_status status;
>   	struct address_space *mapping;
> @@ -128,7 +128,7 @@ int ocxl_config_check_afu_index(struct pci_dev *dev,
>    * pasid: the PASID for the AFU context
>    * tid: the new thread id for the process element
>    */
> -int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid);
> +int ocxl_link_update_pe(void *link_handle, unsigned int pasid, __u16 tid);
>   
>   int ocxl_context_mmap(struct ocxl_context *ctx,
>   			struct vm_area_struct *vma);
> diff --git a/drivers/misc/ocxl/pasid.c b/drivers/misc/ocxl/pasid.c
> index d14cb56e6920..a151fc8f0bec 100644
> --- a/drivers/misc/ocxl/pasid.c
> +++ b/drivers/misc/ocxl/pasid.c
> @@ -80,7 +80,7 @@ static void range_free(struct list_head *head, u32 start, u32 size,
>   
>   int ocxl_pasid_afu_alloc(struct ocxl_fn *fn, u32 size)
>   {
> -	int max_pasid;
> +	unsigned int max_pasid;
>   
>   	if (fn->config.max_pasid_log < 0)
>   		return -ENOSPC;
> diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
> index 17e21cb2addd..019e2fc63b1d 100644
> --- a/drivers/misc/ocxl/trace.h
> +++ b/drivers/misc/ocxl/trace.h
> @@ -9,13 +9,13 @@
>   #include <linux/tracepoint.h>
>   
>   DECLARE_EVENT_CLASS(ocxl_context,
> -	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
> +	TP_PROTO(pid_t pid, void *spa, unsigned int pasid, u32 pidr, u32 tidr),
>   	TP_ARGS(pid, spa, pasid, pidr, tidr),
>   
>   	TP_STRUCT__entry(
>   		__field(pid_t, pid)
>   		__field(void*, spa)
> -		__field(int, pasid)
> +		__field(unsigned int, pasid)
>   		__field(u32, pidr)
>   		__field(u32, tidr)
>   	),
> @@ -38,21 +38,21 @@ DECLARE_EVENT_CLASS(ocxl_context,
>   );
>   
>   DEFINE_EVENT(ocxl_context, ocxl_context_add,
> -	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
> +	TP_PROTO(pid_t pid, void *spa, unsigned int pasid, u32 pidr, u32 tidr),
>   	TP_ARGS(pid, spa, pasid, pidr, tidr)
>   );
>   
>   DEFINE_EVENT(ocxl_context, ocxl_context_remove,
> -	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
> +	TP_PROTO(pid_t pid, void *spa, unsigned int pasid, u32 pidr, u32 tidr),
>   	TP_ARGS(pid, spa, pasid, pidr, tidr)
>   );
>   
>   TRACE_EVENT(ocxl_terminate_pasid,
> -	TP_PROTO(int pasid, int rc),
> +	TP_PROTO(unsigned int pasid, int rc),
>   	TP_ARGS(pasid, rc),
>   
>   	TP_STRUCT__entry(
> -		__field(int, pasid)
> +		__field(unsigned int, pasid)
>   		__field(int, rc)
>   	),
>   
> @@ -107,11 +107,11 @@ DEFINE_EVENT(ocxl_fault_handler, ocxl_fault_ack,
>   );
>   
>   TRACE_EVENT(ocxl_afu_irq_alloc,
> -	TP_PROTO(int pasid, int irq_id, unsigned int virq, int hw_irq),
> +	TP_PROTO(unsigned int pasid, int irq_id, unsigned int virq, int hw_irq),
>   	TP_ARGS(pasid, irq_id, virq, hw_irq),
>   
>   	TP_STRUCT__entry(
> -		__field(int, pasid)
> +		__field(unsigned int, pasid)
>   		__field(int, irq_id)
>   		__field(unsigned int, virq)
>   		__field(int, hw_irq)
> @@ -133,11 +133,11 @@ TRACE_EVENT(ocxl_afu_irq_alloc,
>   );
>   
>   TRACE_EVENT(ocxl_afu_irq_free,
> -	TP_PROTO(int pasid, int irq_id),
> +	TP_PROTO(unsigned int pasid, int irq_id),
>   	TP_ARGS(pasid, irq_id),
>   
>   	TP_STRUCT__entry(
> -		__field(int, pasid)
> +		__field(unsigned int, pasid)
>   		__field(int, irq_id)
>   	),
>   
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..5eca04c8da97 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -429,7 +429,7 @@ int ocxl_config_set_TL(struct pci_dev *dev, int tl_dvsec);
>    * desired AFU. It can be found in the AFU configuration
>    */
>   int ocxl_config_terminate_pasid(struct pci_dev *dev,
> -				int afu_control_offset, int pasid);
> +				int afu_control_offset, unsigned int pasid);
>   
>   /*
>    * Read the configuration space of a function and fill in a
> @@ -466,7 +466,7 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle);
>    * 'xsl_err_data' is an argument passed to the above callback, if
>    * defined
>    */
> -int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> +int ocxl_link_add_pe(void *link_handle, unsigned int pasid, u32 pidr, u32 tidr,
>   		u64 amr, struct mm_struct *mm,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data);
> @@ -474,7 +474,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   /*
>    * Remove a Process Element from the Shared Process Area for a link
>    */
> -int ocxl_link_remove_pe(void *link_handle, int pasid);
> +int ocxl_link_remove_pe(void *link_handle, unsigned int pasid);
>   
>   /*
>    * Allocate an AFU interrupt associated to the link.
> 
