Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0733ACC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 08:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTDV6SSTz301w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:52:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cuk3giHK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cuk3giHK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTD34HVfz2yRP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 18:52:35 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F7XsgX089859; Mon, 15 Mar 2021 03:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=HcX046qC/tehsLd7N2DVF9Yj77T3WGq0lvIEkaEsFEA=;
 b=cuk3giHKykYPYWGVenYLJC9/n5ekFPbFg97T6zlwInxYFbomwgVAjCgqSKyQc8ReH13p
 ycNRmiB/l8jeF5o+NdG7WHpFw9yUgkTvpn50XHy/KTAXwYEqIBSeNTo7PkhVK14Ki0E9
 ybhqxUa0H8mGuU02mCzdNfcter4t7190wUuWWOevlK6CNL4rm0x7znmYY9i4YREpGjTE
 LK2R8mdYGN/1nlXVsNpopeGzc6B0xYQkJ/aRWPxJA6nyXPy9wWlkUZ++QFOIRI8dYH5+
 0w66a1kir+v4snaDX4DhITLMgoIj81gyXZEVoXbM0LwkM9neK02YsyS/v1qietQPv+en xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379r4a48jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 03:52:21 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12F7Xvmt090288;
 Mon, 15 Mar 2021 03:52:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379r4a48ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 03:52:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F7nTYJ007557;
 Mon, 15 Mar 2021 07:52:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 378n18hkey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:52:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F7qG4d57409972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 07:52:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39CC65204E;
 Mon, 15 Mar 2021 07:52:16 +0000 (GMT)
Received: from [9.79.177.97] (unknown [9.79.177.97])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 693AC52050;
 Mon, 15 Mar 2021 07:52:12 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 4/4] tools/perf: Support pipeline stage cycles for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YEtlEyb2z33qHhvO@krava>
Date: Mon, 15 Mar 2021 13:22:09 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD9505E3-8CDE-4073-88A0-BCA4B92F276E@linux.vnet.ibm.com>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YEtlEyb2z33qHhvO@krava>
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150050
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, kjain@linux.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12-Mar-2021, at 6:26 PM, Jiri Olsa <jolsa@redhat.com> wrote:
>=20
> On Tue, Mar 09, 2021 at 09:04:00AM -0500, Athira Rajeev wrote:
>> The pipeline stage cycles details can be recorded on powerpc from
>> the contents of Performance Monitor Unit (PMU) registers. On
>> ISA v3.1 platform, sampling registers exposes the cycles spent in
>> different pipeline stages. Patch adds perf tools support to present
>> two of the cycle counter information along with memory latency =
(weight).
>>=20
>> Re-use the field 'ins_lat' for storing the first pipeline stage =
cycle.
>> This is stored in 'var2_w' field of 'perf_sample_weight'.
>>=20
>> Add a new field 'p_stage_cyc' to store the second pipeline stage =
cycle
>> which is stored in 'var3_w' field of perf_sample_weight.
>>=20
>> Add new sort function 'Pipeline Stage Cycle' and include this in
>> default_mem_sort_order[]. This new sort function may be used to =
denote
>> some other pipeline stage in another architecture. So add this to
>> list of sort entries that can have dynamic header string.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/Documentation/perf-report.txt |  1 +
>> tools/perf/arch/powerpc/util/event.c     | 18 ++++++++++++++++--
>> tools/perf/util/event.h                  |  1 +
>> tools/perf/util/hist.c                   | 11 ++++++++---
>> tools/perf/util/hist.h                   |  1 +
>> tools/perf/util/session.c                |  4 +++-
>> tools/perf/util/sort.c                   | 24 =
++++++++++++++++++++++--
>> tools/perf/util/sort.h                   |  2 ++
>> 8 files changed, 54 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/tools/perf/Documentation/perf-report.txt =
b/tools/perf/Documentation/perf-report.txt
>> index f546b5e9db05..9691d9c227ba 100644
>> --- a/tools/perf/Documentation/perf-report.txt
>> +++ b/tools/perf/Documentation/perf-report.txt
>> @@ -112,6 +112,7 @@ OPTIONS
>> 	- ins_lat: Instruction latency in core cycles. This is the =
global instruction
>> 	  latency
>> 	- local_ins_lat: Local instruction latency version
>> +	- p_stage_cyc: Number of cycles spent in a pipeline stage.
>=20
> please specify in here that it's ppc only

Ok Sure,

>=20
> SNIP
>=20
>> +struct sort_entry sort_p_stage_cyc =3D {
>> +	.se_header      =3D "Pipeline Stage Cycle",
>> +	.se_cmp         =3D sort__global_p_stage_cyc_cmp,
>> +	.se_snprintf	=3D hist_entry__p_stage_cyc_snprintf,
>> +	.se_width_idx	=3D HISTC_P_STAGE_CYC,
>> +};
>> +
>> struct sort_entry sort_mem_daddr_sym =3D {
>> 	.se_header	=3D "Data Symbol",
>> 	.se_cmp		=3D sort__daddr_cmp,
>> @@ -1853,6 +1872,7 @@ static void =
sort_dimension_add_dynamic_header(struct sort_dimension *sd)
>> 	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>> 	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>> 	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
>> +	DIM(SORT_P_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
>=20
> this might be out of scope for this patch, but would it make sense
> to add arch specific sort dimension? so the specific column is
> not even visible on arch that it's not supported on
>=20

Hi Jiri,

Thanks for the suggestions.

Below is an approach I came up with for adding dynamic sort key based on =
architecture support.
With this patch, perf report for mem mode will display new sort key only =
in supported archs.=20
Please help to review if this approach looks good. I have created this =
on top of my current set. If this looks fine,=20
I can include this in version2 patch set.

=46rom 8ebbe6ae802d895103335899e4e60dde5e562f33 Mon Sep 17 00:00:00 2001
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Date: Mon, 15 Mar 2021 02:33:28 +0000
Subject: [PATCH] tools/perf: Add dynamic sort dimensions for mem mode

Add dynamic sort dimensions for mem mode.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/event.c |  7 +++++
 tools/perf/util/event.h              |  1 +
 tools/perf/util/sort.c               | 43 +++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/util/event.c =
b/tools/perf/arch/powerpc/util/event.c
index b80fbee83b6e..fddfc288c415 100644
--- a/tools/perf/arch/powerpc/util/event.c
+++ b/tools/perf/arch/powerpc/util/event.c
@@ -44,3 +44,10 @@ const char *arch_perf_header_entry__add(const char =
*se_header)
 		return "Dispatch Cyc";
 	return se_header;
 }
+
+int arch_support_dynamic_key(const char *sort_key)
+{
+	if (!strcmp(sort_key, "p_stage_cyc"))
+		return 1;
+	return 0;
+}
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 65f89e80916f..6cd4bf54dbdc 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -429,5 +429,6 @@ char *get_page_size_name(u64 size, char *str);
 void arch_perf_parse_sample_weight(struct perf_sample *data, const =
__u64 *array, u64 type);
 void arch_perf_synthesize_sample_weight(const struct perf_sample *data, =
__u64 *array, u64 type);
 const char *arch_perf_header_entry__add(const char *se_header);
+int arch_support_dynamic_key(const char *sort_key);
=20
 #endif /* __PERF_RECORD_H */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index cbb3899e7eca..e194b1187db8 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -37,7 +37,7 @@ const char	default_parent_pattern[] =3D =
"^sys_|^do_page_fault";
 const char	*parent_pattern =3D default_parent_pattern;
 const char	*default_sort_order =3D "comm,dso,symbol";
 const char	default_branch_sort_order[] =3D =
"comm,dso_from,symbol_from,symbol_to,cycles";
-const char	default_mem_sort_order[] =3D =
"local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,=
local_ins_lat,p_stage_cyc";
+const char	default_mem_sort_order[] =3D =
"local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,=
local_ins_lat";
 const char	default_top_sort_order[] =3D "dso,symbol";
 const char	default_diff_sort_order[] =3D "dso,symbol";
 const char	default_tracepoint_sort_order[] =3D "trace";
@@ -47,6 +47,7 @@ regex_t		ignore_callees_regex;
 int		have_ignore_callees =3D 0;
 enum sort_mode	sort__mode =3D SORT_MODE__NORMAL;
 const char	*dynamic_headers[] =3D {"local_ins_lat", "p_stage_cyc"};
+const char	*dynamic_sort_keys_mem[] =3D {"p_stage_cyc"};
=20
 /*
  * Replaces all occurrences of a char used with the:
@@ -2997,6 +2998,20 @@ static char *prefix_if_not_in(const char *pre, =
char *str)
 	return n;
 }
=20
+/*
+ * Adds 'suff,' suffix into 'str' if 'suff' is
+ * not already part of 'str'.
+ */
+static char *suffix_if_not_in(const char *suff, char *str)
+{
+	if (!str || strstr(str, suff))
+		return str;
+
+	if (asprintf(&str, "%s,%s", str, suff) < 0)
+		str =3D NULL;
+	return str;
+}
+
 static char *setup_overhead(char *keys)
 {
 	if (sort__mode =3D=3D SORT_MODE__DIFF)
@@ -3010,6 +3025,26 @@ static char *setup_overhead(char *keys)
 	return keys;
 }
=20
+int __weak arch_support_dynamic_key(const char *sort_key =
__maybe_unused)
+{
+	return 0;
+}
+
+static char *setup_dynamic_sort_keys(char *str)
+{
+	unsigned int j;
+
+	if (sort__mode =3D=3D SORT_MODE__MEMORY)
+		for (j =3D 0; j < ARRAY_SIZE(dynamic_sort_keys_mem); =
j++)
+			if =
(arch_support_dynamic_key(dynamic_sort_keys_mem[j])) {
+				str =3D =
suffix_if_not_in(dynamic_sort_keys_mem[j], str);
+				if (str =3D=3D NULL)
+					return str;
+			}
+
+	return str;
+}
+
 static int __setup_sorting(struct evlist *evlist)
 {
 	char *str;
@@ -3050,6 +3085,12 @@ static int __setup_sorting(struct evlist *evlist)
 		}
 	}
=20
+	str =3D setup_dynamic_sort_keys(str);
+	if (str =3D=3D NULL) {
+		pr_err("Not enough memory to setup dynamic sort keys");
+		return -ENOMEM;
+	}
+
 	ret =3D setup_sort_list(&perf_hpp_list, str, evlist);
=20
 	free(str);
--=20
2.26.2


Thanks,
Athira

>=20
>> };
>>=20
>> #undef DIM
>> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
>> index 63f67a3f3630..23b20cbbc846 100644
>> --- a/tools/perf/util/sort.h
>> +++ b/tools/perf/util/sort.h
>> @@ -51,6 +51,7 @@ struct he_stat {
>> 	u64			period_guest_us;
>> 	u64			weight;
>> 	u64			ins_lat;
>> +	u64			p_stage_cyc;
>> 	u32			nr_events;
>> };
>>=20
>> @@ -234,6 +235,7 @@ enum sort_type {
>> 	SORT_CODE_PAGE_SIZE,
>> 	SORT_LOCAL_INS_LAT,
>> 	SORT_GLOBAL_INS_LAT,
>> +	SORT_P_STAGE_CYC,
>=20
> we could have the whole 'SORT_PEPELINE_STAGE_CYC',
> so it's more obvious

Ok.

>=20
> thanks,
> jirka

