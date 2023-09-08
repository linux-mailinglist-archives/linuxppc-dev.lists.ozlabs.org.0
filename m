Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9027F79886C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 16:19:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LRNBUl5Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhysQ2kM0z3cR0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LRNBUl5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhyrT1jWPz3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 00:18:17 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388E8hU0030383;
	Fri, 8 Sep 2023 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+o8wzrnxyaV9ywL/NgYvDm8CPNXPm5BwPj19YC8AJEo=;
 b=LRNBUl5YprS2lCgB4dWyN+9NQZju7fuIFIWVeFErlsmX1K3uN1NXqxUnhjr4/2iCMIEN
 FmtC2edcToSiwvthkRLgeXYS31VBKoePjHPamXYO86b2Sqyy7C7EJ/3wLOis0tTl2lcQ
 Bz2z9oE2jO3quhgJnuFFmpbz0a4hIsvHWPnkE/QPJLuf63zRJV636CoYP3l4hKaWl3Zd
 Y/l547dFSRrQ0OSMp0ERybuePihCf+fOOf/S5DD/LC3hIJ+/UMgyI+4LCLKUA15EsFUJ
 rNrZ3PIx8XgiATLSCL0d8UYuvfkuY1ittc4zWKIaZb0Ug0LqqDhOMfiNpDXYkYd8fMly Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t04dshnwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:18:11 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388EHRhO016503;
	Fri, 8 Sep 2023 14:18:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t04dshnvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:18:11 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388DPTno026770;
	Fri, 8 Sep 2023 14:18:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgcp4607-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 14:18:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388EI6dN39256544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 14:18:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 880D520049;
	Fri,  8 Sep 2023 14:18:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94A332004B;
	Fri,  8 Sep 2023 14:18:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.123.252])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 Sep 2023 14:18:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] tools/perf: Add includes for detected configs in
 Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fXSAzpdf0dH4kdPKRVjonC2wBF2oD56_=2NE0iBs96EOA@mail.gmail.com>
Date: Fri, 8 Sep 2023 19:47:53 +0530
Message-Id: <5B185B8B-A076-4984-BC18-C21E43608273@linux.vnet.ibm.com>
References: <20230907171944.36953-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXSAzpdf0dH4kdPKRVjonC2wBF2oD56_=2NE0iBs96EOA@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1uwBFN6Nmg7yjqBnqmKNdT4U5-HTmVlG
X-Proofpoint-GUID: uDCf8fhF5K-Wj9aEi0Cv9aWsYQcZNeps
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080130
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Sep-2023, at 4:41 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Thu, Sep 7, 2023 at 10:19=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Makefile.perf uses "CONFIG_*" checks in the code. Example the config
>> for libtraceevent is used to set PYTHON_EXT_SRCS
>>=20
>>        ifeq ($(CONFIG_LIBTRACEEVENT),y)
>>          PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-source=
s)
>>        else
>>          PYTHON_EXT_SRCS :=3D $(shell grep -v '^\#\|util/trace-event.c' =
util/python-ext-sources)
>>        endif
>>=20
>> But this is not picking the value for CONFIG_LIBTRACEEVENT that is
>> set using the settings in Makefile.config. Include the file
>> ".config-detected" so that make will use the system detected
>> configuration in the CONFIG checks. This will fix isues that
>> could arise when other "CONFIG_*" checks are added to Makefile.perf
>> in future as well.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/Makefile.perf | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>> index 37af6df7b978..6764b0e156f4 100644
>> --- a/tools/perf/Makefile.perf
>> +++ b/tools/perf/Makefile.perf
>> @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>>=20
>> python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD=
) $(OUTPUT)python/perf*.so
>>=20
>> +# Use the detected configuration
>> +include .config-detected
>=20
> Good catch! I think it should look like:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/build/Makefile.build?h=3Dperf-tools-next#n40
>=20
> Thanks,
> Ian

Thanks for the review Ian.

Yes, missed the $(OUTPUT) . Will send a V2 with this change

Athira
>=20
>> +
>> ifeq ($(CONFIG_LIBTRACEEVENT),y)
>>   PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)
>> else
>> --
>> 2.31.1


