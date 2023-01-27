Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E035367DD4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P36LJ3ThYz3fGY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 16:57:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EB+AD3ih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P36KH5jJsz3fCY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 16:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EB+AD3ih;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P36KF5DYLz4xHV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 16:56:49 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P36KF5715z4xGM; Fri, 27 Jan 2023 16:56:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EB+AD3ih;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P36KD6ZWtz4xG5;
	Fri, 27 Jan 2023 16:56:48 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R5TY60018679;
	Fri, 27 Jan 2023 05:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l8J0igRjH+sciPWb7GjJdLrgyl4Rh/e+vSdFV9wc+94=;
 b=EB+AD3ih/Yr21ilmMBvWM+Qzvjy5VgNg/RgveS37gP8A6DsZZMn/n5LEjyiX26XnfBuu
 JQhWIp2C2nrHiGOYETRmYJ5ySj+tZD7DLawURHnOG0463Wu8MkMxkjWT1BBpIHTXWN8b
 D7MxdgeBubX7omNGmhi8gdzZRhpIPIrhwwutUm+7GGvGVE5g5OrwqXuyqD8/tfENM7Fl
 JC2FO4ZxbBoYT741rzGOdEiivdv2geE7xE9i6fPitMP7CeWsWAihtvuEkHQTYLVgQhGB
 V850LTkcfBTlQ4mLNcn97K5UqXhmqeHdscE7QRsv8Qs78WwtvvwpF4x5mzXVFwyczU0S 4g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc8gxgexk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 05:56:45 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30QNr6ne029222;
	Fri, 27 Jan 2023 05:56:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n87afd639-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 05:56:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30R5uegY49152474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 05:56:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1A8520043;
	Fri, 27 Jan 2023 05:56:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B0AD20040;
	Fri, 27 Jan 2023 05:56:39 +0000 (GMT)
Received: from [9.43.84.242] (unknown [9.43.84.242])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jan 2023 05:56:39 +0000 (GMT)
Message-ID: <6e9ebbd8-f4a6-b18f-96ba-7d50b3824b97@linux.ibm.com>
Date: Fri, 27 Jan 2023 11:26:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc/kexec_file: account hot-pluggable memory while
 estimating FDT size
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
References: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SAVDqordP_-A--hQNbG-K0eH_q_SvJ1H
X-Proofpoint-GUID: SAVDqordP_-A--hQNbG-K0eH_q_SvJ1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_02,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270051
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

Gentle reminder, any comments and suggestions on this fix.

- Sourabh

On 15/12/22 14:08, Sourabh Jain wrote:
> On Systems where online memory is lesser compared to max memory, the
> kexec_file_load system call may fail to load the kdump kernel with the
> below errors:
>
>      "Failed to update fdt with linux,drconf-usable-memory property"
>      "Error setting up usable-memory property for kdump kernel"
>
> This happens because the size estimation for usable memory properties
> for the kdump kernel's FDT is based on the online memory whereas the
> usable memory properties include max memory. In short, the hot-pluggable
> memory is not accounted for while estimating the size of the usable
> memory properties.
>
> The issue is addressed by calculating usable memory property size using
> max hotplug address instead of the last online memory address.
>
> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kexec/file_load_64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 349a781cea0b3..2c3fd6fe6bc94 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -947,7 +947,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   	 * linux,drconf-usable-memory properties. Get an approximate on the
>   	 * number of usable memory entries and use for FDT size estimation.
>   	 */
> -	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
> +	usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
>   		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>   	return (unsigned int)(usm_entries * sizeof(u64));
>   }
