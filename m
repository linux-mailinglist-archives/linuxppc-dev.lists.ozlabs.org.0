Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3977B71C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 12:53:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JF0YMd7H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPWTs2SJfz3btp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 20:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JF0YMd7H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPWSz5Clsz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 20:52:51 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EARqXt024348;
	Mon, 14 Aug 2023 10:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=9BZvLnsrLSVKL3+7uPFmpILSTvphDxWhyx3NEzqjphY=;
 b=JF0YMd7HL3l70H6j8RDhwYCOVnaUHSxiGP5fCE9sIvI3hfxCE3w0pb+Iaoon/337mbow
 kSo0k3bZacnkwsk5kZ2ZH2oz9FsvBlTFJQFjyT2m78ZBaNqJuZRWZvSakSlwWudnTmb6
 pVCaFkvYCyCuQ+lwan8Yt8bT5sWKAB83sDZmf6Iv7bxkYv9AlwbE1xemxYP5cKnz2PxY
 /jpHXe1gfzNbLk/H3pDgCfSh7DWx9eXc6onsqsnzWK6bW15QWctcBhkA40+uj0tOc6AF
 Cfqor3X/0T92ZN5RdsATxBrT/mmbPUe9deytFxBG0fc4jXZ0Wm1UtkTcZ84TTUv3BFIG wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfje3rnsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:52:23 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EAMh1g003957;
	Mon, 14 Aug 2023 10:52:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfje3rnry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:52:22 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37E9dbCC001107;
	Mon, 14 Aug 2023 10:52:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsxuutg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:52:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EAqKnN21430804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 10:52:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7EC020040;
	Mon, 14 Aug 2023 10:52:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 076A92005A;
	Mon, 14 Aug 2023 10:52:18 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 14 Aug 2023 10:52:17 +0000 (GMT)
Date: Mon, 14 Aug 2023 16:22:17 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4 09/10] powerpc: Add HOTPLUG_SMT support
Message-ID: <20230814105217.m5arvw36tytlda6c@linux.vnet.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <20230705145143.40545-10-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230705145143.40545-10-ldufour@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mV3pQ_5WxvfmsXlXb6lCYN2zCVftfmBs
X-Proofpoint-GUID: W7UrWveYQOWFE_sV2-lTumK-ZkPpA_hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=839 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308140098
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Laurent Dufour <ldufour@linux.ibm.com> [2023-07-05 16:51:42]:

> From: Michael Ellerman <mpe@ellerman.id.au>
> 
> Add support for HOTPLUG_SMT, which enables the generic sysfs SMT support
> files in /sys/devices/system/cpu/smt, as well as the "nosmt" boot
> parameter.
> 
> Implement the recently added hooks to allow partial SMT states, allow
> any number of threads per core.
> 
> Tie the config symbol to HOTPLUG_CPU, which enables it on the major
> platforms that support SMT. If there are other platforms that want the
> SMT support that can be tweaked in future.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> [ldufour: pass current SMT level to cpu_smt_set_num_threads]
> [ldufour: remove topology_smt_supported]
> [ldufour: remove topology_smt_threads_supported]
> [ldufour: select CONFIG_SMT_NUM_THREADS_DYNAMIC]
> [ldufour: update kernel-parameters.txt]
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju
