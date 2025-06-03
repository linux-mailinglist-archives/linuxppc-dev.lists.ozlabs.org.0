Return-Path: <linuxppc-dev+bounces-9091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A589CACC3C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 11:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBR3Y1Qc6z2yKq;
	Tue,  3 Jun 2025 19:58:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748944681;
	cv=none; b=OlUY/xxfppL7DXH+BrCZsYmBTlRDfaXVeKoRzd9xTQ2GTp+68zY++3xERF3m4qngTYyIg1nqHxYTUwgd65tr6wWZ8xhtJiSA8Bd0AyOrwqgRgU0EoOEN/DMzP7q8j7gNCwDGAbjR5nV73X5DNPhEfbhU5vjeNzHUc0IU9FvhNn2kLIfMX8fqoUs5elCprKbXn7/q4AfP839kliW2w98N1VupDZD2P0Fs2QsUREQgFPDNGKmEjryf1PiCE5R7cPoy5nCtNIu8ARbnB9HvYkPZT9hoj5yuW4M/gj0pPt9H22Ndk9+DZhWVHg9XijayyHoIn7XtspLw3Qw5GG1FlMaxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748944681; c=relaxed/relaxed;
	bh=YX9LFSa/7QyR6POXyugS4CZIYrOrq8GYyI1/cDzcRxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXOnz4qL88vmi5noR7bz3rgK8ojtEdADqumDKFOsAwKMPLPfwbofjyocnNOM8Ha67lMThvthx4I8zJZoCji+Wg/LIa7JDlxY61xGTCjFZjFN5KQ0BwLuJBcbS4f/whwlLeH+Kc2Oc92CWrVlFpraxGslfnW8PkUGMr5qmnKAmRhXFBSe+w2skhjXDQIwQmHld9IGUFtDwICFrio8E4ueENBjbv4T9QM0Dk0L+BILgPJ4xdQ4Nb0DCRc/0+PqUYp3E999vHtTwErHZuRwQ0L+PF63rktYjl7KMw9cSatBZ0wEoG+o/Ilz5j89r3b+/Nheeh+ZFFt9TgDHFbmdY7WMtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W/eg6vh5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W/eg6vh5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBR3W6NnJz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 19:57:59 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55378LHh027006;
	Tue, 3 Jun 2025 09:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YX9LFSa/7QyR6POXyugS4CZIYrOrq8GYyI1/cDzcR
	xk=; b=W/eg6vh5BA8egru0IT339pYMEcjpglxrRYMAOV1WrRv9IyeeNrd9vKe2O
	oK5crQrqFGQ9Bpry+EBNxujr+QF3+CRF/F83MW/wHdb64UDfDmwRe1GuAcn+QmlO
	AURxlFXGTOtM/0UhEN6Z2IfSc7nm1/xO1HuieqPV4DpFersuMNbJ829AcaB/7itl
	ye1m9AiQxPLZ0EECNYEYkiHt1SREuGeFvDdRzJ3K9dEUbNQkZPeKjgNwaaFIqbE1
	88m2jsh69l9rrDfskw/nGwZPVnpqgNxA4LHU1rSHQyb1bua+yYvtAA9Th6Uiw6Z4
	PiOaUjpmo5ysOahOTjLWe5DI4tL6A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gw1ueuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:45 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5539vj5p016447;
	Tue, 3 Jun 2025 09:57:45 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gw1ueun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5539vSAv031633;
	Tue, 3 Jun 2025 09:57:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470cfytahe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5539veUJ21430608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jun 2025 09:57:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 410842004D;
	Tue,  3 Jun 2025 09:57:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D09AC20040;
	Tue,  3 Jun 2025 09:57:37 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jun 2025 09:57:37 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Enhancements to the secvar interface in static key management mode
Date: Tue,  3 Jun 2025 15:27:33 +0530
Message-ID: <20250603095736.99007-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MyBTYWx0ZWRfXwV5LxK6MPDMW aHchcHZZmDW9L01m+j6ADTsNNakgtKlERqjjPnyXWp1TF+fFvUjtaflt2w0ABkwWzdNj7Oq/dQP 2jMsLn+MLdp59lhPB+Y4MNArujWT1CuZFX42RaMCUBIFdrlcdK1lp7CN70oFI7CL01D2xg5hu5x
 JnbsL/wkptkf8HfFtXdnQ1KtiqTDClHdBnWpMigf20Bh6n/bpC4cvRK9B4er92ZmhcyFTn6QhBH 2bHec/PZ44uH69S7/e23mK5CrVqruHD5IqRBHPswEMvljGZZrodiqagVSUTTTf3pr5UPYf5y4M+ gjZAgUNgSJIUeEa66TfCM5NVK7d3l5E4voKi3c7B07VN0xNc68BJxLWernCkkrMLA8ExTxQpmIm
 dbUmYsiSWsTngBJrcwO75zirW31TEaWhqJZk3wtUG7h/t6e+fzVx7vjA0w264g48gHywLBxt
X-Proofpoint-ORIG-GUID: QFSr4ee-26jKGWkCKXUsKu2R00gsLTtQ
X-Authority-Analysis: v=2.4 cv=HcIUTjE8 c=1 sm=1 tr=0 ts=683ec719 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=-GDc6ojF7u6cf32OQp4A:9
X-Proofpoint-GUID: lb-3DSGmYK8w3mPDGzKgh3DsjvTBU0qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030083
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

v3:

* Patch 1:

  - Minor changes to the documentation based on feedback from Andrew.
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

 Documentation/ABI/testing/sysfs-secvar        |  16 ++-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 104 ++++++++++++------
 .../integrity/platform_certs/load_powerpc.c   |   5 +-
 3 files changed, 86 insertions(+), 39 deletions(-)

-- 
2.47.1


