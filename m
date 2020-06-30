Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8D20ED2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:08:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wsp36ZtXzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:08:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wsks30jqzDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:05:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U52bVR100668; Tue, 30 Jun 2020 01:05:52 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ycd4sbfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:05:52 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U50coD007733;
 Tue, 30 Jun 2020 05:05:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 31x5vx310b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:05:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U55o3R27984198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:05:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E027C605D;
 Tue, 30 Jun 2020 05:05:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8508FC6057;
 Tue, 30 Jun 2020 05:05:47 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.48.28])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:05:47 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 7/8] powerpc/pmem: Add WARN_ONCE to catch the wrong
 usage of pmem flush functions.
In-Reply-To: <CAPcyv4giMdgjNVudw1q7p-UpyLMTHTqTad=2Ks8ATNo==edKvQ@mail.gmail.com>
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-8-aneesh.kumar@linux.ibm.com>
 <CAPcyv4giMdgjNVudw1q7p-UpyLMTHTqTad=2Ks8ATNo==edKvQ@mail.gmail.com>
Date: Tue, 30 Jun 2020 10:35:45 +0530
Message-ID: <87d05hgn2u.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 cotscore=-2147483648 malwarescore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006300033
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
Cc: Jan Kara <jack@suse.cz>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Mon, Jun 29, 2020 at 6:58 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> We only support persistent memory on P8 and above. This is enforced by the
>> firmware and further checked on virtualzied platform during platform init.
>> Add WARN_ONCE in pmem flush routines to catch the wrong usage of these.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/cacheflush.h | 2 ++
>>  arch/powerpc/lib/pmem.c               | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
>> index 95782f77d768..1ab0fa660497 100644
>> --- a/arch/powerpc/include/asm/cacheflush.h
>> +++ b/arch/powerpc/include/asm/cacheflush.h
>> @@ -103,6 +103,8 @@ static inline void  arch_pmem_flush_barrier(void)
>>  {
>>         if (cpu_has_feature(CPU_FTR_ARCH_207S))
>>                 asm volatile(PPC_PHWSYNC ::: "memory");
>> +       else
>> +               WARN_ONCE(1, "Using pmem flush on older hardware.");
>
> This seems too late to be making this determination. I'd expect the
> driver to fail to successfully bind default if this constraint is not
> met.

We do that in Patch 1.

-aneesh
