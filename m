Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD67AF956
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 06:26:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dD4hRWyA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwNpv1dpSz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 14:26:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dD4hRWyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwNp23j9fz3cCT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 14:25:46 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R4BorI009148;
	Wed, 27 Sep 2023 04:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=q9TtiU3BtCVHCiGUvvXyh0wTKy0oz1JYTphoQNehZOQ=;
 b=dD4hRWyAp/jXRHK61Ro0GAF500O1LySdAGCWZt9Kjxl0nv+UILbdepBGIc/o8MJ+lnkh
 ZFCkwm3yJomga/wX/1UvZn7l+2deH6l+m/o9+GwBAC0siwYPSqZoa1xrLE/BY75wsCEz
 LtyueFkAB3pYbnuku5WQOvTjPXQGjIKZXVAu7IVjjXqvMamBal3NcSVxK2xeb+uG+r58
 DbGyklee0saUjm+r1VuCqF8vqnlcLt3s4eWCfKjN1nX1xM1LF1/RIP/t44q15q3x3RoU
 lVFIyQgT8vcvsntOWhybLgnlGudf6y0A6D6MNb7IMDFHOrHSwpQ25bbhOepoUfxWM6nw WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5c87rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:25:39 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38R4CXEp011332;
	Wed, 27 Sep 2023 04:25:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5c87ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:25:38 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38R20txF008154;
	Wed, 27 Sep 2023 04:25:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taaqygwv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:25:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38R4PY1B11469504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 04:25:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB3A32004B;
	Wed, 27 Sep 2023 04:25:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDA2620040;
	Wed, 27 Sep 2023 04:25:31 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.105.243])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Sep 2023 04:25:31 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 2/2] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7ciBmHrjB98E6SoVrcULgeviYa=K8ONk1KAP3T5nqnYU4w@mail.gmail.com>
Date: Wed, 27 Sep 2023 09:55:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F9878500-1FDD-4829-A981-2B1EEF9B6BF0@linux.vnet.ibm.com>
References: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
 <20230914171827.98507-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7ciBmHrjB98E6SoVrcULgeviYa=K8ONk1KAP3T5nqnYU4w@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DY743piAHWi7QgNkOL2Gw2qYNOfQGw7X
X-Proofpoint-ORIG-GUID: YBHjURF95paxDekXeqHkfppkNRSG3zRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_19,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270032
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Sep-2023, at 5:25 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> On Thu, Sep 14, 2023 at 10:18=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Add rule in new Makefile "tests/Makefile.tests" for running
>> shellcheck on shell test scripts. This automates below shellcheck
>> into the build.
>>=20
>>        $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do =
shellcheck -S warning $F; done
>=20
> I think you can do it if $(shell command -v shellcheck) returns
> non-empty string (the path to the shellcheck).  Then the feature
> test logic can be gone.

Ok, I will try this.
>=20
>>=20
>> CONFIG_SHELLCHECK check is added to avoid build breakage in
>> the absence of shellcheck binary. Update Makefile.perf to contain
>> new rule for "SHELLCHECK_TEST" which is for making shellcheck
>> test as a dependency on perf binary. Added "tests/Makefile.tests"
>> to run shellcheck on shellscripts in tests/shell. The make rule
>> "SHLLCHECK_RUN" ensures that, every time during make, shellcheck
>> will be run only on modified files during subsequent invocations.
>> By this, if any newly added shell scripts or fixes in existing
>> scripts breaks coding/formatting style, it will get captured
>> during the perf build.
>=20
> Can you show me the example output?

Sure, I will add it.
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/Makefile.perf        | 12 +++++++++++-
>> tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
>> 2 files changed, 35 insertions(+), 1 deletion(-)
>> create mode 100644 tools/perf/tests/Makefile.tests
>>=20
>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>> index f6fdc2d5a92f..c27f54771e90 100644
>> --- a/tools/perf/Makefile.perf
>> +++ b/tools/perf/Makefile.perf
>> @@ -667,7 +667,16 @@ $(PERF_IN): prepare FORCE
>> $(PMU_EVENTS_IN): FORCE prepare
>>        $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build =
dir=3Dpmu-events obj=3Dpmu-events
>>=20
>> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
>> +# Runs shellcheck on perf test shell scripts
>> +ifeq ($(CONFIG_SHELLCHECK),y)
>> +SHELLCHECK_TEST: FORCE prepare
>> +       $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
>> +else
>> +SHELLCHECK_TEST:
>> +       @:
>> +endif
>> +
>> +$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) =
SHELLCHECK_TEST
>>        $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
>>                $(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
>>=20
>> @@ -1129,6 +1138,7 @@ bpf-skel-clean:
>>        $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) =
$(SKELETONS)
>>=20
>> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean =
$(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean =
bpf-skel-clean tests-coresight-targets-clean
>> +       $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests =
clean
>>        $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) =
$(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>>        $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name =
'\.*.cmd' -delete -o -name '\.*.d' -delete
>>        $(Q)$(RM) $(OUTPUT).config-detected
>> diff --git a/tools/perf/tests/Makefile.tests =
b/tools/perf/tests/Makefile.tests
>> new file mode 100644
>> index 000000000000..e74575559e83
>> --- /dev/null
>> +++ b/tools/perf/tests/Makefile.tests
>> @@ -0,0 +1,24 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
>> +-include $(OUTPUT).config-detected
>> +
>> +log_file =3D $(OUTPUT)shellcheck_test.log
>> +PROGS =3D $(subst ./,,$(shell find tests/shell -perm -o=3Dx -type f =
-name '*.sh'))
>> +DEPS =3D $(addprefix output/,$(addsuffix .dep,$(basename $(PROGS))))
>> +DIRS =3D $(shell echo $(dir $(DEPS)) | xargs -n1 | sort -u | xargs)
>> +
>> +.PHONY: all
>> +all: SHELLCHECK_RUN
>> +       @:
>> +
>> +SHELLCHECK_RUN: $(DEPS) $(DIRS)
>> +
>> +output/%.dep: %.sh | $(DIRS)
>> +       $(call rule_mkdir)
>> +       $(Q)$(call frecho-cmd,test)@touch $@
>> +       $(Q)$(call frecho-cmd,test)@shellcheck -S warning $(subst =
output/,./,$(patsubst %.dep, %.sh, $@)) 1> ${log_file} && ([[ ! -s =
${log_file} ]])
>=20
> This line is too long, please wrap it with some backslashes.
Ok

I will address all the comments in next version

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>=20
>> +$(DIRS):
>> +       @mkdir -p $@
>> +
>> +clean:
>> +       @rm -rf $(log_file) output
>> --
>> 2.31.1


