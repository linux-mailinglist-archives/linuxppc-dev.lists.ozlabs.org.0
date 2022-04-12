Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E84FDCB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:06:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2vy3ndhz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:06:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hsZJe29A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hsZJe29A; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2lx3G02z3bd6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:59:09 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id bv19so13529863ejb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=hsZJe29AqSg2O6WCZssdZkgs16ExQWUSSztvz7QZHXLQ1p8siy7CRb5NrHAnlQudSa
 MURp6EYnydmxOdzQ6sbb3XAHJX3SNQIfjcYKViYfDQ5QmxtefPJCKOTmiJts2fT+9j6Q
 Jy4srpYIm8L0XCW8Ky3AUuwglPJakfuSzkTYglJ4B/7A+OaAqBzmwLpZGrdMV78l0VX2
 yVG1uorw6FhE7xCMWszUOvSNn1avDwvFzpf1tPRgDLiF6ImwoVsaA82AcAzK11kLOUYi
 YAbYHfjp71mHXPzf29KRkPg1SHsJpZdQ94+Ekx7UMlzyouyB+WsObi805hv82S0KMAWp
 avDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=P+Xna7ZcylF/ngqqftsrmLvhVre+8Qw6Zu4aUqMEC20m9QXNf0+6TD+u5u96TgZTg1
 Jic7gCkXZN+EEFGr/0pF+0gwQSsKtBbE3LW15mMTIkZOtDIW/LA0+5rdrLZc0AXdlSk/
 xA5yzwSTFCdvecrdS0MhKk/UEmjX80srrM8x+7bTGhCmY9zFQ0qOMBfwVFKst9eKoGWR
 5UbkRotlo6zERdatFB3v7vZXYunEq/bJLmgKEyMzO5sEP9/Byevr5WuwDZolXpWkyHWk
 dxYeLGimp9sFhvwI9FFPqLdr5w5PNtzdazL3//58hB9Va+gaZpy20gN7msLvcDLQDBEN
 uRDw==
X-Gm-Message-State: AOAM532ELbQ4zpXQ2DFXYXCnIOL+zLmwtRRzsTCv96HzdjbvyQjM8+bu
 J6dudwOhgpVNiPhtzKZT9ag=
X-Google-Smtp-Source: ABdhPJwc3b3Ll5+hkkpicYGoscoXx6T0nFGeyGRf8n6yjTeqLLhFcUZswCTy4e/3O+CL8gdNSejuOA==
X-Received: by 2002:a17:906:c14c:b0:6e8:6526:7647 with SMTP id
 dp12-20020a170906c14c00b006e865267647mr13282520ejc.257.1649761146033; 
 Tue, 12 Apr 2022 03:59:06 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:59:05 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 11/18] qed: Remove usage of list iterator variable
 after the loop
Date: Tue, 12 Apr 2022 12:58:23 +0200
Message-Id: <20220412105830.3495846-12-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412105830.3495846-1-jakobkoschel@gmail.com>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
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
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
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

