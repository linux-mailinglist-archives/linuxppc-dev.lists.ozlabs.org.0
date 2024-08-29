Return-Path: <linuxppc-dev+bounces-746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9507496472F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 15:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvjNm48fcz2ytg;
	Thu, 29 Aug 2024 23:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724939464;
	cv=none; b=lYVPNk87H8vE7LQ7TV4qRLShMfv4KKM6PUyyYh77KaOkB+A9fG4vxEePO3sofqyQgMXrujm+SSkhx+eupzgpkUsy9t/9w+WxYj4Gr6AS6d2ddNtNB7ZtpEaoZikAfsrjA+uaBcBn1QgBLh8AAId5ZLY+SM4zLh6TE9zFJu8J7u7hlgLF8ghjGRsO6Q+Fh3m426Ody+jNxZJiXS40sa2rQqNsMnObsqTQetO91yut+EJ7bDlL7UNM2J2Gn4kIREuMjSEmvPbRQgcAOQqilBwqFgzC6cDBov9OGE+XJO1EWBYwR+qAqLE7BvZ8AqFDFI7Dx4Yof5AuTTCUQmPfm0LWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724939464; c=relaxed/relaxed;
	bh=a+3jydTIUFLbIFPPVLalUu4+A0e3T4wDvZ2z6IvdjXs=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=lBL95K4p5jPIIkkCaVwo9QsQiDRdF53mqdOIVIBnJE2ezedfPSGjEvVCCAbJEqkrZv5R/vYxNsk9FQbNJcHkn9EX+nKtx90HSOiz3YTJH82Zj6nSOoWdCR14c+DlZc7qwfGwA+dM6jJc6Zl1FVfAy60d9U/Oom8aiwLO6JNUUm/dIDOjF2yCegtD3qfefXAc/jXfw27T7L3YTArL7CU39lyAbEv9To/zLs9jJ7D8VKjcGQKag/5123vIS3Zt42VZmufInSks8t1JxBPYgYg62TliEfnpHCn9FHWwRYO0/HNeuB9CfPJ5LBB7+SS9uvrq7owrGH37ZHApmGZxzBhP/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0R9G5tw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0R9G5tw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvjNl6MdBz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 23:51:03 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1d1iZ032155;
	Thu, 29 Aug 2024 13:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=a
	+3jydTIUFLbIFPPVLalUu4+A0e3T4wDvZ2z6IvdjXs=; b=b0R9G5twXU7gFydIO
	aXf8wA33gDoJSrR4LktpwVubpkZgYEHBLgLk6V+iqAAoWSWPO/PWlNOR+ABUyxPI
	LJB3I0Pn+Ztg+QF12O476P9ShwFfBz0664LsSQDb+2p80wKBnVw4stX2jHeWspq0
	oW7hGo9EzOq5KuibsaNSL2xqsY6jcb/ZIL1XExVD8wZ07nPZ3oBo2rR+BsKGsSY5
	TC65xPHjl4hSuDFAafDbDsDksHkwaIYfqN1etuePb9vgEKZrHMAxHhKTn62dS6oR
	o5Hb8HSLVPw6Np0BxaVMemBBkukqd1J6BR9VhtsvFuOXySuD3xfr1bvkNxEYdrAU
	cYBOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8u87hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:50:42 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47TDlOxk019521;
	Thu, 29 Aug 2024 13:50:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8u87hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:50:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47TAFKCk030966;
	Thu, 29 Aug 2024 13:50:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417t8150nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:50:41 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47TDoeQE44171692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2024 13:50:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AA0D58056;
	Thu, 29 Aug 2024 13:50:40 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 147FC58052;
	Thu, 29 Aug 2024 13:50:37 +0000 (GMT)
Received: from [9.171.43.86] (unknown [9.171.43.86])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Aug 2024 13:50:36 +0000 (GMT)
Message-ID: <4afe5232-78ae-42a0-9b6d-669cc7f6b051@linux.ibm.com>
Date: Thu, 29 Aug 2024 19:20:35 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] powerpc/pci: restore LSI mappings on card present
 state change
To: Oleksandr Ocheretnyi <oocheret@cisco.com>, xe-linux-external@cisco.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20240827165738.1083422-1-oocheret@cisco.com>
Content-Language: en-US
From: krishna kumar <krishnak@linux.ibm.com>
In-Reply-To: <20240827165738.1083422-1-oocheret@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kW1vDl35JfHWQ3ie-6t96PKSIaohLPkB
X-Proofpoint-ORIG-GUID: DKI4L79Go83gBxnv02tt_RQ1MpoQlA-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290093


On 8/27/24 22:27, Oleksandr Ocheretnyi wrote:
> Commit 450be4960a0f ("powerpc/pci: Remove LSI mappings on device
> teardown") frees irq descriptors on PCIe hotplug link change event
> (Link Down), but the disposed mappings are not restored back on PCIe
> hotplug link change event (Card present).
>
> This change restores IRQ mappings disposed earlier when pcieport
> link's gone down. So, the call pci_read_irq_line is invoked again
> on pcieport's state change (Card present).

Few things are important to know regarding these change-sets:

1. The commit (450be4960aof) addressed an issue where the removal
or hot-unplug of an LSI passthroughed IO adapter was not working on
pseries machines. This was due to interrupt resources not getting cleaned
up before removal. Since there were no pcibios_* hooks for the interrupt
cleanup, the interrupt-related resource cleanup has been addressed using
the notifier framework and an explicit call of ppc_pci_intx_release().

2. Does without your current patch and after hot-plug operation, device is
not working (io not happening or interrupt not getting generated) correctly ?

3. There is already a pcibios_* hook available for creating the interrupt
mapping. Here's a snippet -

  /*
   * Called after device has been added to bus and
   * before sysfs has been created.
   */

void (*pcibios_bus_add_device)(struct pci_dev *pdev);

Above function calls - below function to restore the irq mapping.

/* Read default IRQs and fixup if necessary */
   pci_read_irq_line(dev);

4. Does the above pcibios_* hook not sufficient for enabling the interrupt
mapping or does it not getting invoked during hot-plug operation ?

>
> Fixes 450be4960a0f ("powerpc/pci: Remove LSI mappings on device teardown")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> ---
>   arch/powerpc/kernel/pci-common.c | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index eac84d687b53..a0e7cab2baa7 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -390,22 +390,32 @@ static void ppc_pci_intx_release(struct kref *kref)
>   	kfree(vi);
>   }
>   
> +static int pci_read_irq_line(struct pci_dev *pci_dev);
> +
>   static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
>   			       unsigned long action, void *data)
>   {
>   	struct pci_dev *pdev = to_pci_dev(data);
>   
> -	if (action == BUS_NOTIFY_DEL_DEVICE) {
> -		struct pci_intx_virq *vi;
> -
> -		mutex_lock(&intx_mutex);
> -		list_for_each_entry(vi, &intx_list, list_node) {
> -			if (vi->virq == pdev->irq) {
> -				kref_put(&vi->kref, ppc_pci_intx_release);
> -				break;
> +	switch (action) {
> +		case BUS_NOTIFY_DEL_DEVICE:
> +			{
> +				struct pci_intx_virq *vi;
> +
> +				mutex_lock(&intx_mutex);
> +				list_for_each_entry(vi, &intx_list, list_node) {
> +					if (vi->virq == pdev->irq) {
> +						kref_put(&vi->kref, ppc_pci_intx_release);
> +						break;
> +					}
> +				}
> +				mutex_unlock(&intx_mutex);
>   			}
> -		}
> -		mutex_unlock(&intx_mutex);
> +			break;
> +
> +		case BUS_NOTIFY_ADD_DEVICE:
> +			pci_read_irq_line(pdev);
> +			break;

The above code is fine only if my aforementioned points do not hold.

>   	}
>   
>   	return NOTIFY_DONE;


Best Regards,

Krishna


