Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4E6EC99D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 11:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4gZ00KbRz3fBK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 19:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LBlJy/2G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4gY83vPfz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:57:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LBlJy/2G;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4gY62tl9z4xDH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:57:46 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4gY62qZ1z4xDr; Mon, 24 Apr 2023 19:57:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LBlJy/2G;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4gY56wwPz4xDH
	for <linuxppc-dev@ozlabs.org>; Mon, 24 Apr 2023 19:57:45 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33O9c5HU025509;
	Mon, 24 Apr 2023 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NJ/nkZM9Qq48ObBRcZoXL/wrN9PLFjmFFV9g8PRA/Z0=;
 b=LBlJy/2GXN0YRvt/ZteEHx7q8odDB5LTFRBGyaysojZRU+S74WM+yKNjPaTdatMu2Xq8
 at8kIhX+xJEKQab1VL88wHc25EHAfitzmi7ndhTwveDfZvAEeZ6gKVGMLSRlW0fVAFas
 q77NSjnmTljL1Mekx6TL285XBYP1o4SYmr0SrTpIUWC9gE/cIMDKaqGzrE3kL/IbcOPz
 Ll04PdPpL9RC/VvvPHPOYwfdcmYG17Ysbvh52FCqU1UY5vyk8W8u9GT1HicDtyzkUISR
 OSfCSzSFI19Cwizv4lFon/rKgMjgONo5vAoJXhUgorutrvNgOmJJtahy2mbjTXUWzzQB Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q461bx555-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:57:30 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33O9dk87031609;
	Mon, 24 Apr 2023 09:57:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q461bx547-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:57:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O0a7au008043;
	Mon, 24 Apr 2023 09:57:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q477711a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:57:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33O9vNoU49480008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 09:57:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3E0020043;
	Mon, 24 Apr 2023 09:57:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7812720040;
	Mon, 24 Apr 2023 09:57:23 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 09:57:23 +0000 (GMT)
Message-ID: <c87ace32-b11d-8b60-50f5-584acc2bd824@linux.ibm.com>
Date: Mon, 24 Apr 2023 11:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 2/5] powerpc/crash: introduce a new config option
 CRASH_HOTPLUG
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
 <20230423105213.70795-3-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230423105213.70795-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NDkCLv3pGtdOiEcp1kXvT9kb1eOM7p4K
X-Proofpoint-ORIG-GUID: lZ7L_SLh0YoaPcepW8meMTOM5sMdzIX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240085
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, eric.devolder@oracle.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/04/2023 12:52:10, Sourabh Jain wrote:
> Due to CPU/Memory hot plug/unplug or online/offline events the system
> resources changes. A similar change should reflect in the loaded kdump
> kernel kexec segments that describes the state of the CPU and memory of
> the running kernel.
> 
> If the kdump kernel kexec segments are not updated after the CPU/Memory
> hot plug/unplug or online/offline events and kdump kernel tries to
> collect the dump with the stale system resource data then this might
> lead to dump collection failure or an inaccurate dump collection.
> 
> The current method to keep the kdump kernel kexec segments up to date is
> by reloading the complete kdump kernel whenever a CPU/Memory hot
> plug/unplug or online/offline event is observed in userspace. Reloading
> the kdump kernel for every CPU/Memory hot plug/unplug or online/offline
> event is inefficient and creates a large window where the kdump service
> is not available. It can be improved by doing in-kernel updates to only
> necessary kdump kernel kexec segments which describe CPU and Memory
> resources of the running kernel to the kdump kernel.
> 
> The kernel changes related to in-kernel updates to the kdump kernel
> kexec segments are kept under the CRASH_HOTPLUG config option.
> 
> Later in the series, a powerpc crash hotplug handler is introduced to
> update the kdump kernel kexec segments on CPU/Memory hotplug events.
> This arch-specific handler is triggered from a generic crash handler
> that registers with the CPU/Memory add/remove notifiers.
> 
> The CRASH_HOTPLUG config option is enabled by default.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

I can't remember having sent a review-by on that patch earlier.

Anyway, I can't find any issue with that one, so replace with:
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/Kconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a6c4407d3ec83..ac0dc0ffe89b4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -681,6 +681,18 @@ config CRASH_DUMP
>  	  The same kernel binary can be used as production kernel and dump
>  	  capture kernel.
>  
> +config CRASH_HOTPLUG
> +	bool "In-kernel update to kdump kernel on system configuration changes"
> +	default y
> +	depends on CRASH_DUMP && (HOTPLUG_CPU || MEMORY_HOTPLUG)
> +	help
> +	  Quick and efficient mechanism to update the kdump kernel in the
> +	  event of CPU/Memory hot plug/unplug or online/offline events. This
> +	  approach does the in-kernel update to only necessary kexec segment
> +	  instead of unload-reload entire kdump kernel from userspace.
> +
> +	  If unsure, say Y.
> +
>  config FA_DUMP
>  	bool "Firmware-assisted dump"
>  	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)

