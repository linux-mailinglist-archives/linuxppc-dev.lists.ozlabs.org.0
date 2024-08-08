Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB194B6E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 08:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qtmsmih4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfcxf4DyXz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 16:45:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qtmsmih4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfcwy1wgVz3cRK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 16:45:05 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4783raWW005829;
	Thu, 8 Aug 2024 06:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=LEg29M2yqo1wvbO42uopFKk9Gjuc//TOv0IVcWZHbGs=; b=qtmsmih4vFCJ
	/ybdMAs6kxwQyUQloCJHt72JMN7XatXBrUwkpN5O0KO4XLMPlT5hvKJQEPFXtWCR
	9ELo5jnjuTv9F4zDvMNTlm1uEiUKJKw/jCSCsLROciagbP250ZIgIGSuMpMIaAuM
	tIAOmQW3SbygHUa7YBaXwIk+CW79IoVaSxuIBOFejFOvv0klBYjB/HB1/gbAzLCy
	W2fpo0g6GttEI0nxXZkHKifB7Cpn5P4mDpdftglpEybVTy2vS6NirTM0+oNDxuI4
	+LHL/468xJiL71hM1WVjb7Pm079uGCMgKvD8VUpVDEGpd/i5SJCnlGzKf4StMtvf
	NNZA54IjMw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40urpuby7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 06:44:43 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4786igWp030241;
	Thu, 8 Aug 2024 06:44:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40urpuby7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 06:44:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4783xS2T018004;
	Thu, 8 Aug 2024 06:44:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40t0cmvtkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 06:44:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4786iZHZ57737710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Aug 2024 06:44:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCDE620043;
	Thu,  8 Aug 2024 06:44:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC93920040;
	Thu,  8 Aug 2024 06:44:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.113.139])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Aug 2024 06:44:26 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCHSET 00/10] perf tools: Sync tools and kernel headers for
 v6.11
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZrO5HR9x2xyPKttx@google.com>
Date: Thu, 8 Aug 2024 12:14:12 +0530
Message-Id: <F3C6DE61-8E10-4814-A6C0-C7569B3FD613@linux.vnet.ibm.com>
References: <20240806225013.126130-1-namhyung@kernel.org>
 <ZrO5HR9x2xyPKttx@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L2gBmFoGup1EK_PG9EwlwP3G5Ww1ljlb
X-Proofpoint-GUID: tvb4B9ZyOUHFlc5FqnowrES5Pbrzd0es
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_06,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080046
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
Cc: Ian Rogers <irogers@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>, James Clark <james.clark@linaro.org>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 7 Aug 2024, at 11:42=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org> wr=
ote:
>=20
> Hello folks,
>=20
> On Tue, Aug 06, 2024 at 03:50:03PM -0700, Namhyung Kim wrote:
>> Hello,
>>=20
>> This is the usual sync up in header files we keep in tools directory.
>> I put a file to give the reason of this work and not to repeat it in
>> every commit message.  The changes will be carried in the perf-tools
>> tree.
>=20
> Could you please double check what's in the tmp.perf-tools branch at the
> perf-tools tree so I don't break build and perf trace for arm64, powerpc
> and s390?  It has this patchset + arm64 unistd header revert (according
> to the discussion on patch 6/10) on top of v6.11-rc2.
>=20
> Thanks,
> Namhyung
Hi Namhyung,

Can you please point to the tree. I checked in https://git.kernel.org/pub/s=
cm/linux/kernel/git/acme/linux.git as well as https://git.kernel.org/pub/sc=
m/linux/kernel/git/perf/perf-tools-next.git , but didn=E2=80=99t find the c=
hanges. May be I am missing something. I am trying to check the build in po=
werpc.

Thanks
Athira


>=20
>>=20
>> Namhyung Kim (10):
>>  perf tools: Add tools/include/uapi/README
>>  tools/include: Sync uapi/drm/i915_drm.h with the kernel sources
>>  tools/include: Sync uapi/linux/kvm.h with the kernel sources
>>  tools/include: Sync uapi/linux/perf.h with the kernel sources
>>  tools/include: Sync uapi/sound/asound.h with the kernel sources
>>  tools/include: Sync uapi/asm-generic/unistd.h with the kernel sources
>>  tools/include: Sync network socket headers with the kernel sources
>>  tools/include: Sync filesystem headers with the kernel sources
>>  tools/include: Sync x86 headers with the kernel sources
>>  tools/include: Sync arm64 headers with the kernel sources
>>=20
>> tools/arch/arm64/include/asm/cputype.h        |  10 +
>> tools/arch/arm64/include/uapi/asm/unistd.h    |  24 +-
>> tools/arch/powerpc/include/uapi/asm/kvm.h     |   3 +
>> tools/arch/x86/include/asm/cpufeatures.h      | 803 +++++++++---------
>> tools/arch/x86/include/asm/msr-index.h        |  11 +
>> tools/arch/x86/include/uapi/asm/kvm.h         |  49 ++
>> tools/arch/x86/include/uapi/asm/svm.h         |   1 +
>> tools/include/uapi/README                     |  73 ++
>> tools/include/uapi/asm-generic/unistd.h       |   2 +-
>> tools/include/uapi/drm/i915_drm.h             |  27 +
>> tools/include/uapi/linux/in.h                 |   2 +
>> tools/include/uapi/linux/kvm.h                |  17 +-
>> tools/include/uapi/linux/perf_event.h         |   6 +-
>> tools/include/uapi/linux/stat.h               |  12 +-
>> .../arch/powerpc/entry/syscalls/syscall.tbl   |   6 +-
>> .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +-
>> .../arch/x86/entry/syscalls/syscall_64.tbl    |   8 +-
>> .../perf/trace/beauty/include/linux/socket.h  |   5 +-
>> .../perf/trace/beauty/include/uapi/linux/fs.h | 163 +++-
>> .../trace/beauty/include/uapi/linux/mount.h   |  10 +-
>> .../trace/beauty/include/uapi/linux/stat.h    |  12 +-
>> .../trace/beauty/include/uapi/sound/asound.h  |   9 +-
>> 22 files changed, 810 insertions(+), 445 deletions(-)
>> create mode 100644 tools/include/uapi/README
>>=20
>> --=20
>> 2.46.0.rc2.264.g509ed76dc8-goog
>>=20

