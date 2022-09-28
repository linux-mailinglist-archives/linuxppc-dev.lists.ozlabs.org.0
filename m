Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EE5ED40B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 06:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mckh34FCNz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 14:55:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l80t6p12;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l80t6p12;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MckgN3Y7lz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 14:54:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S3ctVQ024933;
	Wed, 28 Sep 2022 04:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PCbQj6+tcuKvNWcSAZW6ZxHryRN6dZQuHQTmPmhwj+E=;
 b=l80t6p12iTOp6XQ0ve1IAxS5K9J0Q+gPkLRRBUY5KOzBWDWXz3nZpHX3TYL/qYliwlRR
 LUcGyFH4w5W2lxG6kOikM5FqBRcG0k+XHTWQw9N6xbCIpvLQ0/M5seXseFu7j2VnvmkL
 jEM+dxIRkfEQn2rbgqLv89NgizKxcnIu3gDTG7mXvkzAVCWpl9Qk3mHA7W3OkOMh7g/S
 2Go0xT+pxrV0tsUml33cQ7dBKnXlTuNZwr0lEAwAO0JwLzgPQiw4YKOaSI2PgzH3XAxn
 5NQ8PUywiBcNWM8Ysc1RruWA/IABVJcRdrmlHE2eH433wyomiYKDuoyViXqJZmyF0kNf PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jve7k9s38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 04:54:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S4rTAd027651;
	Wed, 28 Sep 2022 04:54:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jve7k9s2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 04:54:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S4pfDR004746;
	Wed, 28 Sep 2022 04:54:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jssh9cpcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 04:54:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28S4snMV51249446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 04:54:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11FC642042;
	Wed, 28 Sep 2022 04:54:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D024A42045;
	Wed, 28 Sep 2022 04:54:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.45.125])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 28 Sep 2022 04:54:18 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
Date: Wed, 28 Sep 2022 10:24:16 +0530
Message-Id: <3EE5CFF3-51BC-444E-8FEF-2AC219E809F6@linux.vnet.ibm.com>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
 <Yyy0W6CnPk7BkkCU@kernel.org>
 <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -eLxdw0y6N_DS5UpJ6bK21FXFfP9Gijk
X-Proofpoint-ORIG-GUID: h69sNzZsfovU63EH41QCjJLO3v77F_ed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_02,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280027
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

Looking for what direction we can take here.
Do we want to change all tests in tools/perf/tests/shell except test_intel_=
pt.sh to use "bash" or go with
the approach in the patch ? Please share your comments

Thanks
Athira

> On 23-Sep-2022, at 11:54 AM, Adrian Hunter <adrian.hunter@intel.com> wrot=
e:
>=20
> On 22/09/22 22:15, Arnaldo Carvalho de Melo wrote:
>> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
>>> The perf test named =E2=80=9Cbuild id cache operations=E2=80=9D skips w=
ith below
>>> error on some distros:
>>=20
>> I wonder if we shouldn't instead state that bash is needed?
>>=20
>> =E2=AC=A2[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell/*.sh=
 | grep ^#
>> #!/bin/sh
>> #!/bin/bash
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/bash
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/bash
>> #!/bin/sh
>> #!/bin/bash
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> #!/bin/sh
>> =E2=AC=A2[acme@toolbox perf-urgent]$
>>=20
>> Opinions?
>>=20
>=20
> Please don't change tools/perf/tests/shell/test_intel_pt.sh
>=20
> I started using shellcheck on that with the "perf test:=20
> test_intel_pt.sh: Add per-thread test" patch set that I sent.
>=20
> FYI, if you use shellcheck on buildid.sh, it shows up issues even
> after changing to bash:
>=20
> *** Before ***
>=20
> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh=20
>=20
> In tools/perf/tests/shell/buildid.sh line 69:
>        link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
>                                       ^-------^ SC2039: In POSIX sh, stri=
ng indexing is undefined.
>                                                 ^-----^ SC2039: In POSIX =
sh, string indexing is undefined.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 77:
>        file=3D${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
>                                       ^-------^ SC2039: In POSIX sh, stri=
ng indexing is undefined.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 123:
>        echo "running: perf record $@"
>                                   ^-- SC2145: Argument mixes string and a=
rray. Use * or separate argument.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 124:
>        ${perf} record --buildid-all -o ${data} $@ &> ${log}
>                                                ^-- SC2068: Double quote a=
rray expansions to avoid re-splitting elements.
>                                                   ^-------^ SC2039: In PO=
SIX sh, &> is undefined.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 126:
>                echo "failed: record $@"
>                                     ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 131:
>        check ${@: -1}
>              ^------^ SC2068: Double quote array expansions to avoid re-s=
plitting elements.
>              ^------^ SC2039: In POSIX sh, string indexing is undefined.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 158:
> exit ${err}
>     ^----^ SC2154: err is referenced but not assigned.
>=20
> For more information:
>  https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions =
to ...
>  https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and arra=
y. ...
>  https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, &> is undefined.
>=20
> *** After ***
>=20
> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh=20
>=20
> In tools/perf/tests/shell/buildid.sh line 123:
>        echo "running: perf record $@"
>                                   ^-- SC2145: Argument mixes string and a=
rray. Use * or separate argument.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 124:
>        ${perf} record --buildid-all -o ${data} $@ &> ${log}
>                                                ^-- SC2068: Double quote a=
rray expansions to avoid re-splitting elements.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 126:
>                echo "failed: record $@"
>                                     ^-- SC2145: Argument mixes string and=
 array. Use * or separate argument.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 131:
>        check ${@: -1}
>              ^------^ SC2068: Double quote array expansions to avoid re-s=
plitting elements.
>=20
>=20
> In tools/perf/tests/shell/buildid.sh line 158:
> exit ${err}
>     ^----^ SC2154: err is referenced but not assigned.
>=20
> For more information:
>  https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions =
to ...
>  https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and arra=
y. ...
>  https://www.shellcheck.net/wiki/SC2154 -- err is referenced but not assi=
gned.

