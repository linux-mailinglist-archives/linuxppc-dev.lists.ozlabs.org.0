Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD175C807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:41:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l4HAAHYf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6rLJ54Crz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 23:41:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l4HAAHYf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jaypatel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6qmM226dz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 23:15:14 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LC5LTp023077;
	Fri, 21 Jul 2023 13:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=GMxUpVXcvnoLLXnu9uLOggDBYWetPJ2Owc61ZxWdi/0=;
 b=l4HAAHYfAN6KBD3cNXhvpRKUvzJ/ZLlmd9eatnMe2L+hv+K3i1JRg/1TKVowa0MT0BQY
 7o8ZcqHTGprj2ctwLNccYfCkuqk/IC4sRNSQDbvFgH0u6fmvyxCS0R9wQSAkb3RPNFAd
 A7U/5su42EO4w8Qw/yyi9/NBhq3tcAtI7nAoX4T3JTLRKFr22ReGddZWQqXB7lueeFnI
 RgZvR3igweMoS+wqPflmBs6R81Ja2TJO+R9MMeRb12IZDtRZd6owlPDxu/STXuJPR8bH
 uB6CdVTaJhe07UlsjV8vCjzUQB4QHR/4evhMjcRYIE4NRBwC+DNqJj7naVQItFx4PYXs Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rye3fs3vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:14:20 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36LCa2ho007793;
	Fri, 21 Jul 2023 13:14:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rye3fs3v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:14:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36LAiIhP016886;
	Fri, 21 Jul 2023 13:14:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5ss7mvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:14:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36LDEFwI63439216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jul 2023 13:14:15 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA95B2004B;
	Fri, 21 Jul 2023 13:14:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CBCB20040;
	Fri, 21 Jul 2023 13:13:50 +0000 (GMT)
Received: from patel (unknown [9.61.93.148])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 21 Jul 2023 13:13:49 +0000 (GMT)
Date: Fri, 21 Jul 2023 18:43:41 +0530
From: Jay Patel <jaypatel@linux.ibm.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 04/13] powerpc: assert_pte_locked() use
 pte_offset_map_nolock()
Message-ID: <20230721131341.w5abuxcbohofpzwa@patel>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
 <e8d56c95-c132-a82e-5f5f-7bb1b738b057@google.com>
 <87msztbiy8.fsf@linux.ibm.com>
 <392f311f-83ac-a5a2-d16e-2c7736d1b577@google.com>
 <6762c880-6d2b-233f-6786-7ad5b0472dc7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="l3k53vcfqq6gdq3m"
Content-Disposition: inline
In-Reply-To: <6762c880-6d2b-233f-6786-7ad5b0472dc7@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2ecNA7NkEkMAHoLPyYtcVNUPMq4cUpvr
X-Proofpoint-ORIG-GUID: UIxitr1ia8Es_QGazuOlejno-STdYv4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_08,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210118
X-Mailman-Approved-At: Fri, 21 Jul 2023 23:38:36 +1000
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Ira Weiny <ira.weiny@intel.com>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellst
 rom@linux.intel.com>, Ralph Camp bell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, Mel Gorman <mgorman@techsingularity.net>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--l3k53vcfqq6gdq3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Jul 19 2023, Aneesh Kumar K V wrote:
> On 7/19/23 10:34 AM, Hugh Dickins wrote:
> > On Tue, 18 Jul 2023, Aneesh Kumar K.V wrote:
> >> Hugh Dickins <hughd@google.com> writes:
> >>
> >>> Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
> >>> in assert_pte_locked().  BUG if pte_offset_map_nolock() fails: this is
> >>> stricter than the previous implementation, which skipped when pmd_none()
> >>> (with a comment on khugepaged collapse transitions): but wouldn't we want
> >>> to know, if an assert_pte_locked() caller can be racing such transitions?
> >>>
> >>
> >> The reason we had that pmd_none check there was to handle khugpaged. In
> >> case of khugepaged we do pmdp_collapse_flush and then do a ptep_clear.
> >> ppc64 had the assert_pte_locked check inside that ptep_clear.
> >>
> >> _pmd = pmdp_collapse_flush(vma, address, pmd);
> >> ..
> >> ptep_clear()
> >> -> asset_ptep_locked()
> >> ---> pmd_none
> >> -----> BUG
> >>
> >>
> >> The problem is how assert_pte_locked() verify whether we are holding
> >> ptl. It does that by walking the page table again and in this specific
> >> case by the time we call the function we already had cleared pmd .
> > 
> > Aneesh, please clarify, I've spent hours on this.
> > 
> > From all your use of past tense ("had"), I thought you were Acking my
> > patch; but now, after looking again at v3.11 source and today's,
> > I think you are NAKing my patch in its present form.
> > 
> 
> Sorry for the confusion my reply created. 
> 
> > You are pointing out that anon THP's __collapse_huge_page_copy_succeeded()
> > uses ptep_clear() at a point after pmdp_collapse_flush() already cleared
> > *pmd, so my patch now leads that one use of assert_pte_locked() to BUG.
> > Is that your point?
> > 
> 
> Yes. I haven't tested this yet to verify that it is indeed hitting that BUG.
> But a code inspection tells me we will hit that BUG on powerpc because of
> the above details.
>
Hi Aneesh,

After testing it, I can confirm that it encountered a BUG on powerpc.
Log report as attached

Thanks,
Jay Patel 
> > I can easily restore that khugepaged comment (which had appeared to me
> > out of date at the time, but now looks still relevant) and pmd_none(*pmd)
> > check: but please clarify.
> > 
> 
> That is correct. if we add that pmd_none check back we should be good here.
> 
> 
> -aneesh

--l3k53vcfqq6gdq3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="report.txt"

[   53.513058][  T105] ------------[ cut here ]------------
[   53.513080][  T105] kernel BUG at arch/powerpc/mm/pgtable.c:327!
[   53.513090][  T105] Oops: Exception in kernel mode, sig: 5 [#1]
[   53.513099][  T105] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   53.513109][  T105] Modules linked in: bonding pseries_rng rng_core vmx_crypto gf128mul ibmveth crc32c_vpmsum fuse autofs4                                                                              
[   53.513135][  T105] CPU: 3 PID: 105 Comm: khugepaged Not tainted 6.5.0-rc1-gebfaf626e99f-dirty #1
[   53.513146][  T105] Hardware name: IBM,9009-42G POWER9 (raw) 0x4e0202 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries                                                                             
[   53.513156][  T105] NIP:  c000000000079478 LR: c00000000007946c CTR: 0000000000000000
[   53.513165][  T105] REGS: c000000008e9b930 TRAP: 0700   Not tainted  (6.5.0-rc1-gebfaf626e99f-dirty)                                                                                                    
[   53.513175][  T105] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002882  XER: 20040000                                                                                               
[   53.513202][  T105] CFAR: c000000000412a30 IRQMASK: 0
[   53.513202][  T105] GPR00: c00000000007946c c000000008e9bbd0 c0000000012d3500 0000000000000001
[   53.513202][  T105] GPR04: 0000000011000000 c000000008e9bbb0 c000000008e9bbf0 ffffffffffffffff
[   53.513202][  T105] GPR08: 00000000000003ff 0000000000000000 0000000000000000 000000000000000a
[   53.513202][  T105] GPR12: 00000000497b0000 c00000001ec9d480 c00c00000016fe00 c000000051455000
[   53.513202][  T105] GPR16: 0000000000000000 ffffffffffffffff 0000000000000001 0000000000000001
[   53.513202][  T105] GPR20: c000000002912430 c000000051455000 0000000000000000 c00000000946e650
[   53.513202][  T105] GPR24: c0000000029800e8 0000000011000000 c00c000000145168 c000000002980180
[   53.513202][  T105] GPR28: 0000000011000000 8603f85b000080c0 c000000008e9bc70 c00000001bd0d680
[   53.513304][  T105] NIP [c000000000079478] assert_pte_locked.part.18+0x168/0x1b0
[   53.513318][  T105] LR [c00000000007946c] assert_pte_locked.part.18+0x15c/0x1b0
[   53.513329][  T105] Call Trace:
[   53.513335][  T105] [c000000008e9bbd0] [c00000000007946c] assert_pte_locked.part.18+0x15c/0x1b0 (unreliable)                                                                                            
[   53.513350][  T105] [c000000008e9bc00] [c00000000048e10c] collapse_huge_page+0x11dc/0x1700
[   53.513362][  T105] [c000000008e9bd40] [c00000000048ed18] hpage_collapse_scan_pmd+0x6e8/0x850
[   53.513374][  T105] [c000000008e9be30] [c000000000492544] khugepaged+0x7e4/0xb70
[   53.513386][  T105] [c000000008e9bf90] [c00000000015f038] kthread+0x138/0x140
[   53.513399][  T105] [c000000008e9bfe0] [c00000000000dd58] start_kernel_thread+0x14/0x18
[   53.513411][  T105] Code: 7c852378 7c844c36 794a1564 7c894038 794af082 79241f24 78eaf00e 7c8a2214 48399541 60000000 7c630074 7863d182 <0b030000> e9210020 81290000 7d290074                             
[   53.513448][  T105] ---[ end trace 0000000000000000 ]---
[   53.516544][  T105]
[   53.516551][  T105] note: khugepaged[105] exited with irqs disabled
[  182.648447][ T1952] mconf[1952]: segfault (11) at 110efa38 nip 1001e97c lr 1001e8a8 code 1
[  182.648482][ T1952] mconf[1952]: code: 60420000 4bfffd59 4bffffd0 60000000 60420000 e93f0070 2fa90000 409e0014
[  182.648494][ T1952] mconf[1952]: code: 480000cc e9290000 2fa90000 419e00c0 <81490008> 2f8a0005 409effec e9490028
[  962.694079][T39811] sda2: Can't mount, would change RO state

--l3k53vcfqq6gdq3m--

