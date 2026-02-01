Return-Path: <linuxppc-dev+bounces-16495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI33CwRvf2nNqQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 16:19:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C3C64E3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 16:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3thG6MMPz2yDk;
	Mon, 02 Feb 2026 02:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769959166;
	cv=none; b=UfPUwZFbZIn6SafNCCaIUacTuTVnMc1z4NLiJb3Citj5GwQnD+qSK2sq4wU0KkHKL0wdES/ITdqBf7KLflkB703vPwsyi4VzjS1X1q9u6mpPo4C3y7pwmRCHHdn8jgAkwDf017RKS+YADNB+qf3VgLpP+swdKaDxEap2Z5N7iM5uN93zovAyjxDjW2FlRdxc0Wbe+eGDkolPV/jIknT6rkiggkrLjtPd5g7YxMKNY65mxYwOAdU2jnGRiFuomFco2n23YaBpLzQVny4rxhFLI2V/1+hFLor+OFmnJtwlJn+7g2L5Pf02j9arMTSYFbNp76fm+9ZdNKaE6QW4HpDfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769959166; c=relaxed/relaxed;
	bh=fC4JBEapiy1PkXawkT01QKPuA+i/WW6/kWw92rp+mAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSEZeqiFV9UKMfH3yCSXzL/nFRKlW5lRSjGbCpDCbyDdXqrZPs7YYvPbKlpSVI+ZmSjoHNyB5BDpwCMtNbneC1pBtRTYqZy/oydDWFSXLFtnoDrEWvTsoe15/zbW6BG7SwZVDQR+eAPZhlgSDb+oy6xSdTX2kzNgUgeHJ2FsoPJ74Z3gG8P2tnUyUM/22SQPvY+T2kqvpxUMKspC69DMnOTOTXuWfMngBPpU3A5NXmponRbBvZUy+zTEAYkjS+QA9KEi0aZpLDIy074V9HzA15ESI2C+xsTSRxv9lwjM/Ev7/HQgzVMrCmiCYZ4oCEqjFzg5gcvse/pa+82Ei4IzQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tTH3UqgT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tTH3UqgT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3thF3Kp7z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 02:19:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6119smxb032511;
	Sun, 1 Feb 2026 15:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fC4JBE
	apiy1PkXawkT01QKPuA+i/WW6/kWw92rp+mAQ=; b=tTH3UqgTMsXsq3CAi6qomO
	tcilgRfncLgpvxuaA41qu6ZaGQBTRVX/JmmgQ88Haxi5Pocm/01Lf92ojaoZIYMv
	RzkRJvin17VbxX5ksWCPZmxTr8yrI2vtSk50IpVFO/wSgvIuyXzIvHRXqW3qmE8e
	HJC8+5ZebZ46e04M2ZEVj6NEPlhsaliXi1AwYZhFrD604kiLaPm+8H1GNcP/Es+n
	C+y3XtikvmBLTWJ2TpeBlI+A2Y6sMK1DxxLYbEkczBHueiWTAdJxhrB5n5HaiZqy
	9B5uuW/DwmgG1StsnNKr094BU3oF+f/1t/V/cGoBpRl+oNZaX1Aw+Qu5yLHXnwEA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mm31d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 15:19:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 611FJ9Gc027930;
	Sun, 1 Feb 2026 15:19:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mm31b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 15:19:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6119eBNT005996;
	Sun, 1 Feb 2026 15:19:08 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c1x9j1k5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 15:19:08 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 611FJ7hY56426782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 1 Feb 2026 15:19:07 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0075758055;
	Sun,  1 Feb 2026 15:19:07 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 987095804B;
	Sun,  1 Feb 2026 15:19:02 +0000 (GMT)
Received: from [9.39.20.75] (unknown [9.39.20.75])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  1 Feb 2026 15:19:02 +0000 (GMT)
Message-ID: <19427059-aa89-44f6-af0f-19fa183aba32@linux.ibm.com>
Date: Sun, 1 Feb 2026 20:49:00 +0530
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
Subject: Re: [PATCH v6 0/6] Extend "trusted" keys to support a new trust
 source named the PowerVM Key Wrapping Module (PKWM)
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <20260201135930.898721-1-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fZP1mfwCu8JsOGoZFMTRSZNTf-fJLkiK
X-Authority-Analysis: v=2.4 cv=VcX6/Vp9 c=1 sm=1 tr=0 ts=697f6eee cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7O0lCG0yHcpZzvEBGfYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: XFFXzxzahiN6srMW5N7pZtxszOUQMN7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDEyOSBTYWx0ZWRfX6QiZBpYsGyN+
 0zCePtMRroHcxse6FvdeX8KAOWI/nMxM9y5UFFteFSkajFqbjYp4H4FksgLGOx8WJitvXL2kjSY
 XWPH+bwuek6kE+/OjXdYLKl6uoAusmvTtthubtEFDQA7EqX/3tzX1blTqo6Mdj1v1oJfbxg4No3
 j2dMHeRDxJ0uUYVdcx/eTg9c/Z0Kh/PH4Lmz+EggD+85yl/OVOzA4nL2pjzjgadXxTW0Hsb/RM7
 Z/Q7f/nE5FWxpLPNxjKPEpSzbogWVCIC29SDBBE8peCocBEoCAU8Ui4hbxYeZD5v+YTccfQIf9K
 kBC8MHYADEjtgs40jnqknz/MuL/QzdqptMMe7Y7Pd/kpCMGz4WynuXRJ+MzejmYY+T6SiQc6vm3
 ojuhsiFAwo0J8wMtVtTljuTUEQ9ZT8dAx7s4+5ZMLfeSyKhrYm4kVH2rPJK8JQjiV6tsuE9adt3
 oVKs+4GPfaiFdrtIBBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_05,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602010129
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16495-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14]
X-Rspamd-Queue-Id: DA7C3C64E3
X-Rspamd-Action: no action

Please ignore this series (v6).

thanks,
Srish.

On 2/1/26 7:29 PM, Srish Srinivasan wrote:
> Power11 has introduced a feature called the PowerVM Key Wrapping Module
> (PKWM), where PowerVM in combination with Power LPAR Platform KeyStore
> (PLPKS) [1] supports a new feature called "Key Wrapping" [2] to protect
> user secrets by wrapping them using a hypervisor generated wrapping key.
> This wrapping key is an AES-GCM-256 symmetric key that is stored as an
> object in the PLPKS. It has policy based protections that prevents it from
> being read out or exposed to the user. This wrapping key can then be used
> by the OS to wrap or unwrap secrets via hypervisor calls.
>
> This patchset intends to add the PKWM, which is a combination of IBM
> PowerVM and PLPKS, as a new trust source for trusted keys. The wrapping key
> does not exist by default and its generation is requested by the kernel at
> the time of PKWM initialization. This key is then persisted by the PKWM and
> is used for wrapping any kernel provided key, and is never exposed to the
> user. The kernel is aware of only the label to this wrapping key.
>
> Along with the PKWM implementation, this patchset includes two preparatory
> patches: one fixing the kernel-doc inconsistencies in the PLPKS code and
> another reorganizing PLPKS config variables in the sysfs.
>
> Changelog:
>
> v6:
>
> * Patch 1 to Patch 3:
>    - Add Nayna's Tested-by tag
> * Patch 4
>    - Fix build error reported by kernel test robot <lkp@intel.com>
>    - Add Nayna's Tested-by tag
> * Patch 5
>    - Add Nayna's Tested-by tag
>
> v5:
>
> * Patch 1 to Patch 3:
>    - Add Nayna's Reviewed-by tag
> * Patch 4:
>    - Fix build error identified by chleroy@kernel.org
>    - Add Nayna's Reviewed-by tag
> * Patch 5:
>    - Add Reviewed-by tags from Nayna and Jarkko
>
> v4:
>
> * Patch 5:
>    - Add a per-backend private data pointer in trusted_key_options
>      to store a pointer to the backend-specific options structure
>    - Minor clean-up
>
> v3:
>
> * Patch 2:
>    - Add Mimi's Reviewed-by tag
> * Patch 4:
>    - Minor tweaks to some print statements
>    - Fix typos
> * Patch 5:
>    - Fix typos
>    - Add Mimi's Reviewed-by tag
> * Patch 6:
>    - Add Mimi's Reviewed-by tag
>
> v2:
>
> * Patch 2:
>    - Fix build warning detected by the kernel test bot
> * Patch 5:
>    - Use pr_debug inside dump_options
>    - Replace policyhande with wrap_flags inside dump_options
>    - Provide meaningful error messages with error codes
>
> Nayna Jain (1):
>    docs: trusted-encryped: add PKWM as a new trust source
>
> Srish Srinivasan (5):
>    pseries/plpks: fix kernel-doc comment inconsistencies
>    powerpc/pseries: move the PLPKS config inside its own sysfs directory
>    pseries/plpks: expose PowerVM wrapping features via the sysfs
>    pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
>    keys/trusted_keys: establish PKWM as a trusted source
>
>   .../ABI/testing/sysfs-firmware-plpks          |  58 ++
>   Documentation/ABI/testing/sysfs-secvar        |  65 --
>   .../admin-guide/kernel-parameters.txt         |   1 +
>   Documentation/arch/powerpc/papr_hcalls.rst    |  43 ++
>   .../security/keys/trusted-encrypted.rst       |  50 ++
>   MAINTAINERS                                   |   9 +
>   arch/powerpc/include/asm/hvcall.h             |   4 +-
>   arch/powerpc/include/asm/plpks.h              |  95 +--
>   arch/powerpc/include/asm/secvar.h             |   1 -
>   arch/powerpc/kernel/secvar-sysfs.c            |  21 +-
>   arch/powerpc/platforms/pseries/Makefile       |   2 +-
>   arch/powerpc/platforms/pseries/plpks-secvar.c |  29 -
>   arch/powerpc/platforms/pseries/plpks-sysfs.c  |  96 +++
>   arch/powerpc/platforms/pseries/plpks.c        | 688 +++++++++++++++++-
>   include/keys/trusted-type.h                   |   7 +-
>   include/keys/trusted_pkwm.h                   |  33 +
>   security/keys/trusted-keys/Kconfig            |   8 +
>   security/keys/trusted-keys/Makefile           |   2 +
>   security/keys/trusted-keys/trusted_core.c     |   6 +-
>   security/keys/trusted-keys/trusted_pkwm.c     | 190 +++++
>   20 files changed, 1207 insertions(+), 201 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
>   create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
>   create mode 100644 include/keys/trusted_pkwm.h
>   create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
>

