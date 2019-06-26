Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D15750D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 01:53:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z0G50GMjzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 09:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z0DH6thmzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 09:51:26 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QNl4lL061995
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 19:51:22 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcf40qmqb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 19:51:22 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Thu, 27 Jun 2019 00:51:21 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 00:51:18 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5QNpHAc13173322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 23:51:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 641BDAC05B;
 Wed, 26 Jun 2019 23:51:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23A0BAC05E;
 Wed, 26 Jun 2019 23:51:17 +0000 (GMT)
Received: from localhost (unknown [9.85.137.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jun 2019 23:51:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Juliet Kim <julietk@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
In-Reply-To: <c99fb125-ba6d-66aa-d963-83e854bc0eb7@linux.vnet.ibm.com>
References: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
 <87a7e5tvyb.fsf@linux.ibm.com>
 <c99fb125-ba6d-66aa-d963-83e854bc0eb7@linux.vnet.ibm.com>
Date: Wed, 26 Jun 2019 18:51:11 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19062623-2213-0000-0000-000003A575D2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011337; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223752; UDB=6.00644030; IPR=6.01004932; 
 MB=3.00027482; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-26 23:51:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062623-2214-0000-0000-00005F0263FF
Message-Id: <871rzfucr4.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260273
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

Hi Juliet,

Juliet Kim <julietk@linux.vnet.ibm.com> writes:
> On 6/25/19 12:29 PM, Nathan Lynch wrote:
>> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>>>
>>> However, that fix failed to notify Hypervisor that the LPM attempted
>>> had been abandoned which results in a system hang.
>
>> It is surprising to me that leaving a migration unterminated would cause
>> Linux to hang. Can you explain more about how that happens?
>>
> PHYP will block further requests(next partition migration, dlpar etc) whi=
le
> it's in suspending state. That would have a follow-on effect on the HMC a=
nd
> potentially this and other partitions.

I can believe that operations on _this LPAR_ would be blocked by the
platform and/or management console while the migration remains
unterminated, but the OS should not be able to perpetrate a denial of
service on other partitions or the management console simply by botching
the LPM protocol. If it can, that's not Linux's bug to fix.


>>> Fix this by sending a signal PHYP to cancel the migration, so that PHYP
>>> can stop waiting, and clean up the migration.
>>
>> This is well-spotted and rtas_ibm_suspend_me() needs to signal
>> cancellation in several error paths. But I don't agree that this is one
>> of them: this race is going to be a temporary condition in any
>> production setting, and retrying would allow the migration to
>> succeed.
>
> If LPM and CPU offine requests conflict with one another, it might be bet=
ter
> to let them fail and let the customer decide which he prefers.

Hmm I don't think so. When (if ever) this happens in production it would
be the result of an unlucky race with a power management daemon or
similar, not a conscious decision of the administrator in the moment.


> IBM i cancels migration if the other OS components/operations veto
> migration. It=E2=80=99s consistent with other OS behavior for LPM.

But this situation isn't really like that. If we were to have a real
veto mechanism, it would only make sense to have it run as early as
possible, before the platform has done a bunch of work. This benign,
recoverable race is occurring right before we complete the migration,
which at this point has been copying state to the destination for
minutes or hours. It doesn't make sense to error out like this.

As I mentioned earlier though, it does make sense to signal a
cancellation for these less-recoverable error conditions in
rtas_ibm_suspend_me():

- rtas_online_cpus_mask() failure
- alloc_cpumask_var() failure
- the atomic_read(&data.error) !=3D 0 case after returning from the IPI

