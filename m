Return-Path: <linuxppc-dev+bounces-8178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C7AA4641
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 11:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnWT91QtLz3bh6;
	Wed, 30 Apr 2025 19:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746003853;
	cv=none; b=nSWCrdIks5tbQDyz335DioF4c8ErXlqjKj2/uDV2xIFhZdBRQ7EPqNgfan+gb4gLj27WuGXtC12S8Yx9K6DzxoPh66iuNQVnOVAX9IcVsaP7nEpgqr4iFV2cnSS7RXVStW8kUBdZEmCJu7RZpDVkErD7AwWK5CggWvycuMihv50SOSPnfTwSeynXsgf0tVuKo80pAOc6WL/SbFIlzlbP5t/GtjShCtvqSVdRGgGmLzMlzw5+lux15Q9/c1AL98IrSbB64JTI/TzrpOcI6G4DyY6+6MXB/LkBCcqHJ3lWBTynyQZQd1pKbnLbTDhOsBzJao6Cio9qnZrHtwBjOrV6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746003853; c=relaxed/relaxed;
	bh=vKuBZ5aZc0d1DJ2ixmVGYewRSDRmMTUcAvN2prhmTkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORQBTFnlQns7gogtlwoXDRoQ55sl4AAf7BnUv8lskHAavx640Rg+F6hHV6kvVIreYzyA0KvqvSWo8E0dOGB+LhP+Hqsvi1XJdfwyYRRbbrPKwx+JLVNwfXt1QsyOoOntnI27QYDuFivRAayH4gIKraQfgWUzKuHguDjIwtzbYrL6at8C9d8cq/Bot+IVMA09fjXOm0tPog6apm4OOeOjoXnhJLwwylenKdVEGLkJth5XJgyz3/iNMhQ6/mVC8RcuW+gvxjPQJ+9AMbxRymHv+qDO3b3E4NNASwpxEExqLDyHqAhhLmE/gkH1GzE5Cr+CxgYKvhwM/H3GbH0JbHTQ9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOrwCMxH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOrwCMxH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnWT823yjz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 19:04:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TNkGna027564;
	Wed, 30 Apr 2025 09:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vKuBZ5aZc0d1DJ2ixmVGYewRSDRmMTUcAvN2prhmT
	kc=; b=HOrwCMxHMgMabaP+Kinn51j52stEhUWOZXo3pp6SQXC2RlTIZ+g2mj83C
	QHlGx/GK5XkMAjlWRv/WHHhiQ/ydicPPU9tR0x2A6fCnCAJw+GA7yMnz5tUs2PL1
	uuF+Wxk26vZyjmnhNAHvPdsiyPzyVxpG3BKvzFbScPJ/syDBPo9VuTji/Lt4+u6n
	bhd/I8i9+5fvQouCHqj11tcF7ELXDd6OZyFS/VI++j45kI4bW7MASVm1wtgTFsfR
	LI0c9GFRFW2kSoCmCB5JMYN5ctH6kECzVzbqLbmqhK0pKr2JHhdfpCFR/KOSOiQD
	BdVko79xZAXSdQs+mhvZ1pDZE/ngQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:03:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53U8mTQN021165;
	Wed, 30 Apr 2025 09:03:57 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:03:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U7DEPl031627;
	Wed, 30 Apr 2025 09:03:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tu79wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:03:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U93r7C17629530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 09:03:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65DEF20043;
	Wed, 30 Apr 2025 09:03:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDC1F20075;
	Wed, 30 Apr 2025 09:03:50 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.31.221])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 09:03:50 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Enhancements to the secvar interface in static key management mode
Date: Wed, 30 Apr 2025 14:33:47 +0530
Message-ID: <20250430090350.30023-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MCBTYWx0ZWRfX5CwEZ7CcAuaH 3JCjHEbeTGRgoqDQLepQqbrjtefpMY/V6FN6IVI7vwBene6TRku7Aups4kt74CdKU08uywcXSPT Bjlxn5SrcRsgMGcPYvxOTuaLbTrK40YKRBhZjYI0bZTq8h/exvWYJd6uIiI5wqQt26Tb2k2xahq
 8CqFE8J9HcBx00wvtKJMjS1SvvyUmLmOsF2bSjdmIeWnXYYtnKHR9y8SM6G3TXf3P/lhu6hlQgE hd3K6hVnmYmAIYl80+O85tweEkB+Q7LY3w5H4AgtMg4Nz/Ytry3pvN6FkfnQtbGeCRkT8sks3hr 0ViXFKs2MNKxX6V+3/6Qbt69cTmsZoZzA/5xxl0J4FOBRoASsUJk4D60Zlwfhw4Nl+bSiASaERK
 Be7QFUSxGsQ+SR++i7SOU5tnwoyN/uerOmiwVm23XK6o7gQQJtMFYnJVgHOYjv2Aj1X92XcD
X-Authority-Analysis: v=2.4 cv=OqdPyz/t c=1 sm=1 tr=0 ts=6811e77e cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=-1jmnclONZOZV9iy3uUA:9
X-Proofpoint-GUID: WsIpi0vml3b7-lnxn2t7OFbitzGNn3PZ
X-Proofpoint-ORIG-GUID: 6QxYdSmDHmGiKknebpMSRVYlQek6CcKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300060
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
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

Srish Srinivasan (3):
  powerpc/pseries: Correct secvar format representation for static key
    management
  powerpc/secvar: Expose secvars relevant to the key management mode
  integrity/platform_certs: Allow loading of keys in static key
    management mode

 Documentation/ABI/testing/sysfs-secvar        |  9 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 98 ++++++++++++-------
 .../integrity/platform_certs/load_powerpc.c   |  5 +-
 3 files changed, 73 insertions(+), 39 deletions(-)

-- 
2.47.1


