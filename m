Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EF34B0C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 21:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6YvY5M9Dz3c55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 07:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k379yqok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k379yqok; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Qlf5Ml7z2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:25:33 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QF4kbc054118; Fri, 26 Mar 2021 11:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=Gm+ijsFl4p3uMAan0H33QCN2mxd9l3KpwnR/Z1F/jPQ=;
 b=k379yqokN8kyo9DBcT91evKesqHGR1Tuwdkcj1Kn4BrYSsUe8+tpmq5lX9bwT0Z2KeSM
 EZXHH8PBs8MoQaYuAz4WXRSuba+NyMlPUrlFawDae4LkJmgbUFL9qlu0Kq1+LHuULvnW
 yKZoBfrtHSVLo07wVP2u+ABUMnZGRjCXU8vvUOKNrteUE8aSt1sSwnbIXfN6rc+RpUkA
 uPPjFBCByjOkIdBPDlN3B748dPMu2XMy5lHy5DpCajrZ/lemL4QggoGEt43b0l/H+6XK
 jziQgZqRruAJrvKsu4nnDjlu2WCpRVeFTAvDHkzWyRbKrInEbFgcO3SLAM5n1rMGJqFX Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37hhghshnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 11:25:12 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QF4tDN054939;
 Fri, 26 Mar 2021 11:25:12 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37hhghshmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 11:25:12 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QF7vJN008216;
 Fri, 26 Mar 2021 15:25:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 37h1518dex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:25:10 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12QFOmeJ19399124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 15:24:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FBBD11C064;
 Fri, 26 Mar 2021 15:25:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E45C11C050;
 Fri, 26 Mar 2021 15:24:43 +0000 (GMT)
Received: from [9.124.223.127] (unknown [9.124.223.127])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Mar 2021 15:24:41 +0000 (GMT)
Subject: Re: [PATCH V2 3/5] tools/perf: Add powerpc support for
 PERF_SAMPLE_WEIGHT_STRUCT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://2/
In-Reply-To: <YFuWb3S8p0ZGjmGu@krava>
X-Apple-Windows-Friendly: 1
Date: Fri, 26 Mar 2021 20:53:04 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <80EE46ED-9007-4CB7-9A52-A7A2ADC616C6@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-4-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YFuWb3S8p0ZGjmGu@krava>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kF_aDhmMcV66rL06HTmTXBSzna55EN-c
X-Proofpoint-GUID: hsb2U2DAWpG6y9BKGotENgADXLOkjyHj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260115
X-Mailman-Approved-At: Sat, 27 Mar 2021 07:47:30 +1100
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
Cc: ravi.bangoria@linux.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
25-Mar-2021, at 1:13 AM, Jiri Olsa &lt;jolsa@redhat.com&gt; =
wrote:<br><br>On Mon, Mar 22, 2021 at 10:57:25AM -0400, Athira Rajeev =
wrote:<br><blockquote type=3D"cite">Add arch specific =
arch_evsel__set_sample_weight() to set the new<br>sample type for =
powerpc.<br><br>Add arch specific arch_perf_parse_sample_weight() to =
store the<br>sample-&gt;weight values depending on the sample type =
applied.<br>if the new sample type (PERF_SAMPLE_WEIGHT_STRUCT) is =
applied,<br>store only the lower 32 bits to sample-&gt;weight. If sample =
type<br>is 'PERF_SAMPLE_WEIGHT', store the full 64-bit to =
sample-&gt;weight.<br><br>Signed-off-by: Athira Rajeev =
&lt;atrajeev@linux.vnet.ibm.com&gt;<br>---<br>tools/perf/arch/powerpc/util=
/Build &nbsp;&nbsp;| &nbsp;2 ++<br>tools/perf/arch/powerpc/util/event.c =
| 32 =
++++++++++++++++++++++++++++++++<br>tools/perf/arch/powerpc/util/evsel.c =
| &nbsp;8 ++++++++<br>3 files changed, 42 insertions(+)<br>create mode =
100644 tools/perf/arch/powerpc/util/event.c<br>create mode 100644 =
tools/perf/arch/powerpc/util/evsel.c<br><br>diff --git =
a/tools/perf/arch/powerpc/util/Build =
b/tools/perf/arch/powerpc/util/Build<br>index b7945e5a543b..8a79c4126e5b =
100644<br>--- a/tools/perf/arch/powerpc/util/Build<br>+++ =
b/tools/perf/arch/powerpc/util/Build<br>@@ -4,6 +4,8 @@ perf-y +=3D =
kvm-stat.o<br>perf-y +=3D perf_regs.o<br>perf-y +=3D =
mem-events.o<br>perf-y +=3D sym-handling.o<br>+perf-y +=3D =
evsel.o<br>+perf-y +=3D event.o<br><br>perf-$(CONFIG_DWARF) +=3D =
dwarf-regs.o<br>perf-$(CONFIG_DWARF) +=3D skip-callchain-idx.o<br>diff =
--git a/tools/perf/arch/powerpc/util/event.c =
b/tools/perf/arch/powerpc/util/event.c<br>new file mode 100644<br>index =
000000000000..f49d32c2c8ae<br>--- /dev/null<br>+++ =
b/tools/perf/arch/powerpc/util/event.c<br>@@ -0,0 +1,32 @@<br>+// =
SPDX-License-Identifier: GPL-2.0<br>+#include =
&lt;linux/types.h&gt;<br>+#include &lt;linux/string.h&gt;<br>+#include =
&lt;linux/zalloc.h&gt;<br>+<br>+#include =
"../../../util/event.h"<br>+#include =
"../../../util/synthetic-events.h"<br>+#include =
"../../../util/machine.h"<br>+#include =
"../../../util/tool.h"<br>+#include "../../../util/map.h"<br>+#include =
"../../../util/debug.h"<br></blockquote><br>nit, just #include =
"utils/...h" should work no?<br><br>other than that, the patchset looks =
ok to me<br><br>Acked-by: Jiri Olsa =
&lt;jolsa@redhat.com&gt;<br></blockquote><br><br>Hi Jiri, =
Arnaldo<br><br>Thanks for reviewing the patch set.<br>I checked that, =
just using "utils/...h" also works.<br>Below is the change which I =
verified. Since the patches are presently merged in =
<br>https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=3D=
tmp.perf/core, <br>can you please suggest how can we go about this =
change ?<br><br>diff --git a/tools/perf/arch/powerpc/util/event.c =
b/tools/perf/arch/powerpc/util/event.c<br>index =
3bf441257466..c479d0a0e696 100644<br>--- =
a/tools/perf/arch/powerpc/util/event.c<br>+++ =
b/tools/perf/arch/powerpc/util/event.c<br>@@ -3,12 +3,12 @@<br> #include =
&lt;linux/string.h&gt;<br> #include =
&lt;linux/zalloc.h&gt;<br><br>-#include =
"../../../util/event.h"<br>-#include =
"../../../util/synthetic-events.h"<br>-#include =
"../../../util/machine.h"<br>-#include =
"../../../util/tool.h"<br>-#include "../../../util/map.h"<br>-#include =
"../../../util/debug.h"<br>+#include "util/event.h"<br>+#include =
"util/synthetic-events.h"<br>+#include "util/machine.h"<br>+#include =
"util/tool.h"<br>+#include "util/map.h"<br>+#include =
"util/debug.h"<br><br> void arch_perf_parse_sample_weight(struct =
perf_sample *data,<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;&nbsp;const __u64 *array, =
u64 type)<br><br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><br>thanks,<br>jirka<br><br><blockquote =
type=3D"cite">+<br>+void arch_perf_parse_sample_weight(struct =
perf_sample *data,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;&nbsp;const __u64 *array, =
u64 type)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>union perf_sample_weight =
weight;<br>+<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>weight.full =3D *array;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (type &amp; =
PERF_SAMPLE_WEIGHT)<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>data-&gt;weight =3D =
weight.full;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>else<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>data-&gt;weight =3D =
weight.var1_dw;<br>+}<br>+<br>+void =
arch_perf_synthesize_sample_weight(const struct perf_sample =
*data,<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>__u64 *array, u64 type)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>*array =3D =
data-&gt;weight;<br>+<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (type &amp; =
PERF_SAMPLE_WEIGHT_STRUCT)<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>*array &amp;=3D =
0xffffffff;<br>+}<br>diff --git a/tools/perf/arch/powerpc/util/evsel.c =
b/tools/perf/arch/powerpc/util/evsel.c<br>new file mode 100644<br>index =
000000000000..2f733cdc8dbb<br>--- /dev/null<br>+++ =
b/tools/perf/arch/powerpc/util/evsel.c<br>@@ -0,0 +1,8 @@<br>+// =
SPDX-License-Identifier: GPL-2.0<br>+#include =
&lt;stdio.h&gt;<br>+#include "util/evsel.h"<br>+<br>+void =
arch_evsel__set_sample_weight(struct evsel *evsel)<br>+{<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>evsel__set_sample_bit(evsel, WEIGHT_STRUCT);<br>+}<br>-- =
<br>1.8.3.1<br></blockquote></blockquote><br></div></body></html>=
