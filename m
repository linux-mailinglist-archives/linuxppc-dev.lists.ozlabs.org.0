Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207F7E3552
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 07:41:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hVwyoP4W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPdsq6rRrz3clf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 17:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hVwyoP4W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPds03ccMz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 17:40:52 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75k52I013027;
	Tue, 7 Nov 2023 06:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=6C/v6rQHg/9I4yaRM1JmVftWkqQhX4jlMllgyR5Cznk=;
 b=hVwyoP4WWE4crJAUpdwpVH8nc5PVi39b7z8Uj3t3rruMXtCWEeXdddHLU2wTRsQjg7kV
 SHOTF08Un0QE8zhyUFYjHVUNVbiDhqgVTu/BHZf6pRzA8cERvX4kGgmwr0gbiPZqn1s+
 NxP10qYpP0Zh8HslmwXt99QL69MUoijtOrCP+GCVtHl0pMU/sHACoUwa2BkWtNytoHss
 fdPhQPKWUQx/uNKfmrAS4E/VgN2TL4oJqrBHI9tnIdYgoIXdY7IsUdZl17Xmouy5g4k7
 HuM20J68K8oNp2UWCOCjz1/NRpaeK3dHH4SeWHX+E8fs7vgFL2rRm/+bJKYn1mIHGbdO ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7eh4kkc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:40:44 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A75rKUT003941;
	Tue, 7 Nov 2023 06:40:44 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7eh4kkbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:40:44 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75uaxa017004;
	Tue, 7 Nov 2023 06:40:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u6301p8n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:40:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A76eeus14353040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 06:40:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58D252004B;
	Tue,  7 Nov 2023 06:40:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90D0520063;
	Tue,  7 Nov 2023 06:40:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.91.239])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  7 Nov 2023 06:40:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V3] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <3a9164b4-9ff2-82a1-6339-3a1fdd91dc47@arm.com>
Date: Tue, 7 Nov 2023 12:10:26 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <7DDE9ADD-D022-4818-82AE-1F724054ADE6@linux.vnet.ibm.com>
References: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
 <3a9164b4-9ff2-82a1-6339-3a1fdd91dc47@arm.com>
To: James Clark <james.clark@arm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yCT7XSGLWJMe2ZOxOvVyFOWWxC84Phd-
X-Proofpoint-ORIG-GUID: R30587Y_5AqsufGEZx7m-bqcpMhBNG6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311070053
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
Cc: irogers@google.com, Madhavan Srinivasan <maddy@linux.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users <linux-perf-users@vger.kernel.org>, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Oct-2023, at 4:14 PM, James Clark <james.clark@arm.com> wrote:
>=20
>=20
>=20
> On 13/10/2023 08:36, Athira Rajeev wrote:
>> Add rule in new Makefile "tests/Makefile.tests" for running
>> shellcheck on shell test scripts. This automates below shellcheck
>> into the build.
>>=20
>> $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do =
shellcheck -S warning $F; done
>>=20
>> Condition for shellcheck is added in Makefile.perf to avoid build
>> breakage in the absence of shellcheck binary. Update Makefile.perf
>> to contain new rule for "SHELLCHECK_TEST" which is for making
>> shellcheck test as a dependency on perf binary. Added
>> "tests/Makefile.tests" to run shellcheck on shellscripts in
>> tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
>> time during make, shellcheck will be run only on modified files
>> during subsequent invocations. By this, if any newly added shell
>> scripts or fixes in existing scripts breaks coding/formatting
>> style, it will get captured during the perf build.
>>=20
>> Example build failure with present scripts in tests/shell:
>>=20
>> INSTALL libsubcmd_headers
>> INSTALL libperf_headers
>> INSTALL libapi_headers
>> INSTALL libsymbol_headers
>> INSTALL libbpf_headers
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record_sideband.dep] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/test_arm_coresight.dep] Error 1
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/lock_contention.dep] Error 1
>> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
>> make[1]: *** [Makefile.perf:238: sub-make] Error 2
>> make: *** [Makefile:70: all] Error 2
>>=20
>> After this, for testing, changed "tests/shell/record.sh" to
>> break shellcheck format. In the next make run, it is
>> also captured:
>>=20
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record_sideband.dep] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/record.dep] Error 1
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/test_arm_coresight.dep] Error 1
>> make[3]: *** =
[/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17:=
 output/tests/shell/lock_contention.dep] Error 1
>> make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
>> make[1]: *** [Makefile.perf:238: sub-make] Error 2
>> make: *** [Makefile:70: all] Error 2
>>=20
>> The exact failure log can be found in:
>> output/tests/shell/record.dep.log file
>>=20
>=20
> Hi Athira,
>=20
> Having the reason for a hard failure put into a log file rather than =
the
> console output is very non standard. I'm not sure what the reason for
> this is.
>=20
> The log filename isn't even listed in the output so how would anyone
> know what went wrong?
>=20
> Can we just have it so that the failure is printed in the make output
> like any other build error.

Sure James, Thanks for looking into and sharing the review comment.
I will address the change in V4

>=20
> [...]
>=20
>> +output/%.dep: %.sh | $(DIRS)
>> + $(call rule_mkdir)
>> + $(eval input_file :=3D $(subst output/,./,$(patsubst %.dep, %.sh, =
$@)))
>> + $(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> =
$@.log && ([[ ! -s $@.log ]])
>=20
> [[ ]] is a bash extension, but the build system seems to use /bin/sh =
so
> you get this error depending on your distro:
>=20
>  tools/perf/tests/Makefile.tests:17: output/tests/shell
>      /record+probe_libc_inet_pton.dep] Error 127
>  /bin/sh: 1: [[: not found
>=20
> Changing it to [ ] fixes it

Ok, will make the change in next version

>=20
>> + $(Q)$(call frecho-cmd,test)@touch $@
>=20
> Touching the source file in the build system doesn't feel right, =
surely
> this could be open to all kinds of parallel build race conditions or
> version controll issues.
>=20
> Isn't the output of the rule the .log file, so just a normal make rule
> based on those two files work? Then if the .log file is older than the
> source file, the shellcheck is re-run, otherwise not? It feels like =
the
> .dep file would then also be unecessary.

Ok, I will fix this.
>=20
> The .dep lines in the make output are a bit confusing because they're
> not in the source tree so it's not clear to an outsider what that make
> output is for.
>=20
> Other than that, it does seem to work ok for me.
Thanks for the review. I will post V4 with all the changes

Athira
>=20
>> + $(Q)$(call frecho-cmd,test)@rm -rf $@.log
>> +$(DIRS):
>> + @mkdir -p $@
>> +
>> +clean:
>> + @rm -rf output


