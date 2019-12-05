Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B4114342
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 16:08:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TJxn1KDbzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 02:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kamalesh@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TJvK5kMwzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 02:06:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5F5wQX098021
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Dec 2019 10:06:01 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wpvg1t17u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 10:06:00 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kamalesh@linux.vnet.ibm.com>;
 Thu, 5 Dec 2019 15:03:33 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Dec 2019 15:03:30 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB5F3SqV28639464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 15:03:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE856AE058;
 Thu,  5 Dec 2019 15:03:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A348EAE056;
 Thu,  5 Dec 2019 15:03:25 +0000 (GMT)
Received: from JAVRIS.in.ibm.com (unknown [9.199.58.137])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Dec 2019 15:03:25 +0000 (GMT)
From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] pseries: Track and expose idle PURR and SPURR ticks
To: Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r21ju3ud.fsf@linux.ibm.com>
Date: Thu, 5 Dec 2019 20:33:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87r21ju3ud.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120515-0020-0000-0000-000003946102
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120515-0021-0000-0000-000021EB8F17
Message-Id: <48823589-b105-0da3-e532-f633ade8f0d9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_03:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912050127
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/5/19 3:54 AM, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>>
>> On PSeries LPARs, the data centers planners desire a more accurate
>> view of system utilization per resource such as CPU to plan the system
>> capacity requirements better. Such accuracy can be obtained by reading
>> PURR/SPURR registers for CPU resource utilization.
>>
>> Tools such as lparstat which are used to compute the utilization need
>> to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
>> counters are already exposed through sysfs.  We already account for
>> PURR ticks when we go to idle so that we can update the VPA area. This
>> patchset extends support to account for SPURR ticks when idle, and
>> expose both via per-cpu sysfs files.
> 
> Does anything really want to use PURR instead of SPURR? Seems like we
> should expose only SPURR idle values if possible.
> 

lparstat is one of the consumers of PURR idle metric
(https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4). 
Agree, on the argument that system utilization metrics based on SPURR
accounting is accurate in comparison to PURR, which isn't proportional to
CPU frequency.  PURR has been traditionally used to understand the system
utilization, whereas SPURR is used for understanding how much capacity is
left/exceeding in the system based on the current power saving mode.

-- 
Kamalesh

