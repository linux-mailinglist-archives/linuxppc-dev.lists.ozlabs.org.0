Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B73F813F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 05:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw7xl6bGyz2ymP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:44:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olDgokC3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=olDgokC3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw7wx18tNz2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 13:43:28 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17Q3WVqZ192308; Wed, 25 Aug 2021 23:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=2nBCMPuJAlL2L6PEL2YFH2SLNFBS5AtwSlsOxsLEO9I=;
 b=olDgokC30oaqA0mzrieciMR3H0ZmDdZ5CQfd1EU0w3xXBLnx1x/ygTNZ1Pud1iu/G7qK
 /eIVJtNbTIti74+KOnC/qJFd6gHjRDxHIz4G2O6LjZmKpTuG/bBfSy6LsbtUPUR3ChYw
 QM7TKkTKwNxazcJd4taBu8r/Z4CVDGi+m/pYD+sLCX+57390FvbRS1JgwuEfsj5PFjOH
 kQ2j7DLjSJpFKMQ+nlG8JP2nGGj0L2T/BvgcsQq9F25+sXKj/bmf1sCLZ2qlpF+5BjIZ
 TFxNmV3dOC1XmYg5BcQxue/yyHr1CkMpCjF9jVoB3FVGm7e3uZAAiCH36bdfZT0mvDV8 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap1v1hr7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17Q3ZSUf003643;
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap1v1hr7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 23:43:19 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17Q3gjxT011345;
 Thu, 26 Aug 2021 03:43:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3ajs48f22y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 03:43:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17Q3hEuT33948082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 03:43:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A147F5204E;
 Thu, 26 Aug 2021 03:43:14 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2719152054;
 Thu, 26 Aug 2021 03:43:11 +0000 (GMT)
Date: Thu, 26 Aug 2021 09:13:10 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [FSL P50x0] lscpu reports wrong values since the RC1 of kernel
 5.13
Message-ID: <20210826034310.GA296102@linux.vnet.ibm.com>
References: <a7098505-2162-d3cc-b8f9-ef8c8a7d441f@xenosoft.de>
 <c16c3747-8c6c-fb27-4e07-a893b83a5580@xenosoft.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c16c3747-8c6c-fb27-4e07-a893b83a5580@xenosoft.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nafgPOqAcOu8xe9FCZ1j6pFOCGZqeyOH
X-Proofpoint-ORIG-GUID: PWW2l1UiDbkrTcxGO5hKlM3x_FikwQ-x
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_09:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260018
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, qemu-devel@nongnu.org,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Christian Zigotzky <chzigotzky@xenosoft.de> [2021-08-16 14:29:21]:


Hi Christian,

> I tested the RC6 of kernel 5.14 today and unfortunately the issue still
> exists. We have figured out that only P5040 SoCs are affected. [1]
> P5020 SoCs display the correct values.
> Please check the CPU changes in the PowerPC updates 5.13-1 and 5.13-2.
>

Thanks for reporting the issue.
Would it be possible to try
https://lore.kernel.org/linuxppc-dev/20210821092419.167454-3-srikar@linux.vnet.ibm.com/t/#u

If the above patch is not helping, then can you please collect the output of

cat /sys/devices/system/cpu/cpu*/topology/core_siblings

Were all the CPUs online at the time of boot?
Did we do any CPU online/offline operations post boot?

If we did CPU online/offline, can you capture the output just after the
boot along with lscpu output..

Since this is being seen on few SOCs, can you summarize the difference
between P5040 and P5020.
> 
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=53775#p53775
> 
> 
> On 09 August 2021 um 02:37 pm, Christian Zigotzky wrote:
> > Hi All,
> > 
> > Lscpu reports wrong values [1] since the RC1 of kernel 5.13 on my FSL
> > P5040 Cyrus+ board (A-EON AmigaOne X5000). [2]
> > The differences are:
> > 
> > Since the RC1 of kernel 5.13 (wrong values):
> > 
> > Core(s) per socket: 1
> > Socket(s): 3
> > 

I know that the socket count was off by 1, but I cant explain how its off by
2 here.

> > Before (correct values):
> > 
> > Core(s) per socket: 4
> > Socket(s): 1
> > 

-- 
Thanks and Regards
Srikar Dronamraju
