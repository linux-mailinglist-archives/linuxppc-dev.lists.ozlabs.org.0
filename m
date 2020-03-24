Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22E1910F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:32:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mscP2XkpzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 00:32:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48msBm2pRlzDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 00:13:35 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OD4ecQ002042
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 09:13:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywbtgnprk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 09:13:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Tue, 24 Mar 2020 13:13:28 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Mar 2020 13:13:25 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02ODDQPd38273506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 13:13:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F32EC52052;
 Tue, 24 Mar 2020 13:13:25 +0000 (GMT)
Received: from pomme.local (unknown [9.145.51.233])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4D46752051;
 Tue, 24 Mar 2020 13:13:25 +0000 (GMT)
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S HV: check caller of H_SVM_* Hcalls
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-2-ldufour@linux.ibm.com>
 <20200320132248.44b81b3b@bahia.lan> <20200323234323.GA5604@blackberry>
 <20200324130052.373fdf89@bahia.lan>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Tue, 24 Mar 2020 14:13:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324130052.373fdf89@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032413-0008-0000-0000-0000036302DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032413-0009-0000-0000-00004A846EFC
Message-Id: <4dc4bb94-9ddd-30f7-3b4c-0b8439119349@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240067
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 24/03/2020 à 13:00, Greg Kurz a écrit :
> On Tue, 24 Mar 2020 10:43:23 +1100
> Paul Mackerras <paulus@ozlabs.org> wrote:
> 
>> On Fri, Mar 20, 2020 at 01:22:48PM +0100, Greg Kurz wrote:
>>> On Fri, 20 Mar 2020 11:26:42 +0100
>>> Laurent Dufour <ldufour@linux.ibm.com> wrote:
>>>
>>>> The Hcall named H_SVM_* are reserved to the Ultravisor. However, nothing
>>>> prevent a malicious VM or SVM to call them. This could lead to weird result
>>>> and should be filtered out.
>>>>
>>>> Checking the Secure bit of the calling MSR ensure that the call is coming
>>>> from either the Ultravisor or a SVM. But any system call made from a SVM
>>>> are going through the Ultravisor, and the Ultravisor should filter out
>>>> these malicious call. This way, only the Ultravisor is able to make such a
>>>> Hcall.
>>>
>>> "Ultravisor should filter" ? And what if it doesn't (eg. because of a bug) ?
>>>
>>> Shouldn't we also check the HV bit of the calling MSR as well to
>>> disambiguate SVM and UV ?
>>
>> The trouble with doing that (checking the HV bit) is that KVM does not
>> expect to see the HV bit set on an interrupt that occurred while we
>> were in the guest, and if it is set, it indicates a serious problem,
>> i.e. that an interrupt occurred while we were in the code that
>> transitions from host context to guest context, or from guest context
>> to host context.  In those cases we don't know how much of the
>> transition has been completed and therefore whether we have guest
>> values or host values in the CPU registers (GPRs, FPRs/VSRs, SPRs).
>> If we do see HV set then KVM reports a severe error to userspace which
>> should cause userspace to terminate the guest.
>>
>> Therefore the UV should *always* have the HV bit clear in HSRR1/SRR1
>> when transitioning to KVM.
>>
> 
> Indeed... thanks for the clarification. So I guess we'll just assume
> that the UV doesn't reflect these SVM specific hcalls if they happened
> to be issued by the guest then.

As mentioned in the series's description:
"It is assumed that the UV will filtered out such Hcalls made by a malicious
SVM."

> Cheers,
> 
> --
> Greg
> 
>> Paul.
> 

