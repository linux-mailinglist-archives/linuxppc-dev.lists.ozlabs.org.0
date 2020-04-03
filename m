Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 702BE19D49A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:07:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twbB6P2nzDsRY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:07:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48twW829PCzDrhp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 21:03:48 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033A1uWA093373
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 06:03:45 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304hjc7rg6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:03:44 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Fri, 3 Apr 2020 11:03:29 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 11:03:27 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033A3dVq56492248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 10:03:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A72042045;
 Fri,  3 Apr 2020 10:03:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 295D242049;
 Fri,  3 Apr 2020 10:03:39 +0000 (GMT)
Received: from localhost (unknown [9.85.72.61])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 10:03:38 +0000 (GMT)
Date: Fri, 03 Apr 2020 15:33:35 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v8 2/7] powerpc/kprobes: Mark newly allocated probes as RO
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
 <20200402084053.188537-2-ruscur@russell.cc>
 <1585844035.o235bvxmq0.naveen@linux.ibm.com>
 <1585852977.oiikywo1jz.naveen@linux.ibm.com>
 <c336400d5b7765eb72b3090cd9f8a3c57761d0b6.camel@russell.cc>
 <1585906281.fbqgtc3kpy.naveen@linux.ibm.com>
 <02c6c3d0483e217a6d879bb7037f0b549c64ba04.camel@russell.cc>
In-Reply-To: <02c6c3d0483e217a6d879bb7037f0b549c64ba04.camel@russell.cc>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040310-0008-0000-0000-00000369A365
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040310-0009-0000-0000-00004A8B32B0
Message-Id: <1585907769.yhied5pgqm.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_06:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030082
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
Cc: kernel-hardening@lists.openwall.com, ajd@linux.ibm.com, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey wrote:
> On Fri, 2020-04-03 at 15:06 +0530, Naveen N. Rao wrote:
>> Russell Currey wrote:
>> > On Fri, 2020-04-03 at 00:18 +0530, Naveen N. Rao wrote:
>> > > Naveen N. Rao wrote:
>> > > > Russell Currey wrote:
>> > > > > =20
>> > > > > +void *alloc_insn_page(void)
>> > > > > +{
>> > > > > +	void *page =3D vmalloc_exec(PAGE_SIZE);
>> > > > > +
>> > > > > +	if (page)
>> > > > > +		set_memory_ro((unsigned long)page, 1);
>> > > > > +
>> > > > > +	return page;
>> > > > > +}
>> > > > > +
>> > > >=20
>> > > > This crashes for me with KPROBES_SANITY_TEST during the
>> > > > kretprobe
>> > > > test. =20
>> > >=20
>> > > That isn't needed to reproduce this. After bootup, disabling
>> > > optprobes=20
>> > > also shows the crash with kretprobes:
>> > > 	sysctl debug.kprobes-optimization=3D0
>> > >=20
>> > > The problem happens to be with patch_instruction() in=20
>> > > arch_prepare_kprobe(). During boot, on kprobe init, we register a
>> > > probe=20
>> > > on kretprobe_trampoline for use with kretprobes (see=20
>> > > arch_init_kprobes()). This results in an instruction slot being=20
>> > > allocated, and arch_prepare_kprobe() to be called for copying
>> > > the=20
>> > > instruction (nop) at kretprobe_trampoline. patch_instruction()
>> > > is=20
>> > > failing resulting in corrupt instruction which we try to
>> > > emulate/single=20
>> > > step causing the crash.
>> >=20
>> > OK I think I've fixed it, KPROBES_SANITY_TEST passes too.  I'd
>> > appreciate it if you could test v9, and thanks again for finding
>> > this -
>> > very embarrassing bug on my side.
>>=20
>> Great! Thanks.
>>=20
>> I think I should also add appropriate error checking to kprobes' use
>> of=20
>> patch_instruction() which would have caught this much more easily.
>=20
> Only kind of!  It turns out that if the initial setup fails for
> KPROBES_SANITY_TEST, it silently doesn't run - so you miss the "Kprobe
> smoke test" text, but you don't get any kind of error either.  I'll
> send a patch so that it fails more loudly later.

Ha, I see what you mean. Good catch, we should pass the kprobe init=20
status to the test and have it error out.

>=20
>>=20
>> On a related note, I notice that x86 seems to prefer not having any
>> RWX=20
>> pages, and so they continue to do 'module_alloc()' followed by=20
>> 'set_memory_ro()' and then 'set_memory_x()'. Is that something worth=20
>> following for powerpc?
>=20
> I just noticed that too.  arm64 doesn't set theirs executable, as far
> as I can tell powerpc doesn't need to.

I didn't follow that. We do need it to be executable so that we can=20
single step the original instruction.

arm64 does vmalloc_exec(), which looks like it sets the page to RWX,=20
then marks it RO. There is a small window where the page would be WX. =20
x86 instead seems to first allocate the page as RW, mark as RO, and only=20
then enable X - removing that small window where the page is both W and=20
X.

- Naveen

