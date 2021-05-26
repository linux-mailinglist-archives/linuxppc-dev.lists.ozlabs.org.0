Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED0391363
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqlWJ1bNvz2yXh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 19:09:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WpjtLDaA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WpjtLDaA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqlVk4plWz2xv4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 19:08:46 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14Q92olY044719; Wed, 26 May 2021 05:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ceeVXdZOY+8HA9nM/G4FCbmI62E1ORuJonpAr0+pMhM=;
 b=WpjtLDaAkAxS9ihqCAiJYQYJLzDzQI8yXF7nR82b9xIb2MNqM24Qkf+pOOxvst2ZJKtT
 /2qKnJVkUchDq/SqNDRfZ1TQV0L2Rr/BliNioOcsySzy2M9XyESN0H4Wiom4+5ORYCoh
 JNlK9dKFmM/KOJkFPUQnHO40+naCFV7QfkBB9ehQcpDN0LbttTWfCe3eMwS4D04q2ZZL
 SxBjlahvSYWgmEWLqFf+UvjUGAngQHxkKEYYKJpOhsXgjyxbPXbyfiNbBVSs05efgAmJ
 tC4PzGo1g5qe1wf8FsfrTOiOfFeTPatiYTFfFo7xNG0H/Pat+heoTK17OgJy8qCSCcU1 pg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38sf9sq98v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 05:08:31 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14Q92Qst022731;
 Wed, 26 May 2021 09:08:30 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 38s1qd6ykh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 09:08:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14Q98TdB32964872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 09:08:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75DF26A04D;
 Wed, 26 May 2021 09:08:29 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C8736A054;
 Wed, 26 May 2021 09:08:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.37.104])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 May 2021 09:08:23 +0000 (GMT)
Subject: Re: [RFC v2 4/4] powerpc/papr_scm: Add cpu hotplug support for nvdimm
 pmu device
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20210525132216.1239259-1-kjain@linux.ibm.com>
 <20210525132216.1239259-5-kjain@linux.ibm.com>
 <YK0G1nmvhOPimRay@hirez.programming.kicks-ass.net>
 <b89d1954-638b-34c0-2d79-5d1ce4e72a3a@linux.ibm.com>
 <569ee30d-29c0-37c4-6f3e-9dd1345f837e@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <0849ba2a-9ff3-f3e7-4a27-28c598ba45f9@linux.ibm.com>
Date: Wed, 26 May 2021 14:38:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <569ee30d-29c0-37c4-6f3e-9dd1345f837e@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CoQpnaid5nMyNONm1mmtFQXx6M_AyCXd
X-Proofpoint-ORIG-GUID: CoQpnaid5nMyNONm1mmtFQXx6M_AyCXd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_06:2021-05-25,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260060
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, ira.weiny@intel.com,
 linux-nvdimm@lists.01.org, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/26/21 2:15 PM, Aneesh Kumar K.V wrote:
> On 5/26/21 12:56 PM, kajoljain wrote:
>>
>>
>> On 5/25/21 7:46 PM, Peter Zijlstra wrote:
>>> On Tue, May 25, 2021 at 06:52:16PM +0530, Kajol Jain wrote:
>>>> Patch here adds cpu hotplug functions to nvdimm pmu.
>>>
>>> I'm thinking "Patch here" qualifies for "This patch", see
>>> Documentation/process/submitting-patches.rst .
>>>
>> Hi Peter,
>>     I will reword this commit message.
>>
>>>> It adds cpumask to designate a cpu to make HCALL to
>>>> collect the counter data for the nvdimm device and
>>>> update ABI documentation accordingly.
>>>>
>>>> Result in power9 lpar system:
>>>> command:# cat /sys/devices/nmem0/cpumask
>>>> 0
>>>
>>> Is this specific to the papr thing, or should this be in generic nvdimm
>>> code?
>>
>> This code is not specific to papr device and we can move it to
>> generic nvdimm interface. But do we need to add some checks on whether
>> any arch/platform specific driver want that support or we can assume
>> that this will be something needed by all platforms?
>>
> 
> It says the cpu that should be used to make the hcall. That makes it PAPR specific.

Hi Aneesh,
  The hcall in the commit message basically pointing to the method we used to get
counter data. But adding cpumask to a PMU is not specific to powerpc.
So, Incase other platform/arch want to enable hotplug feature, they can use same code for
that and hence we can move it to generic nvdimm interface.

Our concerned it mainly about is it right to assume from the common code point of view, if
the cpumask attr is null, common code can add the cpumask support to it, or 
do we need to have explicit flag for the device to request for it.

Thanks,
Kajol Jain
> 
> -aneesh
> 
