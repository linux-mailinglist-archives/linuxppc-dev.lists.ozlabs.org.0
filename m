Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFD502A20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:37:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfwnm3VpRz3dyq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:37:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VTgQeHrk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VTgQeHrk; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwfb1Ny3z3bcv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:31:03 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id l7so15185024ejn.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXuHnml0JyQ7WUWtSyqxCdcrvdOAihH7ECEcB+ac3FQ=;
 b=VTgQeHrkpIHgOEGZvW6m7lK+ww/hBIaLxp/ed1YbHFERxY7K8zgmthq8r0MO/eDheA
 64RJAUDP0PCNupTiFSXSD0K9TwZw/VBqVra2httvVSuGRa0rtzP8UWtbBnmILYXL6Z2H
 sr5X4+IEfwB6d5kKRo4eDMfm2O1ZmyozhlUEFzHkyPeS+S7EEuZSM7ink8BrFdT5ZLz3
 GIxrZW9NwL5XcJZvTEmI8dg0NdKEWbX31YU7MxwkMeQJhRou9/SCt1Ujs+st1SvtgpVw
 9aQDWxS22TjT0DPrnK2A3NtIzbFZtU+RaSWnUyyUovnBEkNcZnYSmXiUDfvziK0b2SLX
 cyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXuHnml0JyQ7WUWtSyqxCdcrvdOAihH7ECEcB+ac3FQ=;
 b=t4k9a2p0KAiBPt3BVTTtLkKza3eUmsEr5Ap9eLUSU9An+Nmp112JjdWenPj0Sh8z64
 sKriWlsNxCQF4BHP95OONIJzzFSisFIe+RRMDph0mW7kCIfAmIFgGfdrLowaKT/zxvZh
 wBGQAlE8nW/xYV5QEG+oNbXR9yHFMdTQrzts6TZRCuKsHMqmJB0aSED9cIqkaN8Xmwc+
 zQda3A1ni0wWJWynVJGmeW/yCwRBS6DsyPTkITBV7+ram14RHZdXk/82catNISL3tuPD
 KU0B2+LrxL/ru4vA7MIDLEjJyoE6VMDEEuNCcPVJ1qHBlViMS+2zk7jckEax86QY2mL7
 8uEg==
X-Gm-Message-State: AOAM532je28QMrlDnH3COTkF7va/jKpiLbMVhh0PlFSwvgt1NQTyAOA0
 Jv3CDnFI/n82CPFSkMAA2oA=
X-Google-Smtp-Source: ABdhPJxoOHJKRpfHC4KfhLHKEeHHtK1KA32Oh4BvD5pxRHzbDl+DHwOIhAvuB9jirqfyrBrH+vb+KQ==
X-Received: by 2002:a17:907:9485:b0:6da:aa54:a88 with SMTP id
 dm5-20020a170907948500b006daaa540a88mr6248462ejc.427.1650025859818; 
 Fri, 15 Apr 2022 05:30:59 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:30:59 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 10/18] qed: Replace usage of found with dedicated
 list iterator variable
Date: Fri, 15 Apr 2022 14:29:39 +0200
Message-Id: <20220415122947.2754662-11-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415122947.2754662-1-jakobkoschel@gmail.com>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/qlogic/qed/qed_iwarp.c | 26 ++++++++++-----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_iwarp.c b/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
index 1d1d4caad680..198c9321bf51 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
@@ -1630,38 +1630,36 @@ static struct qed_iwarp_listener *
 qed_iwarp_get_listener(struct qed_hwfn *p_hwfn,
 		       struct qed_iwarp_cm_info *cm_info)
 {
-	struct qed_iwarp_listener *listener = NULL;
+	struct qed_iwarp_listener *listener = NULL, *iter;
 	static const u32 ip_zero[4] = { 0, 0, 0, 0 };
-	bool found = false;
 
-	list_for_each_entry(listener,
+	list_for_each_entry(iter,
 			    &p_hwfn->p_rdma_info->iwarp.listen_list,
 			    list_entry) {
-		if (listener->port == cm_info->local_port) {
-			if (!memcmp(listener->ip_addr,
+		if (iter->port == cm_info->local_port) {
+			if (!memcmp(iter->ip_addr,
 				    ip_zero, sizeof(ip_zero))) {
-				found = true;
+				listener = iter;
 				break;
 			}
 
-			if (!memcmp(listener->ip_addr,
+			if (!memcmp(iter->ip_addr,
 				    cm_info->local_ip,
 				    sizeof(cm_info->local_ip)) &&
-			    (listener->vlan == cm_info->vlan)) {
-				found = true;
+			    iter->vlan == cm_info->vlan) {
+				listener = iter;
 				break;
 			}
 		}
 	}
 
-	if (found) {
+	if (listener)
 		DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener found = %p\n",
 			   listener);
-		return listener;
-	}
+	else
+		DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener not found\n");
 
-	DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener not found\n");
-	return NULL;
+	return listener;
 }
 
 static int
-- 
2.25.1

