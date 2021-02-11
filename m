Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F662318A59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 13:23:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbwlL1YLfzDwft
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X4RLG3Mn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbwfd61f6zDsnC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 23:19:20 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11BC2tX4169909; Thu, 11 Feb 2021 07:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=WEDo829DJWeRH4KXAeh5Q5ZAm/QaI0pshhbcjXNqfWo=;
 b=X4RLG3MnkXVmB46/kLu3wtewrm/SW9TkJI8XJAwmtp1UiN3acOmk4T2vyBTYXvzTWWdw
 YM4dXGFICl0O9bXfC4JuZs6j/mGJp7ZFY2NV6Qeh+lDP/eRiw2FaPmTCo29T4cb0dmmT
 B+A010iLBua9QeQV6jjlW6j9Vaj5/UVkjBZUPmGyq4JC33Cajkyxvel7zlycS9tm1Uf4
 Lv6Vz2ezHOSiGhKbnv6PUmWHDwl8TES8dgJnZMNxNv+DH+OVkU01ZJTdpEFBprX6HWzx
 XPzw0Aahf5nitJ1LfK92L688v8r13hJJx9rXUziVJivnFyZqoYb3D2pESMujOwuwA3Z/ PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36n45118fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 07:19:16 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11BC3PGG174871;
 Thu, 11 Feb 2021 07:19:16 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36n45118ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 07:19:16 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BCBlMU020802;
 Thu, 11 Feb 2021 12:19:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 36hjr7u0ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 12:19:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11BCJBeR39977288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 12:19:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47DF1A4051;
 Thu, 11 Feb 2021 12:19:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A149DA4055;
 Thu, 11 Feb 2021 12:19:09 +0000 (GMT)
Received: from [9.124.215.101] (unknown [9.124.215.101])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Feb 2021 12:19:09 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and module
 start
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210209124712.GC1018564@kernel.org>
Date: Thu, 11 Feb 2021 17:49:07 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <47DBD65C-6250-45EB-A6E9-B831413E7E5A@linux.vnet.ibm.com>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
 <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
 <1D564116-5FAC-4775-BEB2-4D5B837080D6@linux.vnet.ibm.com>
 <20210203153148.GC854763@kernel.org> <20210209124712.GC1018564@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_05:2021-02-10,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110105
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
Cc: Jiri Olsa <jolsa@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jiri Olsa <jolsa@kernel.org>,
 Kajol Jain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Feb-2021, at 6:17 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Wed, Feb 03, 2021 at 12:31:48PM -0300, Arnaldo Carvalho de Melo =
escreveu:
>> Em Tue, Feb 02, 2021 at 04:02:36PM +0530, Athira Rajeev escreveu:
>>>=20
>>>=20
>>>    On 18-Jan-2021, at 3:51 PM, kajoljain <kjain@linux.ibm.com> =
wrote:
>>>=20
>>>=20
>>>=20
>>>    On 1/12/21 3:08 PM, Jiri Olsa wrote:
>>>=20
>>>        On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev =
wrote:
>>>=20
>>>        SNIP
>>>=20
>>>=20
>>>            c000000002799370 b backtrace_flag
>>>            c000000002799378 B radix_tree_node_cachep
>>>            c000000002799380 B __bss_stop
>>>            c0000000027a0000 B _end
>>>            c008000003890000 t icmp_checkentry      [ip_tables]
>>>            c008000003890038 t ipt_alloc_initial_table      =
[ip_tables]
>>>            c008000003890468 T ipt_do_table [ip_tables]
>>>            c008000003890de8 T ipt_unregister_table_pre_exit        =
[ip_tables]
>>>            ...
>>>=20
>>>            Perf calls function symbols__fixup_end() which sets the =
end of
>>>            symbol
>>>            to 0xc008000003890000, which is the next address and this =
is the
>>>            start
>>>            address of first module (icmp_checkentry in above) which =
will make
>>>            the
>>>            huge symbol size of 0x80000010f0000.
>>>=20
>>>            After symbols__fixup_end:
>>>            symbols__fixup_end: sym->name: _end, sym->start:
>>>            0xc0000000027a0000,
>>>            sym->end: 0xc008000003890000
>>>=20
>>>            On powerpc, kernel text segment is located at =
0xc000000000000000
>>>            whereas the modules are located at very high memory =
addresses,
>>>            0xc00800000xxxxxxx. Since the gap between end of kernel =
text
>>>            segment
>>>            and beginning of first module's address is high, =
histogram
>>>            allocation
>>>            using calloc fails.
>>>=20
>>>            Fix this by detecting the kernel's last symbol and =
limiting
>>>            the range of last kernel symbol to pagesize.
>>>=20
>>>=20
>>>    Patch looks good to me.
>>>=20
>>>    Tested-By: Kajol Jain<kjain@linux.ibm.com>
>>>=20
>>>    Thanks,
>>>    Kajol Jain
>>>=20
>>>=20
>>>            Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
>>>=20
>>>=20
>>>        I can't test, but since the same approach works for arm and =
s390,
>>>        this also looks ok
>>>=20
>>>        Acked-by: Jiri Olsa <jolsa@redhat.com>
>>>=20
>>>        thanks,
>>>        jirka
>>>=20
>>>=20
>>> Hi Arnaldo,
>>>=20
>>> Can you please help review this patch and merge if this looks good..
>>=20
>> Thanks, collected the Tested-by from Kajol and the Acked-by from Jiri
>> and applied to my local tree for testing, then up to my perf/core
>> branch.
>=20
> Had to apply this on top.
>=20
> - Arnaldo
>=20
> commit 0f000f9c89182950cd3500226729977251529364
> Author: Arnaldo Carvalho de Melo <acme@redhat.com>
> Date:   Tue Feb 9 09:41:21 2021 -0300
>=20
>    perf powerpc: Fix printf conversion specifier for IP addresses
>=20
>    We need to use "%#" PRIx64 for u64 values, not "%lx", fixing this =
build
>    problem on powerpc 32-bit:
>=20
>      72    13.69 ubuntu:18.04-x-powerpc        : FAIL =
powerpc-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
>        arch/powerpc/util/machine.c: In function =
'arch__symbols__fixup_end':
>        arch/powerpc/util/machine.c:23:12: error: format '%lx' expects =
argument of type 'long unsigned int', but argument 6 has type 'u64 {aka =
long long unsigned int}' [-Werror=3Dformat=3D]
>          pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
>                    ^
>        /git/linux/tools/perf/util/debug.h:18:21: note: in definition =
of macro 'pr_fmt'
>         #define pr_fmt(fmt) fmt
>                             ^~~
>        /git/linux/tools/perf/util/debug.h:33:29: note: in expansion of =
macro 'pr_debugN'
>         #define pr_debug4(fmt, ...) pr_debugN(4, pr_fmt(fmt), =
##__VA_ARGS__)
>                                     ^~~~~~~~~
>        /git/linux/tools/perf/util/debug.h:33:42: note: in expansion of =
macro 'pr_fmt'
>         #define pr_debug4(fmt, ...) pr_debugN(4, pr_fmt(fmt), =
##__VA_ARGS__)
>                                                  ^~~~~~
>        arch/powerpc/util/machine.c:23:2: note: in expansion of macro =
'pr_debug4'
>          pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
>          ^~~~~~~~~
>        cc1: all warnings being treated as errors
>        /git/linux/tools/build/Makefile.build:139: recipe for target =
'util' failed
>        make[5]: *** [util] Error 2
>        /git/linux/tools/build/Makefile.build:139: recipe for target =
'powerpc' failed
>        make[4]: *** [powerpc] Error 2
>        /git/linux/tools/build/Makefile.build:139: recipe for target =
'arch' failed
>        make[3]: *** [arch] Error 2
>      73    30.47 ubuntu:18.04-x-powerpc64      : Ok   =
powerpc64-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
>=20
>    Fixes: 557c3eadb7712741 ("perf powerpc: Fix gap between kernel end =
and module start")
>    Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>    Cc: Jiri Olsa <jolsa@redhat.com>
>    Cc: Kajol Jain <kjain@linux.ibm.com>
>    Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Thanks Arnaldo for the fix.

Athira.
>=20
> diff --git a/tools/perf/arch/powerpc/util/machine.c =
b/tools/perf/arch/powerpc/util/machine.c
> index c30e5cc88c1673d6..e652a1aa8132274f 100644
> --- a/tools/perf/arch/powerpc/util/machine.c
> +++ b/tools/perf/arch/powerpc/util/machine.c
> @@ -1,5 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> +#include <inttypes.h>
> #include <stdio.h>
> #include <string.h>
> #include <internal/lib.h> // page_size
> @@ -20,5 +21,5 @@ void arch__symbols__fixup_end(struct symbol *p, =
struct symbol *c)
> 		p->end +=3D page_size;
> 	else
> 		p->end =3D c->start;
> -	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
> +	pr_debug4("%s sym:%s end:%#" PRIx64 "\n", __func__, p->name, =
p->end);
> }

