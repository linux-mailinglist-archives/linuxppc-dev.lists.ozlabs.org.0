Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1312F9C46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 11:23:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK7Ck3KHrzDr6K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 21:23:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aamL0nOj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK79Z3ywjzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 21:21:22 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10IA1Qbk196143; Mon, 18 Jan 2021 05:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sG95zBgUXNWcCsdiqyphFGisWHd+OuET9HdF+0ZpsJ8=;
 b=aamL0nOjG1Pni/mHgJC05xFHkI6f2l/SaIVuMCUDEibH9VzMasIueM7FadbGEl89FOT4
 mCAbKqfLkEwwt0ci69K2BEosavl/q23ekwY6ZvzNR2GO8kaOH0F54qYO+51ZYHmDPaRj
 O5ZlJGBzeXi9Ne3To2gJq3JyHAo24KljPOOzOC7MMbuQOvJYQwma2iSbevlhMLJ5cdu4
 NVEM7kNI/z9iYxjf+/y4VLejQNS5dwARHzClRN+HWENE/AwyJtBpqT/QTOgXIdUegfxg
 PVuRJCuKkY2Kj6CiAEs/O10YMU1mMzrj98mWoS9TFOgflOJ1DZeApQn0OCMPmVHzTw90 sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36586h8fxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 05:21:15 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10IA1QdO196110;
 Mon, 18 Jan 2021 05:21:14 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36586h8fwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 05:21:14 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10IACHci020161;
 Mon, 18 Jan 2021 10:21:12 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 363qs8ssxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 10:21:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10IALBV040632622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jan 2021 10:21:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78303AC059;
 Mon, 18 Jan 2021 10:21:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BF52AC05B;
 Mon, 18 Jan 2021 10:21:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.87.16])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Jan 2021 10:21:08 +0000 (GMT)
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and module
 start
To: Jiri Olsa <jolsa@redhat.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
Date: Mon, 18 Jan 2021 15:51:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112093811.GA1272772@krava>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_07:2021-01-15,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101180055
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jolsa@kernel.org,
 acme@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/12/21 3:08 PM, Jiri Olsa wrote:
> On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev wrote:
> 
> SNIP
> 
>> c000000002799370 b backtrace_flag
>> c000000002799378 B radix_tree_node_cachep
>> c000000002799380 B __bss_stop
>> c0000000027a0000 B _end
>> c008000003890000 t icmp_checkentry      [ip_tables]
>> c008000003890038 t ipt_alloc_initial_table      [ip_tables]
>> c008000003890468 T ipt_do_table [ip_tables]
>> c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
>> ...
>>
>> Perf calls function symbols__fixup_end() which sets the end of symbol
>> to 0xc008000003890000, which is the next address and this is the start
>> address of first module (icmp_checkentry in above) which will make the
>> huge symbol size of 0x80000010f0000.
>>
>> After symbols__fixup_end:
>> symbols__fixup_end: sym->name: _end, sym->start: 0xc0000000027a0000,
>> sym->end: 0xc008000003890000
>>
>> On powerpc, kernel text segment is located at 0xc000000000000000
>> whereas the modules are located at very high memory addresses,
>> 0xc00800000xxxxxxx. Since the gap between end of kernel text segment
>> and beginning of first module's address is high, histogram allocation
>> using calloc fails.
>>
>> Fix this by detecting the kernel's last symbol and limiting
>> the range of last kernel symbol to pagesize.

Patch looks good to me.

Tested-By: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain
>>
>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> 
> I can't test, but since the same approach works for arm and s390,
> this also looks ok
> 
> Acked-by: Jiri Olsa <jolsa@redhat.com>
> 
> thanks,
> jirka
> 
>> ---
>>  tools/perf/arch/powerpc/util/Build     |  1 +
>>  tools/perf/arch/powerpc/util/machine.c | 24 ++++++++++++++++++++++++
>>  2 files changed, 25 insertions(+)
>>  create mode 100644 tools/perf/arch/powerpc/util/machine.c
>>
>> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
>> index e86e210bf514..b7945e5a543b 100644
>> --- a/tools/perf/arch/powerpc/util/Build
>> +++ b/tools/perf/arch/powerpc/util/Build
>> @@ -1,4 +1,5 @@
>>  perf-y += header.o
>> +perf-y += machine.o
>>  perf-y += kvm-stat.o
>>  perf-y += perf_regs.o
>>  perf-y += mem-events.o
>> diff --git a/tools/perf/arch/powerpc/util/machine.c b/tools/perf/arch/powerpc/util/machine.c
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
>> +/* On powerpc kernel text segment start at memory addresses, 0xc000000000000000
>> + * whereas the modules are located at very high memory addresses,
>> + * for example 0xc00800000xxxxxxx. The gap between end of kernel text segment
>> + * and beginning of first module's text segment is very high.
>> + * Therefore do not fill this gap and do not assign it to the kernel dso map.
>> + */
>> +
>> +void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
>> +{
>> +	if (strchr(p->name, '[') == NULL && strchr(c->name, '['))
>> +		/* Limit the range of last kernel symbol */
>> +		p->end += page_size;
>> +	else
>> +		p->end = c->start;
>> +	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
>> +}
>> -- 
>> 1.8.3.1
>>
> 
