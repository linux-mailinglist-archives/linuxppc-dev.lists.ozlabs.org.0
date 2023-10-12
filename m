Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CD7C6A0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 11:55:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NMg0Jrkq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5lP0245Yz3dBM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 20:55:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NMg0Jrkq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5lN407Z3z3bP4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 20:54:11 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C9jnBP003237;
	Thu, 12 Oct 2023 09:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+IcQnnHRD9zyDe/wFkQD7/u3NNGtDze4SULeQkFNvao=;
 b=NMg0Jrkq3KhuXNZfQkBgF77q1iJAdhpfUl+TQZiE3cAenzP+5EZcByrzEZnMkkEHJCgK
 dLi5kt6xxqtnaclJAZf0VJa2Y2jVpYwQF2VaUccM1zxA+rJddH066CO0kva+jBrURcCY
 iuhg2/XDl9KIVbzmCVHWupj0k/NHhzu6Q0nPBj8EWQRulxtpMLyDvvqiDzTUMBNiGsov
 C3QSSvc/rj8unD6/qaNip5rV8pTFSvxxX3T5dw5lu5AAJM21f3D2cudgM5V8hyaDQDRw
 73E/qwMrmJ/3qKCIJUsGtKeAuDQibJ1NLLERNv+GC9lwfo9VlKTVFWO+JUkiYHZxMlcW bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpdy61175-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 09:54:04 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39C9k5gE005045;
	Thu, 12 Oct 2023 09:54:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpdy6116e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 09:54:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39C7oZnu001239;
	Thu, 12 Oct 2023 09:54:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvk685u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 09:54:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39C9rxcI16450200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 09:53:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94BC72004D;
	Thu, 12 Oct 2023 09:53:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C36C220040;
	Thu, 12 Oct 2023 09:53:57 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.214.47])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Oct 2023 09:53:57 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7cj75AzZ29tzuDbo2=1+s_t_kzQEakoUFs8o9vh9NYqCKA@mail.gmail.com>
Date: Thu, 12 Oct 2023 15:23:45 +0530
Message-Id: <A0EFA81D-83A1-4859-9448-AD1E37C0EA14@linux.vnet.ibm.com>
References: <20230929064909.1152-1-atrajeev@linux.vnet.ibm.com>
 <DFCC944C-02D9-4BF4-B4CB-358BF1C14A08@linux.vnet.ibm.com>
 <CAM9d7cj75AzZ29tzuDbo2=1+s_t_kzQEakoUFs8o9vh9NYqCKA@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QkBIzOkt2Z7pVOHTcqLhAly_zIsnSoc2
X-Proofpoint-ORIG-GUID: NRo9JDot9YuVJ0xT98cfymmUOD3eMXkL
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120082
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



> On 09-Oct-2023, at 10:38 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> Hello,
>=20
> Sorry for the late reply.
>=20
> On Thu, Oct 5, 2023 at 8:27=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>>> On 29-Sep-2023, at 12:19 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com=
> wrote:
>>>=20
>>> Add rule in new Makefile "tests/Makefile.tests" for running
>>> shellcheck on shell test scripts. This automates below shellcheck
>>> into the build.
>>>=20
>>> $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellchec=
k -S warning $F; done
>>>=20
>>> Condition for shellcheck is added in Makefile.perf to avoid build
>>> breakage in the absence of shellcheck binary. Update Makefile.perf
>>> to contain new rule for "SHELLCHECK_TEST" which is for making
>>> shellcheck test as a dependency on perf binary. Added
>>> "tests/Makefile.tests" to run shellcheck on shellscripts in
>>> tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
>>> time during make, shellcheck will be run only on modified files
>>> during subsequent invocations. By this, if any newly added shell
>>> scripts or fixes in existing scripts breaks coding/formatting
>>> style, it will get captured during the perf build.
>>>=20
>>> Example build failure with present scripts in tests/shell:
>>>=20
>>> INSTALL libsubcmd_headers
>>> INSTALL libperf_headers
>>> INSTALL libapi_headers
>>> INSTALL libsymbol_headers
>>> INSTALL libbpf_headers
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
>>> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
>>> make[1]: *** [Makefile.perf:238: sub-make] Error 2
>>> make: *** [Makefile:70: all] Error 2
>>>=20
>>> After this, for testing, changed "tests/shell/record.sh" to
>>> break shellcheck format. In the next make run, it is
>>> also captured:
>=20
> Where can I see the actual failure messages?
Hi Namhyung,
Thanks for the review comments.

Example, with current tree, we have these format issues:

 GENSKEL /root/athira/linux/tools/perf/util/bpf_skel/kwork_trace.skel.h
CC bench/uprobe.o
CC util/header.o
LD bench/perf-in.o
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/stat_all_metricgroups.dep] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/record_sideband.dep] Error 1
CC util/bpf_counter.o
CC util/bpf_counter_cgroup.o
CC util/bpf_ftrace.o
CC util/bpf_off_cpu.o
CC util/bpf-filter.o
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:15: output=
/tests/shell/test_arm_coresight.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:15: output=
/tests/shell/lock_contention.dep] Error 1
make[2]: *** [Makefile.perf:679: SHELLCHECK_TEST] Error 2
make[2]: *** Waiting for unfinished jobs....
LD util/perf-in.o
LD perf-in.o
make[1]: *** [Makefile.perf:242: sub-make] Error 2
make: *** [Makefile:70: all] Error 2

The actual fail can be seen here:

# cat output/tests/shell/stat_all_metricgroups.dep.log=20

In ./tests/shell/stat_all_metricgroups.sh line 7:
function ParanoidAndNotRoot()
^-- SC2112: 'function' keyword is non-standard. Delete it.

For more information:
https://www.shellcheck.net/wiki/SC2112 -- 'function' keyword is non-standar=
...
>=20


>>>=20
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/record.dep] Error 1
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
>>> make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Ma=
kefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
>>> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
>>> make[1]: *** [Makefile.perf:238: sub-make] Error 2
>>> make: *** [Makefile:70: all] Error 2
>=20
> So is this reported at build time before I run the test command?
> I'm ok with that but maybe I need to build it even though I know
> some test is broken.  Can we have an option to do that like with
> `make NO_SHELLCHECK=3D1` ?

Yes, agree Namhyung. Valid point.
I will add that in V3

>=20
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> Changelog:
>>> v1 -> v2:
>>> Version1 had shellcheck in feature check which is not
>>> required since shellcheck is already a binary. Presence
>>> of binary can be checked using:
>>> $(shell command -v shellcheck)
>>> Addressed these changes as suggested by Namhyung in V2
>>> Feature test logic is removed in V2. Also added example
>>> for build breakage when shellcheck fails in commit message
>>=20
>> Hi All,
>>=20
>> Looking for feedback on this patch
>>=20
>> Thanks
>> Athira
>>>=20
>>> tools/perf/Makefile.perf        | 14 +++++++++++++-
>>> tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
>>> 2 files changed, 37 insertions(+), 1 deletion(-)
>>> create mode 100644 tools/perf/tests/Makefile.tests
>>>=20
>>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>>> index 98604e396ac3..56a66ca253ab 100644
>>> --- a/tools/perf/Makefile.perf
>>> +++ b/tools/perf/Makefile.perf
>>> @@ -667,7 +667,18 @@ $(PERF_IN): prepare FORCE
>>> $(PMU_EVENTS_IN): FORCE prepare
>>> $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=3Dpmu-events o=
bj=3Dpmu-events
>>>=20
>>> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
>>> +# Runs shellcheck on perf test shell scripts
>>> +
>>> +SHELLCHECK :=3D $(shell command -v shellcheck)
>>> +ifneq ($(SHELLCHECK),)
>>> +SHELLCHECK_TEST: FORCE prepare
>>> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
>>> +else
>>> +SHELLCHECK_TEST:
>>> + @:
>>> +endif
>>> +
>>> +$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) SHELLCHECK_TEST
>>> $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
>>> $(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
>>>=20
>>> @@ -1130,6 +1141,7 @@ bpf-skel-clean:
>>> $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
>>>=20
>>> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)=
-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-core=
sight-targets-clean
>>> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
>>> $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archiv=
e $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>>> $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -dele=
te -o -name '\.*.d' -delete
>>> $(Q)$(RM) $(OUTPUT).config-detected
>>> diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefil=
e.tests
>>> new file mode 100644
>>> index 000000000000..8011e99768a3
>>> --- /dev/null
>>> +++ b/tools/perf/tests/Makefile.tests
>>> @@ -0,0 +1,24 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
>>> +
>>> +PROGS =3D $(subst ./,,$(shell find tests/shell -perm -o=3Dx -type f -n=
ame '*.sh'))
>>> +DEPS =3D $(addprefix output/,$(addsuffix .dep,$(basename $(PROGS))))
>>> +DIRS =3D $(shell echo $(dir $(DEPS)) | xargs -n1 | sort -u | xargs)
>>> +
>>> +.PHONY: all
>>> +all: SHELLCHECK_RUN
>>> + @:
>>> +
>>> +SHELLCHECK_RUN: $(DEPS) $(DIRS)
>>> +
>>> +output/%.dep: %.sh | $(DIRS)
>>> + $(call rule_mkdir)
>>> + $(eval input_file :=3D $(subst output/,./,$(patsubst %.dep, %.sh, $@)=
))
>>> + $(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> $@=
.log && ([[ ! -s $@.log ]])
>=20
> What is the last part?  I guess it checks if shellcheck found no errors.
> Can we just check the exit code of the shellcheck?  Is there a case
> it didn't work?

It checks to see if the redirected file has any warnings ( if it is not emp=
ty ).
I had tried exit code, but it reported false fails with using exit code

Diff I used:

diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefile.te=
sts
index 8011e99768a3..b3089f46ba6f 100644
--- a/tools/perf/tests/Makefile.tests
+++ b/tools/perf/tests/Makefile.tests
@@ -14,7 +14,7 @@ SHELLCHECK_RUN: $(DEPS) $(DIRS)
output/%.dep: %.sh | $(DIRS)
$(call rule_mkdir)
$(eval input_file :=3D $(subst output/,./,$(patsubst %.dep, %.sh, $@)))
- $(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> $@.log=
 && ([[ ! -s $@.log ]])
+ $(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> $@.log=
 && ([[ ! $? ]])
$(Q)$(call frecho-cmd,test)@touch $@
$(Q)$(call frecho-cmd,test)@rm -rf $@.log
$(DIRS):


  INSTALL libsubcmd_headers
INSTALL libsymbol_headers
INSTALL libperf_headers
INSTALL libapi_headers
INSTALL libbpf_headers
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/stat_all_metricgroups.dep] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/trace+probe_vfs_getname.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/record_sideband.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/test_java_symbol.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/test_brstack.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/test_task_analyzer.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/test_arm_coresight.dep] Error 1
make[3]: *** [/root/athira/linux/tools/perf/tests/Makefile.tests:17: output=
/tests/shell/lock_contention.dep] Error 1
make[2]: *** [Makefile.perf:679: SHELLCHECK_TEST] Error 2
make[1]: *** [Makefile.perf:242: sub-make] Error 2
make: *** [Makefile:70: all] Error 2

I think it happens since we run the checks parallely.
Hence checking the corresponding log for the particular script will give us=
 accuracy with the results.

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>=20
>>> + $(Q)$(call frecho-cmd,test)@touch $@
>>> + $(Q)$(call frecho-cmd,test)@rm -rf $@.log
>>> +$(DIRS):
>>> + @mkdir -p $@
>>> +
>>> +clean:
>>> + @rm -rf output
>>> --
>>> 2.31.1


