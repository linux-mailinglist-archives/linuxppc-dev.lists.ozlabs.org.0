Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B985F666E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjrn83pSyz3dqV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:47:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMPIK/nj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMPIK/nj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjrmB72hKz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 23:46:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296BaTZd008139;
	Thu, 6 Oct 2022 12:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bpYvXdFJNEPpfk2V/7a8JoYvpN88qFJ7VwBwMvkPYDg=;
 b=aMPIK/njlSwQAGFnvXhmN3v3BJrwnsZwlNplIGOL/wDDldGxyNoE87LRH5MIaJmDh4oe
 df4yzZkYmHMY+H+jx8Uj7jFI9kKQ02ZA2xbsqRCBPKGWV+CKBg5gTk2ShWSNxRmbp2sm
 T6jLNr5QERkqTNbqvEX2Lxm2Gp1IW0331flJRnuQkJlBBfkIs4+HbY/553rVErE/SQfM
 5g5Q63T9i6J9/cs3xj70sn9yF/WYBeBQnOGblpcrIiFP4qHqmwDzqgdZ4IjTH4vF/uuZ
 W8k6Nqmj08nw/ga8rlGlMIj1LCy3x9yDlGOt/s0ya14aTPnrNwUwQdWkFTbsPFgHlMUu 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1x21a9tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 12:46:26 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296Bcm8q014155;
	Thu, 6 Oct 2022 12:46:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1x21a9sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 12:46:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296CcdA7013388;
	Thu, 6 Oct 2022 12:46:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jxd697258-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 12:46:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296CkJ8858720512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 12:46:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93F94C040;
	Thu,  6 Oct 2022 12:46:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F346F4C046;
	Thu,  6 Oct 2022 12:46:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.29.124])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Oct 2022 12:46:16 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Yz16FdcUF+Wn8xvA@kernel.org>
Date: Thu, 6 Oct 2022 18:16:14 +0530
Message-Id: <3D36EC01-B516-46CA-BC71-010617DB4A9D@linux.vnet.ibm.com>
References: <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com>
 <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
 <Yzx4A+2I4yWTlbEn@kernel.org> <Yzx4ET7QU2VpCcsx@kernel.org>
 <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
 <Yz14hG3EVJPph11m@kernel.org> <Yz16FdcUF+Wn8xvA@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i8x_S5FTYMVetyfK1eSCENvubEXKjQ6X
X-Proofpoint-GUID: e7z-AvkeC6j9_RLMTP15oAaQ7YozHspJ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_02,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060075
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Oct-2022, at 6:05 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>=20
> Em Wed, Oct 05, 2022 at 09:28:52AM -0300, Arnaldo Carvalho de Melo escrev=
eu:
>> Em Wed, Oct 05, 2022 at 10:23:39AM +0530, Athira Rajeev escreveu:
>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-disp=
lay.c
>>> index b82844cb0ce7..cf28020798ec 100644
>>> --- a/tools/perf/util/stat-display.c
>>> +++ b/tools/perf/util/stat-display.c
>>> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *=
config,
>>> 					id.socket,
>>> 					id.die,
>>> 					id.core);
>>> -			} else if (id.core > -1) {
>>> +			} else if (id.cpu.cpu > -1) {
>>> 				fprintf(config->output, "\"cpu\" : \"%d\", ",
>>> 					id.cpu.cpu);
>>> 			}
>>> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *=
config,
>>> 					id.die,
>>> 					config->csv_output ? 0 : -3,
>>> 					id.core, config->csv_sep);
>>> -			} else if (id.core > -1) {
>>> +			} else if (id.cpu.cpu > -1) {
>>> 				fprintf(config->output, "CPU%*d%s",
>>> 					config->csv_output ? 0 : -7,
>>> 					id.cpu.cpu, config->csv_sep);
>>> --=20
>>> If it is confusing, shall I send it as a separate patch along with Test=
ed-by from Ian ?
>>=20
>> I'll have to do this by hand, tried pointing b4 to this message and it
>> picked the old one, also tried to save the message and apply by hand,
>> its mangled.
>=20
> This is what I have now, will force push later, please triple check :-)


Sorry for all the confusion Arnaldo. Hereafter, I will resubmit the patch t=
o avoid this.
In below patch which you shared, code change is correct. But commit message=
 is different.
So to avoid further confusion, I went ahead and posted a separate patch in =
the mailing list with:

subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printo=
ut
Patch link: https://lore.kernel.org/lkml/20221006114225.66303-1-atrajeev@li=
nux.vnet.ibm.com/T/#u

Please pick the separately send patch.

Thanks
Athira

>=20
> - Arnaldo
>=20
> From b7dd96f9211e4ddbd6fa080da8dec2eac98d3f2a Mon Sep 17 00:00:00 2001
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Date: Tue, 13 Sep 2022 17:27:17 +0530
> Subject: [PATCH 1/1] perf stat: Fix aggr_printout to display CPU field
> irrespective of core value
>=20
> perf stat includes option to specify aggr_mode to display per-socket,
> per-core, per-die, per-node counter details.  Also there is option -A (
> AGGR_NONE, -no-aggr ), where the counter values are displayed for each
> CPU along with "CPU" value in one field of the output.
>=20
> Each of the aggregate mode uses the information fetched from
> "/sys/devices/system/cpu/cpuX/topology" like core_id,
> physical_package_id. Utility functions in "cpumap.c" fetches this
> information and populates the socket id, core id, CPU etc.  If the
> platform does not expose the topology information, these values will be
> set to -1. Example, in case of powerpc, details like physical_package_id
> is restricted to be exposed in pSeries platform. So id.socket, id.core,
> id.cpu all will be set as -1.
>=20
> In case of displaying socket or die value, there is no check done in the
> "aggr_printout" function to see if it points to valid socket id or die.
> But for displaying "cpu" value, there is a check for "if (id.core >
> -1)". In case of powerpc pSeries where detail like physical_package_id
> is restricted to be exposed, id.core will be set to -1. Hence the column
> or field itself for CPU won't be displayed in the output.
>=20
> Result for per-socket:
>=20
>  perf stat -e branches --per-socket -a true
>=20
>   Performance counter stats for 'system wide':
>=20
>  S-1      32            416,851      branches
>=20
> Here S has -1 in above result. But with -A option which also expects CPU
> in one column in the result, below is observed.
>=20
>  perf stat -e instructions -A -a true
>=20
>   Performance counter stats for 'system wide':
>=20
>            47,146      instructions
>            45,226      instructions
>            43,354      instructions
>            45,184      instructions
>=20
> If the CPU id value is pointing to -1 also, it makes sense to display
> the column in the output to replicate the behaviour or to be in
> precedence with other aggr options(like per-socket, per-core). Remove
> the check "id.core" so that CPU field gets displayed in the output.
>=20
> After the fix:
>=20
>  perf stat -e instructions -A -a true
>=20
>   Performance counter stats for 'system wide':
>=20
>  CPU-1                  64,034      instructions
>  CPU-1                  68,941      instructions
>  CPU-1                  59,418      instructions
>  CPU-1                  70,478      instructions
>  CPU-1                  65,201      instructions
>  CPU-1                  63,704      instructions
>=20
> This is caught while running "perf test" for "stat+json_output.sh" and
> "stat+csv_output.sh".
>=20
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Suggested-by: Ian Rogers <irogers@google.com>
> Suggested-by: James Clark <james.clark@arm.com>
> Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Tested-by: Ian Rogers <irogers@google.com>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Kajol Jain <kjain@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Link: https://lore.kernel.org/r/20220913115717.36191-1-atrajeev@linux.vne=
t.ibm.com
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
> tools/perf/util/stat-display.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-displa=
y.c
> index df26fb5eb072be9f..5c47ee9963a7c04c 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *co=
nfig,
> 					id.socket,
> 					id.die,
> 					id.core);
> -			} else if (id.core > -1) {
> +			} else if (id.cpu.cpu > -1) {
> 				fprintf(config->output, "\"cpu\" : \"%d\", ",
> 					id.cpu.cpu);
> 			}
> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *co=
nfig,
> 					id.die,
> 					config->csv_output ? 0 : -3,
> 					id.core, config->csv_sep);
> -			} else if (id.core > -1) {
> +			} else if (id.cpu.cpu > -1) {
> 				fprintf(config->output, "CPU%*d%s",
> 					config->csv_output ? 0 : -7,
> 					id.cpu.cpu, config->csv_sep);
> --=20
> 2.37.3
>=20

