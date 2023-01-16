Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFACE66B6C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 06:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwKh94nMYz3fBj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 16:04:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNF5FBrE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNF5FBrE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwKfX0pzgz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 16:03:15 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G2iqlA011720;
	Mon, 16 Jan 2023 05:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZAqZaqP2qQDPTZePUkkD3giSWOpBTZB8wAGhnF0SRMo=;
 b=tNF5FBrEF9xY0gAtlehtYhhk2VvK8P4HPTlaqkmqA3BB4JqYQMZUvb9aTwbmeCqGg8Ip
 lugLqP7wPBTCuG7e0jP8KL3xyDs/EvRRNh5GUXEY+r8LVr18/ttpiOsvCAsUEpWkpU1r
 /CchIrxNJpyv5RAbPOLJzslaCbMoGw4PiMj7RbNfWx0A2RMQ2MCFW9HbSj23U+c2z3ZB
 XWzwxcgHTIIVOR0JcZCn2GyvbaG+KkmRz1RNXyVSFqX7ItGi3gvfSeLZQSlWsaoU8XzM
 bh2HBoArMNMtHKcm1qWwIIaZIhUgyRMNCpvqvws2ESAHT3bW0O8y26tPOfvFEM7HYVYU 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed2febm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:03:08 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30G51EB1005797;
	Mon, 16 Jan 2023 05:03:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed2feb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:03:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30F4hV5A017303;
	Mon, 16 Jan 2023 05:03:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n3m169d9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:03:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30G532EA50594296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 05:03:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1AB220040;
	Mon, 16 Jan 2023 05:03:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0491D2004F;
	Mon, 16 Jan 2023 05:03:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.245])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 16 Jan 2023 05:03:00 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <3EE5CFF3-51BC-444E-8FEF-2AC219E809F6@linux.vnet.ibm.com>
Date: Mon, 16 Jan 2023 10:32:58 +0530
Message-Id: <41461A8A-74F7-4938-9E8D-9F275114E906@linux.vnet.ibm.com>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
 <Yyy0W6CnPk7BkkCU@kernel.org>
 <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
 <3EE5CFF3-51BC-444E-8FEF-2AC219E809F6@linux.vnet.ibm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wan1DbpTF_F5xahTluJpMtrdBqkMA8Vp
X-Proofpoint-ORIG-GUID: Ol9zNKtK00UCyVVecwRItO-NOn7lxwEf
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_02,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301160037
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28-Sep-2022, at 10:24 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> =
wrote:
>=20
> Hi All,
>=20
> Looking for what direction we can take here.
> Do we want to change all tests in tools/perf/tests/shell except test_inte=
l_pt.sh to use "bash" or go with
> the approach in the patch ? Please share your comments
>=20
> Thanks
> Athira
>=20

Hi All,

Looking for what direction we can take here.
Do we want to change all tests in tools/perf/tests/shell except test_intel_=
pt.sh to use "bash" or go with
the approach in the patch ? Please share your comments

Thanks
Athira

>> On 23-Sep-2022, at 11:54 AM, Adrian Hunter <adrian.hunter@intel.com> wro=
te:
>>=20
>> On 22/09/22 22:15, Arnaldo Carvalho de Melo wrote:
>>> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
>>>> The perf test named =E2=80=9Cbuild id cache operations=E2=80=9D skips =
with below
>>>> error on some distros:
>>>=20
>>> I wonder if we shouldn't instead state that bash is needed?
>>>=20
>>> =E2=AC=A2[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell/*.s=
h | grep ^#
>>> #!/bin/sh
>>> #!/bin/bash
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/bash
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/bash
>>> #!/bin/sh
>>> #!/bin/bash
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> #!/bin/sh
>>> =E2=AC=A2[acme@toolbox perf-urgent]$
>>>=20
>>> Opinions?
>>>=20
>>=20
>> Please don't change tools/perf/tests/shell/test_intel_pt.sh
>>=20
>> I started using shellcheck on that with the "perf test:=20
>> test_intel_pt.sh: Add per-thread test" patch set that I sent.
>>=20
>> FYI, if you use shellcheck on buildid.sh, it shows up issues even
>> after changing to bash:
>>=20
>> *** Before ***
>>=20
>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 69:
>>       link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
>>                                      ^-------^ SC2039: In POSIX sh, stri=
ng indexing is undefined.
>>                                                ^-----^ SC2039: In POSIX =
sh, string indexing is undefined.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 77:
>>       file=3D${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
>>                                      ^-------^ SC2039: In POSIX sh, stri=
ng indexing is undefined.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 123:
>>       echo "running: perf record $@"
>>                                  ^-- SC2145: Argument mixes string and a=
rray. Use * or separate argument.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 124:
>>       ${perf} record --buildid-all -o ${data} $@ &> ${log}
>>                                               ^-- SC2068: Double quote a=
rray expansions to avoid re-splitting elements.
>>                                                  ^-------^ SC2039: In PO=
SIX sh, &> is undefined.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 126:
>>               echo "failed: record $@"
>>                                    ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 131:
>>       check ${@: -1}
>>             ^------^ SC2068: Double quote array expansions to avoid re-s=
plitting elements.
>>             ^------^ SC2039: In POSIX sh, string indexing is undefined.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 158:
>> exit ${err}
>>    ^----^ SC2154: err is referenced but not assigned.
>>=20
>> For more information:
>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions =
to ...
>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and arra=
y. ...
>> https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, &> is undefined.
>>=20
>> *** After ***
>>=20
>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 123:
>>       echo "running: perf record $@"
>>                                  ^-- SC2145: Argument mixes string and a=
rray. Use * or separate argument.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 124:
>>       ${perf} record --buildid-all -o ${data} $@ &> ${log}
>>                                               ^-- SC2068: Double quote a=
rray expansions to avoid re-splitting elements.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 126:
>>               echo "failed: record $@"
>>                                    ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 131:
>>       check ${@: -1}
>>             ^------^ SC2068: Double quote array expansions to avoid re-s=
plitting elements.
>>=20
>>=20
>> In tools/perf/tests/shell/buildid.sh line 158:
>> exit ${err}
>>    ^----^ SC2154: err is referenced but not assigned.
>>=20
>> For more information:
>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions =
to ...
>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and arra=
y. ...
>> https://www.shellcheck.net/wiki/SC2154 -- err is referenced but not assi=
gned.
>=20

