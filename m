Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 788997BA250
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 17:28:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPFso2vG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1b7H3Mf2z3vg5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 02:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPFso2vG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1b6L5LB7z3cPN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 02:27:54 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 395FOCNC027852;
	Thu, 5 Oct 2023 15:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=7LUUnAI2rzBUc+KYdURGoHhmP9bBaKJcwT/0qopdQJ8=;
 b=JPFso2vGQsJITjFSIIf81i9IbRhSUfQlcmFsDFzS6OU0RhYVW5JS8CIyz7JrsrHHgU5O
 eGEgAXsE1sJ+tMyiLjD+/5z0jkfr5cTpSof9HxujvzW8yKVMcsontYtO/nwvmWEDOGxr
 2hB5UGuv9rLDfMcPQN55QHjaK2NmrAolGsolhE8m0lgNOKKi57srL2vGieQFyJ0b9NdT
 TQJwp34919W3Z5uATc57mc9wQMX1hKLCNIa9vhX9/Nhhz51wsci9Ke11wb04VBII73D2
 dNWdPhJcgbVxtGA1m+q2jpPTeciZeAW0jJg19BGnJ+P1B5D6o5/QkTSRcmS+JveqBhWP FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thy9phwj5-82
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 15:27:33 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 395Ea0Ac013042;
	Thu, 5 Oct 2023 14:39:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3thy21r8dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 14:39:08 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 395ELGjJ017611;
	Thu, 5 Oct 2023 14:37:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tey0nv4h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 14:37:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 395EbnPg43254100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Oct 2023 14:37:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 982A72004D;
	Thu,  5 Oct 2023 14:37:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E13C320040;
	Thu,  5 Oct 2023 14:37:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.66.111])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Oct 2023 14:37:47 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V2] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230929064909.1152-1-atrajeev@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2023 20:07:35 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <DFCC944C-02D9-4BF4-B4CB-358BF1C14A08@linux.vnet.ibm.com>
References: <20230929064909.1152-1-atrajeev@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W72RWa2xCmhGugMmIbBaJuBP3MJzcbQ0
X-Proofpoint-ORIG-GUID: ysaa3xm98PQ5jQo2Vrpn_AYVDDNilPfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_10,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050119
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
Cc: linux-perf-users <linux-perf-users@vger.kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Sep-2023, at 12:19 PM, Athira Rajeev =
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
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v1 -> v2:
> Version1 had shellcheck in feature check which is not
> required since shellcheck is already a binary. Presence
> of binary can be checked using:
> $(shell command -v shellcheck)
> Addressed these changes as suggested by Namhyung in V2
> Feature test logic is removed in V2. Also added example
> for build breakage when shellcheck fails in commit message

Hi All,

Looking for feedback on this patch

Thanks
Athira
>=20
> tools/perf/Makefile.perf        | 14 +++++++++++++-
> tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
> 2 files changed, 37 insertions(+), 1 deletion(-)
> create mode 100644 tools/perf/tests/Makefile.tests
>=20
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 98604e396ac3..56a66ca253ab 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -667,7 +667,18 @@ $(PERF_IN): prepare FORCE
> $(PMU_EVENTS_IN): FORCE prepare
> $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=3Dpmu-events =
obj=3Dpmu-events
>=20
> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
> +# Runs shellcheck on perf test shell scripts
> +
> +SHELLCHECK :=3D $(shell command -v shellcheck)
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
> @@ -1130,6 +1141,7 @@ bpf-skel-clean:
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

