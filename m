Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B3685E9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P68ZT4s0Fz3cgr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:48:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFxeOcV9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P68YW0hbdz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:47:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFxeOcV9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P68YV42wPz4xwq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:47:58 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P68YV3kHdz4x1f; Wed,  1 Feb 2023 15:47:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFxeOcV9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P68YV0gZZz4x1d;
	Wed,  1 Feb 2023 15:47:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3114l9cE011110;
	Wed, 1 Feb 2023 04:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C7QMWEmDsCKtUtv2v3QFYULGrEoeOuUJ0CGIaR9W1wg=;
 b=LFxeOcV9cUDbwxOtCMIXKOFVudceR3FDNXMVlxfnlH4B7sJ1H/Qn3fmmGZRMqjl1tDy1
 0veRGOOKZLK+YN3Ok+BjCeSXm+srzSD4F1IEXXPfUmODcDKU67b0/CZaeepczKwDg73V
 G7ok17urir4gyYIfeRCGgjQcGnph35G52toA1Xr/xzlFXW4b+loLtex8nBMBxrrAzIeG
 YPTRK8BJmnKZZA+vdZpTiahdyqu/iaK2IHc5HqFTFniyJFBXkv5awbYLuBauASRGane7
 i8pjngMMJVzTE3XeYzWfOqrpCEWSSTAJ3pyAvnZF2BWeKq0ujkZL832Fm7+dhWLrIJwe 7g== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfd46526r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:47:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VJfGQ7030067;
	Wed, 1 Feb 2023 04:47:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshb2vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:47:53 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3114lpI922348170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 04:47:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2537B2004D;
	Wed,  1 Feb 2023 04:47:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E28520043;
	Wed,  1 Feb 2023 04:47:50 +0000 (GMT)
Received: from [9.43.109.52] (unknown [9.43.109.52])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 04:47:49 +0000 (GMT)
Message-ID: <24f4aed2-9493-2bab-7cb4-385acd797adc@linux.ibm.com>
Date: Wed, 1 Feb 2023 10:17:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc/kexec_file: print error string on usable memory
 property update failure
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
References: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lF9BdKKsC5PwlMbn6YgpoWh9ThOEmPc8
X-Proofpoint-GUID: lF9BdKKsC5PwlMbn6YgpoWh9ThOEmPc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=869 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010037
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only place on kexec/kdump path where we don't print
reason for FDT operation failure. This patch fix that.

Will this be a good candidate for next rc?

Thanks,
Sourabh

On 16/12/22 17:57, Sourabh Jain wrote:
> Print the FDT error description along with the error message if failed
> to set the "linux,drconf-usable-memory" property in the kdump kernel's
> FDT.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
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
