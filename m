Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44626508B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 09:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbCxw44zZz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 19:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A8SX752t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbCwy07FQz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 19:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A8SX752t;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NbCws4fXLz4xwl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 19:46:21 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NbCws4NhQz4xZj; Mon, 19 Dec 2022 19:46:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A8SX752t;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NbCwr4Qscz4xG6;
	Mon, 19 Dec 2022 19:46:19 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ8Kfts004352;
	Mon, 19 Dec 2022 08:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6RmFcpJUA23I77W20IfYxOeUx+jokhSqIp1awwkQAtI=;
 b=A8SX752tdzQE4Lqreau0AzBQOpl7LWSoFJXRoCiItauwA77f+CmXqRE2/wMSSjzz0H25
 vwTXnKWPsEQEWQtpaawpzYp8fhlYbSdXJiArTBHHNQL2Fm2EaDaedXDrmxH+iptvYdXA
 4Ne/01LLZYD/TQkzB2n40PN+Ur47YJrxHjmS/MfcVDZOCl5KK05tNJy2YBafbxdeEpun
 nQBGRE6btRLAwAmsXCE3QwnPxkhrc/h0LaVSHeKvMs2mhsIdAyzVNL+QgFGaQ0BG7ljc
 eZzVbr7eodV+gXkH29S7uvShLvdZ+fJCUWtt7vEVtvVI5Hn0zwU7IZLsccYayzlRv1mJ nw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjmc48gjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 08:46:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BIFMVQC031264;
	Mon, 19 Dec 2022 08:46:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3mh6yuhjj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 08:46:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BJ8kAIf24445262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Dec 2022 08:46:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AB7B2004D;
	Mon, 19 Dec 2022 08:46:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EF3020043;
	Mon, 19 Dec 2022 08:46:09 +0000 (GMT)
Received: from [9.203.107.3] (unknown [9.203.107.3])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Dec 2022 08:46:08 +0000 (GMT)
Message-ID: <7118ca5c-f83a-007f-20f0-2fd65c1ef5a7@linux.ibm.com>
Date: Mon, 19 Dec 2022 14:16:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] powerpc/kexec_file: print error string on usable memory
 property update failure
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l1Hk859aSOaZxtnTSmOSI4Nn1Y1KqwR9
X-Proofpoint-GUID: l1Hk859aSOaZxtnTSmOSI4Nn1Y1KqwR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212190074
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/12/22 5:57 pm, Sourabh Jain wrote:
> Print the FDT error description along with the error message if failed
> to set the "linux,drconf-usable-memory" property in the kdump kernel's
> FDT.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

LGTM

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/kexec/file_load_64.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 349a781cea0b3..7602f7e1e634e 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -687,7 +687,8 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
>   		ret = fdt_setprop(fdt, node, "linux,drconf-usable-memory",
>   				  um_info.buf, (um_info.idx * sizeof(u64)));
>   		if (ret) {
> -			pr_err("Failed to update fdt with linux,drconf-usable-memory property");
> +			pr_err("Failed to update fdt with linux,drconf-usable-memory property: %s",
> +			       fdt_strerror(ret));
>   			goto out;
>   		}
>   	}
