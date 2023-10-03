Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57287B5F04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 04:23:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fh8kvpSL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S01pF4DV2z3vXB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 13:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fh8kvpSL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S01nM29fBz3c57
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 13:22:47 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3932HVdG010839;
	Tue, 3 Oct 2023 02:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SZwaleVpIQzkeA67WV/Bm+zqgoi+GnVh7ghXdVuCxo8=;
 b=fh8kvpSL0sHcZNV7GkIiiYKvKHnwi8dyO/dJ4nzfWH/h3iyUWnlKCFEh4cZQqdoUtUhA
 zdPfoEtBT3QXXy8HB9FBbWs+gKnPv2zlj+gLAfG4CYr2zA2r8MgLhL+bvcXbSkn3YA/U
 /vCTlrzGzPPDk/SZNkiz17PXfTXWQ1XEofoOBeAMRocPQZuig5CR5KPKDsKy+I0RRrkT
 Z07tjJE7nOK8b1An3x+KSqlLTMVWVC0SH5Yvyjv0kXoxYsRVmXkslNqjJRJA3amG6cR0
 fVLl8qVTpFgEOrjt+yK47p83ywLyxRCiPX965vrhG1+avBYe5aZZIsjTi9SMAsK6+794 Rg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tga1x02b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 02:22:39 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3931NZfo025047;
	Tue, 3 Oct 2023 02:22:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3texcxxasb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 02:22:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3932MaFc10093248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Oct 2023 02:22:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A53D520043;
	Tue,  3 Oct 2023 02:22:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3FC820040;
	Tue,  3 Oct 2023 02:22:35 +0000 (GMT)
Received: from [9.204.207.183] (unknown [9.204.207.183])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Oct 2023 02:22:35 +0000 (GMT)
Message-ID: <a29c5d79-b56d-4314-508f-e6bbac7bc498@linux.ibm.com>
Date: Tue, 3 Oct 2023 07:52:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] powerpc/pseries/iommu: enable_ddw incorrectly returns
 direct mapping for SR-IOV device.
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20231002214603.43881-1-gbatra@linux.vnet.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20231002214603.43881-1-gbatra@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fK24skQHecJECCh_tgt0YWwKS3ummoQb
X-Proofpoint-GUID: fK24skQHecJECCh_tgt0YWwKS3ummoQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_16,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030016
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/3/23 3:16 AM, Gaurav Batra wrote:
> When a device is initialized, the driver invokes dma_supported() twice - first
> for streaming mappings followed by coherent mappings. For an SR-IOV device,
> default window is deleted and DDW created. With vPMEM enabled, TCE mappings
> are dynamically created for both vPMEM and SR-IOV device. There are no direct
> mappings.
>
> First time when dma_supported() is called with 64 bit mask, DDW is created and
> marked as dynamic window. The second time dma_supported() is called, enable_ddw()
> finds existing window for the device and incorrectly returns it as "direct mapping".
>
> This only happens when size of DDW is capable of mapping max LPAR memory.
>
> This results in streaming TCEs to not get dynamically mapped, since code incorrently
> assumes these are already pre-mapped. The adapter initially comes up but goes down
> due to EEH.

Just checked for patch submission and it is missing "Signed-off-by:"
It is good to run once with checkpatch.pl before posting to mailing list

maddy

> ---
>   arch/powerpc/platforms/pseries/iommu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 16d93b580f61..d8b4adcef1ad 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -914,7 +914,8 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
>   	return 0;
>   }
>
> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
> +static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift,
> +			      bool *direct_mapping)
>   {
>   	struct dma_win *window;
>   	const struct dynamic_dma_window_prop *dma64;
> @@ -927,6 +928,7 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *windo
>   			dma64 = window->prop;
>   			*dma_addr = be64_to_cpu(dma64->dma_base);
>   			*window_shift = be32_to_cpu(dma64->window_shift);
> +			*direct_mapping = window->direct;
>   			found = true;
>   			break;
>   		}
> @@ -1270,8 +1272,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>
>   	mutex_lock(&dma_win_init_mutex);
>
> -	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
> -		direct_mapping = (len >= max_ram_len);
> +	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len, &direct_mapping)) {
>   		goto out_unlock;
>   	}
>
