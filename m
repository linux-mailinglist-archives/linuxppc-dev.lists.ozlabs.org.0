Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BC46357B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 14:30:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3NQQ6PFzz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 00:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ODqiebSF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ODqiebSF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3NPf29Qnz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 00:30:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUDI7JG002806; 
 Tue, 30 Nov 2021 13:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=CVjwGkb7p5udWMQVSq4oYFBOvcOFjuiIzwPA+NteRIA=;
 b=ODqiebSFQz2+R3MOt/BdEFmZIiYbLL6k9KfyLEXpiWWFukxVMs/A5NfNPt86fmKF2uqV
 SakoFEeDWrGpUc+ynOOL6ldteBU3vdwMpt3E3KHegK2WbU5XtX5cxZTd505fpjzCDeEX
 LxngNWeqHHsTSkPzkeqQeiTH3ZejpsxhA59KmuyXCEoUxhDnBni/vJkdC+ToixyNkmxe
 2ZyQT0ZtremVKOHdA2APgnfteptirJXvqxt4tcs0PM9pNphsEqCIpoO8kJ1qikdtAjxB
 Ohm7RFvFsQCgfrg8FiDfO7qyfyzkOJlX1p1BG4qdV+bTQlvVZhQ0ufpoJVqrNEjkEm5K 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnmqc07st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 13:29:59 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUDKtJW013557;
 Tue, 30 Nov 2021 13:29:59 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnmqc07s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 13:29:59 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUDOe5m004394;
 Tue, 30 Nov 2021 13:29:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3ckca9wreu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 13:29:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUDTqhQ22217204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 13:29:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 941B0A408D;
 Tue, 30 Nov 2021 13:29:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 335C8A4085;
 Tue, 30 Nov 2021 13:29:48 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.87.86])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Nov 2021 13:29:47 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YaUJwxHPTz1J7K1e@krava>
Date: Tue, 30 Nov 2021 18:59:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6597729D-0CBE-4872-A78E-ADA10A76F765@linux.vnet.ibm.com>
References: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
 <YaUJwxHPTz1J7K1e@krava>
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bbJb1Oovm4ji3i0wFcaBsXON0MDf5B-6
X-Proofpoint-GUID: 72xBwhf1G5BTtDhRk0p9hIcHrrhV7x6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_07,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300075
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com,
 Namhyung Kim <namhyung@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Nov-2021, at 10:41 PM, Jiri Olsa <jolsa@redhat.com> wrote:
>=20
> On Thu, Nov 25, 2021 at 08:18:50AM +0530, Athira Rajeev wrote:
>> Sort key p_stage_cyc is used to present the latency
>> cycles spend in pipeline stages. perf tool has local
>> p_stage_cyc sort key to display this info. There is no
>> global variant available for this sort key. local variant
>> shows latency in a sinlge sample, whereas, global value
>> will be useful to present the total latency (sum of
>> latencies) in the hist entry. It represents latency
>> number multiplied by the number of samples.
>>=20
>> Add global (p_stage_cyc) and local variant
>> (local_p_stage_cyc) for this sort key. Use the
>> local_p_stage_cyc as default option for "mem" sort mode.
>> Also add this to list of dynamic sort keys.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reported-by: Namhyung Kim <namhyung@kernel.org>
>> ---
>> tools/perf/util/hist.c |  4 +++-
>> tools/perf/util/hist.h |  3 ++-
>> tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
>> tools/perf/util/sort.h |  3 ++-
>> 4 files changed, 32 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
>> index b776465e04ef..0a8033b09e28 100644
>> --- a/tools/perf/util/hist.c
>> +++ b/tools/perf/util/hist.c
>> @@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, =
struct hist_entry *h)
>> 	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
>> 	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
>> 	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
>> -	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
>> +	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
>> +	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
>> +
>> 	if (symbol_conf.nanosecs)
>> 		hists__new_col_len(hists, HISTC_TIME, 16);
>> 	else
>> diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
>> index 5343b62476e6..2752ce681108 100644
>> --- a/tools/perf/util/hist.h
>> +++ b/tools/perf/util/hist.h
>> @@ -75,7 +75,8 @@ enum hist_column {
>> 	HISTC_MEM_BLOCKED,
>> 	HISTC_LOCAL_INS_LAT,
>> 	HISTC_GLOBAL_INS_LAT,
>> -	HISTC_P_STAGE_CYC,
>> +	HISTC_LOCAL_P_STAGE_CYC,
>> +	HISTC_GLOBAL_P_STAGE_CYC,
>> 	HISTC_NR_COLS, /* Last entry */
>> };
>>=20
>> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
>> index e9216a292a04..e978f7883e07 100644
>> --- a/tools/perf/util/sort.c
>> +++ b/tools/perf/util/sort.c
>> @@ -37,7 +37,7 @@ const char	default_parent_pattern[] =3D =
"^sys_|^do_page_fault";
>> const char	*parent_pattern =3D default_parent_pattern;
>> const char	*default_sort_order =3D "comm,dso,symbol";
>> const char	default_branch_sort_order[] =3D =
"comm,dso_from,symbol_from,symbol_to,cycles";
>> -const char	default_mem_sort_order[] =3D =
"local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,=
local_ins_lat,p_stage_cyc";
>> +const char	default_mem_sort_order[] =3D =
"local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,=
local_ins_lat,local_p_stage_cyc";
>> const char	default_top_sort_order[] =3D "dso,symbol";
>> const char	default_diff_sort_order[] =3D "dso,symbol";
>> const char	default_tracepoint_sort_order[] =3D "trace";
>> @@ -46,8 +46,8 @@ const char	*field_order;
>> regex_t		ignore_callees_regex;
>> int		have_ignore_callees =3D 0;
>> enum sort_mode	sort__mode =3D SORT_MODE__NORMAL;
>> -const char	*dynamic_headers[] =3D {"local_ins_lat", "p_stage_cyc"};
>> -const char	*arch_specific_sort_keys[] =3D {"p_stage_cyc"};
>> +const char	*dynamic_headers[] =3D {"local_ins_lat", "ins_lat", =
"local_p_stage_cyc", "p_stage_cyc"};
>=20
> so you also add global ins_lat, right? will this change
> some default behaviour?

Hi Jiri,

By default, if the architecture doesn=E2=80=99t have a dynamic header =
entry for this sort key ( taken care by arch_perf_header_entry() =
function ),
It will use the default se_header value in perf report. So default =
behaviour will not be changed.

>=20
>> +const char	*arch_specific_sort_keys[] =3D {"local_p_stage_cyc", =
"p_stage_cyc"};
>=20
> nit.. both dynamic_headers and arch_specific_sort_keys could be static =
right?

Sure, this is used only in util/sort.c=20
I will add the change to make these static in next version.

Thanks
Athira
>=20
> thanks,
> jirka
>=20
>>=20
>> /*
>>  * Replaces all occurrences of a char used with the:
>> @@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat =3D {
>> };
>>=20
>> static int64_t
>> -sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct =
hist_entry *right)
>> +sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry =
*right)
>> {
>> 	return left->p_stage_cyc - right->p_stage_cyc;
>> }
>>=20
>> +static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry =
*he, char *bf,
>> +					size_t size, unsigned int width)
>> +{
>> +	return repsep_snprintf(bf, size, "%-*u", width,
>> +			he->p_stage_cyc * he->stat.nr_events);
>> +}
>> +
>> +
>> static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, =
char *bf,
>> 					size_t size, unsigned int width)
>> {
>> 	return repsep_snprintf(bf, size, "%-*u", width, =
he->p_stage_cyc);
>> }
>>=20
>> -struct sort_entry sort_p_stage_cyc =3D {
>> -	.se_header      =3D "Pipeline Stage Cycle",
>> -	.se_cmp         =3D sort__global_p_stage_cyc_cmp,
>> +struct sort_entry sort_local_p_stage_cyc =3D {
>> +	.se_header      =3D "Local Pipeline Stage Cycle",
>> +	.se_cmp         =3D sort__p_stage_cyc_cmp,
>> 	.se_snprintf	=3D hist_entry__p_stage_cyc_snprintf,
>> -	.se_width_idx	=3D HISTC_P_STAGE_CYC,
>> +	.se_width_idx	=3D HISTC_LOCAL_P_STAGE_CYC,
>> +};
>> +
>> +struct sort_entry sort_global_p_stage_cyc =3D {
>> +	.se_header      =3D "Pipeline Stage Cycle",
>> +	.se_cmp         =3D sort__p_stage_cyc_cmp,
>> +	.se_snprintf    =3D hist_entry__global_p_stage_cyc_snprintf,
>> +	.se_width_idx   =3D HISTC_GLOBAL_P_STAGE_CYC,
>> };
>>=20
>> struct sort_entry sort_mem_daddr_sym =3D {
>> @@ -1858,7 +1873,8 @@ static struct sort_dimension =
common_sort_dimensions[] =3D {
>> 	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>> 	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>> 	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
>> -	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
>> +	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", =
sort_local_p_stage_cyc),
>> +	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", =
sort_global_p_stage_cyc),
>> };
>>=20
>> #undef DIM
>> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
>> index 3c7518378d62..83abe5e6812a 100644
>> --- a/tools/perf/util/sort.h
>> +++ b/tools/perf/util/sort.h
>> @@ -235,7 +235,8 @@ enum sort_type {
>> 	SORT_CODE_PAGE_SIZE,
>> 	SORT_LOCAL_INS_LAT,
>> 	SORT_GLOBAL_INS_LAT,
>> -	SORT_PIPELINE_STAGE_CYC,
>> +	SORT_LOCAL_PIPELINE_STAGE_CYC,
>> +	SORT_GLOBAL_PIPELINE_STAGE_CYC,
>>=20
>> 	/* branch stack specific sort keys */
>> 	__SORT_BRANCH_STACK,
>> --=20
>> 2.27.0

