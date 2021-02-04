Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97D30F4D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 15:23:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWgkT6TbyzDwvJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 01:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aQpa6zBw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWgfy5Hm5zDrgx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 01:19:52 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114E62no029368
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Feb 2021 09:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uQEAhMsDHNuCpnbQUKYLGiZSCAf5LZtNGSaKjz2DwmU=;
 b=aQpa6zBws7pSaEX4q9ueunyWdRx5m+Z2Loj4kUf2IKOCqvw70ppHzCWXLfo+1yf+wGya
 t6c2QbjF7zQ5/ysjamXH3igsqZLkPJL3QvU0JStG/8fQ4aVAI+3eeVpISqy7iUDYKwm6
 z8H/qhdkihfW60gGiD+dP/JEv24+AlPMu89cTIlKZdvHS5cK/gJQquIAg/e0yeEba8u7
 FBi/ehXiz+MBa1QeW0iVbrK0QDT2NhKBfCcrHa+v35P7TViXF7B/OduimFkfPIPqPCGK
 ar4kJSro6BD2lXLE3V0HGV5nvc0L0Drb5GtJgal1KfNfvVFvaynCog0Bm+7ahtKFDIpb dQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36gj908rtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 09:19:49 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114EGLal001824
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Feb 2021 14:19:48 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 36ex3p8m3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 14:19:48 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114EJld317105354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Feb 2021 14:19:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF224AC05E
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:19:47 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E9BAC059
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:19:47 +0000 (GMT)
Received: from [9.85.93.213] (unknown [9.85.93.213])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:19:46 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
To: linuxppc-dev@lists.ozlabs.org
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
 <79b0bed7-8b98-d58d-dc47-644195bbc095@linux.ibm.com>
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Organization: IBM
Message-ID: <eec57554-d110-7ae6-07d2-2d376f16ba7c@linux.ibm.com>
Date: Thu, 4 Feb 2021 19:49:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <79b0bed7-8b98-d58d-dc47-644195bbc095@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_07:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040086
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
Reply-To: ananth@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/4/21 4:19 PM, Ravi Bangoria wrote:
> 
> 
> On 2/4/21 4:17 PM, Ravi Bangoria wrote:
>> Don't allow Uprobe on 2nd word of a prefixed instruction. As per
>> ISA 3.1, prefixed instruction should not cross 64-byte boundary.
>> So don't allow Uprobe on such prefixed instruction as well.
>>
>> There are two ways probed instruction is changed in mapped pages.
>> First, when Uprobe is activated, it searches for all the relevant
>> pages and replace instruction in them. In this case, if we notice
>> that probe is on the 2nd word of prefixed instruction, error out
>> directly. Second, when Uprobe is already active and user maps a
>> relevant page via mmap(), instruction is replaced via mmap() code
>> path. But because Uprobe is invalid, entire mmap() operation can
>> not be stopped. In this case just print an error and continue.
> 
> @mpe,
> 
> arch_uprobe_analyze_insn() can return early if
> cpu_has_feature(CPU_FTR_ARCH_31) is not set. But that will
> miss out a rare scenario of user running binary with prefixed
> instruction on p10 predecessors. Please let me know if I
> should add cpu_has_feature(CPU_FTR_ARCH_31) or not.

Wouldn't that binary get a SIGILL in any case? I concur with Naveen...
it makes sense to add the check.


-- 
Ananth
