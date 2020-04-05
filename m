Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450419EB86
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 15:42:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wFGB6XrfzDqH5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 23:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wF9H5QV2zDqyj
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 23:37:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 035DYWwI049732; Sun, 5 Apr 2020 09:37:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306k5u52wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Apr 2020 09:37:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 035Dbmp2054527;
 Sun, 5 Apr 2020 09:37:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306k5u52wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Apr 2020 09:37:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 035DapGJ011301;
 Sun, 5 Apr 2020 13:37:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 306hv5hes2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Apr 2020 13:37:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 035DbkTV34275678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 5 Apr 2020 13:37:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFF79BE053;
 Sun,  5 Apr 2020 13:37:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D67DDBE054;
 Sun,  5 Apr 2020 13:37:42 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.46.157])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun,  5 Apr 2020 13:37:42 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v2 01/22] powerpc/pkeys: Avoid using lockless page table
 walk
In-Reply-To: <20200403002649.GB22412@oc0525413822.ibm.com>
References: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
 <20200319035609.158654-2-aneesh.kumar@linux.ibm.com>
 <20200403002649.GB22412@oc0525413822.ibm.com>
Date: Sun, 05 Apr 2020 19:07:40 +0530
Message-ID: <87h7xyjbob.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-05_03:2020-04-03,
 2020-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004050121
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
Cc: Ram Pai <linuxram@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, linux-mm@kvack.org, kvm-ppc@vger.kernel.org,
 kirill@shutemov.name, leonardo@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:

> On Thu, Mar 19, 2020 at 09:25:48AM +0530, Aneesh Kumar K.V wrote:
>> Fetch pkey from vma instead of linux page table. Also document the fact that in
>> some cases the pkey returned in siginfo won't be the same as the one we took
>> keyfault on. Even with linux page table walk, we can end up in a similar scenario.
>
> There is no way to correctly ensure that the key returned through
> siginfo is actually the key that took the fault.  Either get it
> from page table or get it from the corresponding vma.

That is correct.

>
> So we had to choose the lesser evil. Getting it from the page table was
> faster, and did not involve taking any locks.

That is because you are locks which need to be held on page table walk.

>Getting it from the vma
> was slower, since it needed locks.  Also I faintly recall, there
> is a scenario where the address that gets a key fault, has no
> corresponding VMA associated with it yet.

I would be interested in this. For now IIUC even x86 fetch the key from
VMA.

>
> Hence the logic used was --
> 	if it is key-fault, than procure the key quickly
> 	from the page table.  In the unlikely event that the fault is
> 	something else, but still has a non-permissive key associated
> 	with it, get the key from the vma.


I am fixing that logic further in the next patch. I do have a test case
attached for that. We always check for the key in the vma and if it
allows access, then we retry.


>
> A well written application should avoid changing the key of an address
> space without synchronizing the corresponding threads that operate in
> that address range.  However, if the application ignores to do so, than
> it is vulnerable to a undefined behavior. There is no way to prove that
> the reported key is correct or incorrect, since there is no provable
> order between the two events; the key-fault event and the key-change
> event.
>
> Hence I think the change proposed in this patch may not be necessary.
> RP

The change is needed so that we can make the page table walk safer.


-aneesh
