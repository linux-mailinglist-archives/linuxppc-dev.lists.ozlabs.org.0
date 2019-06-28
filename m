Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DF5A5A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:08:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b79k14rkzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 06:08:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b7584Gt3zDqwt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 06:04:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SK1MEp038774
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:04:04 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdqdtcjw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:04:03 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5SK0WLK015771
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 20:04:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2t9by7fpy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 20:04:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SK40Zm39911858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 20:04:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E2D112062;
 Fri, 28 Jun 2019 20:04:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E81C112061;
 Fri, 28 Jun 2019 20:04:00 +0000 (GMT)
Received: from juliets-mbp.austin.ibm.com (unknown [9.41.174.95])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Jun 2019 20:04:00 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
 <87a7e5tvyb.fsf@linux.ibm.com>
 <c99fb125-ba6d-66aa-d963-83e854bc0eb7@linux.vnet.ibm.com>
 <871rzfucr4.fsf@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <5e7b5592-06c5-a0c9-910e-61090381d418@linux.vnet.ibm.com>
Date: Fri, 28 Jun 2019 15:03:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <871rzfucr4.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280229
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
Cc: linuxppc-dev@lists.ozlabs.org, mmc@linux.vnet.ibm.com, mwb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/26/19 6:51 PM, Nathan Lynch wrote:
> Hi Juliet,
>
> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>> On 6/25/19 12:29 PM, Nathan Lynch wrote:
>>> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>>>> However, that fix failed to notify Hypervisor that the LPM attempted
>>>> had been abandoned which results in a system hang.
>>> It is surprising to me that leaving a migration unterminated would cause
>>> Linux to hang. Can you explain more about how that happens?
>>>
>> PHYP will block further requests(next partition migration, dlpar etc) while
>> it's in suspending state. That would have a follow-on effect on the HMC and
>> potentially this and other partitions.
> I can believe that operations on _this LPAR_ would be blocked by the
> platform and/or management console while the migration remains
> unterminated, but the OS should not be able to perpetrate a denial of
> service on other partitions or the management console simply by botching
> the LPM protocol. If it can, that's not Linux's bug to fix.
>
>
>>>> Fix this by sending a signal PHYP to cancel the migration, so that PHYP
>>>> can stop waiting, and clean up the migration.
>>> This is well-spotted and rtas_ibm_suspend_me() needs to signal
>>> cancellation in several error paths. But I don't agree that this is one
>>> of them: this race is going to be a temporary condition in any
>>> production setting, and retrying would allow the migration to
>>> succeed.
>> If LPM and CPU offine requests conflict with one another, it might be better
>> to let them fail and let the customer decide which he prefers.
> Hmm I don't think so. When (if ever) this happens in production it would
> be the result of an unlucky race with a power management daemon or
> similar, not a conscious decision of the administrator in the moment.
>
Guessing that a production race would only be against power mgmt is maybe
reasonable.  But we have an actual failure case where the race was against
an explicit offline request, and that's a legitimate/supported thing for
a customer to do.

>> IBM i cancels migration if the other OS components/operations veto
>> migration. It’s consistent with other OS behavior for LPM.
> But this situation isn't really like that. If we were to have a real
> veto mechanism, it would only make sense to have it run as early as
> possible, before the platform has done a bunch of work. This benign,
> recoverable race is occurring right before we complete the migration,
> which at this point has been copying state to the destination for
> minutes or hours. It doesn't make sense to error out like this.

Let me clarify that the cancellation is occurring in the phase preparing
for migration.It would be even better if it runs before LPM is allowed to make
a start. But that's what a long-term solution might look like.

> As I mentioned earlier though, it does make sense to signal a
> cancellation for these less-recoverable error conditions in
> rtas_ibm_suspend_me():
>
> - rtas_online_cpus_mask() failure
> - alloc_cpumask_var() failure
> - the atomic_read(&data.error) != 0 case after returning from the IPI
