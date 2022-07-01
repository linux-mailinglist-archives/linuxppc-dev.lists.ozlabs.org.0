Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394A562E1A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 10:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ7cL75Npz3dp5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 18:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ7bx16C3z3blh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 18:27:21 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LZ7Wd62dZzTgCq;
	Fri,  1 Jul 2022 16:23:41 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 16:27:13 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>, <tglx@linutronix.de>,
	<mark.rutland@arm.com>
Subject: [PATCH -next v3 0/2] powerpc: add support for syscall stack randomization
Date: Fri, 1 Jul 2022 16:24:33 +0800
Message-ID: <20220701082435.126596-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This patchset adds support for syscall stack randomization for
powerpc, which can make harder the various stack-based attacks that
rely on deterministic stack structure.

Changes in v3:
  -add a lead-up patch to move system_call_exception() to syscall.c to
  avoid disabling stack protector for all functions in interrupt.c
Changes in v2:
  -move choose choose_random_kstack_offset() to the end of system_call_exception
  -allow full 6 (10) bits of entropy
  -disable stack-protector for interrupt.c

Xiu Jianfeng (2):
  powerpc: Move system_call_exception() to syscall.c
  powerpc: add support for syscall stack randomization

 arch/powerpc/Kconfig            |   1 +
 arch/powerpc/kernel/Makefile    |   9 +-
 arch/powerpc/kernel/interrupt.c | 161 ---------------------------
 arch/powerpc/kernel/syscall.c   | 190 ++++++++++++++++++++++++++++++++
 4 files changed, 199 insertions(+), 162 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall.c

-- 
2.17.1

