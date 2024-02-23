Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30B8608C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 03:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GfhOvFV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgv0N0rjcz3dXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 13:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GfhOvFV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgtzc1FxCz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 13:21:15 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41N27VRA002986;
	Fri, 23 Feb 2024 02:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jyu8obssYAghHzRyfn193mH7xmv5FK6nyc5aPPLUHH0=;
 b=GfhOvFV+T+nERQ2EtYysfP6Nufpd+E/xtuPwiz6GCVdSUTAM8ZHXE7AAS/Sct/mV0Blj
 NRrxGMXxViXJxTksmN+A9qIjbqamOHxHQ3UhZ5dVvjW98mMUMz1BehBppcW2ZZ3cnZ+/
 hEeGNstrv0CwCcihDUne2S9m4jtvAw9qGeDv3aYeN9bybYqOjL3UQU3H+8ymmVR9ofIG
 vjQjoPmLOuNzcE75CCfAJmCIfKNjYk+bQuCZXCGBph1EFMk8M/EZdwDgpJoHWp7Hrgf3
 VIOSXys7crfaHUO8w6fPDfa4dBGEpgMklmBt2/gWxa8cRe3QUKhc41bM4DXgiQSCH3S2 xQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3weja40c9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 02:21:10 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41N2CAPl009547;
	Fri, 23 Feb 2024 02:21:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb84ptdar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 02:21:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41N2L6p441615684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Feb 2024 02:21:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE2B52004D;
	Fri, 23 Feb 2024 02:21:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A76E20043;
	Fri, 23 Feb 2024 02:21:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Feb 2024 02:21:05 +0000 (GMT)
Received: from [9.150.6.158] (unknown [9.150.6.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2C18E60060;
	Fri, 23 Feb 2024 13:20:59 +1100 (AEDT)
Message-ID: <870bb708e7c69b92a25022cf1582130b19b09606.camel@linux.ibm.com>
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in memset32
 (bpf_prog_pack_free)
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hari Bathini
	 <hbathini@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 23 Feb 2024 13:20:55 +1100
In-Reply-To: <2000a30f-214a-4b20-b0b5-348e987d6a0e@csgroup.eu>
References: <2000a30f-214a-4b20-b0b5-348e987d6a0e@csgroup.eu>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rFvJLsmH8zViHw7ryOZiJrIM8t8jtIz0
X-Proofpoint-GUID: rFvJLsmH8zViHw7ryOZiJrIM8t8jtIz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxlogscore=632 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402230014
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-01-31 at 11:46 +0000, Christophe Leroy wrote:
> Hi,
>=20
> Got the following BUG while loading module test_bpf.ko
>=20
> No time to investigate for now.
>=20
> root@vgoip:~# insmod test_bpf.ko
> [=C2=A0 263.409030]=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0 263.416415] BUG: KASAN: vmalloc-out-of-bounds in
> memset32+0x5c/0xa0
> [=C2=A0 263.422952] Write of size 4 at addr c9000e40 by task kworker/0:0/=
7
> [=C2=A0 263.429322]
> [=C2=A0 263.430816] CPU: 0 PID: 7 Comm: kworker/0:0 Not tainted=20
> 6.8.0-rc1-s3k-dev-02364-gc626219462a6-dirty #606
> [=C2=A0 263.440580] Hardware name: MIAE 8xx 0x500000 CMPC885
> [=C2=A0 263.445658] Workqueue: events bpf_prog_free_deferred
> [=C2=A0 263.450973] Call Trace:
> [=C2=A0 263.453411] [c905bd00] [c0c114e8] dump_stack_lvl+0x34/0x50
> (unreliable)
> [=C2=A0 263.460744] [c905bd20] [c026b9d4] print_report+0x174/0x608
> [=C2=A0 263.466853] [c905bd70] [c026c01c] kasan_report+0xc0/0x130
> [=C2=A0 263.472788] [c905bdd0] [c0c43cb0] memset32+0x5c/0xa0
> [=C2=A0 263.478198] [c905bdf0] [c0030690] patch_instructions+0x70/0x17c
> [=C2=A0 263.484656] [c905be30] [c00389b0]
> bpf_arch_text_invalidate+0xa8/0x120
> [=C2=A0 263.491638] [c905be90] [c018e63c] bpf_prog_pack_free+0xec/0x24c
> [=C2=A0 263.498096] [c905bec0] [c018ea34]
> bpf_jit_binary_pack_free+0x3c/0x80
> [=C2=A0 263.504991] [c905bee0] [c0038ae8] bpf_jit_free+0xc0/0x128
> [=C2=A0 263.510925] [c905bf00] [c00790f8] process_one_work+0x310/0x6e8
> [=C2=A0 263.517209] [c905bf50] [c0079b2c] worker_thread+0x65c/0x868
> [=C2=A0 263.523232] [c905bfc0] [c0084b78] kthread+0x17c/0x1ac
> [=C2=A0 263.528817] [c905bff0] [c00181fc] start_kernel_thread+0x10/0x14
> [=C2=A0 263.535279]
> [=C2=A0 263.536782] The buggy address belongs to the virtual mapping at
> [=C2=A0 263.536782]=C2=A0 [c9000000, c9008000) created by:
> [=C2=A0 263.536782]=C2=A0 text_area_cpu_up+0x28/0x1d4
> [=C2=A0 263.551418]
> [=C2=A0 263.552902] The buggy address belongs to the physical page:
> [=C2=A0 263.560228]
> [=C2=A0 263.561713] Memory state around the buggy address:
> [=C2=A0 263.566585]=C2=A0 c9000d00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f=
8 f8
> f8 f8
> [=C2=A0 263.573307]=C2=A0 c9000d80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f=
8 f8
> f8 f8
> [=C2=A0 263.580027] >c9000e00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> f8 f8
> [=C2=A0 263.586677]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^
> [=C2=A0 263.591370]=C2=A0 c9000e80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f=
8 f8
> f8 f8
> [=C2=A0 263.598093]=C2=A0 c9000f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f=
8 f8
> f8 f8
> [=C2=A0 263.604743]=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Christophe
>=20

Looks like a false positive. It's clearly in range of the poking
allocation after all. KASAN apparently leaves VM_ALLOC areas as
poisoned, expecting some kind of subsequent allocator to come and
unpoison specific parts. Except we call map_patch_area() instead of
whatever path generic code was expecting, so we never unpoison the
range. The issue would be pre-existing from the beginning, and gone
unnoticed because the original code path that does the patching (i.e.,
actually interacts with the poking page) isn't instrumented.
