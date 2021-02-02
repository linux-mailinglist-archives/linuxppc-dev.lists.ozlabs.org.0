Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15530D238
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:50:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVnl65dhYzDwx6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:50:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UrZ1sVuG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVLk76vySzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 21:33:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112AWDS0020085; Tue, 2 Feb 2021 05:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=eeHEOfylBqj+cp8cYTXBgNExeuhTme5LvIAKbE1M0qk=;
 b=UrZ1sVuGRzSbml/KBM3GBarcAJ6PkFqNf+FKIB+HMxwisW9HB0eesMr5LRWcb4vddtfo
 Y06M0nhlNlvXA87XtodPp6aUAEkzTVfSzGMGtUj4E2m4MA5/rtgm3O5+HNgBXZE32paP
 uodCG08H48Yh8O0/Hmb1JK4mp47BCdIGQbHvZnpcpsj/hyB4o655PC6xSu6MZLp3np1h
 2klXi43GHQS0dbWhPN1aKoW8N8fj42VY50Hw6c0vzLjEOC5G0hKltAMfOKygvi3faALc
 5SVEm6okMdnEkX2ONmlelQL3nY/rG5rxYgYMajO3yKTBlUFU3HEJ8KeN6T+5xjCLeZtD fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f4sd0j1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 05:32:59 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112AWYDv021479;
 Tue, 2 Feb 2021 05:32:58 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f4sd0j15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 05:32:58 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112ANXAj009083;
 Tue, 2 Feb 2021 10:32:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 36cy389e1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 10:32:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112AWr0r8323372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 10:32:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D59CAA4055;
 Tue,  2 Feb 2021 10:32:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52D9BA4051;
 Tue,  2 Feb 2021 10:32:52 +0000 (GMT)
Received: from [9.79.254.227] (unknown [9.79.254.227])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Feb 2021 10:32:52 +0000 (GMT)
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and module
 start
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://9/
In-Reply-To: <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
X-Apple-Windows-Friendly: 1
Date: Tue, 2 Feb 2021 16:02:36 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D564116-5FAC-4775-BEB2-4D5B837080D6@linux.vnet.ibm.com>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
 <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_05:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020067
X-Mailman-Approved-At: Wed, 03 Feb 2021 14:49:16 +1100
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@redhat.com>,
 Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
18-Jan-2021, at 3:51 PM, kajoljain &lt;kjain@linux.ibm.com&gt; =
wrote:<br><br><br><br>On 1/12/21 3:08 PM, Jiri Olsa =
wrote:<br><blockquote type=3D"cite">On Mon, Dec 28, 2020 at 09:14:14PM =
-0500, Athira Rajeev wrote:<br><br>SNIP<br><br><blockquote =
type=3D"cite">c000000002799370 b backtrace_flag<br>c000000002799378 B =
radix_tree_node_cachep<br>c000000002799380 B =
__bss_stop<br>c0000000027a0000 B _end<br>c008000003890000 t =
icmp_checkentry =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ip_tables]<br>c008000003890038 t =
ipt_alloc_initial_table =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ip_tables]<br>c008000003890468 T =
ipt_do_table [ip_tables]<br>c008000003890de8 T =
ipt_unregister_table_pre_exit =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ip_tables]<br>...<br><br>Perf =
calls function symbols__fixup_end() which sets the end of symbol<br>to =
0xc008000003890000, which is the next address and this is the =
start<br>address of first module (icmp_checkentry in above) which will =
make the<br>huge symbol size of 0x80000010f0000.<br><br>After =
symbols__fixup_end:<br>symbols__fixup_end: sym-&gt;name: _end, =
sym-&gt;start: 0xc0000000027a0000,<br>sym-&gt;end: =
0xc008000003890000<br><br>On powerpc, kernel text segment is located at =
0xc000000000000000<br>whereas the modules are located at very high =
memory addresses,<br>0xc00800000xxxxxxx. Since the gap between end of =
kernel text segment<br>and beginning of first module's address is high, =
histogram allocation<br>using calloc fails.<br><br>Fix this by detecting =
the kernel's last symbol and limiting<br>the range of last kernel symbol =
to pagesize.<br></blockquote></blockquote><br>Patch looks good to =
me.<br><br>Tested-By: Kajol =
Jain&lt;kjain@linux.ibm.com&gt;<br><br>Thanks,<br>Kajol =
Jain<br><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br>Signed-off-by: Athira =
Rajeev&lt;atrajeev@linux.vnet.ibm.com&gt;<br></blockquote><br>I can't =
test, but since the same approach works for arm and s390,<br>this also =
looks ok<br><br>Acked-by: Jiri Olsa =
&lt;jolsa@redhat.com&gt;<br><br>thanks,<br>jirka<br></blockquote></blockqu=
ote><br>Hi Arnaldo,<br><br>Can you please help review this patch and =
merge if this looks good..<br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><blockquote type=3D"cite"><br><blockquote =
type=3D"cite">---<br>tools/perf/arch/powerpc/util/Build =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 =
+<br>tools/perf/arch/powerpc/util/machine.c | 24 =
++++++++++++++++++++++++<br>2 files changed, 25 insertions(+)<br>create =
mode 100644 tools/perf/arch/powerpc/util/machine.c<br><br>diff --git =
a/tools/perf/arch/powerpc/util/Build =
b/tools/perf/arch/powerpc/util/Build<br>index e86e210bf514..b7945e5a543b =
100644<br>--- a/tools/perf/arch/powerpc/util/Build<br>+++ =
b/tools/perf/arch/powerpc/util/Build<br>@@ -1,4 +1,5 @@<br>perf-y +=3D =
header.o<br>+perf-y +=3D machine.o<br>perf-y +=3D kvm-stat.o<br>perf-y =
+=3D perf_regs.o<br>perf-y +=3D mem-events.o<br>diff --git =
a/tools/perf/arch/powerpc/util/machine.c =
b/tools/perf/arch/powerpc/util/machine.c<br>new file mode =
100644<br>index 000000000000..c30e5cc88c16<br>--- /dev/null<br>+++ =
b/tools/perf/arch/powerpc/util/machine.c<br>@@ -0,0 +1,24 @@<br>+// =
SPDX-License-Identifier: GPL-2.0<br>+<br>+#include =
&lt;stdio.h&gt;<br>+#include &lt;string.h&gt;<br>+#include =
&lt;internal/lib.h&gt; // page_size<br>+#include "debug.h"<br>+#include =
"symbol.h"<br>+<br>+/* On powerpc kernel text segment start at memory =
addresses, 0xc000000000000000<br>+ * whereas the modules are located at =
very high memory addresses,<br>+ * for example 0xc00800000xxxxxxx. The =
gap between end of kernel text segment<br>+ * and beginning of first =
module's text segment is very high.<br>+ * Therefore do not fill this =
gap and do not assign it to the kernel dso map.<br>+ */<br>+<br>+void =
arch__symbols__fixup_end(struct symbol *p, struct symbol =
*c)<br>+{<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (strchr(p-&gt;name, '[') =3D=3D NULL &amp;&amp; =
strchr(c-&gt;name, '['))<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* Limit the range of last kernel =
symbol */<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>p-&gt;end +=3D page_size;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>p-&gt;end =
=3D c-&gt;start;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>pr_debug4("%s sym:%s end:%#lx\n", =
__func__, p-&gt;name, p-&gt;end);<br>+}<br>-- =
<br>1.8.3.1<br></blockquote></blockquote></blockquote><br></div></body></h=
tml>=
