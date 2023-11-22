Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C77F4401
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 11:37:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0v6XahJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZyNT6X3yz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 21:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0v6XahJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZyMc0Jrzz3bw8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 21:36:12 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SZyMb6Zsyz4xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 21:36:11 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SZyMb6KH0z4xWG; Wed, 22 Nov 2023 21:36:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0v6XahJ;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SZyMb2YBZz4xTg;
	Wed, 22 Nov 2023 21:36:10 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMAXIsX018418;
	Wed, 22 Nov 2023 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0AiQ9vaNrCykqtbi003UIIQeNptKVib52V5o9W7u0ts=;
 b=L0v6XahJOyPpPYvQT8R6UM8xfRlqYCQrUZaaLlxaxrsGaLUI0wzHyzNOeM648WdCyDmX
 b00jMKFi0gyF0NVviG5kXaVB4D5cnsAlbc8/rKEG1kkurB4a1fg+i0j7/gixFx6Iwt2b
 mfJEpT9ix1ish6lSCiNSyWTScnKKJGFxA5G++NhwH/S8mpvmN+B5OiyheOQC2+LxDdBd
 LKKqFKyRvoMtgIU6Cf/hjvvLjTj5dQ2wNXonhd2y0QVJ0Tm1LQtf1J/qZ4/OdquwLMqt
 nGQtCyK8T1lfrpD//WCl1UOuqiPlAgVD/tDnACDxbx8BiOpmPvLeFb0chpkY2IMdsHNY iA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhg00g1yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:36:06 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMAJntt029450;
	Wed, 22 Nov 2023 10:36:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf7yyqd58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:36:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AMAa2S619202680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 10:36:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3B4C20040;
	Wed, 22 Nov 2023 10:36:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1446720043;
	Wed, 22 Nov 2023 10:36:01 +0000 (GMT)
Received: from [9.43.39.242] (unknown [9.43.39.242])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Nov 2023 10:36:00 +0000 (GMT)
Message-ID: <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
Date: Wed, 22 Nov 2023 16:05:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
To: Michael Ellerman <mpe@ellerman.id.au>,
        Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
 <87fs0yjrjf.fsf@mail.lhotse>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87fs0yjrjf.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dVb9VuYCYy04STympxG-6ncaqUY90PQP
X-Proofpoint-GUID: dVb9VuYCYy04STympxG-6ncaqUY90PQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220073
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,


On 22/11/23 10:47, Michael Ellerman wrote:
> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
> ...
>> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
>> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
>> crash kernel and fadump kernel will be same version?
> How sure are we of that?
>
> Don't we go through grub when we boot into the 2nd kernel. And so
> couldn't it choose to boot a different kernel, for whatever reason.
>
> I don't think we need to support different pt_reg / cpumask sizes, but
> requiring the exact same kernel version is too strict I think.
Agree.
>
> But maybe I'm wrong. Would be good to hear what distro folks think.

How about checking fadump crash info header compatibility in the 
following way?

static bool is_fadump_header_compatible(struct fadump_crash_info_header 
*fdh)
{
     if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
         pr_err("Old magic number, can't process the dump.");
         return false;
     }

     if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
         pr_err("Fadump header is corrupted.");
         return false;
     }

     /*
      * If the kernel version of the first/crashed kernel and the 
second/fadump
      * kernel is not same, then only collect the dump if the size of all
      * non-primitive type members of the fadump header is the same 
across kernels.
      */
     if (strcmp(fdh->kernel_version, init_uts_ns.name.release)) {
         if (fdh->pt_regs_sz != sizeof(struct pt_regs) || 
fdh->cpu_mask_sz != sizeof(struct cpumask)) {
             pr_err("Fadump header size mismatch.\n")
             return false;
         } else
             pr_warn("Kernel version mismatch; dump data is unreliable.\n");
     }

     return true;
}

And the new fadump crash info header will be: As suggested by Hari.

/* fadump crash info structure */
struct fadump_crash_info_header {
     u64        magic_number;
+  u32        version;
     u32        crashing_cpu;
     u64        elfcorehdr_addr;
+  u64        elfcorehdr_size;
+  u64        vmcoreinfo_raddr;
+  u64        vmcoreinfo_size;
+  u8          kernel_version[__NEW_UTS_LEN + 1];
+  u32        pt_regs_sz;
     struct pt_regs    regs;
+  u32        cpu_mask_sz;
     struct cpumask    cpu_mask;
};

Thanks,
Sourabh Jain
