Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 695751C801
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 13:52:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453GJB70gKzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 21:52:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453GGm1fbWzDqGQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 21:50:56 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EBon4B104234
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 07:50:53 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfvw0gph3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 07:50:52 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 14 May 2019 12:50:43 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 12:50:42 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EBof4w49021066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 11:50:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E54704C06D;
 Tue, 14 May 2019 11:50:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1387D4C050;
 Tue, 14 May 2019 11:50:40 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 11:50:39 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: Kernel OOPS followed by a panic on next20190507 with 4K page size
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <fb4c0e92-ef29-c26e-9e24-602203edd45a@c-s.fr>
Date: Tue, 14 May 2019 17:20:39 +0530
Content-Transfer-Encoding: quoted-printable
References: <A4247410-7C78-4E52-AB56-1C33A6C27FF3@linux.vnet.ibm.com>
 <0414d06e-1c4e-e9ec-e265-fd9662308df8@linux.ibm.com>
 <4465D9C6-BE89-4215-9730-21CD40ABEA50@linux.vnet.ibm.com>
 <fb4c0e92-ef29-c26e-9e24-602203edd45a@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19051411-0012-0000-0000-0000031B84CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051411-0013-0000-0000-000021541C9B
Message-Id: <E1BC5F49-B412-48DB-A017-80BB3C5F8F79@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140087
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-May-2019, at 4:35 PM, Christophe Leroy <christophe.leroy@c-s.fr> =
wrote:
>=20
>=20
>=20
> Le 14/05/2019 =C3=A0 10:57, Sachin Sant a =C3=A9crit :
>>> On 14-May-2019, at 7:00 AM, Aneesh Kumar K.V =
<aneesh.kumar@linux.ibm.com> wrote:
>>>=20
>>> On 5/8/19 4:30 PM, Sachin Sant wrote:
>>>> While running LTP tests (specifically futex_wake04) against =
next-20199597
>>>> build with 4K page size on a POWER8 LPAR following crash is =
observed.
>>>> [ 4233.214876] BUG: Kernel NULL pointer dereference at 0x0000001c
>>>> [ 4233.214898] Faulting instruction address: 0xc000000001d1e58c
>>>> [ 4233.214905] Oops: Kernel access of bad area, sig: 11 [#1]
>>>> [ 4233.214911] LE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
>>>> [ 4233.214920] Dumping ftrace buffer:
>>>> [ 4233.214928]    (ftrace buffer empty)
>>>> [ 4233.214933] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
>>>> [ 4233.214973] CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G       =
 W  O      5.1.0-next-20190507-autotest #1
>>>> [ 4233.214980] NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: =
0000000000000000
>>>> [ 4233.214987] REGS: c000000004937890 TRAP: 0300   Tainted: G       =
 W  O       (5.1.0-next-20190507-autotest)
>>>> [ 4233.214993] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
22424822  XER: 00000000
>>>> [ 4233.215005] CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: =
40000000 IRQMASK: 0
>>>> [ 4233.215005] GPR00: c000000001901a80 c000000004937b20 =
c000000003938700 0000000000000000
>>>> [ 4233.215005] GPR04: 0000000000400cc0 000000000003efff =
000000027966e000 c000000003ba8700
>>>> [ 4233.215005] GPR08: c000000003ba8700 000000000d601125 =
c000000003ba8700 0000000080000000
>>>> [ 4233.215005] GPR12: 0000000022424822 c00000001ecae280 =
0000000000000000 0000000000000000
>>>> [ 4233.215005] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
>>>> [ 4233.215005] GPR20: 0000000000000018 c0000000039e2d30 =
c0000000039e2d28 c0000002762da460
>>>> [ 4233.215005] GPR24: 000000000000001c 0000000000000000 =
0000000000000001 c000000001901a80
>>>> [ 4233.215005] GPR28: 0000000000400cc0 0000000000000000 =
0000000000000000 0000000000400cc0
>>>> [ 4233.215065] NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
>>>> [ 4233.215071] LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
>>>> [ 4233.215075] Call Trace:
>>>> [ 4233.215081] [c000000004937b20] [c000000001c91150] =
__pud_alloc+0x160/0x200 (unreliable)
>>>> [ 4233.215090] [c000000004937b80] [c000000001901a80] =
huge_pte_alloc+0x580/0x950
>>>> [ 4233.215098] [c000000004937c00] [c000000001cf7910] =
hugetlb_fault+0x9a0/0x1250
>>>> [ 4233.215106] [c000000004937ce0] [c000000001c94a80] =
handle_mm_fault+0x490/0x4a0
>>>> [ 4233.215114] [c000000004937d20] [c0000000018d529c] =
__do_page_fault+0x77c/0x1f00
>>>> [ 4233.215121] [c000000004937e00] [c0000000018d6a48] =
do_page_fault+0x28/0x50
>>>> [ 4233.215129] [c000000004937e20] [c00000000183b0d4] =
handle_page_fault+0x18/0x38
>>>> [ 4233.215135] Instruction dump:
>>>> [ 4233.215139] 39290001 f92ac1b0 419e009c 3ce20027 3ba00000 =
e927c1f0 39290001 f927c1f0
>>>> [ 4233.215149] 3d420027 e92ac290 39290001 f92ac290 <8359001c> =
83390018 60000000 3ce20027
>>>=20
>>> I did send a patch to the list to handle page allocation failures in =
this patch. But i guess what we are finding here is get_current() =
crashing. Any chance to bisect this?
>>>=20
>> Following commit seems to have introduced this problem.
>> 723f268f19 - powerpc/mm: cleanup ifdef mess in add_huge_page_size()
>> Reverting this patch allows the test case to execute properly without =
a crash.
>=20
> Oops ...
>=20
> Can you check by replacing
>=20
> mmu_psize =3D check_and_get_huge_psize(size);
>=20
> by
>=20
> mmu_psize =3D check_and_get_huge_psize(shift);
>=20
> in add_huge_page_size()

Yup this allowed the test to PASS without any crash.

Thanks
-Sachin

