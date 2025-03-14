Return-Path: <linuxppc-dev+bounces-7027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F5A607DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVg660Qdz3cW8;
	Fri, 14 Mar 2025 14:47:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924034;
	cv=none; b=di+sa6UJ44+4vDBajmuqoqHLW/DXh96HBtopF4CQ6MvW/wVhwEl0BUv1Hd4+KcM9v+6aLyvOS8aPM13fSxKCCuDspJx8VDNiMv9LN5NsAqT7LCER6Ut0Qig70vhVQQh79JrMki+HWrd1qBIZFoREUkKnmDA14uuSkCFyOQdJAyC7RKYUf9jJWrSV7l5pQr2M3sNXdDg2PJB7d/VqOeHjcoEp+yXjbT0DBH1YKNr7dqExKjWAxj/z3xG+UnkCwSsaovHdJrS5fCX9j/waZQsj47iP9DwU1hC2Co6HyeOc9CRSK2CSORT+2qVP0P2+mc4MdsMTuNyI6Fwfu1piAx0HaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924034; c=relaxed/relaxed;
	bh=GqfipV5ca4LdAp5dGcglzb+9cWzAV1VCxMnJ+UczaPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACBjjuoptk4tqitl87pG5VlT4Olrx3c8+RhoPndPPNjb5eq7dQTOx3uIHUnpq5JYJuhdpYwwKuouSZHtBDPfLab7NlHbCBk41IZWj8/18bxB/e+pmNFkiHpSSkOIQl6B9p9UB9S8nLJVKUdxR+a/+FNnf/53cqGTaAEbSWZEfe86f3/VWo1SNX5UCnR+V2KvJMP5IIuMIcULNmcYXYafvD7ZkA9Nvyb0j58DVBpeFZ6zF8rzMp3UBtWBAyKF7PYRFLNZIJAn+Mogoibu4wDx+upQTrPVOmHYhb/YN0AXmiIKsypJebAN2fHu3n3Q2f/4AhMLdygFgvHAhv0NTGUx4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azvkX/+c; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azvkX/+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVg51Rnqz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPBpo007380;
	Fri, 14 Mar 2025 03:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GqfipV
	5ca4LdAp5dGcglzb+9cWzAV1VCxMnJ+UczaPU=; b=azvkX/+cmCOlQ/QleP2LVj
	zEhCYF4lVyBWc7YAKabmwhYZHs8HA7fhJOcstL9Jg0DfzO3vbSLxKIWF2INFKtpV
	LF41Fs13CPWqc0NLHDkXyngZmJxbi5A/pkTI0zfR6/sYUc6BjgQGWlRmbrw0sB/Y
	/t687OZ4DqfO4UCzX1jjZdp2WVM6/QqM7ABZic1bptHHUg5m6P4c7SgM40qJmSCp
	sfVBjRvN/43cQMUFNUimTSNuthpm/rLRp7Hd0dSaX4n+h3pWGs73J6cnKN0x8F5X
	cz7JVSpSTp1fkD3UbDPU2AeqRLcUtx6yoEUUE43q7D72PN/sTXPcznkr+MegT18A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s59ajy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:59 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E3kxCx027323;
	Fri, 14 Mar 2025 03:46:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s59ajw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E04KDR007468;
	Fri, 14 Mar 2025 03:46:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrd1w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3kuiH18809296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:46:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 693C42004B;
	Fri, 14 Mar 2025 03:46:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A808C20040;
	Fri, 14 Mar 2025 03:46:54 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:46:54 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix 'intra_function_call not a direct call' warning
Date: Fri, 14 Mar 2025 09:16:53 +0530
Message-ID: <174192385437.14370.8812406188343679236.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu>
References: <88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mmWLhl5V9nK_SNc1QL7Ih81ALHW2UDbF
X-Proofpoint-ORIG-GUID: L5VJTQ8DqvsXjDnuDVB9-1qbt2NOdF-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=727 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 05 Mar 2025 00:00:19 +0100, Christophe Leroy wrote:
> The following build warning have been reported:
> 
>   arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>   arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
> 
> This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
> for decoding all types of uncond branches") because that commit decodes
> 'bl .+4' as a normal instruction because that instruction is used by
> clang instead of 'bcl 20,31,+.4' for relocatable code.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix 'intra_function_call not a direct call' warning
      https://git.kernel.org/powerpc/c/382094a41c706bf9d990a224d5d4d34c02a21f15

Thanks

