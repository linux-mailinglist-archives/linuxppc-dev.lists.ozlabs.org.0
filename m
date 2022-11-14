Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E13026287D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:06:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9y0s5hkWz3fMf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 05:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B7tLtjNR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B7tLtjNR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9xsM35gyz3cck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 04:59:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEHjllL015909;
	Mon, 14 Nov 2022 17:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DWqLwKDiSXDEVYu1oAswgwUxAJuhi6s0aPLywuN3z/k=;
 b=B7tLtjNR52MIypK2JB7KdDeudwF8EqYBZatEX4wWHxq4I9vmqavcvk0s7v+PX+1NHgfr
 fo6aPvZbzY2lHCOuhdy9dN+GiR1e5SgJkCiUU2xmTMhomPmQFcO0aOd9AtE5FCFCGe0J
 u17CJ6fZ7SsutrfPYIw407iLqOdcj8xuE/y8ZCQdQaJ1obiWmmmdbFlErucfuSY7NZXd
 ESk04Uv2Zl5PmeAWjd4X/Mc4lV2DHGsc9IGeQ9YyBOQDCKegFcQjLVE0HSaqFCa4YTk9
 9VbYZbeKWdptHXbeUWrI6zYr4Uax7mjvHewJfWEy4e7XBIXSjEah4YAxNYwFzDxxkk9+ mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kutbtg9gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 17:59:23 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEHqNDf009567;
	Mon, 14 Nov 2022 17:59:22 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kutbtg9fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 17:59:22 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEHpsFx012416;
	Mon, 14 Nov 2022 17:59:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3kt34925mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 17:59:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEHxvve52560286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 17:59:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3725411C04A;
	Mon, 14 Nov 2022 17:59:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49A6D11C050;
	Mon, 14 Nov 2022 17:59:13 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.116.246])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 17:59:12 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 07/16] powerpc: Skip objtool from running on VDSO files
Date: Mon, 14 Nov 2022 23:27:45 +0530
Message-Id: <20221114175754.1131267-8-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221114175754.1131267-1-sv@linux.ibm.com>
References: <20221114175754.1131267-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: moB04eKGqvVglnsXulHDzId9g-xH6I0A
X-Proofpoint-GUID: McWDXu7Z7EDRdyeo6035daQpZ9aPJfg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_13,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=950 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140125
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do not run objtool on VDSO files, by using OBJECT_FILES_NON_STANDARD.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/vdso/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index a2e7b0ce5b19..6a977b0d8ffc 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -102,3 +102,5 @@ quiet_cmd_vdso64ld_and_check = VDSO64L $@
       cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
 quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
+
+OBJECT_FILES_NON_STANDARD := y
-- 
2.31.1

