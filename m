Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3234FDF62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4dW2yBMz3f0S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:23:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lZrp4fUK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lZrp4fUK; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4TP3hn0z3bYy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:16:41 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id k23so36918611ejd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=lZrp4fUKHuSqiOLSJtpVC7XXMD0asm7ixPH3FzwMKxz4wTFY81n7AZNGcznRjoJDjw
 ImJJkIdZDpeyXwXRa72utr2cTE6/up0jKF2dieBvSDBmO+V/CDpO7jTw6zG8s+PGz0rx
 iJcQB6866kBoMX9E31+b/0LYLmfrDaHavCtmQXUrTG/co/r8uRUuAuZGQ1J91bxe7+Sp
 PqbcmXjh4Fb3JE28zM/pUTaGT4WfZjnmFizg4+0Q6K8pnYGTsqeeIS6Z3+npPCGPE0e9
 vYzkjZXHzEg3hIrq3rsGGjOQTFsjbWqhY0e34zIJd8A57XqeYBM7m5LT5/nI6j5RHSNG
 w09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=Jc6aSLcWmYcT+IfJsskYENLyNz9gRZdoAZjEMAaqs21IGOma4th+8iWHvMS8C1NbSc
 UeYFZeSUaOu52NTMIR7VAm0oIvQU+sigQwjmnpXla6ZWdaOEhx2J8jiFtRXL+PeC54Jz
 MJPri4hLuz4XqVMfe2YwQWxl28e/uVQUrIZUgJmLnpxNzseIJM/a91c+qKHky7wNBt7s
 bou88kviplAuM33NjYZyM9aNku71HRVnVXjdgbtvO666ld8EGlfqwkBLk2IOPNYc+pmZ
 wNpVn5Wc3daM7ICiJDKDPzslsTdyCYx3hJfAQGxR0L7LMBnVI7aU5ndWX5TeBbx/RmY7
 2t3Q==
X-Gm-Message-State: AOAM530X8nGhQw7O4i1szxLzkhnBaUp0QQYr/JmcyFBQA+Dvb09JmQVL
 HhiAhYCG+9oJn84qleFSlqQ=
X-Google-Smtp-Source: ABdhPJyvMlGS8lbsL8Ct1xcPBU/bepbuaCJfo+JyDSjrVyvEKhUC0Od61kuaqKRiaeCSIhZj4v8qwg==
X-Received: by 2002:a17:906:4787:b0:6e8:9252:5bef with SMTP id
 cw7-20020a170906478700b006e892525befmr9204660ejc.679.1649765798369; 
 Tue, 12 Apr 2022 05:16:38 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm8827900ejb.143.2022.04.12.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:16:38 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v3 11/18] qed: Remove usage of list iterator variable
 after the loop
Date: Tue, 12 Apr 2022 14:15:50 +0200
Message-Id: <20220412121557.3553555-12-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412121557.3553555-1-jakobkoschel@gmail.com>
References: <20220412121557.3553555-1-jakobkoschel@gmail.com>
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
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
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

Since "found" and "p_ent" need to be equal, "found" should be used
consistently to limit the scope of "p_ent" to the list traversal in
the future.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/qlogic/qed/qed_spq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_spq.c b/drivers/net/ethernet/qlogic/qed/qed_spq.c
index d01b9245f811..cbaa2abed660 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_spq.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_spq.c
@@ -934,10 +934,10 @@ int qed_spq_completion(struct qed_hwfn *p_hwfn,
 		       u8 fw_return_code,
 		       union event_ring_data *p_data)
 {
+	struct qed_spq_entry	*found = NULL;
 	struct qed_spq		*p_spq;
-	struct qed_spq_entry	*p_ent = NULL;
+	struct qed_spq_entry	*p_ent;
 	struct qed_spq_entry	*tmp;
-	struct qed_spq_entry	*found = NULL;
 
 	if (!p_hwfn)
 		return -EINVAL;
@@ -980,7 +980,7 @@ int qed_spq_completion(struct qed_hwfn *p_hwfn,
 	DP_VERBOSE(p_hwfn, QED_MSG_SPQ,
 		   "Complete EQE [echo %04x]: func %p cookie %p)\n",
 		   le16_to_cpu(echo),
-		   p_ent->comp_cb.function, p_ent->comp_cb.cookie);
+		   found->comp_cb.function, found->comp_cb.cookie);
 	if (found->comp_cb.function)
 		found->comp_cb.function(p_hwfn, found->comp_cb.cookie, p_data,
 					fw_return_code);
-- 
2.25.1

