Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D325E1625AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 12:44:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MJsr64PFzDq5f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:44:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MJp75x7TzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 22:41:03 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IBYwVq077938
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 06:40:57 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6adrxv6q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 06:40:57 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 18 Feb 2020 11:40:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 11:40:50 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IBenR851052756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 11:40:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25807AE04D;
 Tue, 18 Feb 2020 11:40:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259DBAE056;
 Tue, 18 Feb 2020 11:40:48 +0000 (GMT)
Received: from [9.199.196.80] (unknown [9.199.196.80])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 11:40:47 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
Date: Tue, 18 Feb 2020 17:10:47 +0530
Content-Transfer-Encoding: quoted-printable
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20021811-0016-0000-0000-000002E7ED8D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021811-0017-0000-0000-0000334B0109
Message-Id: <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=902
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180096
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
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Michal Hocko <mhocko@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> could you please test your boot with original patch from here:
>>=20
>> https://patchwork.kernel.org/patch/11360007/
>=20
> After you tried the above patch instead of the problem patch,
> do one more test and apply the below on current linux-next.
> Please, say which of the patches makes your kernel bootable again.
>=20
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 63bb6a2aab81..7b9b48dcbc60 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -334,7 +334,7 @@ static int memcg_expand_one_shrinker_map(struct =
mem_cgroup *memcg,
> 		if (!old)
> 			return 0;
>=20
> -		new =3D kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, =
nid);
> +		new =3D kmalloc_node(sizeof(*new) + size, GFP_KERNEL, =
nid);
> 		if (!new)
> 			return -ENOMEM;
>=20
> @@ -378,7 +378,7 @@ static int memcg_alloc_shrinker_maps(struct =
mem_cgroup *memcg)
> 	mutex_lock(&memcg_shrinker_map_mutex);
> 	size =3D memcg_shrinker_map_size;
> 	for_each_node(nid) {
> -		map =3D kvzalloc_node(sizeof(*map) + size, GFP_KERNEL, =
nid);
> +		map =3D kzalloc_node(sizeof(*map) + size, GFP_KERNEL, =
nid);
> 		if (!map) {
> 			memcg_free_shrinker_maps(memcg);
> 			ret =3D -ENOMEM;

With this incremental patch applied on top of current linux-next, =
machine fails to boot

[    8.868433] BUG: Kernel NULL pointer dereference on read at =
0x000073b0
[    8.868439] Faulting instruction address: 0xc0000000003d55f4
[    8.868444] Oops: Kernel access of bad area, sig: 11 [#1]
[    8.868449] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    8.868453] Modules linked in:
[    8.868458] CPU: 18 PID: 1 Comm: systemd Not tainted =
5.6.0-rc2-next-20200218-autotest+ #4
[    8.868463] NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: =
0000000000000000
[    8.868468] REGS: c0000008b3783710 TRAP: 0300   Not tainted  =
(5.6.0-rc2-next-20200218-autotest+)
[    8.868474] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
24004844  XER: 00000000
[    8.868481] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: =
40000000 IRQMASK: 1=20
[    8.868481] GPR00: c0000000003d5b94 c0000008b37839a0 c00000000155d400 =
c0000008b301f500=20
[    8.868481] GPR04: 0000000000000dc0 0000000000000002 c0000000003fee38 =
c0000008bb298620=20
[    8.868481] GPR08: 00000008ba1f0000 0000000000000001 0000000000000000 =
0000000000000000=20
[    8.868481] GPR12: 0000000024004844 c00000001ec54200 0000000000000000 =
0000000000000000=20
[    8.868481] GPR16: c0000008a1a60048 c000000001595898 c000000001750c18 =
0000000000000002=20
[    8.868481] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 =
5deadbeef0000122=20
[    8.868481] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 =
c0000000003fee38=20
[    8.868481] GPR28: c0000008b301f500 c0000008bb298620 0000000000000000 =
c00c000002286d00=20
[    8.868529] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
[    8.868534] LR [c0000000003d5b94] __slab_alloc+0x34/0x60
[    8.868538] Call Trace:
[    8.868541] [c0000008b37839a0] [c0000000003d5734] =
___slab_alloc+0x334/0x760 (unreliable)
[    8.868547] [c0000008b3783a80] [c0000000003d5b94] =
__slab_alloc+0x34/0x60
[    8.868553] [c0000008b3783ab0] [c0000000003d6fa0] =
__kmalloc_node+0x110/0x490
[    8.868559] [c0000008b3783b30] [c0000000003fee38] =
mem_cgroup_css_online+0x108/0x270
[    8.868565] [c0000008b3783b90] [c000000000235aa8] =
online_css+0x48/0xd0
[    8.868571] [c0000008b3783bc0] [c00000000023eaec] =
cgroup_apply_control_enable+0x2ec/0x4d0
[    8.868577] [c0000008b3783ca0] [c000000000242318] =
cgroup_mkdir+0x228/0x5f0
[    8.868583] [c0000008b3783d10] [c00000000051e170] =
kernfs_iop_mkdir+0x90/0xf0
[    8.868589] [c0000008b3783d50] [c00000000043dc00] =
vfs_mkdir+0x110/0x230
[    8.868594] [c0000008b3783da0] [c000000000441c90] =
do_mkdirat+0xb0/0x1a0
[    8.868601] [c0000008b3783e20] [c00000000000b278] =
system_call+0x5c/0x68
[    8.868605] Instruction dump:
[    8.868608] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 =
60000000 faa10088=20
[    8.868615] 3ea2000c 3ab57070 7b4a1f24 7d55502a <e94a73b0> 2faa0000 =
409e0394 3d02002a=20
[    8.868623] ---[ end trace f9b8e3c36493f430 ]---
[    8.870690]=20
[    9.870701] Kernel panic - not syncing: Fatal exception

Thanks
-Sachin

