Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8FA9CDEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:18:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H8dF0Tc9zDqPN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 21:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H8b51Y26zDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 21:16:31 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QBA0SD032075
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 07:16:28 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umbsy5xkq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 07:16:28 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 26 Aug 2019 12:16:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 12:16:22 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QBGLQg54067414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 11:16:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8095B4204D;
 Mon, 26 Aug 2019 11:16:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADB2F4204C;
 Mon, 26 Aug 2019 11:16:19 +0000 (GMT)
Received: from [9.85.90.31] (unknown [9.85.90.31])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 11:16:19 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/fadump: sysfs for fadump memory reservation
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20190810175905.7761-1-sourabhjain@linux.ibm.com>
 <53311fa4-2cce-1eb6-1aae-0c835e06eb24@linux.ibm.com>
 <cf4fdb60-438c-bc4e-d759-1fbb27364c50@linux.ibm.com>
 <f53e4cfe-57cb-d8a6-385a-fa6243940573@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Mon, 26 Aug 2019 16:46:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f53e4cfe-57cb-d8a6-385a-fa6243940573@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082611-0020-0000-0000-0000036415AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082611-0021-0000-0000-000021B95D01
Message-Id: <f8e9cbdd-1926-081d-c8e6-f9d55408fe51@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260124
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
Cc: mahesh@linux.vnet.ibm.com, corbet@lwn.net, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/08/19 4:14 PM, Sourabh Jain wrote:
> 
> 
> On 8/26/19 3:46 PM, Sourabh Jain wrote:
>>
>>
>> On 8/26/19 3:29 PM, Hari Bathini wrote:
>>>
>>>
>>> On 10/08/19 11:29 PM, Sourabh Jain wrote:
>>>> Add a sys interface to allow querying the memory reserved by
>>>> fadump for saving the crash dump.
>>>>
>>>> Add an ABI doc entry for new sysfs interface.
>>>>    - /sys/kernel/fadump_mem_reserved
>>>>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>> Changelog:
>>>> v1 -> v2:
>>>>   - Added ABI doc for new sysfs interface.
>>>>
>>>> v2 -> v3:
>>>>   - Updated the ABI documentation.
>>>> ---
>>>>
>>>>  Documentation/ABI/testing/sysfs-kernel-fadump    |  6 ++++++
>>>
>>> Shouldn't this be Documentation/ABI/testing/sysfs-kernel-fadump_mem_reserved?
> 
> How about documenting fadump_mem_reserved and other sysfs attributes suggested
> by you in a single file Documentation/ABI/testing/sysfs-kernel-fadump?

I wouldn't mind that but please do check if it is breaking a convention..

- Hari

