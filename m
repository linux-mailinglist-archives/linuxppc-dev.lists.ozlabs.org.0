Return-Path: <linuxppc-dev+bounces-8832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDCABF232
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2T1J2Mw1z3c4f;
	Wed, 21 May 2025 20:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747825108;
	cv=none; b=FzvFqNE3fBvNFGQZTqjlGD+F5yE1Eu8M1vMGUxVhRrJ7o9tO9TqzlIy/x4JuekUoMNbbXAIWGgN7x6RRcEFxrjwthhPBa2FouqJnkgz/fpc+uxRuXetFnlR8yOFcGN4eo7A5/8xUM9mQhdcQ7pJpfHdj0QyXxyjQ4f4xCTWRk5feRE5YZQhFMQt9Kh1GTFt5w+GhGJiheZQMYFvBP3AZbqqtHKOEU/8w6WiI4NTs6hYV1fgZj8jP4FjFxDfzMn+82wIvUYLdh8zqtCCkNadAmIR0vhgCDsxZvrI6N0Wj3FKfuQB17h+QxFwqHIvL4qFYjcbddVhGVHutQwIVtL4mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747825108; c=relaxed/relaxed;
	bh=SbrGxKuKyhMa7qBj3W0O5z8k9UAjZY3w5kCX92wShHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kDNx8seKNzlVPGGcwmSZFpmU5anNi2oqDun4Unl8jXTImzcErv91Q8pVU7YfWgiNqDoHz7mYqEMTkKAfNy0bX2N+fRnXN53DlOor2O8gcLlgz4Zgdz3ew2++MS0u9FDHeizT4nb6AZrEpp0emwaVw3stn55QmlkUR48JBIp6Axuqmxj0NwgklyKLbaRi2C+628SHHPGGrQnWOIWiAp0d1r5oXuMC4N5xJFGkKz7feSYCKQqJCzS89pJJ8uQjTpREjTFktoxbLdkkozbyp1nXW6zUcDNKLwxvN6pTDqVUS3yij4sCA3arWgqK+qXyCyBHH7o7JURy6N+A3DTQiRhQLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F8TGzlRI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F8TGzlRI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2T1H1sTXz3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:58:26 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9ErlM031285;
	Wed, 21 May 2025 10:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SbrGxKuKyhMa7qBj3W0O5z8k9UAjZY3w5kCX92wSh
	Ho=; b=F8TGzlRIl6p7H5diI1+i+r2jeckSM9XULK5C6JIo3+Csn5gCq4kV5DoTe
	iFqcXXI0O7RaxndrB5jF8Kfg1LfnrRlU/gP/lTvYYMJhhy5/y+heUTClzJrFx1yD
	s0RUh8YUejqcE9cJ3cAMZVAikkglY0oPktoOcK9POz5NACuD7oUZg5DH3mPu5Ubn
	+hwuOQMyQW3B1UDhrLVfL92gRR9Toy07wbJxseCQrHeQYouf/4NcLc39WCZ6NggH
	c57MF2/s4DV7d3U5pGJlojM6B032Px5/4me3+K0KXrxtXTjG6QXq9KwKf/zRMl2A
	IsuTSM+dctW2y0w2xMIjNKHwW56yQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sc1j0ex9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LAw7U0002582;
	Wed, 21 May 2025 10:58:07 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sc1j0ex4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LA0ewA032009;
	Wed, 21 May 2025 10:58:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmq3t90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LAw2uT31392020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 10:58:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4453A20043;
	Wed, 21 May 2025 10:58:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3AB920040;
	Wed, 21 May 2025 10:57:59 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 10:57:59 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Enhancements to the secvar interface in static key management mode
Date: Wed, 21 May 2025 16:27:56 +0530
Message-ID: <20250521105759.8408-1-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: AK58A0-4JuZcf24V18cmuGtLGK8GB0px
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwNSBTYWx0ZWRfX/GRMz80Q8Ta7 2WGuT+a6GWBrZbRnqPMxwdyfti1sltArXpI5hPQg6wkVT47FUR+GcVGq2LvcYR0bQl5+N6oHIeV VQcQle5z+GjV5yZnsk/B3hrzigBLi7pln95NMCz52V7Bf7VEiB4XCFaXyQL++ScZWgURkVVYVve
 Dct0+MNJrz0Za0ZQKUT1XVrNoFCNins4Vy2qAbPmGtAAL2VjrDwUyJgUThOxH/rwonVuw7fVdAV isUpJ7KvCAQPH6Rk60hLB22pRQZ7hrR2OyFIFBxX6HZxS7yKPrksLWJaR5/z19Qq95t0XYPEIFI ipcwF0vIoRnbEBAv8aHNYa3vf0nDXfPhMufwpVlFejBT2kcMfzkQcHZF6ZISIYA7BcdgbI1cMqh
 BFyHE72Jfb/omcPmujuYq0jsOH+R/zCZi1HYcXbLlAMHeQTT6E2inQm0m28onj03wuMwZZOh
X-Authority-Analysis: v=2.4 cv=GpdC+l1C c=1 sm=1 tr=0 ts=682db1bf cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=-1jmnclONZOZV9iy3uUA:9
X-Proofpoint-GUID: ArT8vSoai2X7r-3ul74AEPLarJQFuL55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PLPKS enabled Power LPAR sysfs exposes all of the secure boot secure
variables irrespective of the key management mode. There is support for
both static and dynamic key management and the key management mode can
be updated using the management console. The user can modify the secure
boot secvars db, dbx, grubdb, grubdbx, and sbat only in the dynamic key
mode. But the sysfs interface exposes these secvars even in static key
mode. This could lead to errors when reading them or writing to them in
the static key mode.

Update the secvar format property based on the key management mode and
expose only the secure variables relevant to the key management mode.
Enable loading of signed third-party kernel modules in the static key
mode when the platform keystore is enabled.

Changelog:

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

 Documentation/ABI/testing/sysfs-secvar        |  15 ++-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 104 ++++++++++++------
 .../integrity/platform_certs/load_powerpc.c   |   5 +-
 3 files changed, 85 insertions(+), 39 deletions(-)

-- 
2.47.1


