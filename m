Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B550333F010
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 13:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0pzy5XzCz3btR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 23:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BF/trTN6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BF/trTN6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BF/trTN6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BF/trTN6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0pzW5w1Yz30BG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 23:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615983377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FszNgVMbQS63a+s1/yYr/sdKQFD0RdKs3g1thIm7GaM=;
 b=BF/trTN6T4HPsqTUeEAgxF9zwJONqxTU9Pr6efuo51nMQXAVoGWyNfbZcniW/nrUAyH3eV
 sti3DaNFKzePE9gW0imWMU6SPSHAx5fCwuZfgXtkh1BgtAISRryHbU+n1p0jplp2fPyqa6
 nXJiZK2nsr8OYqFLQxJ0PgIOg/q/WbE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615983377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FszNgVMbQS63a+s1/yYr/sdKQFD0RdKs3g1thIm7GaM=;
 b=BF/trTN6T4HPsqTUeEAgxF9zwJONqxTU9Pr6efuo51nMQXAVoGWyNfbZcniW/nrUAyH3eV
 sti3DaNFKzePE9gW0imWMU6SPSHAx5fCwuZfgXtkh1BgtAISRryHbU+n1p0jplp2fPyqa6
 nXJiZK2nsr8OYqFLQxJ0PgIOg/q/WbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-aznJxc56OhGAFbe8fIvmWQ-1; Wed, 17 Mar 2021 08:16:09 -0400
X-MC-Unique: aznJxc56OhGAFbe8fIvmWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAFA98189D3;
 Wed, 17 Mar 2021 12:16:07 +0000 (UTC)
Received: from krava (unknown [10.40.194.149])
 by smtp.corp.redhat.com (Postfix) with SMTP id 4778C5D9D3;
 Wed, 17 Mar 2021 12:16:02 +0000 (UTC)
Date: Wed, 17 Mar 2021 13:16:01 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] tools/perf: Support pipeline stage cycles for powerpc
Message-ID: <YFHzAZjE1f8nq0l8@krava>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YEtlEyb2z33qHhvO@krava>
 <FD9505E3-8CDE-4073-88A0-BCA4B92F276E@linux.vnet.ibm.com>
 <YE/rS5jZLA0RHYZG@krava>
 <CA827A39-FA2A-4B0C-BF8F-9DB428CD58B8@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CA827A39-FA2A-4B0C-BF8F-9DB428CD58B8@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Wed, Mar 17, 2021 at 05:01:27PM +0530, Athira Rajeev wrote:
> <html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; -we=
bkit-nbsp-mode: space; line-break: after-white-space;" class=3D"ApplePlainT=
extBody"><div class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite=
">On 16-Mar-2021, at 4:48 AM, Jiri Olsa &lt;jolsa@redhat.com&gt; wrote:<br>=
<br>On Mon, Mar 15, 2021 at 01:22:09PM +0530, Athira Rajeev wrote:<br><br>S=
NIP<br><br><blockquote type=3D"cite">+<br>+static char *setup_dynamic_sort_=
keys(char *str)<br>+{<br>+<span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">	</span>unsigned int j;<br>+<br>+<span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">	</span>if (sort__mode =3D=3D SORT_MODE__MEMORY)<br>=
+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for (j =3D 0; j &lt=
; ARRAY_SIZE(dynamic_sort_keys_mem); j++)<br>+<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D=
"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">	</span>if (arch_support_dynamic_key(dynamic_sort_keys_mem[j])) {<b=
r>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>str =3D suffix_if_not_in(dynamic_sort=
_keys_mem[j], str);<br>+<span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (str =3D=3D N=
ULL)<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return str;<br>+<span class=3D"Apple-tab-=
span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>}<br>+<br>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span>return str;<br>+}<br>+<br>static int __setup_sorting(s=
truct evlist *evlist)<br>{<br><span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>char *str;<br>@@ -3050,6 +3085,12 @@ static int __setup=
_sorting(struct evlist *evlist)<br><span class=3D"Apple-tab-span" style=3D"=
white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">	</span>}<br><span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span>}<br><br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre=
">	</span>str =3D setup_dynamic_sort_keys(str);<br>+<span class=3D"Apple-ta=
b-span" style=3D"white-space:pre">	</span>if (str =3D=3D NULL) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"A=
pple-tab-span" style=3D"white-space:pre">	</span>pr_err("Not enough memory =
to setup dynamic sort keys");<br>+<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space=
:pre">	</span>return -ENOMEM;<br>+<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span>}<br></blockquote><br>hum, so this is basicaly over=
loading the default_mem_sort_order for<br>architecture, right?<br><br>then =
I think it'd be easier just overload default_mem_sort_order directly<br><br=
>I was thinking more about adding extra (arch specific) loop to<br>sort_dim=
ension__add or somehow add arch's specific stuff to<br>memory_sort_dimensio=
ns<br></blockquote><br>Hi Jiri,<br><br>Above patch was to append additional=
 sort keys to sort order based on<br>sort mode and architecture support. I =
had initially thought of defining two<br>orders ( say default_mem_sort_orde=
r plus mem_sort_order_pstage ). But if<br>new sort keys gets added for mem =
mode in future, we will need to keep<br>updating both orders. So preferred =
the approach of "appending" supported sort<br>keys to default order.<br><br=
>Following your thought on using "sort_dimension__add", I tried below appro=
ach<br>which is easier. The new sort dimension "p_stage_cyc" is presently o=
nly supported<br>on powerpc. For unsupported platforms, we don't want to di=
splay it<br>in the perf report output columns. Hence added check in sort_di=
mension__add()<br>and skip the sort key incase its not applicable for parti=
cular arch.<br><br>Please help to check if below approach looks fine.<br><b=
r><br>diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/p=
owerpc/util/event.c<br>index b80fbee83b6e..7205767d75eb 100644<br>--- a/too=
ls/perf/arch/powerpc/util/event.c<br>+++ b/tools/perf/arch/powerpc/util/eve=
nt.c<br>@@ -44,3 +44,10 @@ const char *arch_perf_header_entry__add(const ch=
ar *se_header)<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>r=
eturn "Dispatch Cyc";<br> <span class=3D"Apple-tab-span" style=3D"white-spa=
ce:pre">	</span>return se_header;<br> }<br>+<br>+int arch_support_sort_key(=
const char *sort_key)<br>+{<br>+<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span>if (!strcmp(sort_key, "p_stage_cyc"))<br>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span>return 1;<br>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span>return 0;<br>+}<br>diff --g=
it a/tools/perf/util/event.h b/tools/perf/util/event.h<br>index 65f89e80916=
f..612a92aaaefb 100644<br>--- a/tools/perf/util/event.h<br>+++ b/tools/perf=
/util/event.h<br>@@ -429,5 +429,6 @@ char *get_page_size_name(u64 size, cha=
r *str);<br> void arch_perf_parse_sample_weight(struct perf_sample *data, c=
onst __u64 *array, u64 type);<br> void arch_perf_synthesize_sample_weight(c=
onst struct perf_sample *data, __u64 *array, u64 type);<br> const char *arc=
h_perf_header_entry__add(const char *se_header);<br>+int arch_support_sort_=
key(const char *sort_key);<br><br> #endif /* __PERF_RECORD_H */<br>diff --g=
it a/tools/perf/util/sort.c b/tools/perf/util/sort.c<br>index cbb3899e7eca.=
=2Ed8b0b0b43a81 100644<br>--- a/tools/perf/util/sort.c<br>+++ b/tools/perf/=
util/sort.c<br>@@ -47,6 +47,7 @@ regex_t<span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>ignore_callees_regex;<br> int<span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>have_ignore_callees =3D 0;<br> enum sort_mode<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>sort__mode =
=3D SORT_MODE__NORMAL;<br> const char<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>*dynamic_headers[] =3D {"local_ins_lat", "p_st=
age_cyc"};<br>+const char<span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">	</span>*arch_specific_sort_keys[] =3D {"p_stage_cyc"};<br><br> /*<b=
r> &nbsp;* Replaces all occurrences of a char used with the:<br>@@ -1837,6 =
+1838,11 @@ struct sort_dimension {<br> <span class=3D"Apple-tab-span" styl=
e=3D"white-space:pre">	</span>int<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:=
pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</sp=
an>taken;<br> };<br><br>+int __weak arch_support_sort_key(const char *sort_=
key __maybe_unused)<br>+{<br>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">	</span>return 0;<br>+}<br>+<br> const char * __weak arch_perf_=
header_entry__add(const char *se_header)<br> {<br> <span class=3D"Apple-tab=
-span" style=3D"white-space:pre">	</span>return se_header;<br>@@ -2773,6 +2=
779,18 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *t=
ok,<br> {<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</s=
pan>unsigned int i, j;<br><br>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span>/* Check to see if there are any arch specific<br>+<sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * sort dimen=
sions not applicable for the current<br>+<span class=3D"Apple-tab-span" sty=
le=3D"white-space:pre">	</span> * architecture. If so, Skip that sort key s=
ince<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
* we don't want to display it in the output fields.<br>+<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">	</span> */<br>+<span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span>for (j =3D 0; j &lt; ARRAY_SIZE=
(arch_specific_sort_keys); j++) {<br>+<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>if (!strcmp(arch_specific_sort_keys[j], tok) &amp;&amp;<=
br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"A=
pple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-s=
pan" style=3D"white-space:pre">	</span>!arch_support_sort_key(tok)) {<br>+<=
span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-=
tab-span" style=3D"white-space:pre">	</span>return 0;<br>+<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">	</span><span class=3D"Apple-tab-sp=
an" style=3D"white-space:pre">	</span>}<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br>+<br> <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>for (i =3D 0; i &lt; ARRAY_SIZE(common_s=
ort_dimensions); i++) {<br> <span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>struct sort_dimension *sd =3D &amp;common_sort_dimensions[i];<br><b=
r>=E2=80=94 <br>2.26.2<br><br>Thanks<br>Athira<br><br><blockquote type=3D"c=
ite"><br>jirka<br><br></blockquote><br></div></body></html>
>=20

apart from the html content, looks ok ;-)

jirka

