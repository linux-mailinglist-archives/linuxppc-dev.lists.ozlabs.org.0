Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640C4654A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 19:01:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J46Mw2Gjjz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 05:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayoZMMvq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ayoZMMvq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J46M72Gbnz2yfr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 05:00:34 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B1HpWn8020607; 
 Wed, 1 Dec 2021 18:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nwD9avsZXP7FfMNDkd8I8lKzbanJXEMPgMen/x+dDLk=;
 b=ayoZMMvqKaZMwr/y4JmLJqRVJ2IOSj/br1JolRjJ7qu+q9s/4CXvq46Mep95cEdBzcYC
 Lix3W7G0qlbZmRIAwYRaN21flXG8NYfEMyAMtBxDzZndftv2CESeSEbKMkWrZ8svPo+W
 /5iikFATcd1R9bRVl8kWaaM5I4lO2QVOZiX6UnVv9ENesW2UZvG9rab8dNBMMF7B3ljv
 llf7nYorx5Tq4DBdwlOhBjfNkgSHbcHGUf0MhtVWqhMlJ2az5KqA8gz8MIG69wf7c+H+
 9T+eAydwEDnl3VMnDOXKHVbSgApOul/4tmGFZ82FYxepwabG1xz4LUAQKwLdUuLJ1YAQ Eg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cpdtrg5h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 18:00:30 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B1HrIFK020578;
 Wed, 1 Dec 2021 18:00:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3ckca9thrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 18:00:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B1I0PAO21954956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Dec 2021 18:00:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E40DA405D;
 Wed,  1 Dec 2021 18:00:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35A95A4053;
 Wed,  1 Dec 2021 18:00:25 +0000 (GMT)
Received: from [9.145.175.48] (unknown [9.145.175.48])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Dec 2021 18:00:25 +0000 (GMT)
Message-ID: <8027ed39-3e71-a560-10c2-0ca70962ffa7@linux.ibm.com>
Date: Wed, 1 Dec 2021 19:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211201144826.45342-1-ldufour@linux.ibm.com>
 <87h7bsny0a.fsf@linux.ibm.com>
 <60df1f67-dc37-f891-3c83-aba5a15bdddc@linux.ibm.com>
In-Reply-To: <60df1f67-dc37-f891-3c83-aba5a15bdddc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zaIEnE8R_g8iy40fKx6-AJxdNtdfmmPd
X-Proofpoint-GUID: zaIEnE8R_g8iy40fKx6-AJxdNtdfmmPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112010094
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/12/2021, 16:57:06, Laurent Dufour wrote:
> On 01/12/2021, 16:30:29, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> The LPAR name may be changed after the LPAR has been started in the HMC.
>>> In that case lparstat command is not reporting the updated value because it
>>> reads it from the device tree which is read at boot time.
>> Could lparstat be changed to make the appropriate get-system-parameter
>> call via librtas, avoiding a kernel change?
> 
> You're right, I could do that directly in lparstat without changes in the
> kernel.

Indeed, that's not so easy because the RTAS syscall can only be called by
privileged users, even to read some parameters.

So to have the lparstat command reporting the updated LPAR name, the only
way is to report that value in /proc/powerpc/lparcfg.

Furthermore, this would make sense to have this value reported in this file.

That's being said, I'll send a v2 to align the property title to the
existing "partition_id", naming it "partition_name".
