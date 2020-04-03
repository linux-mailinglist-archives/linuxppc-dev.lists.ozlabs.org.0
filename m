Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8C19D444
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:47:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tw836147zDqWv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:47:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tvvp3Wb6zDqdG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:36:37 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0339X49W071082
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 05:36:35 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303ws0awnq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 05:36:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Fri, 3 Apr 2020 10:36:13 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 10:36:09 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0339aSSS33161298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 09:36:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD5A3A404D;
 Fri,  3 Apr 2020 09:36:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FAB7A4040;
 Fri,  3 Apr 2020 09:36:28 +0000 (GMT)
Received: from localhost (unknown [9.85.72.61])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 09:36:28 +0000 (GMT)
Date: Fri, 03 Apr 2020 15:06:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v8 2/7] powerpc/kprobes: Mark newly allocated probes as RO
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
 <20200402084053.188537-2-ruscur@russell.cc>
 <1585844035.o235bvxmq0.naveen@linux.ibm.com>
 <1585852977.oiikywo1jz.naveen@linux.ibm.com>
 <c336400d5b7765eb72b3090cd9f8a3c57761d0b6.camel@russell.cc>
In-Reply-To: <c336400d5b7765eb72b3090cd9f8a3c57761d0b6.camel@russell.cc>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040309-0020-0000-0000-000003C0C2C6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040309-0021-0000-0000-00002219721C
Message-Id: <1585906281.fbqgtc3kpy.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_06:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030082
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
> On Fri, 2020-04-03 at 00:18 +0530, Naveen N. Rao wrote:
>> Naveen N. Rao wrote:
>> > Russell Currey wrote:
>> > > With CONFIG_STRICT_KERNEL_RWX=3Dy and CONFIG_KPROBES=3Dy, there will
>> > > be one
>> > > W+X page at boot by default.  This can be tested with
>> > > CONFIG_PPC_PTDUMP=3Dy and CONFIG_PPC_DEBUG_WX=3Dy set, and checking
>> > > the
>> > > kernel log during boot.
>> > >=20
>> > > powerpc doesn't implement its own alloc() for kprobes like other
>> > > architectures do, but we couldn't immediately mark RO anyway
>> > > since we do
>> > > a memcpy to the page we allocate later.  After that, nothing
>> > > should be
>> > > allowed to modify the page, and write permissions are removed
>> > > well
>> > > before the kprobe is armed.
>> > >=20
>> > > The memcpy() would fail if >1 probes were allocated, so use
>> > > patch_instruction() instead which is safe for RO.
>> > >=20
>> > > Reviewed-by: Daniel Axtens <dja@axtens.net>
>> > > Signed-off-by: Russell Currey <ruscur@russell.cc>
>> > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> > > ---
>> > >  arch/powerpc/kernel/kprobes.c | 17 +++++++++++++----
>> > >  1 file changed, 13 insertions(+), 4 deletions(-)
>> > >=20
>> > > diff --git a/arch/powerpc/kernel/kprobes.c
>> > > b/arch/powerpc/kernel/kprobes.c
>> > > index 81efb605113e..fa4502b4de35 100644
>> > > --- a/arch/powerpc/kernel/kprobes.c
>> > > +++ b/arch/powerpc/kernel/kprobes.c
>> > > @@ -24,6 +24,8 @@
>> > >  #include <asm/sstep.h>
>> > >  #include <asm/sections.h>
>> > >  #include <linux/uaccess.h>
>> > > +#include <linux/set_memory.h>
>> > > +#include <linux/vmalloc.h>
>> > > =20
>> > >  DEFINE_PER_CPU(struct kprobe *, current_kprobe) =3D NULL;
>> > >  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>> > > @@ -102,6 +104,16 @@ kprobe_opcode_t *kprobe_lookup_name(const
>> > > char *name, unsigned int offset)
>> > >  	return addr;
>> > >  }
>> > > =20
>> > > +void *alloc_insn_page(void)
>> > > +{
>> > > +	void *page =3D vmalloc_exec(PAGE_SIZE);
>> > > +
>> > > +	if (page)
>> > > +		set_memory_ro((unsigned long)page, 1);
>> > > +
>> > > +	return page;
>> > > +}
>> > > +
>> >=20
>> > This crashes for me with KPROBES_SANITY_TEST during the kretprobe
>> > test. =20
>>=20
>> That isn't needed to reproduce this. After bootup, disabling
>> optprobes=20
>> also shows the crash with kretprobes:
>> 	sysctl debug.kprobes-optimization=3D0
>>=20
>> The problem happens to be with patch_instruction() in=20
>> arch_prepare_kprobe(). During boot, on kprobe init, we register a
>> probe=20
>> on kretprobe_trampoline for use with kretprobes (see=20
>> arch_init_kprobes()). This results in an instruction slot being=20
>> allocated, and arch_prepare_kprobe() to be called for copying the=20
>> instruction (nop) at kretprobe_trampoline. patch_instruction() is=20
>> failing resulting in corrupt instruction which we try to
>> emulate/single=20
>> step causing the crash.
>=20
> OK I think I've fixed it, KPROBES_SANITY_TEST passes too.  I'd
> appreciate it if you could test v9, and thanks again for finding this -
> very embarrassing bug on my side.

Great! Thanks.

I think I should also add appropriate error checking to kprobes' use of=20
patch_instruction() which would have caught this much more easily.

On a related note, I notice that x86 seems to prefer not having any RWX=20
pages, and so they continue to do 'module_alloc()' followed by=20
'set_memory_ro()' and then 'set_memory_x()'. Is that something worth=20
following for powerpc?


- Naveen

