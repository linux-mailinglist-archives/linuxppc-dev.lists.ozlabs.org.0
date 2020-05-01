Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 099901C0D7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:39:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Czzy67kgzDrYj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nQcbDD1D; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cyvx3snFzDrL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:50:53 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id x15so1084298pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MeMNFXjt/FkCMg9p8GCBHhgmb2h5408dWfUGgl8wNrs=;
 b=nQcbDD1DN6dJmneQrUz5bHFFOnXMDTrv99xpocUhntstuyR3tD9Pmqw9vVjDEmmVp3
 pAPT3LjVLCW0oKK3EP3rIJClNoBUnS6plRJ22XTKrz6FgFJW98UVkkbeLo0nfMwJavIj
 phLzIpGYBO83ZmstJPOK9z2nUcYiYrSMmMMdpMar6J27QZMdrfLmS9uutmufo3YzYxIt
 hDLaV2CIfNqwFFKWLwqX3E3QoS3ESacYw8ou3C0xa91L91G/mCQ+ESau7kOjOKdsD//S
 bm/GNApD79d7uU9PfjR8XK0q3oTcc4aJsNpE4MRUuDHDZIS5jtNljHOZ90eecBUUU26k
 EpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MeMNFXjt/FkCMg9p8GCBHhgmb2h5408dWfUGgl8wNrs=;
 b=tjtn0WEsJf4lJa+pYn8ruf1+Zc9MMYoY+ue8RcO6gCdl1j2KY9LmA9XPcYin6QO+L6
 OQ6qp9EyC87RKNlzk0PZrNLoG1OHgJsO5BGk7UXpI4rn48TUbxow0l/cIvWu5nsP0y9+
 adXFi0JP6mppwKAYA+ylFeJlAnCQgHMJABuYUs2NdK9gG2tWuj0VZUxlaBQSvK98AJDi
 gk4jKgJ1s5JTb32ofH6JuUWv/VY/NsIXiDFvqw7Utg1kX0MovDW/v+IKF18CPLzyGLTD
 KUfUG5uzWtJbaVn3Tsrfb8FFo6IX5scE+y/3bP4ZZ+QLJhTvATo/tQZKAX+ooS5gkhvf
 nMZQ==
X-Gm-Message-State: AGi0PuYFeEK9wfGfTpXAbVYC2vPzeNUhQblIPPgYHA0DKzoyrcEvz1kK
 I4zinJ8crqVEO2ln3bz9uC9Vcb/qvfivaA==
X-Google-Smtp-Source: APiQypKeazE3mBN9NyuIRpCBJOyYl3COUSmU3x2L+TZ41y0jpr9Xr0JsZlXc71N8Tu8jjSnVQE9p8A==
X-Received: by 2002:a62:9211:: with SMTP id o17mr2186167pfd.234.1588305050707; 
 Thu, 30 Apr 2020 20:50:50 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:50:49 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 28/28] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Fri,  1 May 2020 13:42:20 +1000
Message-Id: <20200501034220.8982-29-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d50fa2a78866..32e3ba742e55 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1337,6 +1337,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	switch (opcode) {
 #ifdef __powerpc64__
+	case 1:
+		prefix_r = word & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+		suffixopcode = suffix >> 26;
+		prefixtype = (word >> 24) & 0x3;
+		switch (prefixtype) {
+		case 2:
+			if (prefix_r && ra)
+				return 0;
+			switch (suffixopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = mlsd_8lsd_ea(word, suffix, regs);
+				goto compute_done;
+			}
+		}
+		break;
 	case 2:		/* tdi */
 		if (rd & trap_compare(regs->gpr[ra], (short) word))
 			goto trap;
-- 
2.17.1

