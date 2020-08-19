Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79115249938
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 11:21:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWj2k06WGzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:21:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ffxxRpH8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWj0b32jmzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 19:19:43 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07J8XR0j057281; Wed, 19 Aug 2020 05:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aEtAkvGpkOg2uUlDQkAYVJcVLR0cOsNQ3wNqajETxpg=;
 b=ffxxRpH8XJql+GKXTMun0SP2+V9l3f7s8KJvwMR2I5k2JwbH/KYdP30O0a52QTNq8Sf9
 suru7PKfvWBcNtup5lzAGvCW9yfr+wGYRykur6DtQL7cp7suSKVCOSGM1eXGad6O8ehQ
 fJd5Zdutj7tLBEe21qiJLAJ0lBOIrq1ocI3qNCJJt1Yqj7an0InrL3dxyug29Snz3Mt/
 xyYdU7bqxELlQJWWfTYQw95leCK+yxxReI6bs2ZL2Rju8ySbwQVUmzm1NnNnH7DSQXQ+
 RGA8doW2OFc45zmYhz8VJVtY8xMku68IMXyamtm5Ck+mXC/exFdNYprUj45q+Er0Cm+H ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310ey1p91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 05:19:34 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J8YqY5061975;
 Wed, 19 Aug 2020 05:19:34 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310ey1p84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 05:19:34 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J9EsFR030390;
 Wed, 19 Aug 2020 09:19:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3304c911kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:19:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07J9JTu514025006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 09:19:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 360E34C04E;
 Wed, 19 Aug 2020 09:19:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F3E94C046;
 Wed, 19 Aug 2020 09:19:26 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.79.211.172])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 19 Aug 2020 09:19:26 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 19 Aug 2020 14:49:25 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: Re: [PATCH] powerpc/papr_scm: Limit the readability of 'perf_stats'
 sysfs attribute
In-Reply-To: <87imdm9frg.fsf@mpe.ellerman.id.au>
References: <20200813043458.165718-1-vaibhav@linux.ibm.com>
 <13e82e40-35c7-266c-2ec0-5fcdcb5fb27f@linux.ibm.com>
 <87imdm9frg.fsf@mpe.ellerman.id.au>
Date: Wed, 19 Aug 2020 14:49:25 +0530
Message-ID: <87imdfgfhe.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190073
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Santosh Sivaraj <santosh@fossix.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Aneesh and Mpe for reviewing this patch.

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
[snip]
>>>   
>>> +	/* Allow access only to perfmon capable users */
>>> +	if (!perfmon_capable())
>>> +		return -EACCES;
>>> +
>>
>> An access check is usually done in open(). This is the read callback IIUC.
>
> Yes. Otherwise an unprivileged user can open the file, and then trick a
> suid program into reading from it.

Agree, but since the 'open()' for this sysfs attribute is handled
by kern-fs, AFAIK dont see any direct way to enforce this policy.

Only other way it seems to me is to convert the 'perf_stats' DEVICE_ATTR_RO
to DEVICE_ATTR_ADMIN_RO.

>
> cheers

-- 
Cheers
~ Vaibhav
