Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030079C6F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 08:34:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PcXSaz9v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlDM31fpPz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 16:34:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PcXSaz9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlDL667w1z2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 16:33:18 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C68VO8021002;
	Tue, 12 Sep 2023 06:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Fu7tq+b058Ajqq3XTD1GxC0ZloO//yLnbNmgJSEs0Ac=;
 b=PcXSaz9vZhceuNr+4+nGavoaUFgeC271RGJZpaf7n1qff8ziIakKS/WQ4Bmidp80bbNm
 K+X7nHlceWK2+qM/xDXPCDxpqwgPM7ghgh1/VYcVxfcfR4I7Qj2DU82CTj9+nPzup648
 pAcp9/iHonRNMFDuwDXfQbh4xy6PqgNMO0WS45KTAMJ7ItP1vxM1/02OFc39KN5ATkjM
 nJ1CmMkqT7joZ1eF8o4urpcGmm4mZd21fZIbqCUJ6ZD0rNr9NBtryZOYhsMMsZ3tlTRH
 KG8zxdLmLZRlWJYsPhqY2qOu6UElo/z1F00h4afHEvU05EN07vRuZ8bshh90LHAeqQy7 DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2j6erw1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 06:32:59 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38C6ALpX027587;
	Tue, 12 Sep 2023 06:32:58 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2j6ervxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 06:32:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38C552QD011980;
	Tue, 12 Sep 2023 06:32:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t15r1rbcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 06:32:55 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38C6Wqo644433920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 06:32:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDE0420049;
	Tue, 12 Sep 2023 06:32:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52DFA20040;
	Tue, 12 Sep 2023 06:32:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.60.12])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 12 Sep 2023 06:32:49 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2] tools/perf: Add includes for detected configs in
 Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fVZacRGiU2e1_vW8WWd4tF6f2msbBvA7+U7VqkRinR31w@mail.gmail.com>
Date: Tue, 12 Sep 2023 12:02:36 +0530
Message-Id: <6C1BA86A-ED51-48C2-8EFC-9659542B6A83@linux.vnet.ibm.com>
References: <20230908145045.47408-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fVZacRGiU2e1_vW8WWd4tF6f2msbBvA7+U7VqkRinR31w@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d_t5fstYpZPCNCDvHkioo8-PzoJwybgD
X-Proofpoint-ORIG-GUID: yW5gUdUD1rarBAFqewYyi9GjqiSDtpva
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120054
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Sep-2023, at 9:45 PM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Fri, Sep 8, 2023 at 7:51=E2=80=AFAM Athira Rajeev
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
>> Changelog:
>> v1 -> v2:
>> Added $(OUTPUT) prefix to config-detected as pointed
>> out by Ian
>>=20
>> tools/perf/Makefile.perf | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>> index 37af6df7b978..66b9dc61c32f 100644
>> --- a/tools/perf/Makefile.perf
>> +++ b/tools/perf/Makefile.perf
>> @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>>=20
>> python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD=
) $(OUTPUT)python/perf*.so
>>=20
>> +# Use the detected configuration
>> +include $(OUTPUT).config-detected
>=20
> The Makefile.build version also has a "-include" rather than "include"
> in case the .config-detected file is missing. In Makefile.perf
> including Makefile.config is optional:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/Makefile.perf?h=3Dperf-tools-next#n253
>=20
> and there are certain targets that where we don't include it:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/Makefile.perf?h=3Dperf-tools-next#n200
>=20
> So playing devil's advocate, if we ran "make clean" we'd remove
> .config-detected:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/Makefile.perf?h=3Dperf-tools-next#n1131
>=20
> If we then ran "make tags" then we wouldn't include Makefile.config
> and so .config-detected wouldn't be generated and I think the build
> would fail due to a missing include here. So I think this should be
> -include or perhaps:

Hi Ian

Thanks for checking in detail. Yes, make clean in perf fails with just =E2=
=80=9Cinclude=E2=80=9D

# make clean
Makefile.perf:355: .config-detected: No such file or directory
make[1]: *** No rule to make target '.config-detected'.  Stop.
make: *** [Makefile:90: clean] Error 2


Below change will be correct as you pointed:

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 66b9dc61c32f..f6fdc2d5a92f 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -352,7 +352,7 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
 python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) =
$(OUTPUT)python/perf*.so
   # Use the detected configuration
-include $(OUTPUT).config-detected
+-include $(OUTPUT).config-detected
   ifeq ($(CONFIG_LIBTRACEEVENT),y)
   PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)


I could test to make sure it includes the file when it is present and picks=
 the detected configs correctly as well with this change.
Adding this change in V3=20

Thanks
Athira
>=20
> ifeq ($(config),1)
> include $(OUTPUT).config-detected
> endif
>=20
> Thanks,
> Ian
>=20
>> +
>> ifeq ($(CONFIG_LIBTRACEEVENT),y)
>>   PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)
>> else
>> --
>> 2.31.1


