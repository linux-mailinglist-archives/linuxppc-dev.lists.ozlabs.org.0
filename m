Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968343111D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 09:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXnz36tJ6z3cH9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 18:08:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MnNlhCJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MnNlhCJy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXnxs062Yz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 18:07:28 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I4pE9d014606; 
 Mon, 18 Oct 2021 03:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vbrSzoBt7X4TL99HrXT0Mtl3aZl0ABB0RSF7M+qQSl8=;
 b=MnNlhCJy33wIAyc/XjCsTkALtUOBz9rQ7S3l38ftwFqXIVNVMZwGQpsqr7tmlDmHBNIJ
 iWy/MhQS83u2wHCaEquxE7nfxGX2BeHPf1/VmjTsD96QWIr82LnuAOlW7v6qlKFIHYsQ
 kGww69Mnmvgn7CXQcSVlaXC9p9UZ3DmtGG6nu1cZ+eJvL9Ogg98DQBtKPdL9MLQEc5JO
 IzM6SfAcKojvakJLA1tdWSE4Xeb0r9W+IF6lhMqFXDSu91In0OdDWZuZtnCKOjuE5rUM
 CmU96UVxo4n4uVslABT0YN3C2yF9XNE9T2Rkz3iH4h5Uat58bpXqx61LwQwdtJ3CsZLm aQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs28xj72f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 03:07:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I71joI023363;
 Mon, 18 Oct 2021 07:07:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9b6pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 07:07:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I77C2w51380588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 07:07:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4063BAE04D;
 Mon, 18 Oct 2021 07:07:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE62EAE045;
 Mon, 18 Oct 2021 07:07:07 +0000 (GMT)
Received: from [9.43.101.92] (unknown [9.43.101.92])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 07:07:07 +0000 (GMT)
Message-ID: <cb0dba37-f3e4-acd7-444f-01a6dc737919@linux.ibm.com>
Date: Mon, 18 Oct 2021 12:37:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] powerpc/kexec_file: Add of_node_put() before goto
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211018015418.10182-1-wanjiabing@vivo.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20211018015418.10182-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bJ4ZEjuBgK1SpSvn5A6XlfYvhsN2CbRR
X-Proofpoint-GUID: bJ4ZEjuBgK1SpSvn5A6XlfYvhsN2CbRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180043
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/10/21 7:24 am, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./arch/powerpc/kexec/file_load_64.c:698:1-22: WARNING: Function
> for_each_node_by_type should have of_node_put() before goto
> 
> Early exits from for_each_node_by_type should decrement the
> node reference counter.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Thanks for fixing this!

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/kexec/file_load_64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 5056e175ca2c..b4981b651d9a 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -700,6 +700,7 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
>   		if (ret) {
>   			pr_err("Failed to set linux,usable-memory property for %s node",
>   			       dn->full_name);
> +			of_node_put(dn);
>   			goto out;
>   		}
>   	}
> 
