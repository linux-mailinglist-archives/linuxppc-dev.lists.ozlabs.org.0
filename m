Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E862C4245
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:39:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3Rn5w8QzDqss
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hoXySxZG; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2pS6mmmzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:10:08 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APE1c0g012834
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=D4aMLqqbJNBZfkRbc+iX1kniDy5eal89qOIZYB3/tHA=;
 b=hoXySxZGr+ZXquoU3ofuCxNuCdmHnJ6ArO28/DGT/CGmEpq+pQknMWQVpGHBOEUsH0Um
 nZmwso0wykN5B1HklvKD2kzB+mf6OIUjqnGwRyquJkNeIXlvy/tZ4fHbnWNSze70j0T9
 tIcTcQWDQCtVwKq10vhwOphv6ux6yf0/RPSkzJCmZv5/IeX/vWzbIF87PYaDHasqL/rU
 4pH0kywXQBvN9C3RyXNtp5FEsgVxjx0wwFs5D0/zfSMA9NTPLQjNA174h1eTvC3YP40v
 5A86UmQTT0CtULBs5n0ZrbuEn2/2rDRTbImRISiPKkUVskczvUAauPyKraoCP6xIXc+w DQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ygtv2ae0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:10:03 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APE8hHg006798
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:10:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r1mf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:09:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APE8gVI8585770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 14:08:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F21EA405F;
 Wed, 25 Nov 2020 14:08:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AD17A4055;
 Wed, 25 Nov 2020 14:08:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 14:08:42 +0000 (GMT)
Subject: Re: [PATCH V3 3/5] ocxl: Update the Process Element Entry
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201124095838.18665-1-clombard@linux.vnet.ibm.com>
 <20201124095838.18665-4-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <46e5496a-22fa-fa4d-04c0-18a101e065a6@linux.ibm.com>
Date: Wed, 25 Nov 2020 15:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124095838.18665-4-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250084
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



On 24/11/2020 10:58, Christophe Lombard wrote:
> To complete the MMIO based mechanism, the fields: PASID, bus, device and
> function of the Process Element Entry have to be filled. (See
> OpenCAPI Power Platform Architecture document)
> 
>                     Hypervisor Process Element Entry
> Word
>      0 1 .... 7  8  ...... 12  13 ..15  16.... 19  20 ........... 31
> 0                  OSL Configuration State (0:31)
> 1                  OSL Configuration State (32:63)
> 2               PASID                      |    Reserved
> 3       Bus   |   Device    |Function |        Reserved
> 4                             Reserved
> 5                             Reserved
> 6                               ....
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---


LGTM
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/ocxl/context.c       | 4 +++-
>   drivers/misc/ocxl/link.c          | 4 +++-
>   drivers/misc/ocxl/ocxl_internal.h | 9 ++++++---
>   drivers/scsi/cxlflash/ocxl_hw.c   | 6 ++++--
>   include/misc/ocxl.h               | 2 +-
>   5 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index c21f65a5c762..9eb0d93b01c6 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -70,6 +70,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
>   {
>   	int rc;
>   	unsigned long pidr = 0;
> +	struct pci_dev *dev;
> 
>   	// Locks both status & tidr
>   	mutex_lock(&ctx->status_mutex);
> @@ -81,8 +82,9 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
>   	if (mm)
>   		pidr = mm->context.id;
> 
> +	dev = to_pci_dev(ctx->afu->fn->dev.parent);
>   	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid, pidr, ctx->tidr,
> -			      amr, mm, xsl_fault_error, ctx);
> +			      amr, pci_dev_id(dev), mm, xsl_fault_error, ctx);
>   	if (rc)
>   		goto out;
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index fd73d3bc0eb6..77381dda2c45 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -494,7 +494,7 @@ static u64 calculate_cfg_state(bool kernel)
>   }
> 
>   int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> -		u64 amr, struct mm_struct *mm,
> +		u64 amr, u16 bdf, struct mm_struct *mm,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data)
>   {
> @@ -529,6 +529,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> 
>   	memset(pe, 0, sizeof(struct ocxl_process_element));
>   	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
> +	pe->pasid = cpu_to_be32(pasid << (31 - 19));
> +	pe->bdf = cpu_to_be16(bdf);
>   	pe->lpid = cpu_to_be32(mfspr(SPRN_LPID));
>   	pe->pid = cpu_to_be32(pidr);
>   	pe->tid = cpu_to_be32(tidr);
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 0bad0a123af6..10125a22d5a5 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -84,13 +84,16 @@ struct ocxl_context {
> 
>   struct ocxl_process_element {
>   	__be64 config_state;
> -	__be32 reserved1[11];
> +	__be32 pasid;
> +	__be16 bdf;
> +	__be16 reserved1;
> +	__be32 reserved2[9];
>   	__be32 lpid;
>   	__be32 tid;
>   	__be32 pid;
> -	__be32 reserved2[10];
> +	__be32 reserved3[10];
>   	__be64 amr;
> -	__be32 reserved3[3];
> +	__be32 reserved4[3];
>   	__be32 software_state;
>   };
> 
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
> index e4e0d767b98e..244fc27215dc 100644
> --- a/drivers/scsi/cxlflash/ocxl_hw.c
> +++ b/drivers/scsi/cxlflash/ocxl_hw.c
> @@ -329,6 +329,7 @@ static int start_context(struct ocxlflash_context *ctx)
>   	struct ocxl_hw_afu *afu = ctx->hw_afu;
>   	struct ocxl_afu_config *acfg = &afu->acfg;
>   	void *link_token = afu->link_token;
> +	struct pci_dev *pdev = afu->pdev;
>   	struct device *dev = afu->dev;
>   	bool master = ctx->master;
>   	struct mm_struct *mm;
> @@ -360,8 +361,9 @@ static int start_context(struct ocxlflash_context *ctx)
>   		mm = current->mm;
>   	}
> 
> -	rc = ocxl_link_add_pe(link_token, ctx->pe, pid, 0, 0, mm,
> -			      ocxlflash_xsl_fault, ctx);
> +	rc = ocxl_link_add_pe(link_token, ctx->pe, pid, 0, 0,
> +			      pci_dev_id(pdev), mm, ocxlflash_xsl_fault,
> +			      ctx);
>   	if (unlikely(rc)) {
>   		dev_err(dev, "%s: ocxl_link_add_pe failed rc=%d\n",
>   			__func__, rc);
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index e013736e275d..3ed736da02c8 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -447,7 +447,7 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle);
>    * defined
>    */
>   int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> -		u64 amr, struct mm_struct *mm,
> +		u64 amr, u16 bdf, struct mm_struct *mm,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data);
> 
