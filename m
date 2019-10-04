Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BFCB591
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:59:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l2Md08KWzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 17:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="BvjX+2QR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J/TEhDlQ"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l2Bb0CR4zDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 17:51:27 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7CD8C50B;
 Fri,  4 Oct 2019 03:51:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Oct 2019 03:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=yjVBuN8fDyv2tKTpnfD9VXR9yu
 le3zNbO8vI7Gi7jkA=; b=BvjX+2QRkFCoBv32EqvQLN9iaT9oKWC6PTDWjpllaM
 UVhEDDf16SrRjJHwy604muzyt4XPAbnm5SQMUHaXJBRCaWFFJe2Y4CLCAvzKxXm0
 EDnuHTYuhKB5jk6ejKMB8BmK/yN32seZ17qCygbC+4lwkqpDL9lyzPNvii4TP6+q
 qS66a+FttaCS/iKAg9vpnmR0Klgge8zbN0fFvn1HGzUhQOVMJjM5Le4UaJatze4T
 ZONM9ulgPDXxSfSrfcY7w9Hy+iGYUEEpNzR0XIXNqEvH1RmdRoIe/RG48M3QTK/V
 xPbFSC7GIeGhZ2evlqWClxl2dXnqalVKVwjWY83BPsHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yjVBuN8fDyv2tKTpn
 fD9VXR9yule3zNbO8vI7Gi7jkA=; b=J/TEhDlQfM6dVOyu8glYBIjlrn4CmtObo
 2i+jrjmj9QXwuv9EhiHsvWB0yNG4/sIOhQJyNFOpotSef/9mOAH6QMWGZicq2MhA
 OgF4ftNtEELvvQXP8c07xBKwICzOrvZKQLP1Wj93tawNtaQdU+bIMg0L4ZN/pd6f
 AQ22jYUTy33vpH+uIGZJWj52x0+6vo08rznnXkJNHfx8aKwHHJ4/IJQ0gt8+EA3q
 XfYaIpFY1Kh40SvaMVSphqIuchMgJ/+gkck7kDWo857kd1HGnEdJxII7te1Ta/rw
 OcI3SQrP4w3wGxLN9yf45Dkps6XAkTnewGeqyNfeUQfAguJOqQeyw==
X-ME-Sender: <xms:-vmWXeZAY-WQkUfFHXQxMKofBW2-q73iTRf7zFDTlMLdnJPy8ChAjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddrud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-vmWXeJv_r3S9sGywlDfI5ecCCJd2jJKrc6sE_NWVqo1nTksUnm-PA>
 <xmx:-vmWXYh5VGYLihXBSxA0eE1RJYuKs4-LKACFKEZEsRdO0X2p2xJUQA>
 <xmx:-vmWXZRJ7EPl71IVcz6m_kOHrppPpk_ulrrqFJ5qHjIzVjmBeT4bDg>
 <xmx:-_mWXct1tUI3S251qf550jm4p9wxHbVKyZtXjhH1U4mDElhj704sCA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16AA480060;
 Fri,  4 Oct 2019 03:51:18 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] Implement STRICT_MODULE_RWX for powerpc
Date: Fri,  4 Oct 2019 17:50:46 +1000
Message-Id: <20191004075050.73327-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, rashmica.g@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's been quite a while since the last iteration, there were a few
things to hunt down and fix.

The first was the way that I was updating PTEs was using set_pte_at()
unsafely - now, each page is updated by clearing -> flushing -> setting.
This should be generic across all MMUs, I know that there are some
potential inefficiencies - for example, Hash flushes the entire PID
regardless of the given page range - but I don't think it's a very big
deal.

The next was that there is an errant page that was tricky to hunt down,
it turned out to be that kprobes never get marked RO after creation,    
leading to (at least) one W+X page present in the kernel, even with both
STRICT_KERNEL_RWX and STRICT_MODULE_RWX on.

I added a debugfs handler to call ptdump_check_wx() to facilitate making
sure module RWX continues to work after boot.

There's more detail in the final patch about exactly how "on by default"
module RWX is, but it doesn't really matter until STRICT_KERNEL_RWX is  
on by default too.

Thanks to Nick Piggin, Michael Ellerman, Daniel Axtens, and others for  
helping.

Christophe, I did test this in qemu mac99 so hopefully it works for all
32bit, I'm sure you'll let me know if it doesn't.

Would appreciate an ack from Joel to enable this in skiroot_defconfig.

Russell Currey (4):
  powerpc/mm: Implement set_memory() routines
  powerpc/kprobes: Mark newly allocated probes as RO
  powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
  powerpc: Enable STRICT_MODULE_RWX

 arch/powerpc/Kconfig                   |  2 +
 arch/powerpc/configs/skiroot_defconfig |  1 +
 arch/powerpc/include/asm/set_memory.h  | 32 ++++++++++++++
 arch/powerpc/kernel/kprobes.c          |  3 ++
 arch/powerpc/mm/Makefile               |  1 +
 arch/powerpc/mm/pageattr.c             | 60 ++++++++++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c        | 31 ++++++++++---
 7 files changed, 124 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/include/asm/set_memory.h
 create mode 100644 arch/powerpc/mm/pageattr.c

-- 
2.23.0

