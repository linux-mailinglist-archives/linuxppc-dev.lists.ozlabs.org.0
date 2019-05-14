Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBF1C623
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:34:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453CFK6zH5zDqN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:34:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453CCs1wdQzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 19:33:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E9TJEU130433
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 05:33:09 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfu3a05np-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 05:33:08 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 14 May 2019 10:33:07 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 10:33:05 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E9X4so42336412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 09:33:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DBE652059;
 Tue, 14 May 2019 09:33:04 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8A2BE5204F;
 Tue, 14 May 2019 09:33:03 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] powerpc/mm: Handle page table allocation failures
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <87ftphtu6s.fsf@concordia.ellerman.id.au>
Date: Tue, 14 May 2019 15:03:02 +0530
Content-Transfer-Encoding: quoted-printable
References: <20190514010543.29896-1-aneesh.kumar@linux.ibm.com>
 <87ftphtu6s.fsf@concordia.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19051409-0028-0000-0000-0000036D7B78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051409-0029-0000-0000-0000242D0C88
Message-Id: <7668D19B-5013-4C9B-A574-9FFAE8A43337@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=878 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140068
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-May-2019, at 12:10 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> This fix the below crash that arise due to not handling page table =
allocation
>> failures while allocating hugetlb page table.
>>=20
>> BUG: Kernel NULL pointer dereference at 0x0000001c
>> Faulting instruction address: 0xc000000001d1e58c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
>>=20
>> CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      =
5.1.0-next-20190507-autotest #1
>> NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
>> REGS: c000000004937890 TRAP: 0300   Tainted: G        W  O       =
(5.1.0-next-20190507-autotest)
>> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: =
00000000
>> CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: =
0
>> GPR00: c000000001901a80 c000000004937b20 c000000003938700 =
0000000000000000
>> GPR04: 0000000000400cc0 000000000003efff 000000027966e000 =
c000000003ba8700
>> GPR08: c000000003ba8700 000000000d601125 c000000003ba8700 =
0000000080000000
>> GPR12: 0000000022424822 c00000001ecae280 0000000000000000 =
0000000000000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
>> GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 =
c0000002762da460
>> GPR24: 000000000000001c 0000000000000000 0000000000000001 =
c000000001901a80
>> GPR28: 0000000000400cc0 0000000000000000 0000000000000000 =
0000000000400cc0
>> NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
>> LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
>> Call Trace:
>>  [c000000001c91150] __pud_alloc+0x160/0x200 (unreliable)
>>  [c000000001901a80] huge_pte_alloc+0x580/0x950
>>  [c000000001cf7910] hugetlb_fault+0x9a0/0x1250
>>  [c000000001c94a80] handle_mm_fault+0x490/0x4a0
>>  [c0000000018d529c] __do_page_fault+0x77c/0x1f00
>>  [c0000000018d6a48] do_page_fault+0x28/0x50
>>  [c00000000183b0d4] handle_page_fault+0x18/0x38
>>=20
>> Fixes: e2b3d202d1db ("powerpc: Switch 16GB and 16MB explicit =
hugepages to a different page table format")
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>=20
>> Note: I did add a recent commit for the Fixes tag. But in reality we =
never checked for page table
>> allocation failure there. If we want to go to that old commit, then =
we may need.
>=20
> If we never checked for failure in that path, is there some reason =
we've
> only just noticed the crashes? Are we just testing under memory =
pressure
> more effectively than we used to?
>=20
Actually the reported crash seems to be due to commit 723f268f19

723f268f19 - powerpc/mm: cleanup ifdef mess in add_huge_page_size()

Reverting this patch allows the test case to execute correctly without a =
crash.

Thanks
-Sachin

