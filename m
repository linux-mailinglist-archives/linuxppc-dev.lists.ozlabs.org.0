Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4F5018EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 18:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfQFk72NKz3brx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bozdgtOl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfQF31m3Bz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bozdgtOl; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KfQF14wXPz4xL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:40:37 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KfQF14sLdz4xLQ; Fri, 15 Apr 2022 02:40:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bozdgtOl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KfQF11qnSz4xL4
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Apr 2022 02:40:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EE7AT2032969; 
 Thu, 14 Apr 2022 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RoZLritMCLY0PRds36mM80V08uhmZ7efVou1Imsq0Yw=;
 b=bozdgtOljVRRLNJy8XSjewel9UtIQRz//3YgHl8iQ6RBGEQKA0K4m6yPoqvyAbYcTKud
 A9Tzx9mMCoxJMcfFDu8WyziGNX1N2KJctYmy8yYHFd3OfwE2Md0J1H5Ky3ZAZRxxOdhQ
 wRHwWNx/+waEi9aRRpEOFlcOqR3Tl1Uxph/puqbYSD4NFtjIKrpKNZQ0g5T7cuoCdfRW
 oCvimR8LQdIZc6WPy7TtbfozHrdNuWn49G0qDUo3nosP1EetUo9QS8ECXCewocuEr6GO
 AgpWLepJB14w7oZbXdyYLlIfOf4IzynFuRH9WItWfUhzxt3t5pltnpJ4ZxMFH+smIt+O MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fef1pb5hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:40:27 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23EGAu3c036755;
 Thu, 14 Apr 2022 16:40:27 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fef1pb5h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:40:27 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23EGbcQ0003142;
 Thu, 14 Apr 2022 16:40:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3fbsj063wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:40:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23EGeMVm40894968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 16:40:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 703A111C04A;
 Thu, 14 Apr 2022 16:40:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22DFA11C052;
 Thu, 14 Apr 2022 16:40:22 +0000 (GMT)
Received: from [9.145.94.207] (unknown [9.145.94.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 16:40:22 +0000 (GMT)
Message-ID: <bb14b849-0fbb-072e-bb26-266da0756e17@linux.ibm.com>
Date: Thu, 14 Apr 2022 18:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220411084357.157308-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gzNSrCx5ih8bbN0d1KyEKsY-2LuR8ctD
X-Proofpoint-ORIG-GUID: 0X39dvd59PWDZo-Pf6DH5ZEiDIJORK8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140088
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/2022, 10:43:54, Sourabh Jain wrote:
> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
> hotplug events.
> 
> All the updates needed on the capture kernel load path in the kernel for
> both kexec_load and kexec_file_load system will be kept under this config.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b779603978e1..777db33f75b5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -623,6 +623,17 @@ config FA_DUMP
>  	  If unsure, say "y". Only special kernels like petitboot may
>  	  need to say "N" here.
>  
> +config CRASH_HOTPLUG
> +	bool "kernel updates of crash kexec segments"
> +	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
> +	help
> +	  An efficient way to keep the capture kernel up-to-date with CPU
> +	  hotplug events. On CPU hotplug event the kexec segments of capture
> +	  kernel becomes stale and need to be updated with latest CPU data.
> +	  In this method the kernel performs minimal update to only relevant
> +	  kexec segments on CPU hotplug event, instead of triggering full
> +	  capture kernel reload from userspace using udev rule.
> +
>  config PRESERVE_FA_DUMP
>  	bool "Preserve Firmware-assisted dump"
>  	depends on PPC64 && PPC_POWERNV && !FA_DUMP

