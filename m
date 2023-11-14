Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561147EB05A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 13:54:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fPdQbc9r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV5qL1hZZz3dKH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 23:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fPdQbc9r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV5ns42nnz3c8c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 23:53:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AECnlvZ010404;
	Tue, 14 Nov 2023 12:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gzmPHP5+AikoPZlCBtMFvyPrlGgPzEAv5aI027qNKbs=;
 b=fPdQbc9r9HMuuZRB6sgpINUzqaFFXeraO7IuM7P5Y+4xHvwlMuC3zsawXuPjc+hsq3Dd
 jlpV8PXz5nTMqrq4VKrDfxfQtFEFjyHH1R9o4Flr+mA0G1O/ZM2cFR4V3OUcLqAbnkM+
 kDm/6IyuuQa3qwkOgMo76asfBZnVcTzcVb4kE0iS47MsDHnEKP+ArH0nhs+wMQ8qpaty
 t2rJl2igZrO9+1b383Rjn1fd/pXZ7Ype9QcHPPzo53GNdtFHQFlzsLesZ9kVFpOJlyQy
 EMHWbNpwKJ9l5NlYo6ndgR7cBcH2Ic7/XUutSLtJQR11HtcnCvXWWDRYGW+j3gBdTNRV jg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc8ws0n65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 12:53:29 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AEBS9mj011650;
	Tue, 14 Nov 2023 12:53:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uanekfp61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 12:53:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AECrOJ456754522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 12:53:24 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E16820043;
	Tue, 14 Nov 2023 12:53:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1EC220040;
	Tue, 14 Nov 2023 12:53:23 +0000 (GMT)
Received: from [9.144.146.189] (unknown [9.144.146.189])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 12:53:23 +0000 (GMT)
Message-ID: <50ffec17-62be-4f67-a8d9-3c503c7b8a34@linux.ibm.com>
Date: Tue, 14 Nov 2023 13:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: ocxl: link: Remove unnecessary (void*) conversions
Content-Language: en-US
To: Li zeming <zeming@nfschina.com>, ajd@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
References: <20231113014533.11064-1-zeming@nfschina.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20231113014533.11064-1-zeming@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z8Fe1F9dz_sw7wI14e_NqaCYT0mvCvVE
X-Proofpoint-ORIG-GUID: z8Fe1F9dz_sw7wI14e_NqaCYT0mvCvVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxlogscore=822 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/11/2023 02:45, Li zeming wrote:
> The link pointer does not need to cast the type.
> 
> Signed-off-by: Li zeming <zeming@nfschina.com>
> ---


Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   drivers/misc/ocxl/link.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index c06c699c0e7b1..03402203cacdb 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -188,7 +188,7 @@ static void xsl_fault_handler_bh(struct work_struct *fault_work)
>   
>   static irqreturn_t xsl_fault_handler(int irq, void *data)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) data;
> +	struct ocxl_link *link = data;
>   	struct spa *spa = link->spa;
>   	u64 dsisr, dar, pe_handle;
>   	struct pe_data *pe_data;
> @@ -483,7 +483,7 @@ static void release_xsl(struct kref *ref)
>   
>   void ocxl_link_release(struct pci_dev *dev, void *link_handle)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   
>   	mutex_lock(&links_list_lock);
>   	kref_put(&link->ref, release_xsl);
> @@ -540,7 +540,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   	struct spa *spa = link->spa;
>   	struct ocxl_process_element *pe;
>   	int pe_handle, rc = 0;
> @@ -630,7 +630,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_add_pe);
>   
>   int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   	struct spa *spa = link->spa;
>   	struct ocxl_process_element *pe;
>   	int pe_handle, rc;
> @@ -666,7 +666,7 @@ int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
>   
>   int ocxl_link_remove_pe(void *link_handle, int pasid)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   	struct spa *spa = link->spa;
>   	struct ocxl_process_element *pe;
>   	struct pe_data *pe_data;
> @@ -752,7 +752,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_remove_pe);
>   
>   int ocxl_link_irq_alloc(void *link_handle, int *hw_irq)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   	int irq;
>   
>   	if (atomic_dec_if_positive(&link->irq_available) < 0)
> @@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(ocxl_link_irq_alloc);
>   
>   void ocxl_link_free_irq(void *link_handle, int hw_irq)
>   {
> -	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	struct ocxl_link *link = link_handle;
>   
>   	xive_native_free_irq(hw_irq);
>   	atomic_inc(&link->irq_available);
