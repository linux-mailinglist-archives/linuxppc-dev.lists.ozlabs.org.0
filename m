Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B6573EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 23:50:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YxXz6hFNzDqJf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:50:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YxWC3383zDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 07:49:10 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QLlCjk106560
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 17:49:08 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcgemgxfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 17:49:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5QLj5xG030310
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 21:49:07 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2t9by79wns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 21:49:07 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5QLn50Q60686732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 21:49:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96C14C6057;
 Wed, 26 Jun 2019 21:49:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F203C6059;
 Wed, 26 Jun 2019 21:49:05 +0000 (GMT)
Received: from juliets-mbp.austin.ibm.com (unknown [9.41.174.95])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Jun 2019 21:49:04 +0000 (GMT)
Subject: Re: [PATCH] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
 <87a7e5tvyb.fsf@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <c99fb125-ba6d-66aa-d963-83e854bc0eb7@linux.vnet.ibm.com>
Date: Wed, 26 Jun 2019 16:49:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87a7e5tvyb.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260248
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

On 6/25/19 12:29 PM, Nathan Lynch wrote:
> Juliet Kim <julietk@linux.vnet.ibm.com> writes:
>> The commit
>> (“powerpc/rtas: Fix a potential race between CPU-Offline & Migration)
>> attempted to fix a hang in Live Partition Mobility(LPM) by abandoning
>> the LPM attempt if a race between LPM and concurrent CPU offline was
>> detected.
>>
>> However, that fix failed to notify Hypervisor that the LPM attempted
>> had been abandoned which results in a system hang.
> It is surprising to me that leaving a migration unterminated would cause
> Linux to hang. Can you explain more about how that happens?
>
PHYP will block further requests(next partition migration, dlpar etc) while
it's in suspending state. That would have a follow-on effect on the HMC and
potentially this and other partitions.
>> Fix this by sending a signal PHYP to cancel the migration, so that PHYP
>> can stop waiting, and clean up the migration.
> This is well-spotted and rtas_ibm_suspend_me() needs to signal
> cancellation in several error paths. But I don't agree that this is one
> of them: this race is going to be a temporary condition in any
> production setting, and retrying would allow the migration to succeed.
If LPM and CPU offine requests conflict with one another, it might be better
to let them fail and let the customer decide which he prefers. IBM i cancels
migration if the other OS components/operations veto migration. It’s consistent
with other OS behavior for LPM. I think all the IBM products should have a
consistent customer experience. Even if the race can be temporary, it still
could happen and can cause livelock.
