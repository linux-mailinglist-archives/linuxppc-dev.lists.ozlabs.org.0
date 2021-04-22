Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26A36831A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR19W6csdz3bq2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:11:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=A9TxkZcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.43; helo=pv50p00im-hyfv10011601.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=A9TxkZcr; dkim-atps=neutral
Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com
 [17.58.6.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR18q0cCtz303h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 01:11:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1619104281; bh=a+6VQ8pLlz1642rIhBYQF/ryx1ofGc8+0N3JGfNATL8=;
 h=From:To:Subject:Date:Message-Id;
 b=A9TxkZcrX41py7jNK8WeMErTMTC7M9HStvqTMB+xF5WXGGsfrUF+BuZzga2NEAgbV
 9NZ7ohO/e5hJNNwivJG4oNZva4DcrX7Ph+VEt1aiOumN4AEwAYITkXZBLQGvmiynTD
 kfkwpFya2bR4dIzU+uQSy7jyJ8YIaC1jjFkC5c0YI/fZng8iqAoxSj9BRrxA1jCRV/
 CwVUiHOorGbSPKTmN2Ro2kP7JeKXZffpx1nAwZWoZRcRwTnQfCOKtdEGCuHL+lZUE6
 I41QVg6CaLaWdm5BgJtkGt/OEKmalM17i3yIgq9aytprNXgbBnJGKybut6HAhox4fL
 w6jPG404n79nw==
Received: from localhost.localdomain (unknown [120.245.2.61])
 by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id E7C0C38058A;
 Thu, 22 Apr 2021 15:11:16 +0000 (UTC)
From: Xiongwei Song <sxwjean@me.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu, npiggin@gmail.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 0x7f454c46@gmail.com
Subject: [PATCH 2/2] powerpc: Print esr register when hitting Program Interrupt
Date: Thu, 22 Apr 2021 23:10:22 +0800
Message-Id: <20210422151022.17868-2-sxwjean@me.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422151022.17868-1-sxwjean@me.com>
References: <20210422151022.17868-1-sxwjean@me.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_06:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=675 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104220120
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

The esr register has the details of Program Interrupt on BookE/4xx cpus,
printing its value is helpful.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 5c3830837f3a..664aecf8ee2e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1459,6 +1459,7 @@ static bool interrupt_detail_printable(int trap)
 	case INTERRUPT_MACHINE_CHECK:
 	case INTERRUPT_DATA_STORAGE:
 	case INTERRUPT_ALIGNMENT:
+	case INTERRUPT_PROGRAM:
 		return true;
 	default:
 		return false;
-- 
2.17.1

