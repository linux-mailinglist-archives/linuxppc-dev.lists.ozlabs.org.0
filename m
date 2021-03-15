Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98F33AC63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 08:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzT0c5yB8z301F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:42:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SiJRBu7w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SiJRBu7w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzT074DHBz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 18:42:14 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F7YPHM036228; Mon, 15 Mar 2021 03:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=1suujmnuk7iwngbrEAP041QiNnwt+bgAxX3kTWojIgU=;
 b=SiJRBu7w7tJbCTR94ZvlW0oBISMT71afAqT25+u47Wyh4SkZV0YTnqkSg7XHGX7Y9yzt
 /TtCt5fj12RL0SxJQZHv9HpTNXNm9/4VJ5Ap4xAIkN7/IR24qKh2YGX6ROIFy0+XgAHe
 Hxj4k683/6Mer7Vw40LMj5nQA4T5whzMEakEkQYiY8e/sGDr98rrhYRxM8WcJ5GOPc+0
 wUZCsdYi+aB4tiEh/ZZVPlL46tQzDNOmWfHrclOzfcF+ep1lnO6uwWhVpS1i0nTr/Bgc
 7h96R9zpupt0p+mfvvggoYJiVSZEfaywdtRpINK1P6PSo3/uKSZtozCfwddvYONvaEsa qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yhqcyuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 03:41:51 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12F7aovV046339;
 Mon, 15 Mar 2021 03:41:51 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yhqcytu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 03:41:50 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F7d9IZ020956;
 Mon, 15 Mar 2021 07:41:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 378n188tn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:41:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F7fjIK25297216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 07:41:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20AED52054;
 Mon, 15 Mar 2021 07:41:45 +0000 (GMT)
Received: from [9.79.177.97] (unknown [9.79.177.97])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 26A5F52051;
 Mon, 15 Mar 2021 07:41:41 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 2/4] tools/perf: Add dynamic headers for perf report
 columns
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <YEtlHzsJ4z19pB/M@krava>
Date: Mon, 15 Mar 2021 13:11:38 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <82153A58-31F2-44ED-9326-EF1F74ADDA91@linux.vnet.ibm.com>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YEtlHzsJ4z19pB/M@krava>
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103150050
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
 peterz@infradead.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12-Mar-2021, at 6:27 PM, Jiri Olsa <jolsa@redhat.com> wrote:
>=20
> On Tue, Mar 09, 2021 at 09:03:58AM -0500, Athira Rajeev wrote:
>> Currently the header string for different columns in perf report
>> is fixed. Some fields of perf sample could have different meaning
>> for different architectures than the meaning conveyed by the header
>> string. An example is the new field 'var2_w' of perf_sample_weight
>> structure. This is presently captured as 'Local INSTR Latency' in
>> perf mem report. But this could be used to denote a different latency
>> cycle in another architecture.
>>=20
>> Introduce a weak function arch_perf_header_entry__add() to set
>> the arch specific header string for the fields which can contain =
dynamic
>> header. If the architecture do not have this function, fall back to =
the
>> default header string value.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/event.h |  1 +
>> tools/perf/util/sort.c  | 19 ++++++++++++++++++-
>> 2 files changed, 19 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
>> index f603edbbbc6f..89b149e2e70a 100644
>> --- a/tools/perf/util/event.h
>> +++ b/tools/perf/util/event.h
>> @@ -427,5 +427,6 @@ void  cpu_map_data__synthesize(struct =
perf_record_cpu_map_data *data, struct per
>>=20
>> void arch_perf_parse_sample_weight(struct perf_sample *data, const =
__u64 *array, u64 type);
>> void arch_perf_synthesize_sample_weight(const struct perf_sample =
*data, __u64 *array, u64 type);
>> +const char *arch_perf_header_entry__add(const char *se_header);
>>=20
>> #endif /* __PERF_RECORD_H */
>> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
>> index 0d5ad42812b9..741a6df29fa0 100644
>> --- a/tools/perf/util/sort.c
>> +++ b/tools/perf/util/sort.c
>> @@ -25,6 +25,7 @@
>> #include <traceevent/event-parse.h>
>> #include "mem-events.h"
>> #include "annotate.h"
>> +#include "event.h"
>> #include "time-utils.h"
>> #include "cgroup.h"
>> #include "machine.h"
>> @@ -45,6 +46,7 @@
>> regex_t		ignore_callees_regex;
>> int		have_ignore_callees =3D 0;
>> enum sort_mode	sort__mode =3D SORT_MODE__NORMAL;
>> +const char	*dynamic_headers[] =3D {"local_ins_lat"};
>>=20
>> /*
>>  * Replaces all occurrences of a char used with the:
>> @@ -1816,6 +1818,16 @@ struct sort_dimension {
>> 	int			taken;
>> };
>>=20
>> +const char * __weak arch_perf_header_entry__add(const char =
*se_header)
>=20
> no need for the __add suffix in here
>=20
> jirka
>=20

Thanks Jiri for the review.

I will include this change in next version.

Thanks
Athira

>> +{
>> +	return se_header;
>> +}
>> +
>> +static void sort_dimension_add_dynamic_header(struct sort_dimension =
*sd)
>> +{
>> +	sd->entry->se_header =3D =
arch_perf_header_entry__add(sd->entry->se_header);
>> +}
>> +
>> #define DIM(d, n, func) [d] =3D { .name =3D n, .entry =3D &(func) }
>>=20
>> static struct sort_dimension common_sort_dimensions[] =3D {
>> @@ -2739,11 +2751,16 @@ int sort_dimension__add(struct perf_hpp_list =
*list, const char *tok,
>> 			struct evlist *evlist,
>> 			int level)
>> {
>> -	unsigned int i;
>> +	unsigned int i, j;
>>=20
>> 	for (i =3D 0; i < ARRAY_SIZE(common_sort_dimensions); i++) {
>> 		struct sort_dimension *sd =3D =
&common_sort_dimensions[i];
>>=20
>> +		for (j =3D 0; j < ARRAY_SIZE(dynamic_headers); j++) {
>> +			if (!strcmp(dynamic_headers[j], sd->name))
>> +				sort_dimension_add_dynamic_header(sd);
>> +		}
>> +
>> 		if (strncasecmp(tok, sd->name, strlen(tok)))
>> 			continue;
>>=20
>> --=20
>> 1.8.3.1

