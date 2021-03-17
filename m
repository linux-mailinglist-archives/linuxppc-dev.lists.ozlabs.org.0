Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF033F958
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 20:32:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F10fy0Cf8z3bvS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 06:32:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfiOPnzy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pfiOPnzy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0p0G0P4Gz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 22:31:57 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12HB4252067188; Wed, 17 Mar 2021 07:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=XPkGvB+zD31dt5X6YPj6Lga8FY45CB0z+woM4CWHjjk=;
 b=pfiOPnzydM78MPKxhxRdwMU3ey7ImQoFWtjEUAa3ZSt8IGq50dOsK6ZQ6sQ1DDykmtyu
 B0K2j+/fzQD9XVk6sIPz/7Lg68VZz85EVUjC3GjIQdDewrima2kRtPDoMuCZxHnYvKK2
 bmyt6PytwhqiBChBB91Q0JNL1J3/mFLh8QPJgciZPaBWcf931Gfea1t9Q2sSt5lHXqTg
 J+I8xIAfGnsqTBnmDZpEi6D+g7YTbAHeNwUFV85qmxh5XqEsvYXjQu/FTS23Bzmjn3+s
 PwEaOcZdougZXGoPdN/tHJUuV9eUA54URJkcrvHJxk6iJOQjEPQTRsRoPRSyfQ0SauAS Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37b7kge092-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 07:31:42 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12HB4rB3077857;
 Wed, 17 Mar 2021 07:31:41 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37b7kge08f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 07:31:41 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HBSN3I002825;
 Wed, 17 Mar 2021 11:31:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 378n181yjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 11:31:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12HBVatM48824744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 11:31:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB1384C046;
 Wed, 17 Mar 2021 11:31:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F60F4C04E;
 Wed, 17 Mar 2021 11:31:30 +0000 (GMT)
Received: from [9.195.47.249] (unknown [9.195.47.249])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 17 Mar 2021 11:31:30 +0000 (GMT)
Subject: Re: [PATCH 4/4] tools/perf: Support pipeline stage cycles for powerpc
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://5/
In-Reply-To: <YE/rS5jZLA0RHYZG@krava>
X-Apple-Windows-Friendly: 1
Date: Wed, 17 Mar 2021 17:01:27 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA827A39-FA2A-4B0C-BF8F-9DB428CD58B8@linux.vnet.ibm.com>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YEtlEyb2z33qHhvO@krava>
 <FD9505E3-8CDE-4073-88A0-BCA4B92F276E@linux.vnet.ibm.com>
 <YE/rS5jZLA0RHYZG@krava>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-17_05:2021-03-17,
 2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170082
X-Mailman-Approved-At: Thu, 18 Mar 2021 06:32:18 +1100
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
 Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
16-Mar-2021, at 4:48 AM, Jiri Olsa &lt;jolsa@redhat.com&gt; =
wrote:<br><br>On Mon, Mar 15, 2021 at 01:22:09PM +0530, Athira Rajeev =
wrote:<br><br>SNIP<br><br><blockquote type=3D"cite">+<br>+static char =
*setup_dynamic_sort_keys(char *str)<br>+{<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>unsigned =
int j;<br>+<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (sort__mode =3D=3D SORT_MODE__MEMORY)<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for (j =3D =
0; j &lt; ARRAY_SIZE(dynamic_sort_keys_mem); j++)<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(arch_support_dynamic_key(dynamic_sort_keys_mem[j])) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>str =3D =
suffix_if_not_in(dynamic_sort_keys_mem[j], str);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (str =
=3D=3D NULL)<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return str;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br>+<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
str;<br>+}<br>+<br>static int __setup_sorting(struct evlist =
*evlist)<br>{<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>char *str;<br>@@ -3050,6 +3085,12 @@ static int =
__setup_sorting(struct evlist *evlist)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br><span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>}<br><br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>str =3D =
setup_dynamic_sort_keys(str);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (str =3D=3D NULL) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>pr_err("Not enough memory to setup dynamic sort keys");<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENOMEM;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br></blockquote><br>hum, so this is basicaly overloading the =
default_mem_sort_order for<br>architecture, right?<br><br>then I think =
it'd be easier just overload default_mem_sort_order directly<br><br>I =
was thinking more about adding extra (arch specific) loop =
to<br>sort_dimension__add or somehow add arch's specific stuff =
to<br>memory_sort_dimensions<br></blockquote><br>Hi Jiri,<br><br>Above =
patch was to append additional sort keys to sort order based on<br>sort =
mode and architecture support. I had initially thought of defining =
two<br>orders ( say default_mem_sort_order plus mem_sort_order_pstage ). =
But if<br>new sort keys gets added for mem mode in future, we will need =
to keep<br>updating both orders. So preferred the approach of =
"appending" supported sort<br>keys to default order.<br><br>Following =
your thought on using "sort_dimension__add", I tried below =
approach<br>which is easier. The new sort dimension "p_stage_cyc" is =
presently only supported<br>on powerpc. For unsupported platforms, we =
don't want to display it<br>in the perf report output columns. Hence =
added check in sort_dimension__add()<br>and skip the sort key incase its =
not applicable for particular arch.<br><br>Please help to check if below =
approach looks fine.<br><br><br>diff --git =
a/tools/perf/arch/powerpc/util/event.c =
b/tools/perf/arch/powerpc/util/event.c<br>index =
b80fbee83b6e..7205767d75eb 100644<br>--- =
a/tools/perf/arch/powerpc/util/event.c<br>+++ =
b/tools/perf/arch/powerpc/util/event.c<br>@@ -44,3 +44,10 @@ const char =
*arch_perf_header_entry__add(const char *se_header)<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
"Dispatch Cyc";<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return se_header;<br> =
}<br>+<br>+int arch_support_sort_key(const char =
*sort_key)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (!strcmp(sort_key, =
"p_stage_cyc"))<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return 1;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
0;<br>+}<br>diff --git a/tools/perf/util/event.h =
b/tools/perf/util/event.h<br>index 65f89e80916f..612a92aaaefb =
100644<br>--- a/tools/perf/util/event.h<br>+++ =
b/tools/perf/util/event.h<br>@@ -429,5 +429,6 @@ char =
*get_page_size_name(u64 size, char *str);<br> void =
arch_perf_parse_sample_weight(struct perf_sample *data, const __u64 =
*array, u64 type);<br> void arch_perf_synthesize_sample_weight(const =
struct perf_sample *data, __u64 *array, u64 type);<br> const char =
*arch_perf_header_entry__add(const char *se_header);<br>+int =
arch_support_sort_key(const char *sort_key);<br><br> #endif /* =
__PERF_RECORD_H */<br>diff --git a/tools/perf/util/sort.c =
b/tools/perf/util/sort.c<br>index cbb3899e7eca..d8b0b0b43a81 =
100644<br>--- a/tools/perf/util/sort.c<br>+++ =
b/tools/perf/util/sort.c<br>@@ -47,6 +47,7 @@ regex_t<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>ignore_callees_regex;<br> int<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>have_ignore_callees =3D 0;<br> =
enum sort_mode<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>sort__mode =3D SORT_MODE__NORMAL;<br> const char<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>*dynamic_headers[] =3D {"local_ins_lat", =
"p_stage_cyc"};<br>+const char<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>*arch_specific_sort_keys[] =3D =
{"p_stage_cyc"};<br><br> /*<br> &nbsp;* Replaces all occurrences of a =
char used with the:<br>@@ -1837,6 +1838,11 @@ struct sort_dimension =
{<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>int<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>taken;<br> };<br><br>+int __weak arch_support_sort_key(const char =
*sort_key __maybe_unused)<br>+{<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return 0;<br>+}<br>+<br> const =
char * __weak arch_perf_header_entry__add(const char *se_header)<br> =
{<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return se_header;<br>@@ -2773,6 +2779,18 @@ int =
sort_dimension__add(struct perf_hpp_list *list, const char *tok,<br> =
{<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned int i, j;<br><br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* Check to see if there are any =
arch specific<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> * sort dimensions not applicable =
for the current<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> * architecture. If so, Skip that =
sort key since<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> * we don't want to display it in =
the output fields.<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for (j =3D =
0; j &lt; ARRAY_SIZE(arch_specific_sort_keys); j++) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!strcmp(arch_specific_sort_keys[j], tok) &amp;&amp;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>!arch_support_sort_key(tok)) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return 0;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br>+<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for (i =3D 0; i &lt; =
ARRAY_SIZE(common_sort_dimensions); i++) {<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>struct =
sort_dimension *sd =3D &amp;common_sort_dimensions[i];<br><br>=E2=80=94 =
<br>2.26.2<br><br>Thanks<br>Athira<br><br><blockquote =
type=3D"cite"><br>jirka<br><br></blockquote><br></div></body></html>=
