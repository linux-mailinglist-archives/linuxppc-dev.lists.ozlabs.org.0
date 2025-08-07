Return-Path: <linuxppc-dev+bounces-10739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B3B1DA77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 16:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byVgX0st0z3cR2;
	Fri,  8 Aug 2025 00:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754578776;
	cv=none; b=HJqYa9VysADZGgDb1f2gizHSRyOvN3czoZ1gnjJyspOlY3qhKs/C6YPesL8WtYxn0WYkO/v3ef7ELIyLEgryKioxCVZOs8Y1WQW54vYdeqmM9fEO4WI1rQN2BttcoF4oq/Eq0Fpix5dwvWZU8sNHwh8+VIBtIuPGKehIf0+djMQaJKs7xG1Z9PqIXMmQEZAtbnhNkzj7FbP4gNyuKk1J9uUIoTN2FckHDHZMGrMEc3KuTGMBMGE/Ud1GS6jNYlVjSnyE7wazv8Evoe454jpmwuIjmLhEHhCZSN8hKY5fkdc97EmcQP741fVThM+mr49unli3VRKQJ0dMpFIEQBVlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754578776; c=relaxed/relaxed;
	bh=ryfLtLeDXs3nbNtKSgthsvsyjfARDXOnqgE+N8SlktY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcQ2ZwP0+k57O+dKzyH2ltuBqR/2dNk2tyWscY/YGarH1l9vJq5PkCujdmSxAxFTaxUrrFepZjZOFAKY7h/P4ypfqE/lKgc7JkUcuvXEY0I0sg0DMyVL4aGoZU4ZtKK6T3jySWUYll6h4jVsqRQWw5XqZ5p4oQl8bhyn9Ig/sk/qV2fwId4e4Pd71UiP/wsb3q1oSs3p+9VVK/w7v7e387a4eQ0bCQGcy1sJLtcYM3viz7DqX/gUjoMe+4JVwXXQRbxq5M/RxuO7KkMVBFokxJfLK2m5AG0daFRgrqrowf4c7IU1M9BQQctYty06wOh8qWwE7sVtF3cPnOPIhnM3Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M1iaBISD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M1iaBISD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byVgV0KyGz3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 00:59:33 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5775SDLN028233;
	Thu, 7 Aug 2025 14:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=ryfLtLeDXs3nbNtKSgths
	vsyjfARDXOnqgE+N8SlktY=; b=M1iaBISDpUOai2rSPVRK3tQOHckLoXYxbR7Z5
	HAgcIoTytNq662TxdSiSG7b5CtWpH3obyhsseiq6vQAAhlSz2+vO/7ybL61b2rha
	SziKalPymiJmnHR+AzVdfpFRCRXLs3xqhwZFqu9okgeo3M1m51gzv0v32RHFozYq
	+byrujpgW8qnv35zMxQTVlY88VWxXFOvVSjSuh0t4rRmTpkev657g4OHaCNCPHg7
	XNzqY9k4g1Lf0BsxkbbZwP9L0llcO3ohK/L6l0+sz5eTMdQ+xHqG7mmOu9ZLFFEm
	/4R+9wTyon6rQeno/gFRLBybmaStz4VRYqnli7bu6lKew+hvQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq612x96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 14:59:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577EoDCi013493;
	Thu, 7 Aug 2025 14:59:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq612x93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 14:59:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 577DirPG022647;
	Thu, 7 Aug 2025 14:59:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwqh4wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 14:59:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577ExMFb53543182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 14:59:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6D8C20049;
	Thu,  7 Aug 2025 14:59:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DD7020040;
	Thu,  7 Aug 2025 14:59:16 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.216.206])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Aug 2025 14:59:16 +0000 (GMT)
Date: Thu, 7 Aug 2025 20:29:12 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
        Linas Vepstas <linasvepstas@gmail.com>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v5 3/3] powerpc/eeh: Use result of error_detected() in
 uevent
Message-ID: <nk2zd4agog5pqajeofiazo6aut7xekbj5jsvoe373lldfl2y2g@qngl743pigmr>
Reply-To: mahesh@linux.ibm.com
References: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
 <20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nPK7BmCEmykejs_odMrOVMw6UNvtcAPE
X-Proofpoint-ORIG-GUID: 3f5MHXYlkHYvcyFm94JM3rn0C-c4ud3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDEyMCBTYWx0ZWRfXz/p2ZjS5q2Qz
 x45OPmCMPj6mqeDMd/qxE0o8foCg38eMo94PB/zXOHTuR8/NaF5aUzUQu8/gjv8+xz7trGu4qKg
 ha4SF21Q4LZ6896pPhU2mf5dUFkqykB7rWflRFBzZXmSf6NuVUzTLQwFn/p035ksBFK2K9O422D
 mi46nzsG8lduPa58gnKSgUEo/Gwpbu6BH1cJi5d77dOhNPPPgRkhyFj4Gsp8BUIqZDXEwKxlu/2
 JZ5frIIqXwVAs8AaVPYxVLOPagjwv01x9HkDhrFFWoMclbIPfUCRBmUYVHch3y0OleYQF3Pv08U
 gTIx8e6CwwjTx5oBMyWr5WdnzX1YBx72XLGPOn8t7dWNrhbkx4w4tB51yjFXHDGmOAmtp0qZ+GR
 jQIOt+82oMWWauScthmIsVMkuM6SZwF7CxWdE4TdSeLnnh/sk6tgXy8H1TqJBOVjaJKw7v8p
X-Authority-Analysis: v=2.4 cv=TayWtQQh c=1 sm=1 tr=0 ts=6894bf50 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=y5LWfs1rpAMjDq6n04wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508070120
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-07 15:55:40 Thu, Niklas Schnelle wrote:
> Ever since uevent support was added for AER and EEH with commit
> 856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume"), it
> reported PCI_ERS_RESULT_NONE as uevent when recovery begins.
> 
> Commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for
> udev") subsequently amended AER to report the actual return value of
> error_detected().
> 
> Make the same change to EEH to align it with AER and s390.
> 
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..20ed9685da8b7e6d419a4b02f715b52acfe715d3 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -334,7 +334,7 @@ static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
>  	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
>  
>  	edev->in_error = true;
> -	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
> +	pci_uevent_ers(pdev, rc);
>  	return rc;
>  }

Thanks for the patch. Looks good to me.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

>  
> 
> -- 
> 2.48.1
> 
> 

-- 
Mahesh J Salgaonkar

