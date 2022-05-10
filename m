Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76843521913
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 15:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyK0M1rRBz3cLJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 23:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dOAbDwDi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dOAbDwDi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyJzb4R81z2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:39:07 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24ACfZOG019034;
 Tue, 10 May 2022 13:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=YF6myPAayCBnBVmWei8iPhGyU8lb2wIlzZNK29UirrA=;
 b=dOAbDwDicnLidKgQt5x4tLt+wFN0KCW8aTxUrU4gDfbIDYz/vjVZOxzgBmSCJXxmOb6n
 mwKnNJyLC7LUbFSdxnvCPK1GWODP7B/OkaliHVIMwDvns6t0eGB1XAvEZwYvBbrAERpB
 dFSpYE8c73qiiafbZFc+9CVOn3ur7+yNCaPLNqCJV6xt5ez6kUndNHqBK63Ng8RgINKc
 Wl4g/x34pljVikzvFvMf5Q2L24K7C9a2QxrRSIEObDYSjZ393kQmerb2BV7GrXzprm2d
 0somMbHGM/98fCgf7UQAS6lb2Gxy7zRsz8mA0fLlLQxPCucrD6F7s+9PENna56m7704G nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyncevqjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:39:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24ACgBp9019693;
 Tue, 10 May 2022 13:39:01 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyncevqhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:39:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ADcRxN013025;
 Tue, 10 May 2022 13:38:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8v53q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:38:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ADcuhi44630410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 13:38:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79C08AE04D;
 Tue, 10 May 2022 13:38:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C930AE045;
 Tue, 10 May 2022 13:38:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.24.192])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 10 May 2022 13:38:52 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V2 1/2] tools/perf: Add utility function to read
 /proc/cpuinfo for any field
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <460BE4F4-9748-40E4-94F3-B4263FD34D5F@linux.vnet.ibm.com>
Date: Tue, 10 May 2022 19:08:47 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC9A38D1-E972-4F9B-8C76-8EBDC03FA6F1@linux.vnet.ibm.com>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
 <20220505094000.58220-2-atrajeev@linux.vnet.ibm.com>
 <YnQIYdqh9VsKm2aX@kernel.org>
 <460BE4F4-9748-40E4-94F3-B4263FD34D5F@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hgeqLEwAJ84NmTonXvVm4i7Y2RCNcYkz
X-Proofpoint-ORIG-GUID: NBoUvxidtotvfsAzBZYxG2ZBbdYg9-hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205100060
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-May-2022, at 3:03 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
>> On 05-May-2022, at 10:54 PM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>>=20
>> Em Thu, May 05, 2022 at 03:09:59PM +0530, Athira Rajeev escreveu:
>>> /proc/cpuinfo provides information about type of processor, number
>>> of CPU's etc. Reading /proc/cpuinfo file outputs useful information
>>> by field name like cpu, platform, model (depending on architecture)
>>> and its value separated by colon.
>>>=20
>>> Add new utility function "cpuinfo_field" in "util/header.c" which
>>> accepts field name as input string to search in /proc/cpuinfo =
content.
>>> This returns the first matching value as resulting string. Example,
>>> calling the function "cpuinfo_field(platform)" in powerpc returns
>>> the platform value. This can be used to fetch processor information
>>> from "cpuinfo" by other utilities/testcases.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> tools/perf/util/header.c | 53 =
++++++++++++++++++++++++++++++++++++++++
>>> tools/perf/util/header.h |  1 +
>>> 2 files changed, 54 insertions(+)
>>>=20
>>> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
>>> index a27132e5a5ef..f08857f96606 100644
>>> --- a/tools/perf/util/header.c
>>> +++ b/tools/perf/util/header.c
>>> @@ -983,6 +983,59 @@ static int write_dir_format(struct feat_fd *ff,
>>> 	return do_write(ff, &data->dir.version, =
sizeof(data->dir.version));
>>> }
>>>=20
>>> +/*
>>> + * Return entry from /proc/cpuinfo
>>> + * indicated by "search" parameter.
>>> + */
>>> +char *cpuinfo_field(const char *search)
>>> +{
>>> +	FILE *file;
>>> +	char *buf =3D NULL;
>>> +	char *copy_buf =3D NULL, *p;
>>> +	size_t len =3D 0;
>>> +
>>> +	if (!search)
>>> +		return NULL;
>>> +
>>> +	file =3D fopen("/proc/cpuinfo", "r");
>>> +	if (!file)
>>> +		return NULL;
>>> +
>>> +	while (getline(&buf, &len, file) > 0) {
>>> +		if (!strncmp(buf, search, strlen(search)))
>>=20
>> Can you save the search string lenght in a variable and use it =
instead
>> of calling strlen() for the same buffer for each line in =
/proc/cpuinfo?
>=20
>=20
> Hi Arnaldo, Michael
>=20
> Thanks for review comments. Based on suggestion from Michael, I am =
reworking on patch 2 to SKIP the test
> if physical_id is set to -1 irrespective of value from cpuinfo.
>=20
> In this patch, I had written "cpuinfo_field " function as generic =
function for retrieving any entry from /proc/cpuinfo.
> But it won't be used in patch 2 now. Do you think this function is =
useful to keep ? Otherwise, I will drop patch 1

Hi,

Requesting for suggestions on this change

Thanks
Athira
>=20
> Thanks
> Athira Rajeev
>=20
>>=20
>>> +			break;
>>> +	}
>>> +
>>> +	if (feof(file))
>>> +		goto done;
>>> +
>>> +	/*
>>> +	 * Trim the new line and separate
>>> +	 * value for search field from ":"
>>> +	 * in cpuinfo line output.
>>> +	 * Example output line:
>>> +	 * platform : <value>
>>> +	 */
>>> +	copy_buf =3D buf;
>>> +	p =3D strchr(copy_buf, ':');
>>=20
>> So you assume that this will always be there, right? Shouldn't we not
>> assume that and check if p is NULL and bail out instead?
>>=20
>>> +
>>> +	/* Go to string after ":" */
>>> +	copy_buf =3D p + 1;
>>> +	p =3D strchr(copy_buf, '\n');
>>=20
>> Ditto.
>>=20
>>> +	if (p)
>>> +		*p =3D '\0';
>>> +
>>> +	/* Copy the filtered string after removing space to buf */
>>> +	strcpy(buf, strim(copy_buf));
>>> +
>>> +	fclose(file);
>>> +	return buf;
>>> +
>>> +done:
>>=20
>> Please rename this goto label to "not_found", "done" isn't intention
>> revealing.
>>=20
>>> +	free(buf);
>>> +	fclose(file);
>>> +	return NULL;
>>> +}
>>> /*
>>> * Check whether a CPU is online
>>> *
>>> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
>>> index 0eb4bc29a5a4..b0f754364bd4 100644
>>> --- a/tools/perf/util/header.h
>>> +++ b/tools/perf/util/header.h
>>> @@ -166,4 +166,5 @@ int get_cpuid(char *buffer, size_t sz);
>>>=20
>>> char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
>>> int strcmp_cpuid_str(const char *s1, const char *s2);
>>> +char *cpuinfo_field(const char *search);
>>> #endif /* __PERF_HEADER_H */
>>> --=20
>>> 2.35.1
>>=20
>> --=20
>>=20
>> - Arnaldo

