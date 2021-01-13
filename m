Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5392F44A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 07:46:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFydx28WWzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 17:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MLj+Tk5P; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFyc51wYwzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 17:44:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10D6694K040672; Wed, 13 Jan 2021 01:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Xdh93DKnHzGwqWQxuE0FTVfuIpnjR/LH1RUGp4hNWR4=;
 b=MLj+Tk5P2Jh0mCReHz9DMng9RUK18g65K14cw0os8M1JyiOU/ryFw5PdlzRa3g0Lef/3
 6xEmZnurg5ojrwjT9YWPuAOiHRhiMaHRB2+XbYGu9xJTwhUxdJrfLoJIdfMMhoditrPN
 jXtNoKjTjPpwH7NUKC++sOsrlgHWGAubZhqfSooeTnqvYF/tHErEdJH5j/LH5G+5sjmF
 SbRN359FBm+AXf5k8+rn/7CMxu8FgTz7uYbdOOT8H7YhJkMm+JIAcrsZQYwXEPxASgZb
 5LAvmgyq4wDR1t/thUjGCehoN5qeWkR1hcSdXK8w69uhc+Vk8n5iijt67HH9sTrK4hT5 CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 361qvn4q3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 01:44:46 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10D6eL1a146479;
 Wed, 13 Jan 2021 01:44:46 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 361qvn4q3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 01:44:45 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10D6X3D8005407;
 Wed, 13 Jan 2021 06:44:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 35y447vnj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 06:44:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10D6ifYT32768354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 06:44:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D7B14C050;
 Wed, 13 Jan 2021 06:44:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9D494C040;
 Wed, 13 Jan 2021 06:44:38 +0000 (GMT)
Received: from [9.79.240.54] (unknown [9.79.240.54])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Jan 2021 06:44:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and module
 start
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210112093811.GA1272772@krava>
Date: Wed, 13 Jan 2021 12:14:35 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C6F1824-3E4F-4D8D-B210-C883166756AD@linux.vnet.ibm.com>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_02:2021-01-12,
 2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130037
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
Cc: Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jiri Olsa <jolsa@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12-Jan-2021, at 3:08 PM, Jiri Olsa <jolsa@redhat.com> wrote:
>=20
> On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev wrote:
>=20
> SNIP
>=20
>> c000000002799370 b backtrace_flag
>> c000000002799378 B radix_tree_node_cachep
>> c000000002799380 B __bss_stop
>> c0000000027a0000 B _end
>> c008000003890000 t icmp_checkentry      [ip_tables]
>> c008000003890038 t ipt_alloc_initial_table      [ip_tables]
>> c008000003890468 T ipt_do_table [ip_tables]
>> c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
>> ...
>>=20
>> Perf calls function symbols__fixup_end() which sets the end of symbol
>> to 0xc008000003890000, which is the next address and this is the =
start
>> address of first module (icmp_checkentry in above) which will make =
the
>> huge symbol size of 0x80000010f0000.
>>=20
>> After symbols__fixup_end:
>> symbols__fixup_end: sym->name: _end, sym->start: 0xc0000000027a0000,
>> sym->end: 0xc008000003890000
>>=20
>> On powerpc, kernel text segment is located at 0xc000000000000000
>> whereas the modules are located at very high memory addresses,
>> 0xc00800000xxxxxxx. Since the gap between end of kernel text segment
>> and beginning of first module's address is high, histogram allocation
>> using calloc fails.
>>=20
>> Fix this by detecting the kernel's last symbol and limiting
>> the range of last kernel symbol to pagesize.
>>=20
>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
>=20
> I can't test, but since the same approach works for arm and s390,
> this also looks ok
>=20
> Acked-by: Jiri Olsa <jolsa@redhat.com>
>=20
> thanks,
> jirka

Thanks Jiri for reviewing the patch,

Athira
>=20
>> ---
>> tools/perf/arch/powerpc/util/Build     |  1 +
>> tools/perf/arch/powerpc/util/machine.c | 24 ++++++++++++++++++++++++
>> 2 files changed, 25 insertions(+)
>> create mode 100644 tools/perf/arch/powerpc/util/machine.c
>>=20
>> diff --git a/tools/perf/arch/powerpc/util/Build =
b/tools/perf/arch/powerpc/util/Build
>> index e86e210bf514..b7945e5a543b 100644
>> --- a/tools/perf/arch/powerpc/util/Build
>> +++ b/tools/perf/arch/powerpc/util/Build
>> @@ -1,4 +1,5 @@
>> perf-y +=3D header.o
>> +perf-y +=3D machine.o
>> perf-y +=3D kvm-stat.o
>> perf-y +=3D perf_regs.o
>> perf-y +=3D mem-events.o
>> diff --git a/tools/perf/arch/powerpc/util/machine.c =
b/tools/perf/arch/powerpc/util/machine.c
>> new file mode 100644
>> index 000000000000..c30e5cc88c16
>> --- /dev/null
>> +++ b/tools/perf/arch/powerpc/util/machine.c
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <internal/lib.h> // page_size
>> +#include "debug.h"
>> +#include "symbol.h"
>> +
>> +/* On powerpc kernel text segment start at memory addresses, =
0xc000000000000000
>> + * whereas the modules are located at very high memory addresses,
>> + * for example 0xc00800000xxxxxxx. The gap between end of kernel =
text segment
>> + * and beginning of first module's text segment is very high.
>> + * Therefore do not fill this gap and do not assign it to the kernel =
dso map.
>> + */
>> +
>> +void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
>> +{
>> +	if (strchr(p->name, '[') =3D=3D NULL && strchr(c->name, '['))
>> +		/* Limit the range of last kernel symbol */
>> +		p->end +=3D page_size;
>> +	else
>> +		p->end =3D c->start;
>> +	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
>> +}
>> --=20
>> 1.8.3.1

