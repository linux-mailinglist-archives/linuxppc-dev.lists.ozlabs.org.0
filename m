Return-Path: <linuxppc-dev+bounces-11405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0AAB392DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 07:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC91s6jZ2z3blc;
	Thu, 28 Aug 2025 15:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756358961;
	cv=none; b=KXjxHUUOTYQOKfiAPHXgs9LKmsVEMmAbK1BUPwtxcS6fFaPhHHjZmSx5AebA/+g04cji8V1+dhCMWWEePzC1CQMV8H/mW0I7nHBkkfsiwJzyqerX6ZfFzl3wjATQcH+5VbVQV2U89eO6JHxef+sCKFvdEStyBmpR0BetK8J968W+SlK41Ae4OBbQzKTOf0lHu/b7lj8xegwoHS/NsfJYFBycAiPlvaAsyU3hIuOw2m2Tk53A6OiUzBNIShTTcAgrRMGwOS8QlpeJgDPmG4w4COuSkDmwdQENXVd+fc0hhpp6Fh94bG5rhd4vOM5cRrlrlnUmngGQWDZCZDlTYdfDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756358961; c=relaxed/relaxed;
	bh=W3YZ/zTzqNnvixi2EoicWpWm0NUqtqRjH11Z9UGPw1k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mDFoENw4pvkGszbJptQ6uIf2JIwgrfo+kBYo71AvVbT1hzTkmiQBVnLSrx10d2UmcxbryUe/+uUZmyBQV326wbWaeLUE51Zppfzngsfjqce1/ZQaXTBMOhVy0e53DvvT4VDp6pidtpsdvF0dJueio/Qmf734sunsv3lKwFF67QMgUn1IEAXyFKdXmj6O6DQ1ZKnVqVywOss4BXl3VMTuJHOVey51Tb1OFj0V2Pry06nttvAK/PxACezlaYgWBDITJjaqAHt07KZPJ/Ft1PieKs61lP9+SNEUKgXRl28agrsbmtSySwi2oBA8ajxWmXjU01E5v4dCPmMFgFx9l2LS4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iypRVBib; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iypRVBib;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cC91r5z8Lz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 15:29:20 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S1fWCU030401;
	Thu, 28 Aug 2025 05:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=W3YZ/zTzqNnvixi2EoicWpWm0NUq
	tqRjH11Z9UGPw1k=; b=iypRVBibTXbpCrAO8OmTLV6vbbDumIhjTuNIoYdivXPb
	ZSjqKqwALVQm0zLcsRmeWXlEQltUd5vdT+Z4TPUVo+1/73yqrMsK0pM1Cd/Qb1V2
	vf97npdnG6p40V2tweDMB7VmVENdpgdWXL6ThU7LZ6U9XSRzP3NM6hP1Jjg27hTB
	1FGnqd2Ap9NeBj7Afy+e1C6s7B6r6/qwnpxLXmVkcOM9ZNpeTERSdkWng5BKGeUL
	5Y1hT9qYxoDVmz7tRfICsnhuVSE7QoXieCsX8drIalax0h7eZeZOkZtFQmFCZe2N
	ub6Z0EMPTAHoWGCXSqzgfmtMNrHOI2irgHY3+MwZyg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw2vyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 05:28:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57S5QhQ7014062;
	Thu, 28 Aug 2025 05:28:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rw2vym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 05:28:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S4CH4D007451;
	Thu, 28 Aug 2025 05:28:57 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyukm64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 05:28:57 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S5SuHt590568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 05:28:56 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F395E58059;
	Thu, 28 Aug 2025 05:28:55 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45F395805C;
	Thu, 28 Aug 2025 05:28:51 +0000 (GMT)
Received: from [9.43.64.161] (unknown [9.43.64.161])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 05:28:50 +0000 (GMT)
Message-ID: <832d6a3f-40b2-4e81-86a0-99d6ad73f1a3@linux.ibm.com>
Date: Thu, 28 Aug 2025 10:58:49 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ajd@linux.ibm.com, gautam@linux.ibm.com, jirislaby@kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        masahiroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, zhao.xichao@vivo.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-3 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: owCUOC0eC1YFaJSIhzI6j5_N7kfEUQTy
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68afe91b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=F0ATjmcYWGgMqGeifjYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Wd8lPUtfKc5uEip6qM4oM60j0FhVq89A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX7kp/RQXf87B7
 UH83HW27thtsSH4Lg5Cj+tLQrIcF25weCBVjrXEjBdhY02hCZkNbJaHrOwY7Xy335fR92aWq60F
 EaNI6IEgIoFTIj29fNWiztghqE3eiyzN0jjIdYE7rTCYUIjiEFoJ52jEDPogc/kiKvtu3Cjd9hC
 TJFm98LnO76pGUb2KYQSBGKE3+ArxcZdu+eTwxp7h6P6ULUDAhYekyP3+KzwS3QTn9/rVvzhnPw
 tRJseYfzMCJrfzgbqV8nB3mYr6C2WTu+vnmLty3dFBwUaLx6i4r4dyNKU4mLh3aFzftOJLUjRiZ
 ITbrdSaxYKBaDKwVnoJJhiatJl3pDV6vyrqIwlOFOgxOrbdYLfvFNSl7CRSsowmbRPUruqNusdP
 T6nRXL1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull couple of powerpc fixes for 6.17:

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-3

for you to fetch changes up to 8763d2257f5231cfdfd8a53594647927dbf8bb06:

  powerpc/boot/install.sh: Fix shellcheck warnings (2025-08-20 14:05:18 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.17 #3

 - Merge two CONFIG_POWERPC64_CPU entries in Kconfig.cputype
 - Replace extra-y to always-y in Makefile
 - Cleanup to use dev_fwnode helper
 - Fix misleading comment in kvmppc_prepare_to_enter()
 - misc cleanup and fixes

Thanks to: Amit Machhiwal, Andrew Donnellan, Christophe Leroy, Gautam Menghani,
Jiri Slaby (SUSE), Masahiro Yamada, Shrikanth Hegde, Stephen Rothwell, Venkat
Rao Bagalkote, Xichao Zhao

- ------------------------------------------------------------------
Andrew Donnellan (1):
      KVM: PPC: Fix misleading interrupts comment in kvmppc_prepare_to_enter()

Jiri Slaby (SUSE) (1):
      powerpc: Use dev_fwnode()

Madhavan Srinivasan (3):
      powerpc/kvm: Fix ifdef to remove build warning
      powerpc/prom_init: Fix shellcheck warnings
      powerpc/boot/install.sh: Fix shellcheck warnings

Masahiro Yamada (2):
      powerpc: use always-y instead of extra-y in Makefiles
      powerpc: unify two CONFIG_POWERPC64_CPU entries in the same choice block

Xichao Zhao (1):
      powerpc/64: Drop unnecessary 'rc' variable


 arch/powerpc/boot/Makefile             |  6 +++---
 arch/powerpc/boot/install.sh           | 14 +++++++-------
 arch/powerpc/kernel/Makefile           |  4 +++-
 arch/powerpc/kernel/kvm.c              |  8 ++++----
 arch/powerpc/kernel/prom_init_check.sh | 16 ++++++++--------
 arch/powerpc/kernel/setup_64.c         |  5 +----
 arch/powerpc/kvm/powerpc.c             |  2 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c   |  3 +--
 arch/powerpc/platforms/Kconfig.cputype | 13 ++++---------
 arch/powerpc/sysdev/fsl_msi.c          |  5 ++---
 10 files changed, 34 insertions(+), 42 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmiv6G0ACgkQpnEsdPSH
ZJRFww/9Emkh7vi33dCowAFNTSNMEJFZla+JAAMPJ6TsX7kWw2Ejxcj9aymEBY89
udTNgrX8zYgdHkfFMUwW/e+XSb/B5/Em/ssEcFLTuVIc50WKdt8eod0b3gHMx1Nv
RmxaHxivM9Pp2mEuCuw7oEJYcYDQFxPJd6KToeKNgCODp7f+ZC4jEos/ObxuwPOf
+96iIeqS/QIkaCb4DRFg7ZMUYrSWJw2tQGRkocmuPW7/ryVSj4cVB8YQGR/oEhr8
BCSMiYY3PO6u+9laVxtth58AqJhQ6n8WMG83W+IHUt6c7Ed4C8rkYDHwdJSkMi9t
wq1VUajEmKO4V26NXSOgqZCtLZK2XMeMdBmP3rjkFX5/lPU4QhmDza2/RP9UAXlC
mXNL6V36iOyRa4GUDvY5prhEn/+Jli+W1aAnnrB1cqFDsy9wvw3NhrY2h8KsGPhF
CnNiUNfIfxjYgONFHxmcgPhbxkEF4f8OWudnmVUJzxq9ssXGZNOuR22OiIozrWTf
T8GFRvIUJ+lc49/iB8ve81+KCf7EPCdLUSMXsBdHxGK1bm1MR8tSOpixt0N2NxOr
Ujq6Mco57Bwz+IiaDKQ652sS2VpbhYWYh1dhQJcrcHODwQ289ONJ1infZ0xrl9mT
/EQhrnxj73l7e2/87Hdk6XNpbiY62IXks0Tgp18u9os7/WOZmKw=
=T1gP
-----END PGP SIGNATURE-----

