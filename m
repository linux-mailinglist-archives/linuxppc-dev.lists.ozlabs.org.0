Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD8615DF9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 09:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Kzd0XDNz3ds4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 19:38:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUVhjAse;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUVhjAse;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Kxq0RlMz3cMv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 19:37:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A27iAZJ009086;
	Wed, 2 Nov 2022 08:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=JivTOdfixVYHEs09laLwGqBUW7omVWi6ADjS+gN6678=;
 b=TUVhjAseGuRkIEd6zIM1vvngzvMeAOyuTKBpuvdEWhjCGdhA5hlrPq6Of10+FAA29BY9
 4m1VVjUNFdMJKcO+6DABPCyE4nwEF29WjyH5xOuisOYkHutCbl5WmTKWwChjMjh5Cb5J
 GdTwTMqsN30y0XDlHM8BztzsaTm2FcEp+rrGNQVue5+2h/wygALnvULazRLfmyYBxDo9
 NVMjMEjdzYbf7FU6S4o07dzL/4JOcgAsNAdqCpBmkNri/soB78a5JSrlT9aaC53IVyxw
 Fc4tbQ4c7gAwSpVGtIpwDo2CUX/ZCJHpHFa21GZ/GI3XOXb0k9z7m7qBhBt8vliF4OrJ pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjruhfa4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:36:53 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A26ixhw021423;
	Wed, 2 Nov 2022 08:36:53 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjruhfa3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:36:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A28LI3i007398;
	Wed, 2 Nov 2022 08:36:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3kgut9cpy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:36:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A28alKt26149568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 08:36:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D57FCA404D;
	Wed,  2 Nov 2022 08:36:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DA3EA4040;
	Wed,  2 Nov 2022 08:36:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.40.163])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Nov 2022 08:36:45 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] tools/perf: Fix printing os->prefix in CSV metrics
 output
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
Date: Wed, 2 Nov 2022 14:06:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B7A4A12-2528-439A-BB83-BBC5606A27B0@linux.vnet.ibm.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Andi Kleen <ak@linux.intel.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0464VflaKYXQX1Cglt2vR5w2L8BYf-x8
X-Proofpoint-ORIG-GUID: I75WzbeDYWs2yoj8ShEzQTuzEvCcV_2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_04,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020048
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, james.clark@arm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Oct-2022, at 2:26 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Perf stat with CSV output option prints an extra empty
> string as first field in metrics output line.
> Sample output below:
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
> 	S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
> 	S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
> 	S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
> 	S0,1,875807,,cycles,1769826,100.00,0.491,GHz
> 	S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend =
cycles idle
> 	S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend =
cycles idle
> 	S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
> =3D=3D=3D=3D>	,S0,1,,,,,,,2.00,stalled cycles per insn
>=20
> The above command line uses field separator as ","
> via "-x," option and per-socket option displays
> socket value as first field. But here the last line
> for "stalled cycles per insn" has "," in the
> beginning.
>=20
> Sample output using interval mode:
> 	# ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
> 	0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs =
utilized
> 	0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
> 	------
> 	0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn =
per cycle
> =3D=3D=3D=3D>	0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn
>=20
> Above result also has an extra csv separator after
> the timestamp. Patch addresses extra field separator
> in the beginning of the metric output line.
>=20
> The counter stats are displayed by function
> "perf_stat__print_shadow_stats" in code
> "util/stat-shadow.c". While printing the stats info
> for "stalled cycles per insn", function "new_line_csv"
> is used as new_line callback.
>=20
> The new_line_csv function has check for "os->prefix"
> and if prefix is not null, it will be printed along
> with cvs separator.
> Snippet from "new_line_csv":
> 	if (os->prefix)
>               fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
>=20
> Here os->prefix gets printed followed by ","
> which is the cvs separator. The os->prefix is
> used in interval mode option ( -I ), to print
> time stamp on every new line. But prefix is
> already set to contain csv separator when used
> in interval mode for csv option.
>=20
> Reference: Function "static void print_interval"
> Snippet:
> 	sprintf(prefix, "%6lu.%09lu%s", ts->tv_sec, ts->tv_nsec, =
config->csv_sep);
>=20
> Also if prefix is not assigned (if not used with
> -I option), it gets set to empty string.
> Reference: function printout() in util/stat-display.c
> Snippet:
> 	.prefix =3D prefix ? prefix : "",
>=20
> Since prefix already set to contain cvs_sep in interval
> option, patch removes printing config->csv_sep in
> new_line_csv function to avoid printing extra field.
>=20
> After the patch:
>=20
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
> 	S0,1,2,,context-switches,2041444,100.00,979.289,/sec
> 	S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
> 	S0,1,2,,page-faults,2040288,100.00,979.289,/sec
> 	S0,1,254589,,cycles,2036066,100.00,0.125,GHz
> 	=
S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles =
idle
> 	S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend =
cycles idle
> 	S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
> 	S0,1,,,,,,,1.27,stalled cycles per insn
>=20
> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Hi All,

Looking for review comments for this change.

Thanks
Athira

> ---
> tools/perf/util/stat-display.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/perf/util/stat-display.c =
b/tools/perf/util/stat-display.c
> index 5c47ee9963a7..879874a4bc07 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config =
*config, void *ctx)
>=20
> 	fputc('\n', os->fh);
> 	if (os->prefix)
> -		fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
> +		fprintf(os->fh, "%s", os->prefix);
> 	aggr_printout(config, os->evsel, os->id, os->nr);
> 	for (i =3D 0; i < os->nfields; i++)
> 		fputs(config->csv_sep, os->fh);
> --=20
> 2.31.1
>=20

