Return-Path: <linuxppc-dev+bounces-8350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A4AAC746
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 16:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsKnb2XKzz2yrf;
	Wed,  7 May 2025 00:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746540099;
	cv=none; b=apQpOrzLhS17BomwtzLcwmJhBlQEuuXz2mZb6+dpI/JJl6lyPzZ6dAPrJq7TXyxx91HBeNAaNTyI2OSzpFfmzy7/amYOOrbrSJe+SiKD/j2YhK/7/ZfSAw0m7NbR71PtbrIwwwuc+Ulx6N8ivISYDxKQU433g/dSDTMH0RLz2g0E8JoOX8hdHn30yiXtVn9Owx7YfWYDSpwJUa0LNvjFbk8plUS1iVEfQPwa47S+atBz4p9kEMjJawVL9pqgIU7W3lYYTOVZHn+qIff614FSRVsTHHjaDp30Td2XLz2AAnG8VOJ9Q2p9xb7R3fngaSMjt9nJ/cujwMozF+5895+fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746540099; c=relaxed/relaxed;
	bh=nQOrkozuw0LdQMTRD2OmQM2cYngbNDobdyyZXYzfD/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abxdXsnyhkN4SQjsjUPMTM8xMrY5CI+Mc1SSKpPb/GVe2v1zbrz9Q4q/VYSrTV+PHEw9/U2c+WDERJEsVu4sKevfDYP3OPPr+RDZz0Fm3gMQxY1L5qCu+QdhXn6sp2xZr3Z5DLdF2HHa34Pf1pAYKh0/q/lTvugRwZOSf66kdQIpMJPoIsWCiZPt5cz8i0aXf2MU1lJyeZlf+QEO6wwcX3Fqk1sQTBM1NKV9SIRHaX/oQzItrmFS90YC5aEQU5eh4JLLqfUqTuxTM6YC1yLoIz95069gbulvORG5/iVsjhp1sjyHHMxRAt2ywSW+CVJUs0ulSKoplZL3/J/tcWJVrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WrA48sdC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WrA48sdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsKnZ4Cg2z2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 00:01:38 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5465gudo006830;
	Tue, 6 May 2025 14:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nQOrko
	zuw0LdQMTRD2OmQM2cYngbNDobdyyZXYzfD/c=; b=WrA48sdCHfbAjyb3Vr/7Pc
	bISFlu7j7Nn/jHfHbR+8SLMIR7mYMtCxBZqDmGeb+YJwDhbnUFtvQLQ8Q2LCm4Ou
	GnaHZ2WLlfIRSSsRLkYIOgc8J2L+WXeSI6QNTOF8d4ec2/Tbf/Ak2iyMW7pG3rNE
	FV7RQx8BwdZZVWrGiRbKxr5aQiVxdPf90XVnXLL+ql8fHbtqbZYEG+PBzWykJcmh
	50A2XM6e7pH0OOz+eRACiF/eiZwjeJLEuYaMQ2Oahq7nPFc3yL4lK/IqKBq2MfnK
	+T8v4Y3+KnFNCVaZx6SFtkFdi8e+A8IIfeg6Q+PoMlDHjojviB1aOfkx3Bnb9lpQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fcgy25f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 14:01:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546CDBam025807;
	Tue, 6 May 2025 14:01:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuyuw2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 14:01:32 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546E1SZF28115536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 14:01:28 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AC515803F;
	Tue,  6 May 2025 14:01:28 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 209015805A;
	Tue,  6 May 2025 14:01:25 +0000 (GMT)
Received: from [9.61.244.33] (unknown [9.61.244.33])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 14:01:24 +0000 (GMT)
Message-ID: <2a8d0351-b48b-4063-ad64-bfb2a8844655@linux.ibm.com>
Date: Tue, 6 May 2025 19:31:23 +0530
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
Subject: Re: [PATCH] powerpc/pseries/htmdump: Include header file to get
 is_kvm_guest() definition
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, adubey@linux.ibm.com, skb99@linux.ibm.com,
        sshegde@linux.ibm.com, riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com,
        kernel test robot <lkp@intel.com>
References: <20250506135232.69014-1-atrajeev@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250506135232.69014-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1I1QVFxUoBTEyOTeEwivqp-mZDK1dsHr
X-Authority-Analysis: v=2.4 cv=Pa7/hjhd c=1 sm=1 tr=0 ts=681a163d cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=s1df5-IGgZRVqE7jIqYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1I1QVFxUoBTEyOTeEwivqp-mZDK1dsHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzMSBTYWx0ZWRfXyaMojU5Tw8kM UWczKm7y7bDrBc1zBgNbD2vKKl6g8KWH9LYMZ/irqSifY6hJNy7dMaGX61i6tRy5HkOqOoKapoo yTJ6ZDoBQS+XG6etl9JSm8rOrU0XcBFKTk/XP3xvxTQccPPY86AsmuoaZX0RnN888gF3nh5N60f
 z4cQKvCIZ2+Xh/I7RxLn15vfO8Lq6fHmABUGB684zBZaJLI0OaoyWAIsElKWj1LIsEGXP/jVG42 /zx0cthAbD0FY1vJVJn2MWiFwAtcMH8cdSvB2VHUYuXz3ZZ78Fl+PS0ZBKdA2A1R11uhcp3bhHX GGtAc01LROAqy5J59eT4l43Q2kuPrBJG/0AB3OETB2Y5oebSAVS7AmIUz3DKlDv0XKmjKS1Z8UU
 hR8BS1z3N8U7/LA1nqcY+BOqXh+ExTEMCv/gPEQKSWuJkBBMU+vjiJzCNUfxUXC/WSVOH79w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060131
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 06/05/25 7:22 pm, Athira Rajeev wrote:
> htmdump_init calls is_kvm_guest() to check for guest environment.
> is_kvm_guest() is defined in kvm_guest.h header file. Without including
> the header file, build hits error failing to find the function.
>
>    arch/powerpc/platforms/pseries/htmdump.c: In function 'htmdump_init':
>    arch/powerpc/platforms/pseries/htmdump.c:469:6: error: implicit declaration of function 'is_kvm_guest';
>    did you mean '__key_get'? [-Werror=implicit-function-declaration]
>    if (is_kvm_guest()) {
>        ^~~~~~~~~~~~
>        __key_get
>
> This is observed in configs where CONFIG_KVM_GUEST is disabled.
> Include header file explicitly to avoid the build error
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505061324.elUl4njU-lkp@intel.com/
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/htmdump.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
> index af15d50c924b..742ec52c9d4d 100644
> --- a/arch/powerpc/platforms/pseries/htmdump.c
> +++ b/arch/powerpc/platforms/pseries/htmdump.c
> @@ -10,6 +10,7 @@
>   #include <asm/io.h>
>   #include <asm/machdep.h>
>   #include <asm/plpar_wrappers.h>
> +#include <asm/kvm_guest.h>
>   
>   static void *htm_buf;
>   static void *htm_status_buf;


Tested this patch by applying on ppc tree, next-test branch and it fixes 
the reported issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



With this patch:


   SIGN 
/lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty/kernel/net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
   INSTALL 
/lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty/kernel/net/vmw_vsock/vsock_loopback.ko
   SIGN 
/lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty/kernel/net/vmw_vsock/vsock_loopback.ko
   INSTALL 
/lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty/kernel/net/nsh/nsh.ko
   SIGN 
/lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty/kernel/net/nsh/nsh.ko
   DEPMOD  /lib/modules/6.15.0-rc2-00040-gab1456c5aa7a-dirty
   INSTALL /boot


# git diff
diff --git a/arch/powerpc/platforms/pseries/htmdump.c 
b/arch/powerpc/platforms/pseries/htmdump.c
index af15d50c924b..742ec52c9d4d 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -10,6 +10,7 @@
  #include <asm/io.h>
  #include <asm/machdep.h>
  #include <asm/plpar_wrappers.h>
+#include <asm/kvm_guest.h>

  static void *htm_buf;
  static void *htm_status_buf;


With out this patch:


make -j 81 -s && make modules_install && make install
gcc: error: missing argument to '-falign-functions='
gcc: error: missing argument to '-Wframe-larger-than='
gcc: error: missing argument to '-falign-functions='
gcc: error: missing argument to '-Wframe-larger-than='
make[2]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:98: 
scripts/mod/devicetable-offsets.s] Error 1
make[1]: *** [/root/linux/Makefile:1279: prepare0] Error 2
make: *** [Makefile:248: __sub-make] Error 2


Regards,

Venkat.


