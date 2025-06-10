Return-Path: <linuxppc-dev+bounces-9261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02143AD44A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 23:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH1rg3CKQz307q;
	Wed, 11 Jun 2025 07:19:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749590371;
	cv=none; b=l/coo0f8owb9DT7LM/rG25O27GjYKCgs4H58jq/HppiyUc3b20y94wgRED6DMu5UQtYIJ+iyT+lFRzxkRMCNOZOCzTSuNQvGF5XyW9ihrIT5DB6NEGEh1/8i+t/M/MMqMbniSP0HDCxkT7TMQ7ZCYvj6xSRPepH9UgWnhZdSzb24ZS9f3v4L5LJQPxDN33sFQno8PDmrYSw7nLNOhTOSAIxks4Mvwthv8fDXJ3AvPj2dWZgeWIjWkbka1guSZpYaGBXz3MQ/aosXey9xQCgUfKh0PYDqIm1kh854DdiSBMh17N/8jpkHxUfdfomMd59Q1X8H6ECF/5p8PT0b9SAwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749590371; c=relaxed/relaxed;
	bh=koPLt8qRp3FKcDva4ZD4XUs8JAblTCSf3xDPaI6BorQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bgDdJAMXkb0P8+JmnOvYBBCMWCik0A686fU94+x4nOQIlglbAvLiEgJQfB6Rwsy60rELibKkotK8fXw0XjvMdairAA20tWMdcglHbKDFGp0y59fLi7JytR5Ma1Kj+GTsZvvcv6vpVfb2mdAT1yFKfKS4zY8YzKD1WBCqKVQzpcQ1yVnB80Vyx8T4VpB2U5rUPLnOxcIDwOWZ0gYjFQUTLta/L+rrBwZ6QinnIg4qlSguVnh8JFwmdrFsxoUpl1joJC0wHi/BHqB8yLMzLjQsymsyPg7A7aVge3NhYB9i8zC8SbHiw0+harYdSsOWKCEsWzTGkqYCB82cxPoh+DJ1vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qFwiXc3s; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qFwiXc3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH1rf38rQz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 07:19:30 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AGif99010507;
	Tue, 10 Jun 2025 21:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=koPLt8qRp3FKcDva4ZD4XUs8JAblTCSf3xDPaI6Bo
	rQ=; b=qFwiXc3suFWGzJ0iAyZMZieSGPkW5ipOoNyrKoHNfLGKpYYJDhH4hSlQe
	SQObbxSN5CI4GnIYxvHP3O/cpa8Ww4v4MBtt1FzAdIxPpG8xVlMtN9su3IL6gjJP
	3jru6vVuor6WCnLMTYCtOj6MNZ7He45x9WG+mRJWFYav5nYxDjR5+yu5m2Vcxue3
	cIO5jarlKxew2XtO+reVnroTDhhEGPGKDjGZR2kYtQOrgUfsE8R1AYzhSEJKXecW
	NdGUxGD8mamrXqlUU2Xnmio4iIyM08yBppuj+FkeRGFPwrOHjkiJdMXSPOhW/qhT
	GA7AfFbAOrLFT3Lg5+u6RBn3r50JA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7grvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55ALHYA6020513;
	Tue, 10 Jun 2025 21:19:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7grvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55AHYB7s028110;
	Tue, 10 Jun 2025 21:19:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518mccc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 21:19:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55ALJBPx44499230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 21:19:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 818432004E;
	Tue, 10 Jun 2025 21:19:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7046720043;
	Tue, 10 Jun 2025 21:19:08 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.26.197])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 21:19:08 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        msuchanek@suse.de, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Enhancements to the secvar interface in static key management mode
Date: Wed, 11 Jun 2025 02:49:04 +0530
Message-ID: <20250610211907.101384-1-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fxxsW0xGSOuaQ-l4FqO0ebhCT11qz7ro
X-Proofpoint-GUID: UuDglZBT5VJYf4exTu3iiFRrA_1WA-W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3NCBTYWx0ZWRfX52DtepAgTJ26 5xcfglXTmsJPc98J9D/l4hAFmXPFqaGWcF1uV1fmIX0GWzs4zS62IKmDvEnmqrakqtyc7LQvQe3 CJH03lMGyd7aDbdBWNdp02lFCGefqqLyfTkoEXR0NfllWJ15LWWxhg7Zl0L5PyzDmgdEcFGNvvo
 G2IltGHbsKzZCLw77ank9m4hT6fhizqlQ8wQlNrRFlxn319V9IwNJzXb7huWUKDggwwTg+pFuHw X8Dzm1Wwmj3/cPv5WC8E7WC9tyDPA/2HZ/gB6ErLRAvDTk5MXmNQ2Pnm8z3kVBJmkYsDcxDtbtX rUkJYw6+9uab7wERwip0kkumbPSpUncPtJSVlaxuQtcmsgD0E/2u76mdlI4CYzCjxXhvpHSTyLD
 0P0FIzRhBoij/VlwAHKuSrJH5mlswyPPmLSyr0JTGqtN0toXBoJkstMgfKlCbUbvOx7RKSsj
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=6848a155 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=-GDc6ojF7u6cf32OQp4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100174
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PLPKS enabled Power LPAR sysfs exposes all of the secure boot secure
variables irrespective of the key management mode. There is support for
both static and dynamic key management and the key management mode can
be updated using the management console. The user should be able to read
from and write to the secure boot secvars db, dbx, grubdb, grubdbx, and
sbat only in the dynamic managememnt key mode. But the sysfs interface
exposes these secvars even in the static key management mode even
though they are not getting consumed in this mode.

Update the secvar format property based on the key management mode and
expose only the secure variables relevant to the key management mode.
Enable loading of signed third-party kernel modules in the static key
mode when the platform keystore is enabled.

Changelog:

v4:

* Patch 2:

  - Changes to the documentation and the patch description based on
    feedback from Michal.

v3:

* Patch 1:

  - Minor changes to the docmentation based on feedback from Andrew.
  - Added reviewed-by from Andrew.

v2:

* Patch 1:

  - Updated plpks_get_sb_keymgmt_mode to handle -ENOENT and -EPERM in
    the case of static key management mode, based on feedback from
    Andrew.
  - Moved the documentation changes relevant to the secvar format
    property from Patch 2 to Patch 1.
  - Added reviewed-by from Nayna.

* Patch 2:

  - Moved the documentaton changes relevant to secure variables from
    /sys/firmware/secvar/format to
    /sys/firmware/secvar/vars/<variable name>.
  - Added reviewed-by from Nayna and Andrew.

* Patch 3:
  - Added reviewed-by from Nayna and Andrew.


Srish Srinivasan (3):
  powerpc/pseries: Correct secvar format representation for static key
    management
  powerpc/secvar: Expose secvars relevant to the key management mode
  integrity/platform_certs: Allow loading of keys in the static key
    management mode

 Documentation/ABI/testing/sysfs-secvar        |  17 ++-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 104 ++++++++++++------
 .../integrity/platform_certs/load_powerpc.c   |   5 +-
 3 files changed, 87 insertions(+), 39 deletions(-)

-- 
2.47.1


