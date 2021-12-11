Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7366471142
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 04:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9tfF4x5Kz3cZH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 14:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=loongson.cn;
 envelope-from=yangtiezhu@loongson.cn; receiver=<UNKNOWN>)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J9tdq1tTVz3c9d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 14:33:17 +1100 (AEDT)
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+sj1G7RhlA0GAA--.13327S2; 
 Sat, 11 Dec 2021 11:33:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/2] kdump: simplify code
Date: Sat, 11 Dec 2021 11:33:06 +0800
Message-Id: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Ax+sj1G7RhlA0GAA--.13327S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyrWF13KFW3ZFW3Gr18Grg_yoWDJrb_JF
 Z7ua4rGr4IvayrtFy7K3Z3ZryDtr4vyF90v3WktrW5tasxJF1rJw4UAF4Yqrn8XFWkJrWU
 ZrW5JFyvyr1FqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUnQ6pDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, x86@kernel.org, kexec@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v2:
  -- add copy_to_user_or_kernel() in lib/usercopy.c
  -- define userbuf as bool type

Tiezhu Yang (2):
  kdump: vmcore: remove copy_to() and add copy_to_user_or_kernel()
  kdump: crashdump: use copy_to_user_or_kernel() to simplify code

 arch/arm/kernel/crash_dump.c     | 12 +++---------
 arch/arm64/kernel/crash_dump.c   | 12 +++---------
 arch/ia64/kernel/crash_dump.c    | 12 +++++-------
 arch/mips/kernel/crash_dump.c    | 11 +++--------
 arch/powerpc/kernel/crash_dump.c | 11 ++++-------
 arch/riscv/kernel/crash_dump.c   | 11 +++--------
 arch/sh/kernel/crash_dump.c      | 11 +++--------
 arch/x86/kernel/crash_dump_32.c  | 11 +++--------
 arch/x86/kernel/crash_dump_64.c  | 15 +++++----------
 fs/proc/vmcore.c                 | 32 +++++++++-----------------------
 include/linux/crash_dump.h       |  8 ++++----
 include/linux/uaccess.h          |  1 +
 lib/usercopy.c                   | 15 +++++++++++++++
 13 files changed, 61 insertions(+), 101 deletions(-)

-- 
2.1.0

