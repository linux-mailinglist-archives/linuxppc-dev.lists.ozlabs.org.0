Return-Path: <linuxppc-dev+bounces-16187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBGlOEoQc2klsAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:08:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2C70BD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:08:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy6t55Wprz3bf4;
	Fri, 23 Jan 2026 17:07:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769148477;
	cv=none; b=Sveccq+OdaM9edX6s630u71hKu14kZuDcQiWh28iFbDYQfNRuBeO0LBbD/8vowFODXi0VcGvTlWlwD/SUZ4yJj6IzFx/Lor9QW+zagrUVKMJMJ/CS81ICo0oT8s6yFhBYPAPlCclWRcWoqFtHu8cH6UwH6HuJYAvJ8BHyQkKVviqb45t5DV/zzzkxMCV1U/8dKK1KdFaESn4CFofz/sfKfomCq1muwm4sONimM97I480G/1Te+D9//XxQN3wBa4L29AMk/3YIcow6Drmieop4T3mQ7uiVOXLaR8HeXvXJdFQo4bHW4+p3qWdatm/wO/kcbrgZ5jZ443k5ZjdfYyeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769148477; c=relaxed/relaxed;
	bh=+Bad8lH4TU6BJz0pPmvv49yWbdDZ24D0e+R8NVmqgUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNOIEA0Rs11p21vNclTwfUMXu614ommtUbN7QVouMYC4E7RYyKDzW/y5UWC9J6vFUBtf4uF/Ojs9iY2veNd2uJQK/5W3mZCv52/Oaz8w2S1c0DIb0lF6xravfn5Gz2UPjHAc3jFYIMQ5WYKRGWEoqlXf/tzB0yrYvEMBu2t8D2Mhi69eVIBJxcy6cLlMT52+jOyQt8WmkEoFaCTkuuFICT1UdtlZeksMNooOx8lH0dInF6gW6HXQ8Tw2csi/p/kA3rJoxQanOnLtmg8JMQEQMvBgc2XglD64pOHKJBuNawNOka4aACocIWWP3AAhcEPv2uWwuhjqeM+qMWDfGFw8YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (unknown [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy6t31X72z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:07:53 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowACnPBAiEHNp9tMuBg--.1678S4;
	Fri, 23 Jan 2026 14:07:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 23 Jan 2026 14:07:29 +0800
Subject: [PATCH v3 2/4] PCI/MSI: Check msi_addr_mask in
 msi_verify_entries()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-pci-msi-addr-mask-v3-2-9f9baa048524@iscas.ac.cn>
References: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
In-Reply-To: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowACnPBAiEHNp9tMuBg--.1678S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5JryfGw1kur43Aw45trb_yoW8GF4fpF
	WqgayDAr4Fkw15JFsxXw1vqF15ZFZ0qa4fGrW8G34a9FsIqwnFyw13K347K3WfXF18Gw15
	ZFyYyw4UGFs8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7sREIzutUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-1.0 required=3.0 tests=RCVD_IN_DNSWL_MED,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:bcreeley@amd.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:gaohan@iscas.ac.cn,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:andrew@lunn.ch,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16187-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E4C2C70BD3
X-Rspamd-Action: no action

Instead of a 32-bit/64-bit dichotomy, check the MSI address against
msi_addr_mask.

This allows platforms with MSI doorbell above 32-bit address space to
work with devices without full 64-bit MSI address support, as long as
the doorbell is within addressable range of MSI of the device.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

---
v3: %llx -> %#llx (Bjorn)
---
 drivers/pci/msi/msi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 48f5f03d1479..77713f89a10b 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -321,14 +321,17 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
 static int msi_verify_entries(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
+	u64 address;
 
 	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
 		return 0;
 
 	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
-		if (entry->msg.address_hi) {
-			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
-				entry->msg.address_hi, entry->msg.address_lo);
+		address = (u64)entry->msg.address_hi << 32 |
+			  entry->msg.address_lo;
+		if (address & ~dev->msi_addr_mask) {
+			pci_err(dev, "arch assigned 64-bit MSI address %#llx above device MSI address mask %#llx\n",
+				address, dev->msi_addr_mask);
 			break;
 		}
 	}

-- 
2.52.0


