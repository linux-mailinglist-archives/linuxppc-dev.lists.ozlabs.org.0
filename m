Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D231C058
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 03:31:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4530XS4YqjzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:31:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4530W62RzdzDqDK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 11:30:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E1RRIK032887
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:30:39 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sfhekwa77-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:30:39 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 02:30:38 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 02:30:35 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E1UYO828180524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 01:30:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48151112069;
 Tue, 14 May 2019 01:30:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27C50112063;
 Tue, 14 May 2019 01:30:33 +0000 (GMT)
Received: from [9.80.221.111] (unknown [9.80.221.111])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 01:30:32 +0000 (GMT)
Subject: Re: Kernel OOPS followed by a panic on next20190507 with 4K page size
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <A4247410-7C78-4E52-AB56-1C33A6C27FF3@linux.vnet.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 14 May 2019 07:00:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <A4247410-7C78-4E52-AB56-1C33A6C27FF3@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051401-0064-0000-0000-000003DE03F8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011094; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01202970; UDB=6.00631401; IPR=6.00983887; 
 MB=3.00026874; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 01:30:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051401-0065-0000-0000-00003D75D2BF
Message-Id: <0414d06e-1c4e-e9ec-e265-fd9662308df8@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=921 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140008
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
Cc: linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/8/19 4:30 PM, Sachin Sant wrote:
> While running LTP tests (specifically futex_wake04) against next-20199597
> build with 4K page size on a POWER8 LPAR following crash is observed.
> 
> [ 4233.214876] BUG: Kernel NULL pointer dereference at 0x0000001c
> [ 4233.214898] Faulting instruction address: 0xc000000001d1e58c
> [ 4233.214905] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 4233.214911] LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [ 4233.214920] Dumping ftrace buffer:
> [ 4233.214928]    (ftrace buffer empty)
> [ 4233.214933] Modules linked in: overlay rpadlpar_io rpaphp iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
> [ 4233.214973] CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
> [ 4233.214980] NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
> [ 4233.214987] REGS: c000000004937890 TRAP: 0300   Tainted: G        W  O       (5.1.0-next-20190507-autotest)
> [ 4233.214993] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
> [ 4233.215005] CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
> [ 4233.215005] GPR00: c000000001901a80 c000000004937b20 c000000003938700 0000000000000000
> [ 4233.215005] GPR04: 0000000000400cc0 000000000003efff 000000027966e000 c000000003ba8700
> [ 4233.215005] GPR08: c000000003ba8700 000000000d601125 c000000003ba8700 0000000080000000
> [ 4233.215005] GPR12: 0000000022424822 c00000001ecae280 0000000000000000 0000000000000000
> [ 4233.215005] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 4233.215005] GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 c0000002762da460
> [ 4233.215005] GPR24: 000000000000001c 0000000000000000 0000000000000001 c000000001901a80
> [ 4233.215005] GPR28: 0000000000400cc0 0000000000000000 0000000000000000 0000000000400cc0
> [ 4233.215065] NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
> [ 4233.215071] LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
> [ 4233.215075] Call Trace:
> [ 4233.215081] [c000000004937b20] [c000000001c91150] __pud_alloc+0x160/0x200 (unreliable)
> [ 4233.215090] [c000000004937b80] [c000000001901a80] huge_pte_alloc+0x580/0x950
> [ 4233.215098] [c000000004937c00] [c000000001cf7910] hugetlb_fault+0x9a0/0x1250
> [ 4233.215106] [c000000004937ce0] [c000000001c94a80] handle_mm_fault+0x490/0x4a0
> [ 4233.215114] [c000000004937d20] [c0000000018d529c] __do_page_fault+0x77c/0x1f00
> [ 4233.215121] [c000000004937e00] [c0000000018d6a48] do_page_fault+0x28/0x50
> [ 4233.215129] [c000000004937e20] [c00000000183b0d4] handle_page_fault+0x18/0x38
> [ 4233.215135] Instruction dump:
> [ 4233.215139] 39290001 f92ac1b0 419e009c 3ce20027 3ba00000 e927c1f0 39290001 f927c1f0
> [ 4233.215149] 3d420027 e92ac290 39290001 f92ac290 <8359001c> 83390018 60000000 3ce20027

I did send a patch to the list to handle page allocation failures in 
this patch. But i guess what we are finding here is get_current() 
crashing. Any chance to bisect this?

-aneesh

