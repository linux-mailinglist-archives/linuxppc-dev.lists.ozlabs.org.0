Return-Path: <linuxppc-dev+bounces-17776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGPbL2F9qWkg8gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:56:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44D2122DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRTzw3y4dz3c8s;
	Thu, 05 Mar 2026 23:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772715356;
	cv=none; b=fkWbbiSuxngKhz6wKuishAaoIr7bHWTH/BKno+AzwDVnuhYfH2XHv0vKQWfWYBXzkVzme5BwqG1SzpHum6Cvxy8xbALlSmrB58eJ5C9YFMuKNTp3awL/zEzpeh8L/9Mm18Q9Za2poJMXFJ9hCMQLxgII5XtDlhk7/T1eVbUiBexE1snFHAlW3E/slfqimXazkBTfi3E8DBdj1e+66QiYLBK02Fd7YpVKx708Yp23PayKGog0siFqkW7NzLHHtohXgvP34qsdyT9FMgtvztrUW1HM6p0tWiQH9+4VMMpyAwpFErxEdXjZVkt2zZNAFBLzDBePWnxkyAAiqA/mk+hYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772715356; c=relaxed/relaxed;
	bh=j46n/Cl/uiusceyLFOPeUtqO6xM+QOc9rxRmh/YsaFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrkpnFPfUtWtebTqTAFugO8wekcoEeL7H3o6K76HURseXilz7Yd02QjaVLh+TggCaXfzfXB8LgdyXYeqZD07MCP/rKCCk4ElG4iZJmmVkSl33elZ12G2nsaKHB+YlX+0gbBCFkOk5B3HkEPXKGvKaFcXFEmL/nzq+3GEqskcA2OWoLPi/nIjAysgu9x3QDIf/WeIax8g41FW/1V1kGyiubFTKmFYAyp6YDjpxri7K4qnjR+N2xhwd7seK5/W/iYdSbzX1Bl4XkJezuq/z5mcOhE/zqhNS2e0ZMgOLRhvd67tTbPp1ML4VvCWr36Jy8R0A6EgzUd7vGAqJbORDdmO3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Go259zIj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gor@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Go259zIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gor@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRTzv29rkz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 23:55:54 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624LUFuQ2339714;
	Thu, 5 Mar 2026 12:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=j46n/C
	l/uiusceyLFOPeUtqO6xM+QOc9rxRmh/YsaFw=; b=Go259zIjpiUsEZ2/VSp1+C
	ajKQN/kmWvrD0WAn+M79WyyoB6eOAjm9paqjImI05Yg622mR0mwRGhjnXuimibrj
	imWAt59vofH6aAXQmFuz70TaypdqlBR1ZzA6Q5Z5HE8VzRH1/+Y0FyFZ11MP2xg/
	djIhFxbFZxz7DOBJRaJdWke1zUk+0N1OmXQDfXEf2VNEd46D1UE09yiJ1eusG9k0
	TpQSWdUgSf/SkopozJf/rEgUa0cx+Cr0vmZQFa/YYWdSqG4hPqJtlcLM9LOt4m4v
	GQPiWRGYBa+47ir2Dyv3nQxU1LEyXbjQ7/2wgwFTH/D8FD4SmraXknK5jBRt0EGA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrjbrkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 12:55:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6259TYY3016397;
	Thu, 5 Mar 2026 12:55:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpnbb4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 12:55:16 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 625CtCPS24380116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2026 12:55:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85D2E20043;
	Thu,  5 Mar 2026 12:55:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAC6C20040;
	Thu,  5 Mar 2026 12:55:10 +0000 (GMT)
Received: from localhost (unknown [9.111.42.248])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Mar 2026 12:55:10 +0000 (GMT)
Date: Thu, 5 Mar 2026 13:55:09 +0100
From: Vasily Gorbik <gor@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
        Coiby Xu <coxu@redhat.com>, Roberto Sassu <roberto.sassu@huawei.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
        "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: [PATCH 1/1] s390/ipl: Fix missing arch_get_secureboot() prototype
 warning
Message-ID: <p01-01.g9ec0a81d34d1.ttbfdx5@ub.hpns>
References: <20260213012851.2532722-2-coxu@redhat.com>
 <c00-01.ttbfdx5@ub.hpns>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c00-01.ttbfdx5@ub.hpns>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a97d36 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=xVpku4ZQUFglSi1p0tMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwMyBTYWx0ZWRfX+RUQn6BMd6jT
 SH21bGK5IhuRS3+4aQfGKCoOdauWr6O8JO/otto6IL/mxask6aIaBTJKuK/BfMWXbWSVe7hJqMS
 IclNLXFmKCZ6YKMVqlWCSzEpHzITp8/HIx8PMJjdO2RzdiROBdj2xXW/ydOeq/9toaBoUxpzllk
 1aMqO/wmDBfEDrpAEQaCC4q39mStv0Ds3eBLOiGR0LCffXuc30hXi1plumFympjJRXPfrmVi6Vc
 ey1yJs4AgDFoEi4HVj+fU3G50EgNmoeslm5M/Y+8PZDtx+khYV+Lyt7KSJ9iaGPANH1DcvJ14ZB
 X1YdAuHhY3EuO47eqGxtmP32mRip1+IQQxDlFcKiQf4ba8UHtCjjqayW+Wx0WmNOeGbExaBTXOQ
 pRdskS0tqYVg+SufInrncQzxcQ+rSORmJLb+dGRtryi+DMoXnxzhFrzxjlhLPrEd9Qu/UUOrA1B
 aoUYVM+cJv650sOf6xQ==
X-Proofpoint-GUID: 18tUCaDZUazDvapJ0KrrVhGhLVF5GXbk
X-Proofpoint-ORIG-GUID: ySm98qxoHM4Lds6ch4Hca4o4NZD8yC-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050103
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7E44D2122DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17776-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:egorenar@linux.ibm.com,m:ardb@kernel.org,m:dave.hansen@intel.com,m:coxu@redhat.com,m:roberto.sassu@huawei.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gor@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gor@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,intel.com,redhat.com,huawei.com,ellerman.id.au,gmail.com,alien8.de,linux.intel.com,zytor.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Include <linux/secure_boot.h> so arch_get_secureboot() has a visible
prototype and -Wmissing-prototypes no longer triggers.

arch/s390/kernel/ipl.c:2507:6: warning: no previous prototype for ‘arch_get_secureboot’ [-Wmissing-prototypes]
 2507 | bool arch_get_secureboot(void)
      |      ^~~~~~~~~~~~~~~~~~~

Fixes: 63e8a44395a4 ("integrity: Make arch_ima_get_secureboot integrity-wide")
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 arch/s390/kernel/ipl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/kernel/ipl.c b/arch/s390/kernel/ipl.c
index bdbbedf52580..2d01a1713938 100644
--- a/arch/s390/kernel/ipl.c
+++ b/arch/s390/kernel/ipl.c
@@ -21,6 +21,7 @@
 #include <linux/crash_dump.h>
 #include <linux/debug_locks.h>
 #include <linux/vmalloc.h>
+#include <linux/secure_boot.h>
 #include <asm/asm-extable.h>
 #include <asm/machine.h>
 #include <asm/diag.h>
-- 
2.53.0

