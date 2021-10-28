Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7534943E4AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg8Cf2gHgz3ccH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.42;
 helo=out30-42.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg8BJ04ttz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 02:10:15 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Uu1.ECo_1635433795; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Uu1.ECo_1635433795) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 28 Oct 2021 23:09:56 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, amit@kernel.org,
 arnd@arndb.de, osandov@fb.com
Subject: [PATCH v12 0/2] make hvc pass dma capable memory to its backend
Date: Thu, 28 Oct 2021 23:09:52 +0800
Message-Id: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: sfr@canb.auug.org.au, Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear all,

This patch series make hvc framework pass DMA capable memory to
put_chars() of hvc backend(eg, virtio-console), and revert commit
c4baad5029 ("virtio-console: avoid DMA from stack”)

V1
virtio-console: avoid DMA from vmalloc area
https://lkml.org/lkml/2021/7/27/494

For v1 patch, Arnd Bergmann suggests to fix the issue in the first
place:
Make hvc pass DMA capable memory to put_chars()
The fix suggestion is included in v2.

V2
[PATCH 1/2] tty: hvc: pass DMA capable memory to put_chars()
https://lkml.org/lkml/2021/8/1/8
[PATCH 2/2] virtio-console: remove unnecessary kmemdup()
https://lkml.org/lkml/2021/8/1/9

For v2 patch, Arnd Bergmann suggests to make new buf part of the
hvc_struct structure, and fix the compile issue.
The fix suggestion is included in v3.

V3
[PATCH v3 1/2] tty: hvc: pass DMA capable memory to put_chars()
https://lkml.org/lkml/2021/8/3/1347
[PATCH v3 2/2] virtio-console: remove unnecessary kmemdup()
https://lkml.org/lkml/2021/8/3/1348

For v3 patch, Jiri Slaby suggests to make 'char c[N_OUTBUF]' part of
hvc_struct, and make 'hp->outbuf' aligned and use struct_size() to
calculate the size of hvc_struct. The fix suggestion is included in
v4.

V4
[PATCH v4 0/2] make hvc pass dma capable memory to its backend
https://lkml.org/lkml/2021/8/5/1350
[PATCH v4 1/2] tty: hvc: pass DMA capable memory to put_chars()
https://lkml.org/lkml/2021/8/5/1351
[PATCH v4 2/2] virtio-console: remove unnecessary kmemdup()
https://lkml.org/lkml/2021/8/5/1352

For v4 patch, Arnd Bergmann suggests to introduce another
array(cons_outbuf[]) for the buffer pointers next to the cons_ops[]
and vtermnos[] arrays. This fix included in this v5 patch.

V5
Arnd Bergmann suggests to use "L1_CACHE_BYTES" as dma alignment,
use 'sizeof(long)' as dma alignment is wrong. fix it in v6.

V6
It contains coding error, fix it in v7 and it worked normally
according to test result.

V7
Greg KH suggests to add test and code review developer,
Jiri Slaby suggests to use lockless buffer and fix dma alignment
in separate patch.
fix above things in v8. 

V8
This contains coding error when switch to use new buffer. fix it in v9.

V9
It didn't make things much clearer, it needs add more comments for new added buf.
Add use lock to protect new added buffer. fix in v10.

V10
Remove 'char outchar' and its lock from hvc_struct, adjust hvc_struct and use
pahole to display the struct layout.
fix it in v11.

V11
Fix early console print issue, which is broken by v11, in v12.

********TEST STEPS*********
1, config guest console=hvc0
2, start guest
3, login guest
    Welcome to Buildroot
    buildroot login: root
    # 
    # cat /proc/cmdline 
    console=hvc0 root=/dev/vda rw init=/sbin/init
    #

drivers/tty/hvc/hvc_console.c | 48 ++++++++++++++++++++++++-----------
drivers/tty/hvc/hvc_console.h | 30 +++++++++++++++++++++-
drivers/char/virtio_console.c | 12 ++----------
3 file changed
