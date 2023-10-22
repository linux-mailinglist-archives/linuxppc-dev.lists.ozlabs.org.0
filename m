Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9657D21A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 09:33:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZCY+DdIW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCqnM5ZC2z3dFL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 18:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZCY+DdIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCqmS4rSWz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 18:32:56 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39M7Fadg032535;
	Sun, 22 Oct 2023 07:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LEhKjGqPDAsan0Nq7SWzAqONAAy0uMNa4ox8uysu/JM=;
 b=ZCY+DdIWxjXc4MC3kmBai/rB29m4DlM/+3WpoJP9nkAO9ZwccLmIQ31FirM3+N2AxGAn
 erV8rdbobQafigAaL1k03AAfa6UmWWSN+Q7m0w1N97CS1m04wGQsDWKep4Zs/myOeLGa
 OmYn8i3rzUndlYcBAVZALQDyq6Os8USYjx4fuqhjrggr4hg06qkbD96wMtFIiXJ9DLUt
 6F+tP4bMd4s3bDoAqPeVaXx6jPnagOQ1KJpiZMkpZYRXNab+hdxSjcAqnM3QNuR62yUd
 cpz889X+nnzH6IBgccfzBGtRFshQEAu5nYu+g56PKy3HTX8oRdbXSH7yAcMzGBc0TfnO 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvy6bg89w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Oct 2023 07:32:47 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39M7NelK015747;
	Sun, 22 Oct 2023 07:32:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvy6bg89k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Oct 2023 07:32:46 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39M3nEQZ023789;
	Sun, 22 Oct 2023 07:13:18 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvryshp9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Oct 2023 07:13:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39M7DF6S15073900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 07:13:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80B7520049;
	Sun, 22 Oct 2023 07:13:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBA2320040;
	Sun, 22 Oct 2023 07:13:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.55.31])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 22 Oct 2023 07:13:11 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V3] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
Date: Sun, 22 Oct 2023 12:42:58 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <67FB4D3C-02B8-4D24-BCCE-7F150D114302@linux.vnet.ibm.com>
References: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cz7wR-IWGSZtaAWTk7Rm89gUTP2YAJ9E
X-Proofpoint-ORIG-GUID: ZXF4oR8AHdmpviTd5-ciCBVjNXui3aKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-22_04,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310220066
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
Cc: linux-perf-users <linux-perf-users@vger.kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Disha Goel <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13-Oct-2023, at 1:06 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Add rule in new Makefile "tests/Makefile.tests" for running
> shellcheck on shell test scripts. This automates below shellcheck
> into the build.
>=20
> $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do =
shellcheck -S warning $F; done
>=20
> Condition for shellcheck is added in Makefile.perf to avoid build
> breakage in the absence of shellcheck binary. Update Makefile.perf
> to contain new rule for "SHELLCHECK_TEST" which is for making
> shellcheck test as a dependency on perf binary. Added
> "tests/Makefile.tests" to run shellcheck on shellscripts in
> tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
> time during make, shellcheck will be run only on modified files
> during subsequent invocations. By this, if any newly added shell
> scripts or fixes in existing scripts breaks coding/formatting
> style, it will get captured during the perf build.
>=20
> Example build failure with present scripts in tests/shell:
>=20
> INSTALL libsubcmd_headers
> INSTALL libperf_headers
> INSTALL libapi_headers
> INSTALL libsymbol_headers
> INSTALL libbpf_headers
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record_sideband.dep] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/test_arm_coresight.dep] Error 1
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/lock_contention.dep] Error 1
> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
> make[1]: *** [Makefile.perf:238: sub-make] Error 2
> make: *** [Makefile:70: all] Error 2
>=20
> After this, for testing, changed "tests/shell/record.sh" to
> break shellcheck format. In the next make run, it is
> also captured:
>=20
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record_sideband.dep] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record.dep] Error 1
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/test_arm_coresight.dep] Error 1
> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/lock_contention.dep] Error 1
> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
> make[1]: *** [Makefile.perf:238: sub-make] Error 2
> make: *** [Makefile:70: all] Error 2
>=20
> The exact failure log can be found in:
> output/tests/shell/record.dep.log file
>=20
> This is reported at build time. To be able to go ahead with
> the build or disable shellcheck even though it is known that
> some test is broken, add a "NO_SHELLCHECK" option. Example:
>=20
>  make NO_LIBTRACEEVENT=3D1 NO_SHELLCHECK=3D1
>=20
>  INSTALL libsubcmd_headers
>  INSTALL libsymbol_headers
>  INSTALL libperf_headers
>  INSTALL libapi_headers
>  INSTALL libbpf_headers
>  PERF_VERSION =3D 6.6.rc1.g7108a40e02ae
>  GEN     perf-iostat
>  GEN     perf-archive
>  CC      util/header.o
>  LD      util/perf-in.o
>  LD      perf-in.o
>  LINK    perf
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> changelog:
> v2 -> v3:
> Add option "NO_SHELLCHECK". This will allow to go ahead
> with the build or disable shellcheck even though it is
> known that some test is broken
>=20
> v1 -> v2:
> Version1 had shellcheck in feature check which is not
> required since shellcheck is already a binary. Presence
> of binary can be checked using:
> $(shell command -v shellcheck)
> Addressed these changes as suggested by Namhyung in V2
> Feature test logic is removed in V2. Also added example
> for build breakage when shellcheck fails in commit message

Hi All,

Looking for review comments on this patch

Thanks
Athira
>=20
> tools/perf/Makefile.perf        | 20 +++++++++++++++++++-
> tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
> 2 files changed, 43 insertions(+), 1 deletion(-)
> create mode 100644 tools/perf/tests/Makefile.tests
>=20
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 456872ac410d..bb49eb8b0d43 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -134,6 +134,8 @@ include ../scripts/utilities.mak
> # x86 instruction decoder - new instructions test
> #
> # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
> +#
> +# Define NO_SHELLCHECK if you do not want to run shellcheck during =
build
>=20
> # As per kernel Makefile, avoid funny character set dependencies
> unexport LC_ALL
> @@ -671,7 +673,22 @@ $(PERF_IN): prepare FORCE
> $(PMU_EVENTS_IN): FORCE prepare
> $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=3Dpmu-events =
obj=3Dpmu-events
>=20
> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
> +# Runs shellcheck on perf test shell scripts
> +
> +SHELLCHECK :=3D $(shell command -v shellcheck)
> +ifeq ($(NO_SHELLCHECK),1)
> +SHELLCHECK :=3D
> +endif
> +
> +ifneq ($(SHELLCHECK),)
> +SHELLCHECK_TEST: FORCE prepare
> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
> +else
> +SHELLCHECK_TEST:
> + @:
> +endif
> +
> +$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) =
SHELLCHECK_TEST
> $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
> $(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
>=20
> @@ -1134,6 +1151,7 @@ bpf-skel-clean:
> $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
>=20
> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean =
$(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean =
bpf-skel-clean tests-coresight-targets-clean
> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) =
$(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
> $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' =
-delete -o -name '\.*.d' -delete
> $(Q)$(RM) $(OUTPUT).config-detected
> diff --git a/tools/perf/tests/Makefile.tests =
b/tools/perf/tests/Makefile.tests
> new file mode 100644
> index 000000000000..8011e99768a3
> --- /dev/null
> +++ b/tools/perf/tests/Makefile.tests
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
> +
> +PROGS =3D $(subst ./,,$(shell find tests/shell -perm -o=3Dx -type f =
-name '*.sh'))
> +DEPS =3D $(addprefix output/,$(addsuffix .dep,$(basename $(PROGS))))
> +DIRS =3D $(shell echo $(dir $(DEPS)) | xargs -n1 | sort -u | xargs)
> +
> +.PHONY: all
> +all: SHELLCHECK_RUN
> + @:
> +
> +SHELLCHECK_RUN: $(DEPS) $(DIRS)
> +
> +output/%.dep: %.sh | $(DIRS)
> + $(call rule_mkdir)
> + $(eval input_file :=3D $(subst output/,./,$(patsubst %.dep, %.sh, =
$@)))
> + $(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> =
$@.log && ([[ ! -s $@.log ]])
> + $(Q)$(call frecho-cmd,test)@touch $@
> + $(Q)$(call frecho-cmd,test)@rm -rf $@.log
> +$(DIRS):
> + @mkdir -p $@
> +
> +clean:
> + @rm -rf output
> --=20
> 2.31.1
>=20

