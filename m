Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C707B2AE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 06:19:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mftm4a8c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxcYf2dJhz3cD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 14:19:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mftm4a8c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxcXn13Cmz3c7v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 14:18:32 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38T4Bora026884;
	Fri, 29 Sep 2023 04:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cnANDNUEBqD0YAZSlcZH7UZpIhvacgkUflpVP7E1RLg=;
 b=Mftm4a8cDzbNeSgHEHhTTCxbdMTjLnggA7xLUaNiaC2R+NzvYTOt1+Z5lN51CoGvUERt
 uClbJUgfg+XloQrhWdkCK8wtaVD8uZgW/4bqnyuzc4M6dQy8eD3Jpzk02bxuGkjt65C6
 ecOtRr14Wz65DMgxBhM9w90EP0nYXg1uDe8hLAeiQO6ERQbx/4fG1jObEcYwth9yiOZL
 cFE4h0HryD3uxw9sLwI24kEoC1mIG35xBd38+6w9a8nVwkniQYMJNola37AaDzqiN1xW
 53UGMhugxLk1awpr7zMO2cizE6yWawqVrtYjuAlyR1fiWLkxfO6wsJEAt6fR6oH9+A6a 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdqbd04a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:18:27 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38T4Bnak026851;
	Fri, 29 Sep 2023 04:18:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdqbd04a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:18:27 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38T3nSQr030398;
	Fri, 29 Sep 2023 04:18:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad229ghc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:18:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38T4INuX9044732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Sep 2023 04:18:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82E3120043;
	Fri, 29 Sep 2023 04:18:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD44220040;
	Fri, 29 Sep 2023 04:18:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.86.96])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 Sep 2023 04:18:21 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <F9878500-1FDD-4829-A981-2B1EEF9B6BF0@linux.vnet.ibm.com>
Date: Fri, 29 Sep 2023 09:48:09 +0530
Message-Id: <A3A72749-DFD3-42C8-BA1D-10B65C0A1E13@linux.vnet.ibm.com>
References: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
 <20230914171827.98507-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7ciBmHrjB98E6SoVrcULgeviYa=K8ONk1KAP3T5nqnYU4w@mail.gmail.com>
 <F9878500-1FDD-4829-A981-2B1EEF9B6BF0@linux.vnet.ibm.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qX4eGbJHKxeRt51W6KffZxMq-9pOK3OI
X-Proofpoint-GUID: I0LUnxn8OYPnvkc8ZKb-9IkQMeAdwK4Z
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_01,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290034
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Sep-2023, at 9:55 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
rote:
>=20
>=20
>=20
>> On 27-Sep-2023, at 5:25 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>>=20
>> On Thu, Sep 14, 2023 at 10:18=E2=80=AFAM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Add rule in new Makefile "tests/Makefile.tests" for running
>>> shellcheck on shell test scripts. This automates below shellcheck
>>> into the build.
>>>=20
>>>       $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do she=
llcheck -S warning $F; done
>>=20
>> I think you can do it if $(shell command -v shellcheck) returns
>> non-empty string (the path to the shellcheck).  Then the feature
>> test logic can be gone.
>=20
> Ok, I will try this.
>>=20
>>>=20
>>> CONFIG_SHELLCHECK check is added to avoid build breakage in
>>> the absence of shellcheck binary. Update Makefile.perf to contain
>>> new rule for "SHELLCHECK_TEST" which is for making shellcheck
>>> test as a dependency on perf binary. Added "tests/Makefile.tests"
>>> to run shellcheck on shellscripts in tests/shell. The make rule
>>> "SHLLCHECK_RUN" ensures that, every time during make, shellcheck
>>> will be run only on modified files during subsequent invocations.
>>> By this, if any newly added shell scripts or fixes in existing
>>> scripts breaks coding/formatting style, it will get captured
>>> during the perf build.
>>=20
>> Can you show me the example output?
>=20
> Sure, I will add it.
>>=20
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> tools/perf/Makefile.perf        | 12 +++++++++++-
>>> tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
>>> 2 files changed, 35 insertions(+), 1 deletion(-)
>>> create mode 100644 tools/perf/tests/Makefile.tests
>>>=20
>>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>>> index f6fdc2d5a92f..c27f54771e90 100644
>>> --- a/tools/perf/Makefile.perf
>>> +++ b/tools/perf/Makefile.perf
>>> @@ -667,7 +667,16 @@ $(PERF_IN): prepare FORCE
>>> $(PMU_EVENTS_IN): FORCE prepare
>>>       $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=3Dpmu-ev=
ents obj=3Dpmu-events
>>>=20
>>> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
>>> +# Runs shellcheck on perf test shell scripts
>>> +ifeq ($(CONFIG_SHELLCHECK),y)
>>> +SHELLCHECK_TEST: FORCE prepare
>>> +       $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
>>> +else
>>> +SHELLCHECK_TEST:
>>> +       @:
>>> +endif
>>> +
>>> +$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) SHELLCHECK_TEST
>>>       $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
>>>               $(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
>>>=20
>>> @@ -1129,6 +1138,7 @@ bpf-skel-clean:
>>>       $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETON=
S)
>>>=20
>>> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)=
-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-core=
sight-targets-clean
>>> +       $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
>>>       $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-=
archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>>>       $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd'=
 -delete -o -name '\.*.d' -delete
>>>       $(Q)$(RM) $(OUTPUT).config-detected
>>> diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefil=
e.tests
>>> new file mode 100644
>>> index 000000000000..e74575559e83
>>> --- /dev/null
>>> +++ b/tools/perf/tests/Makefile.tests
>>> @@ -0,0 +1,24 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
>>> +-include $(OUTPUT).config-detected
>>> +
>>> +log_file =3D $(OUTPUT)shellcheck_test.log
>>> +PROGS =3D $(subst ./,,$(shell find tests/shell -perm -o=3Dx -type f -n=
ame '*.sh'))
>>> +DEPS =3D $(addprefix output/,$(addsuffix .dep,$(basename $(PROGS))))
>>> +DIRS =3D $(shell echo $(dir $(DEPS)) | xargs -n1 | sort -u | xargs)
>>> +
>>> +.PHONY: all
>>> +all: SHELLCHECK_RUN
>>> +       @:
>>> +
>>> +SHELLCHECK_RUN: $(DEPS) $(DIRS)
>>> +
>>> +output/%.dep: %.sh | $(DIRS)
>>> +       $(call rule_mkdir)
>>> +       $(Q)$(call frecho-cmd,test)@touch $@
>>> +       $(Q)$(call frecho-cmd,test)@shellcheck -S warning $(subst outpu=
t/,./,$(patsubst %.dep, %.sh, $@)) 1> ${log_file} && ([[ ! -s ${log_file} ]=
])
>>=20
>> This line is too long, please wrap it with some backslashes.
> Ok
>=20
> I will address all the comments in next version


Hi Namhyung,

While working on V2 for the Makefile changes and testing, came across three=
 issues with latest scripts in perf-tools-next.
I have addressed those in below patchset:

https://lore.kernel.org/linux-perf-users/20230929041133.95355-1-atrajeev@li=
nux.vnet.ibm.com/T/#m7b3dc8a96467058e1b392183190baed47ae0eb75
[PATCH 0/3] Fix for shellcheck issues with latest scripts in tests/shell

For the Makefile.perf changes, I will send V2 separately addressing review =
comments

Thanks
Athira

>=20
> Thanks
> Athira
>>=20
>> Thanks,
>> Namhyung
>>=20
>>=20
>>> +$(DIRS):
>>> +       @mkdir -p $@
>>> +
>>> +clean:
>>> +       @rm -rf $(log_file) output
>>> --
>>> 2.31.1


