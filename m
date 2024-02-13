Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0758528A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:13:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KK4LfJPo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYrcT2Qztz3dWX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 17:13:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KK4LfJPo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYrbk0ym1z309c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 17:13:05 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41D679dH004751;
	Tue, 13 Feb 2024 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=1VESCCkecYDe7AG8iP+4iYlHw0miwdVbVGrRrkTIZcg=;
 b=KK4LfJPoPnxroIU5e5yDa5k6BkK7lQswiEjIzoCRmn8NYMKz/kzsHCwEFP9u2NhMyJj2
 4/NCriqmqOpWchzo4j6VHID6v6RnjMhEGE5z9YM1C7fQ/TTB70lzztZF4EMeKIMiop1Y
 9bQTSWBJagYg7PlN24oK0EC5zUV7v4dl+YVtNpeC1s022G6w1Q5oe3pqWg8tWZYaqjIy
 hrkzrcbwkRoz0T2B+38TTIz3F6UzAI2z718sMqhO8j+CiNsSEolFw8rMXKvUDAq8oyPR
 vEekfyuclSs23vo2cec+PbyeFUW0mJlNRQg+CLEqIaMN0b2BlFMwZL0O68RgOXjRNR4v 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w82vfg5av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 06:12:54 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41D67E7U005081;
	Tue, 13 Feb 2024 06:12:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w82vfg5a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 06:12:54 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41D4AKs1004297;
	Tue, 13 Feb 2024 06:12:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv05t2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 06:12:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41D6CmVv6292206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 06:12:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 087D020043;
	Tue, 13 Feb 2024 06:12:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7478B2004E;
	Tue, 13 Feb 2024 06:12:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 13 Feb 2024 06:12:46 +0000 (GMT)
Date: Tue, 13 Feb 2024 11:42:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: fix accuracy of stolen time
Message-ID: <20240213061245.GB243379@linux.vnet.ibm.com>
References: <20240213052635.231597-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240213052635.231597-1-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X_sdfscIyFXyEzXB70cai5gwGAh2qQSy
X-Proofpoint-GUID: XSeKj7IIr_7RG_bYBfTfQYSqIAvo3xkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_02,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 phishscore=0 mlxlogscore=918 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130046
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
Cc: aneesh.kumar@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Shrikanth Hegde <sshegde@linux.ibm.com> [2024-02-13 10:56:35]:

> powerVM hypervisor updates the VPA fields with stolen time data.
> It currently reports enqueue_dispatch_tb and ready_enqueue_tb for
> this purpose. In linux these two fields are used to report the stolen time.
> 
> The VPA fields are updated at the TB frequency. On powerPC its mostly
> set at 512Mhz. Hence this needs a conversion to ns when reporting it
> back as rest of the kernel timings are in ns. This conversion is already
> handled in tb_to_ns function. So use that function to report accurate
> stolen time.
> 
> Observed this issue and used an Capped Shared Processor LPAR(SPLPAR) to
> simplify the experiments. In all these cases, 100% VP Load is run using
> stress-ng workload. Values of stolen time is in percentages as reported
> by mpstat. With the patch values are close to expected.
> 
> 		6.8.rc1		+Patch
> 12EC/12VP	   0.0		   0.0
> 12EC/24VP	  25.7		  50.2
> 12EC/36VP	  37.3		  69.2
> 12EC/48VP	  38.5		  78.3
> 
> 
> Fixes: 0e8a63132800 ("powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING")
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju
