Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA326393E35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 09:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frxlh5Gmgz30CS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 17:54:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cS0TRI5w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cS0TRI5w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frxl72lkMz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 17:53:38 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S7jRS1067321; Fri, 28 May 2021 03:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=E07mYIrIbcD8S7M7I/zguYPr5COGTFcFtbpS8VoDEuI=;
 b=cS0TRI5w0TsO9jbFZAPrrmyXaYSz+ddYGsrRB4Yzib6Uz0Y7i8FumMl5eTlu4EklCfdI
 waMu0CYUUPRCTdQT7Xic0COYw5Ob6Cb70i+P8v9QcqaAaCbflrr+dlptgfqXhPQJWcP7
 NI9AU3HGouxPBGOkSd6mVh/5yrskkzuixr0zfJZqvpeaQeHWs+Up8RLgRMQPh+GIzw+U
 ahewgUkkC4xdeOM7Le7t5jw7UnAawP4kY5sHx4HuqPihctZGSSIW5JcYKEIXAAU6J6zY
 ctiSuSWdilUArnZosXn45KXz3cEMGeEb1++WO0CbNwIEewcTZrMNeYSMdPVFs9CDIM+x Vg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38tvdn0659-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 03:53:11 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14S7mLG8019243;
 Fri, 28 May 2021 07:53:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 38s1vamsve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 07:53:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14S7r9xB34341194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 07:53:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA6E1BE068;
 Fri, 28 May 2021 07:53:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 790F7BE04F;
 Fri, 28 May 2021 07:53:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.139])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 May 2021 07:53:02 +0000 (GMT)
Subject: Re: [RFC v2 4/4] powerpc/papr_scm: Add cpu hotplug support for nvdimm
 pmu device
To: Peter Zijlstra <peterz@infradead.org>
References: <20210525132216.1239259-1-kjain@linux.ibm.com>
 <20210525132216.1239259-5-kjain@linux.ibm.com>
 <YK0G1nmvhOPimRay@hirez.programming.kicks-ass.net>
 <b89d1954-638b-34c0-2d79-5d1ce4e72a3a@linux.ibm.com>
 <YK4Ho7e+LCqjYA2X@hirez.programming.kicks-ass.net>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <ab7ee13b-fccf-4366-c18c-f63ddf0552e2@linux.ibm.com>
Date: Fri, 28 May 2021 13:23:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK4Ho7e+LCqjYA2X@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0MXISzsXWyIm5rY7s9lJENnNmh6HXMYm
X-Proofpoint-ORIG-GUID: 0MXISzsXWyIm5rY7s9lJENnNmh6HXMYm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_03:2021-05-27,
 2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxlogscore=959 malwarescore=0 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105280049
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
 aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/26/21 2:02 PM, Peter Zijlstra wrote:
> On Wed, May 26, 2021 at 12:56:58PM +0530, kajoljain wrote:
>> On 5/25/21 7:46 PM, Peter Zijlstra wrote:
>>> On Tue, May 25, 2021 at 06:52:16PM +0530, Kajol Jain wrote:
> 
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
> 
> I'm a complete NVDIMM n00b, but to me it would appear they would have to
> conform to the normal memory hierarchy and would thus always be
> per-node.
> 
> Also, if/when deviation from this rule is observed, we can always
> rework/extend this. For now I think it would make sense to have the
> per-node ness of the thing expressed in the generic layer.
> 

Hi Peter,
  Thanks for the suggestion, I will send new RFC patchset with these changes.

Thanks,
Kajol Jain
