Return-Path: <linuxppc-dev+bounces-8571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B7AB6C37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 15:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyDGc3wPJz2yqW;
	Wed, 14 May 2025 23:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747228216;
	cv=none; b=Aiv7mFA1NQ4n28crYuCcB1g4GJ38tX/8THyJP81xDb+VJ42gXHQfc04G8n6lx6YqImYyKCcalBipPKRb3EmEkWsOMSrjnTLmPkM7cq9/2T0wVd3Hm/oHet0WFf1w0F6ag/9Ui0FTIf8q3wQzl9n0AChlT4xNn27pCoAcZRnKeQWi9gqkJJ+ynpNOC7BIQWdZoj+3XEmKrOIwn9Xet8S3eW/6VxgBIxLgz1hlTLiCCXfHH3K4DsGaxuZ0l8tR9g1rVuVbye4fSUKYf6ZPi7EjQLcRinY294d9P3CGQ7rigu56EzgPI/v1xbE/w+goUnGVvL3HJZp8JMEAvd2+jiGgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747228216; c=relaxed/relaxed;
	bh=McKolMQvb55hck4pQRmljZVk0o5e+NP2bZCcZdD7Lf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAkXCvNnoKbQfi+/deDFURpesvLJXTaOdX96B3yaJMMQ8TLWUs0G+uhfBKhoghAz6+oox5ABCjxVuri9RX/U14b6VUvXvqDFTPjWfQbu6OUANuKKjVJtsGWBvIB9oWnT/Vys7XzXG4+1gN83M+FrgSz9/O7m7iEGA3k+sKiSvK4Nxz40r4HmFk1omqMpAWZznMQ3yFGeq3KPJRHYzAbQLQUAxQj829KpcvdPCECCIx/2hlBuM3PgnebrE83UmZ3JszBU5WtFlO5/IavuT+0E/nKA26QtNi31kb3e1LlqTL+AkOcfmlM78f2ukmeZ/aR/qhicoSXvfLtOUcODNkMdPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYZKdarR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYZKdarR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyDGZ0wMnz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 23:10:13 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E8pN45029463;
	Wed, 14 May 2025 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=McKolM
	Qvb55hck4pQRmljZVk0o5e+NP2bZCcZdD7Lf0=; b=oYZKdarRndsWlHZZ2+gjIf
	n1HGe1gZcyUkwvVPd4vBtUo3CFLxJGtBSGybhTP4UcT1mNGjyYvmK/Cq0osU3Mve
	D6jff8rRmV3C49EnGfSxf9lIsKpfyp6f6HJOhzEXxAnBRTyBqTqHdUBaZN21dYYB
	2IWuP2TNwYsGATR56h1nWS1AuN1aFGNrLBPZdmb4V1/yRcpiAf/QA1PODZLDBl2x
	Id9ar5yVHoAU8oOIVKZwh1Ra/Cnk1Fi8TaPqJ4afvN8xC23l7b4AnBSc6bFTH04V
	qoF2CbN9XB35AirmFXYmbnq8UGyRLvIMvHLCBoF3ZvNyYbkblzu5P2k3eH4M7Sxg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mr1gh75h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54ECi8KN006762;
	Wed, 14 May 2025 13:09:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mr1gh75e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E9pVQ2021424;
	Wed, 14 May 2025 13:09:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrm9v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54ED9pQH59703672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 13:09:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D54120172;
	Wed, 14 May 2025 13:09:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AF722016D;
	Wed, 14 May 2025 13:09:48 +0000 (GMT)
Received: from [9.87.145.82] (unknown [9.87.145.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 13:09:48 +0000 (GMT)
Message-ID: <9b936f0c-14d0-4601-927e-89fc0b7016b6@linux.ibm.com>
Date: Wed, 14 May 2025 18:39:47 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] powerpc/eeh: Fix missing PE bridge reconfiguration
 during VFIO EEH recovery
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        gwshan@linux.vnet.ibm.com, benh@kernel.crashing.org, agraf@suse.de,
        vaibhav@linux.ibm.com
References: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
Content-Language: en-US
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vp_JmzGcVB9K5AAqpm7sbLZis4BmuKCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExNSBTYWx0ZWRfX0wyJdccglwNp xKV0dSoG83rzqNwioHrvHQWxSkEDnJ31K64PwNA7UkY/DAdhCQjo5jLzPjJTMxXsXq2O4s+74ez aZHYGe8tMTPISLVWg5QRL1TBjw+Tyq6Fwy04fW7MDO/Ec5GX7mBtU1Or+pPMjBNnlcDrclyQEqS
 OyM4bBiU6fJd6FYCvdYfKy3gZpL0ovY3HFDpuMd4wz2akKqGz5aTaojFYr2NLh7dnefKRv+cEj/ smASnmIxdXtWZseDVmRBeqiTNQnLPo1/GlOHUF5zpQTSlYa6hOHBT+ergWJAxiEzezniO3y4b5M n9fSjZBpBlCaKZcydb79BfoSgxfvtQjnJcO9arQKk/TgyxUwD00AuR5nj+m0hcNykAyGE686lGP
 WxC7rrsK4S9UAuf8t69Uv7PJOFVmybRhpEtxZCCznPrMmcuVoC8edCvPx9LslJWXAq6NKwhN
X-Proofpoint-GUID: wG5sNZ45GPfphW7TLGpr2hg9dGrBJQer
X-Authority-Analysis: v=2.4 cv=QOxoRhLL c=1 sm=1 tr=0 ts=68249625 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=87gp3Zgmo8FheM39fz4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140115
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/8/25 11:59 AM, Narayana Murty N wrote:
> VFIO EEH recovery for PCI passthrough devices fails on PowerNV and pseries
> platforms due to missing host-side PE bridge reconfiguration. In the
> current implementation, eeh_pe_configure() only performs RTAS or OPAL-based
> bridge reconfiguration for native host devices, but skips it entirely for
> PEs managed through VFIO in guest passthrough scenarios.
> 
> This leads to incomplete EEH recovery when a PCI error affects a
> passthrough device assigned to a QEMU/KVM guest. Although VFIO triggers the
> EEH recovery flow through VFIO_EEH_PE_ENABLE ioctl, the platform-specific
> bridge reconfiguration step is silently bypassed. As a result, the PE's
> config space is not fully restored, causing subsequent config space access
> failures or EEH freeze-on-access errors inside the guest.
> 
> This patch fixes the issue by ensuring that eeh_pe_configure() always
> invokes the platform's configure_bridge() callback (e.g.,
> pseries_eeh_phb_configure_bridge) even for VFIO-managed PEs. This ensures
> that RTAS or OPAL calls to reconfigure the PE bridge are correctly issued
> on the host side, restoring the PE's configuration space after an EEH
> event.
> 
> This fix is essential for reliable EEH recovery in QEMU/KVM guests using
> VFIO PCI passthrough on PowerNV and pseries systems.
> 
> Tested with:
> - QEMU/KVM guest using VFIO passthrough (IBM Power9,(lpar)Power11 host)
> - Injected EEH errors with pseries EEH errinjct tool on host, recovery
>    verified on qemu guest.
> - Verified successful config space access and CAP_EXP DevCtl restoration
>    after recovery
> 
> Fixes: 212d16cdca2d ("powerpc/eeh: EEH support for VFIO PCI device")
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   arch/powerpc/kernel/eeh.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 83fe99861eb1..ca7f7bb2b478 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1509,6 +1509,8 @@ int eeh_pe_configure(struct eeh_pe *pe)
>   	/* Invalid PE ? */
>   	if (!pe)
>   		return -ENODEV;
> +	else
> +		ret = eeh_ops->configure_bridge(pe);
> 
>   	return ret;
>   }
> --
> 2.48.1
> 
Looks good to me.
Reviewed-by: Ganesh Goudar <ganeshgr@linux.ibm.com>



