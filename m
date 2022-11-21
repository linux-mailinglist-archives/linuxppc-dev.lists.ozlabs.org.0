Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4D632B2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 18:38:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGF3P2RgJz3dvV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:38:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VArIJaAv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VArIJaAv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGF2V4w5gz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:37:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALFtlgq003722;
	Mon, 21 Nov 2022 17:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=69NpziRK5OQyRmiVgdzk80D3Ia+MTTcNWHfAhoXrXWY=;
 b=VArIJaAvjAVBSoVNdJcHGRzEwNoy6Cfs5jQ3z6xNWYV5Azzh79jG6Zlfe0Cudf5eFRxi
 7ur8ZGyHslK3lXbOyqEWNoPRSn28niE7aczY4ZNuSqZQTbQRZ3mLCJWe7msry6R5N+b2
 1LvBobo8E+pubqS2tirAWEaiAbrjtdqfYneIyTtF/gMtLOc5FC3eDRX2gzDSHqNLZL7M
 FsOX64dYR7ItRBdBkK28azMB/0/tdQ9f6Jc1iNurgXXau4TGeZcS+5f21rmYTuZZQ3Mb
 WbOT2GAP07iI0tBBdTB1Clys5nlWtzPb1RlYNtzRQj4AbhZIcc1P2TPYo0r/SGFYrOwA 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0cdaakjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 17:37:12 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ALHSbRT028227;
	Mon, 21 Nov 2022 17:37:12 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0cdaakhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 17:37:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ALHb9Mg001910;
	Mon, 21 Nov 2022 17:37:09 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdhu197-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 17:37:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ALHb6iv34275750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 17:37:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 635934C044;
	Mon, 21 Nov 2022 17:37:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAF694C04A;
	Mon, 21 Nov 2022 17:37:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.85.57])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Mon, 21 Nov 2022 17:37:03 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH V2] tools/perf: Fix printing field separator in CSV
 metrics output
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20221114085523.86570-1-atrajeev@linux.vnet.ibm.com>
Date: Mon, 21 Nov 2022 23:07:01 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <265748F8-7BD4-4F55-B693-59F7C6EA2848@linux.vnet.ibm.com>
References: <20221114085523.86570-1-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0fWhSgnKFEp1_zvnQzAomplpJGFgRGsu
X-Proofpoint-GUID: J4K50hGN7U1isSOCOyUAqXPXcO_yjjaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_14,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210132
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, James Clark <james.clark@arm.com>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Nov-2022, at 2:25 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> In perf stat with CSV output option, number of fields
> in metrics output is not matching with number of fields
> in other event output lines.
>=20
> Sample output below after applying patch to fix
> printing os->prefix.
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
> 	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
> 	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
> 	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
> 	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
> 	=
S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycles =
idle
> 	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend =
cycles idle
> 	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
> =3D=3D=3D>	S0,1,,,,,,,1.34,stalled cycles per insn
>=20
> The above command line uses field separator as ","
> via "-x," option and per-socket option displays
> socket value as first field. But here the last line
> for "stalled cycles per insn" has more separators.
> Each csv output line is expected to have 8 field
> separatorsi (for the 9 fields), where as last line
> has 10 "," in the result. Patch fixes this issue.
>=20
> The counter stats are displayed by function
> "perf_stat__print_shadow_stats" in code
> "util/stat-shadow.c". While printing the stats info
> for "stalled cycles per insn", function "new_line_csv"
> is used as new_line callback.
>=20
> The fields printed in each line contains:
> "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
>=20
> The metric output prints Socket_id, aggr nr, ratio
> and unit. It has to skip through remaining five fields
> ie, Avg,unit,event_name,run,enable_percent. The csv
> line callback uses "os->nfields" to know the number of
> fields to skip to match with other lines.
> Currently it is set as:
> 	os.nfields =3D 3 + aggr_fields[config->aggr_mode] + =
(counter->cgrp ? 1 : 0);
>=20
> But in case of aggregation modes, csv_sep already
> gets printed along with each field (Function "aggr_printout"
> in util/stat-display.c). So aggr_fields can be
> removed from nfields. And fixed number of fields to
> skip has to be "4". This is to skip fields for:
> "avg, unit, event name, run, enable_percent"
> Example from line for instructions:
> "1.89,msec,cpu-clock,1887692,100.00"
>=20
> This needs 4 csv separators. Patch removes aggr_fields
> and uses 4 as fixed number of os->nfields to skip.
>=20
> After the patch:
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
> 	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
> 	-------
> 	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
> 	S0,1,,,,,,1.81,stalled cycles per insn
>=20
> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Reviewed-By: Kajol Jain <kjain@linux.ibm.com>
> Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> - Rebased on top of latest source.
> - Added Reviewed-by and Tested-by from Kajol and
>  Disha.
>=20

Hi Arnaldo

This v2 is rebased one. Please share your comments

Thanks
Athira
> tools/perf/util/stat-display.c | 13 +------------
> 1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/tools/perf/util/stat-display.c =
b/tools/perf/util/stat-display.c
> index ba66bb7fc1ca..5ce14bf18055 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -551,20 +551,9 @@ static void printout(struct perf_stat_config =
*config, struct aggr_cpu_id id, int
> 	new_line_t nl;
>=20
> 	if (config->csv_output) {
> -		static const int aggr_fields[AGGR_MAX] =3D {
> -			[AGGR_NONE] =3D 1,
> -			[AGGR_GLOBAL] =3D 0,
> -			[AGGR_SOCKET] =3D 2,
> -			[AGGR_DIE] =3D 2,
> -			[AGGR_CORE] =3D 2,
> -			[AGGR_THREAD] =3D 1,
> -			[AGGR_UNSET] =3D 0,
> -			[AGGR_NODE] =3D 1,
> -		};
> -
> 		pm =3D config->metric_only ? print_metric_only_csv : =
print_metric_csv;
> 		nl =3D config->metric_only ? new_line_metric : =
new_line_csv;
> -		os.nfields =3D 3 + aggr_fields[config->aggr_mode] + =
(counter->cgrp ? 1 : 0);
> +		os.nfields =3D 4 + (counter->cgrp ? 1 : 0);
> 	} else if (config->json_output) {
> 		pm =3D config->metric_only ? print_metric_only_json : =
print_metric_json;
> 		nl =3D config->metric_only ? new_line_metric : =
new_line_json;
> --=20
> 2.31.1
>=20

