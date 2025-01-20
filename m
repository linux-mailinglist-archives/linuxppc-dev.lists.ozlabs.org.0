Return-Path: <linuxppc-dev+bounces-5422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C78A17203
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 18:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcHY84btFz30Kd;
	Tue, 21 Jan 2025 04:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737394524;
	cv=none; b=C4EItA6byKtvyg4mYjfYvl4LeIs5Z4zW7vx3MohKtIz/+8sNYHJXq5/lMulCbgbRmKf3Wev0Q9z4wx/HPgT584sSc8VDNHdZQ53Jy1eLULq+suik5YgM4alIhSBhcxvNmTQlFyNMrRul2o9Ey3/6641ammTUYir8pnPQo2Dg23QP6XDEkjAmhZQ5etMo8mmQfbBI4GcEX0+sByRDz/UZyW/HEc0CzE1S9nMAnsWZpePb1XLow0X6khsX0TPx+ObSu2eWtJL5r+yO8uxx1WjY9kv+qF4epv9f6fj+WBSaastERs1U1VWxy59ysQ5zELVfpJ8xbjgT5aW9rfnTD06FlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737394524; c=relaxed/relaxed;
	bh=Y+697YSpO3DohkVrT2N6RWmeQ7PqiKotc4NPn0zjrl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lwBhEDL8kk+yeLP1LGhXozZg73ehweZ3OL0gRLoj1N0OUZ15y0mMpDQE5RDtm9PtQIUMvBWPROxw8A1bzVOiF+2+1rb3pLZqlS26zDV0XZzyK3z/RfVWnc4OTDr69iL7ZGxGFePlwl7Whq6T2BcVR4TuIrGxLsXYLSAHoOtCI+CRWnH8A+oD6dqZA5dB/87z3201duYw9lnfOg0uM4S0tFGC2se8cPrsJ9IpUXmvPUBL5UIy4EuyWKCC81++/d7tZcae+nZv4/I3pehx7YgDtNrrFv9JN3aCSNSx3fpnmjgj5Q9cr5d0u3IrAxG7tSyes9yWjKPzfRRi98Hh0IxBSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r+63y7al; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r+63y7al;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcHY72ysPz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 04:35:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KBlIH5000577;
	Mon, 20 Jan 2025 17:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Y+697YSpO3DohkVrT2N6RWmeQ7Pq
	iKotc4NPn0zjrl8=; b=r+63y7alPJXLOhllkw7n/4CPECK6gcKJFZqBBvAKg39J
	IcmpQ10HF+50fH5L1t2yNeE6IAE3qBwa/DbOPLoEo1DN3MJ9BLH0IUDRS3UoILgI
	6rsTK3aJnP1gw4FAsLQ/jKmb1q4fW2XpvsIPlZzX6uijJyiKtZxvczZqbWStdulh
	Z4ftX94YOY7v4YOoyLsiVne6gwx01vN5OWP6415jUDHik1fvgFtawuAmyCTZkIYg
	mEq6J76VXsw7k3oeLCe9aMHcn9RFn4iI5MQ1557kiONhYJPbY2nfS5rdL6zPgZg4
	P/TZaXgeMyQyY38FiYjxVxBbZ735weMq/yN8ygc+nQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449db0uqtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50KFHAFh024258;
	Mon, 20 Jan 2025 17:35:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0xyjd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50KHZ8pv33751500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 17:35:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D0492004B;
	Mon, 20 Jan 2025 17:35:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C4720040;
	Mon, 20 Jan 2025 17:35:05 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.123.118])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jan 2025 17:35:04 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH 0/2] powerpc/fadump: fix additional parameter for HASH MMU
Date: Mon, 20 Jan 2025 23:04:58 +0530
Message-ID: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2yiRBYwCSxVGS10SOLHj5hRvA6KBiGc_
X-Proofpoint-GUID: 2yiRBYwCSxVGS10SOLHj5hRvA6KBiGc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_04,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=599 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200143
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Patch https://lore.kernel.org/all/20241206065545.14815-1-avnish@linux.ibm.com/
proposed the MIN RMA change to 768MB, which impacts the fadump additional
parameter feature for HASH MMU. Here’s how:

Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
dump capture kernel") introduced the additional parameter feature in
fadump for HASH MMU with the understanding that GRUB does not use the
memory area between 640MB and 768MB for its operation.

However, the patch ("powerpc: increase MIN RMA size for CAS
negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
memory up to 768MB. This makes the fadump reservation for the additional
parameter feature for HASH MMU unreliable.

To address this, adjust the memory range for the additional parameter in
fadump for HASH MMU. This will ensure that GRUB does not overwrite the
memory reserved for fadump additional parameter in HASH MMU.

The first patch exports the MIN_RMA so that fadump can dynamically
decide the suitable memory range for the additional parameter. This will
help us avoid similar fadump changes in the future.

The second patch includes changes that actually fix the issue described
above.

Note:
This patch series is dependent on the below patch:
https://lore.kernel.org/all/20241206065545.14815-1-avnish@linux.ibm.com/

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>

Sourabh Jain (2):
  powerpc: export MIN RMA size
  powerpc/fadump: fix additional param memory reservation for HASH MMU

 arch/powerpc/include/asm/prom.h |  2 ++
 arch/powerpc/kernel/fadump.c    | 21 +++++++++++----------
 arch/powerpc/kernel/prom_init.c |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.47.1


