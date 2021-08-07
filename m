Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 055203E3281
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 03:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhPHT6sSzz3dH3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 11:03:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=twrXvJZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.42; helo=pv50p00im-zteg10011501.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=twrXvJZS; dkim-atps=neutral
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhPH15XNJz308b
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 11:03:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628298202; bh=32oK1hrFCRUgWXFrkZdy+s7tZTvaBZCtulRTSPPphyo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=twrXvJZSQyvONOmxI623LS+G1LNIgReTAfIgwDBkiBAmGSiZjTDIT60vKs5BlPD/Z
 NLIGdr5iYaKSLI0f/ApTzomgP4ZwOn4Oz9DN7/dLYZM2dtuHnZod8FFPkYqdhmD0zU
 OaA8AVgZsY0ZwEpEdVSBR00H9ELrus9kkmpKjomqS30neefHytW8oan/CIT38PrBhg
 o0MCzsUTmcv5OONvD1k6XJou0Wd71DBlFhKEYfc9xJkr8UvEpqL8R9/1G4pNHPaGHE
 Em6HxqODAY+p2hcadK626+gQs+iX6dQWkmLEKvt/0u7MZ89EPitb7roaFuAMfdQMeF
 F/K666fueZk6w==
Received: from xiongwei.. (unknown [120.245.2.134])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 268B5B003BD;
 Sat,  7 Aug 2021 01:03:17 +0000 (UTC)
From: sxwjean@me.com
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] Some improvements on regs usage
Date: Sat,  7 Aug 2021 09:02:35 +0800
Message-Id: <20210807010239.416055-1-sxwjean@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_08:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=787 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108070004
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 aneesh.kumar@linux.ibm.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, efremov@linux.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

When CONFIG_4xx=y or CONFIG_BOOKE=y, currently in code we reference dsisr
to get interrupt reasons and reference dar to get excepiton address.
However, in reference manuals, esr is used for interrupt reasons and dear
is used for excepiton address, so the patchset changes dsisr -> esr,
dar -> dear for CONFIG_4xx=y or CONFIG_BOOKE=y.

Meanwhile, we use _ESR and _DEAR to get offsets of esr and dear on stack.

v2:
 - Discard changes in arch/powerpc/mm/fault.c as Christophe and Michael
   suggested.
 - Discard changes in UAPI headers to avoid possible compile issue.

v1:
 - https://lkml.org/lkml/2021/8/6/57
 - https://lkml.org/lkml/2021/7/26/533
 - https://lkml.org/lkml/2021/7/26/534
 - https://lkml.org/lkml/2021/7/26/535

Xiongwei Song (4):
  powerpc: Optimize register usage for esr register
  powerpc/64e: Get esr offset with _ESR macro
  powerpc: Optimize register usage for dear register
  powerpc/64e: Get dear offset with _DEAR macro

 arch/powerpc/include/asm/ptrace.h          | 10 ++++++++--
 arch/powerpc/kernel/asm-offsets.c          | 15 ++++-----------
 arch/powerpc/kernel/exceptions-64e.S       | 18 +++++++++---------
 arch/powerpc/kernel/process.c              |  2 +-
 arch/powerpc/kernel/ptrace/ptrace.c        |  4 ++++
 arch/powerpc/kernel/traps.c                |  2 +-
 arch/powerpc/platforms/44x/machine_check.c |  4 ++--
 arch/powerpc/platforms/4xx/machine_check.c |  2 +-
 8 files changed, 30 insertions(+), 27 deletions(-)

-- 
2.30.2

