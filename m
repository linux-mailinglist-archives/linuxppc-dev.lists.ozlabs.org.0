Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EE26270C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 08:10:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmWpV6gJCzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:10:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OdWjVyYy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmWmq2nq0zDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 16:08:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08962X2c188595; Wed, 9 Sep 2020 02:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WqrCyLM1kSjdkdfEaU09HhZXBemvwNp0cxXzy5AGdTc=;
 b=OdWjVyYyeVISErs1wyJfVmJtGw1jtxgHWUSI2mw/7V4oeH1wkFC7jmuzZoGa65enlK22
 m1prurgC/8iMl+q3MIZHNO4GJUo+ygZVOOOc7jvaheiWwyFjBKtivX4k15Fdeqy52J+Z
 1tM7JAq/AhGrbGM+GTYhf+rNccEHH8hj+OOuJHeLi7mjEVIKPMR0rJ5RP0G1DCgK1iZD
 +fqv0RlHUXUebrKRWXf3XdMwO9WKXZjzjY39wrVHmMBQHdWIT4E6sE9PmeP728fJM127
 8RTr31DKNMVKcW2jSwDyQ41IkzSdJWfQv9Yc9MHuXVDyEf3jodYV6EmmTLGqb3jxBz4H bw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33eqtpajas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 02:08:46 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089688KK030482;
 Wed, 9 Sep 2020 06:08:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 33c2a9c90g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 06:08:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08968jOD15270742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 06:08:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D2DAC05B;
 Wed,  9 Sep 2020 06:08:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3568AC059;
 Wed,  9 Sep 2020 06:08:41 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.95.249])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Sep 2020 06:08:41 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
In-Reply-To: <20200908173906.30fffaa0@thinkpad>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad> <20200904180115.07ee5f00@thinkpad>
 <20200908173906.30fffaa0@thinkpad>
Date: Wed, 09 Sep 2020 11:38:39 +0530
Message-ID: <87wo134h3s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_03:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=956 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090050
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gerald Schaefer <gerald.schaefer@linux.ibm.com> writes:

> On Fri, 4 Sep 2020 18:01:15 +0200
> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
>
> [...]
>> 
>> BTW2, a quick test with this change (so far) made the issues on s390
>> go away:
>> 
>> @@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
>>         spin_unlock(ptl);
>> 
>>  #ifndef CONFIG_PPC_BOOK3S_64
>> -       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
>>  #endif
>> 
>>         spin_lock(&mm->page_table_lock);
>> 
>> That would more match the "pte_t pointer" usage for hugetlb code,
>> i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
>> but I think the root cause is the pte_t pointer.
>> 
>> Not entirely sure though if that would really be the correct fix.
>> I somehow lost whatever little track I had about what these tests
>> really want to check, and if that would still be valid with that
>> change.
>
> Uh oh, wasn't aware that this (or some predecessor) already went
> upstream, and broke our debug kernel today.

Not sure i followed the above. Are you finding that s390 kernel crash
after this patch series or the original patchset? As noted in my patch
the hugetlb test is broken and we should fix that. A quick fix is to
comment out that test for s390 too as i have done for PPC64.


-aneesh
