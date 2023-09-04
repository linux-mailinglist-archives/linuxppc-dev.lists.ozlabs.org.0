Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A97919BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 16:38:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZvp+LA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfWTJ5By1z30PY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 00:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZvp+LA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfWSP05f0z303l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 00:37:24 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 384E6meZ006297;
	Mon, 4 Sep 2023 14:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mbwLhV2NYtXQOdQV1fKkqCEuFE3DjJZqNv6HLQL5yuQ=;
 b=NZvp+LA7wou5W/q740r+0PvnXwxzxXNmfTmUydxSo4uUDPcMoE8POOFlbXEjDrpZZm/E
 gtrC13k4GdontN+oKUO+q/obAemrJh06zWyN4K/r06o75/Rz/URWDIsvapdUIhA7QdDI
 Zam4ZPLvrOgbUsD0exAwc4GI+J3aUQFS10bWioJ5BEV3N+iL0I6iJQe2YDVU0K4trE1+
 1QHkFCe5p4cPaWrK1Q3qAv4vMcg7KZWijYhYWSYcld2EadDTzyUzUQW4zf+/+IWo1xBd
 bBco996MZVGgoPmvwpdpvdK/eEfHnP6kmJz2qOd5/kUv1I9YeGUSEZSIIV3gGZADd1hK xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sw80jdr50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 14:36:06 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 384E6wXj007713;
	Mon, 4 Sep 2023 14:34:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sw80jdpcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 14:34:51 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 384E0A8C001624;
	Mon, 4 Sep 2023 14:34:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfcsbpcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 14:34:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 384EYA2334472528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Sep 2023 14:34:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAD4F20049;
	Mon,  4 Sep 2023 14:34:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DCE020040;
	Mon,  4 Sep 2023 14:34:09 +0000 (GMT)
Received: from [9.43.27.211] (unknown [9.43.27.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Sep 2023 14:34:08 +0000 (GMT)
Message-ID: <8fcd7ba7-0f27-7bbc-676f-7e13c8bf00d7@linux.ibm.com>
Date: Mon, 4 Sep 2023 20:04:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] vmcore: allow alternate dump capturing methods to
 export vmcore without is_kdump_kernel()
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20230901190438.375678-1-hbathini@linux.ibm.com>
 <ZPP/UeP1zUbGPzrt@MiWiFi-R3L-srv>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <ZPP/UeP1zUbGPzrt@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y6cJGnzQveuKjsB-D8l-jwH2wOhgoTRc
X-Proofpoint-ORIG-GUID: rYr90DU-mk0NiOVoDnuGwmqdNDa4Y-s7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=473 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309040130
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

Thanks for the review...

On 03/09/23 9:06 am, Baoquan He wrote:
> Hi Hari,
> 
> On 09/02/23 at 12:34am, Hari Bathini wrote:
>> Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
>> While elfcorehdr_addr is set for kexec based kernel dump mechanism,
>> alternate dump capturing methods like fadump [1] also set it to export
>> the vmcore. is_kdump_kernel() is used to restrict resources in crash
>> dump capture kernel but such restrictions may not be desirable for
>> fadump. Allow is_kdump_kernel() to be defined differently for such
>> scenarios. With this, is_kdump_kernel() could be false while vmcore
>> is usable. So, introduce is_crashdump_kernel() to return true when
>> elfcorehdr_addr is set and use it for vmcore related checks.
> 
> I got what is done in these two patches, but didn't get why they need be
> done. vmcore_unusable()/is_vmcore_usable() are only unitilized in ia64.
> Why do you care if it's is_crashdump_kernel() or is_kdump_kernel()?
> If you want to override the generic is_kdump_kernel() with powerpc's own
> is_kdump_kernel(), your below change is enough to allow you to do that.
> I can't see why is_crashdump_kernel() is needed. Could you explain that
> specifically?

You mean to just remove is_kdump_kernel() check in is_vmcore_usable() &
vmcore_unusable() functions? Replaced generic is_crashdump_kernel()
function instead, that returns true for any dump capturing method,
irrespective of whether is_kdump_kernel() returns true or false.
For fadump case, is_kdump_kernel() will return false after patch 2/2.

Thanks
Hari
