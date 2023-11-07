Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44D7E354F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 07:39:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=feZuL1Jv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPdqg3rC8z3cVb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 17:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=feZuL1Jv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPdpm4qSWz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 17:38:55 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75mMDv015538;
	Tue, 7 Nov 2023 06:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iGmgARu5sd64vt4eF+2Hdgiq5iln0SDA8QR5/xWExTA=;
 b=feZuL1JvQrHMVxrkeet3HL1fQ9mIMGxx02w9vx9eHO2dRC4qtf+n+nBINwevI+qTZCRp
 MWSggvdyKZ0GT4zGnGsrSZG1JNAj7V3CrZLLrvJKrrIGwHE94BVG64GgH/L/UDRnQRuA
 1FzPI4eldbbL0zva6euj6rykjagEYa7+26zdIJfzdu9mRF7IUDEO/ex4UUdJ43RPSrhT
 s95iXh33XGgxygn2tCBNjVzlHhl8480fnWCZytyrm9P6pvuk0j37kV3gTzCCXMhIgs7V
 xTOhKoKm2qcZpraL8o/cWf7jBW9nHDJ2L7cmv+tNdNwAXR70iNgO65Qqm4SJYq7L2qAf mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7eh4kfh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:38:45 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A75nkVB023560;
	Tue, 7 Nov 2023 06:38:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7eh4kfam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:38:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75QiLR028237;
	Tue, 7 Nov 2023 06:38:42 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u62gjxed6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:38:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A76cdJJ7537256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 06:38:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4ECFB2004B;
	Tue,  7 Nov 2023 06:38:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AB8020040;
	Tue,  7 Nov 2023 06:38:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.91.239])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  7 Nov 2023 06:38:37 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZUleKdUrbR9oFVW4@kernel.org>
Date: Tue, 7 Nov 2023 12:08:25 +0530
Message-Id: <8DEA17FB-DC0B-41F9-800D-4B74371F4849@linux.vnet.ibm.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <552cbde4-6077-d5a4-251e-6c77786e1b31@arm.com>
 <3AFF6660-5A0E-4028-BA5A-D18CBAC8E1A4@linux.vnet.ibm.com>
 <ZUleKdUrbR9oFVW4@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b47DWhhZN7FaRQ3k4UTneSd_AShfyHS5
X-Proofpoint-ORIG-GUID: nW7HYgKPOKHzDFDhGWjvtP7jmwlegyfd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Nov-2023, at 3:14 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>=20
> Em Thu, Oct 05, 2023 at 02:24:15PM +0530, Athira Rajeev escreveu:
>>> On 05-Oct-2023, at 1:50 PM, James Clark <james.clark@arm.com> wrote:
>>> On 29/09/2023 05:11, Athira Rajeev wrote:
>>>> Running shellcheck on tests/shell/test_arm_coresight.sh
>>>> throws below warnings:
>>>>=20
>>>> In tests/shell/test_arm_coresight.sh line 15:
>>>> cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu*=
 -print -quit)
>>>>                 ^--^ SC2061: Quote the parameter to -name so the shell=
 won't interpret it.
>>>>=20
>>>> In tests/shell/test_arm_coresight.sh line 20:
>>>> if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" ] ;=
 then
>>>>                             ^-- SC2166: Prefer [ p ] && [ q ] as [ p -=
a q ] is not well defined
>>>>=20
>>>> This warning is observed after commit:
>>>> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")"
>>>>=20
>>>> Fixed this issue by using quoting 'cpu*' for SC2061 and
>>>> using "&&" in line number 20 for SC2166 warning
>>>>=20
>>>> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf=
/tests/shell/test_arm_coresight.sh
>>>> index fe78c4626e45..f2115dfa24a5 100755
>>>> --- a/tools/perf/tests/shell/test_arm_coresight.sh
>>>> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
>>>> @@ -12,12 +12,12 @@
>>>> glb_err=3D0
>>>>=20
>>>> cs_etm_dev_name() {
>>>> - cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name cp=
u* -print -quit)
>>>> + cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name 'c=
pu*' -print -quit)
>>>> trcdevarch=3D$(cat ${cs_etm_path}/mgmt/trcdevarch)
>>>> archhver=3D$((($trcdevarch >> 12) & 0xf))
>>>> archpart=3D$(($trcdevarch & 0xfff))
>>>>=20
>>>> - if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" ]=
 ; then
>>>> + if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" =3D "0xA1=
3" ] ; then
>>>> echo "ete"
>>>> else
>>>> echo "etm"
>>>=20
>>>=20
>>> Reviewed-by: James Clark <james.clark@arm.com>
>=20
> Some are not applying, even after b4 picking up v2
>=20
> Total patches: 3
> ---
> Cover: ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scrip=
ts_in_tests_shell.cover
> Link: https://lore.kernel.org/r/20231013073021.99794-1-atrajeev@linux.vne=
t.ibm.com
> Base: not specified
>       git am ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest=
_scripts_in_tests_shell.mbx
> =E2=AC=A2[acme@toolbox perf-tools-next]$        git am ./v2_20231013_atra=
jeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.mbx
> Applying: tools/perf/tests Ignore the shellcheck SC2046 warning in lock_c=
ontention
> error: patch failed: tools/perf/tests/shell/lock_contention.sh:33
> error: tools/perf/tests/shell/lock_contention.sh: patch does not apply
> Patch failed at 0001 tools/perf/tests Ignore the shellcheck SC2046 warnin=
g in lock_contention
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> =E2=AC=A2[acme@toolbox perf-tools-next]$ git am --abort
> =E2=AC=A2[acme@toolbox perf-tools-next]$

Hi Arnaldo

The patch is picked up : https://lore.kernel.org/all/169757198796.167943.10=
552920255799914362.b4-ty@kernel.org/ .
Thanks for looking into.

Athira


