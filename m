Return-Path: <linuxppc-dev+bounces-2303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7189A0075
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 07:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSzcG5ZTkz2xt7;
	Wed, 16 Oct 2024 16:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729055550;
	cv=none; b=OlIsCj+eYoleJoPY6YReDD5MkLpgVxLT4Cv+ShFZB/nc+s3OH7xP7rT7MU4xvMPvUfIc9YIqPNBaefa1/vXDUr8ox8Cq5rCqYU/jrqaTYDkWDQG86p1jJgJRKmg3XVjY4vzzyy/r8wqox6lhA1aME8XdXJnH6joJGXn9kcbobVGCiHvxDJSmojR+2VFlY3yZW8kctlfFRaAh7sb9K8ITuXGaIOK4jp69/EOEvrXDxeBj6/dgRmiHfqRI2o6XTUOTa91DGYs19bSAUXgPOiqnGsr3Z6hFAmky96dLojqw4zLFoPreXzx6sFS2R9ldlikQgIEEDFy7IRGQT6qIcHYZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729055550; c=relaxed/relaxed;
	bh=zpuXYVy7p2Vv1O5MWhG2f+F7Dms7BhGQ3R9irG9puoM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GULRysADsDpaJwORjOnLC/bLTCpCqEsEyB3qxivnHJ5uECVgZrDxZhQf+128ripJZXECAmkLsIm13oNWUkAbkLtlvMoe9shl/tiaAIyiVD9aivrmFp0Nkvooon+oIKA1yaBzeUmFfH4ecCX6Z4l43e65OHtt3FnGKH78ydGzPsO+MvbE+0/Np3PJ1Vuc/gpc2kHNhOiqGxbCYCnjuR6smfhz/0H/dwRVIc2sAr+fvYwcI9qi+Y3YNhl1bH0BxTHVQ1sZEvCetctYzHJTpBADlNZau9mle4oYo2xUzkBGS1e0gZEUhsgMKemad4F2GvNKK5M+kODN8kE3ePHYAfgfFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EnLsTHCV; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EnLsTHCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSzcF12R6z2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 16:12:28 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G3vnbp027554;
	Wed, 16 Oct 2024 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zpuXYV
	y7p2Vv1O5MWhG2f+F7Dms7BhGQ3R9irG9puoM=; b=EnLsTHCViJZPU4vKPzLxCw
	U9KnBvW2zqrxFOws4XUEb/NCf+q1lcJ1S8ah1uCOyMnNlbApoq9CW/fJRh0Md2kf
	6WMZ9g6OMKeLqhXjxMm8q978t1MrxQRdos9ry7m3RZoaYLgBgnbYwjutZrWE27tw
	A1BExnq6ZamdXlCVTTjezap5bOYLO8N0KVj7g9jdpnjjCeyZhq/bEPjDoBp1Xih/
	XGCjACDCb14M/jlfq8Lu28401+J9plRa6wDToe/BuBdX4Dd9H8rTK8n6Msel0uGj
	FwiCU0uqoyLdSbxwlxzgTbxB2+TQR1xP+7PNa1fWF+SbIqX6znruWwNw7cR90NGg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42a60a87ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:12:21 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49G59Z7b006341;
	Wed, 16 Oct 2024 05:12:20 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42a60a87af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:12:20 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49G164So027452;
	Wed, 16 Oct 2024 05:12:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283txqh08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 05:12:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49G5CFpq30277898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 05:12:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E17D120040;
	Wed, 16 Oct 2024 05:12:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E29722004B;
	Wed, 16 Oct 2024 05:12:09 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.246.127])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 05:12:09 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/tests/base_probe: Fix check for the count of
 existing probes in test_adding_kernel
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
Date: Wed, 16 Oct 2024 10:41:54 +0530
Cc: jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5267822A-8384-4B9A-817F-B764E24F0116@linux.vnet.ibm.com>
References: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
To: Namhyung Kim <namhyung@kernel.org>, vmolnaro@redhat.com,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nYKh2bQzL_ruitaihCt48o0XMnDss4Dt
X-Proofpoint-ORIG-GUID: FC33Hutp5N2QSTDffGWPknApqv7WkLfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 14 Oct 2024, at 9:09=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> perftool-testsuite_probe fails in test_adding_kernel as below:
> Regexp not found: "probe:inode_permission_11"
> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: force-adding probes =
::
> second probe adding (with force) (output regexp parsing)
> event syntax error: 'probe:inode_permission_11'
>  \___ unknown tracepoint
>=20
> Error:  File /sys/kernel/tracing//events/probe/inode_permission_11
> not found.
> Hint:   Perhaps this kernel misses some CONFIG_ setting to
> enable this feature?.
>=20
> The test does the following:
> 1) Adds a probe point first using :
>    $CMD_PERF probe --add $TEST_PROBE
> 2) Then tries to add same probe again without =E2=80=94force
> and expects it to fail. Next tries to add same probe again
> with =E2=80=94force. In this case, perf probe succeeds and adds
> the probe with a suffix number. Example:
>=20
> ./perf probe --add inode_permission
> Added new event:
>  probe:inode_permission (on inode_permission)
>=20
> ./perf probe --add inode_permission --force
> Added new event:
>  probe:inode_permission_1 (on inode_permission)
>=20
>  ./perf probe --add inode_permission --force
> Added new event:
>  probe:inode_permission_2 (on inode_permission)
>=20
> Each time, suffix is added to existing probe name.
> To get the suffix number, test cases uses :
> NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
>=20
> This will work if there is no other probe existing
> in the system. If there are any other probes other than
> kernel probes or inode_permission, ( example: any probe),
> "perf probe -l" will include count for other probes too.
>=20
> Example, in the system where this failed, already some
> probes were default added. So count became 10
>  ./perf probe -l | wc -l
>  10
>=20
> So to be specific for "inode_permission", restrict the
> probe count check to that probe point alone using :
> NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
>=20
> Similarly while removing the probe using "probe --del *",
> ( removing all probes ), check uses:
>=20
> ../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE"
>=20
> But if there are other probes in the system, the log will
> contain reference to other existing probe too. Hence change
> usage of check_all_lines_matched.pl to check_all_patterns_found.pl
> This will make sure expecting string comes in the result
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Adding Veronika in the mail. Sorry missed to add initially. Please share =
review comments on this fix.

Thanks
Athira
> ---
> tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> index d541ffd44a93..f8b5f096d0d7 100755
> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> @@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"force-adding probes :: second pr
> (( TEST_RESULT +=3D $? ))
>=20
> # adding existing probe with '--force' should pass
> -NO_OF_PROBES=3D`$CMD_PERF probe -l | wc -l`
> +NO_OF_PROBES=3D`$CMD_PERF probe -l $TEST_PROBE| wc -l`
> $CMD_PERF probe --force --add $TEST_PROBE 2> =
$LOGS_DIR/adding_kernel_forceadd_03.err
> PERF_EXIT_CODE=3D$?
>=20
> @@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE =
"using doubled probe"
> $CMD_PERF probe --del \* 2> =
$LOGS_DIR/adding_kernel_removing_wildcard.err
> PERF_EXIT_CODE=3D$?
>=20
> -../common/check_all_lines_matched.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
> +../common/check_all_patterns_found.pl "Removed event: =
probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < =
$LOGS_DIR/adding_kernel_removing_wildcard.err
> CHECK_EXIT_CODE=3D$?
>=20
> print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple =
probes"
> --=20
> 2.43.5
>=20
>=20


