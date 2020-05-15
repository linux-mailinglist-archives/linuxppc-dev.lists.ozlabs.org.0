Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B61D47A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 10:04:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ngsc2xh1zDr4R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 18:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WUjZqVFG; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ngqq11s1zDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 18:02:30 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id p127so1430829oia.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9GDbpA7U1VchqMwiWjmvP2eRAu78guKudD53jqyXdE=;
 b=WUjZqVFGWj7H7p6juykr37cHi4BK9WCta7HTTrL+4qe4j/Mf1iEJDF69lFH1fbDire
 iVl/k/tI3o2MGleu1h5aTjMXsk+ZKIXlWXC+6DnHmgNWjTeuOJwaGi/EEFwQ5YVFAj5N
 jwDhqz4oZsMzQ5UK352C8MktmmIk1Vf7m6spHCB3NlrVxD3yE/OnElJhOE5SK6sQdGfP
 oAGWgIZdbbzZfj5rUP1x+ikPxMbrNkjiERUnWrgM1ZMsz4ZCnPU5Bz2Ddc4k8kEoOWeW
 duwJm+HaOAvIhCk2tveBNMzQuNLp3NYYHyRxezqwzitCasAYC6FDHON4oBmr887o/NlO
 kB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9GDbpA7U1VchqMwiWjmvP2eRAu78guKudD53jqyXdE=;
 b=ow/98T9TFCWk+LOsdSC+EEDbeRdZaNezRD5kZYxhTb4IJ7vzHcaC3f/8ZjEnmyyFwu
 gZM5+XX5QuyGvxKAvPYDce8NPEVZdq6rFGSWC+Z3htLGA7SqM7w3U7dGwiq6DCeilyIj
 Ja9mM280/YRYatpybnxOMMD4InO+JHFE4ps7XBJgzEOdpP7aSW+EZmJZyAGXI5qdqvro
 ClAZ2oUzZvEckqFJ4sZfyTTwz6ED+dQ3eOUuhSk8lUrxW74SGwxy4oQBzQQK1DElRaBm
 4przxns22uYftJKz9mjlVgBLRLjwiQJguB4K7GQQaU4Vu1f+bACKTFBpA9sUGIVGQxqx
 PfrQ==
X-Gm-Message-State: AOAM530wi+KxoARXJsD5gLEhveW8C3v+o8SBYsKyrLQZ1iv+IioSl9M4
 vlFFTAvsvhW9CklaHGQNaM8BUqtqH1y95NYvOJaFhtDRSwg=
X-Google-Smtp-Source: ABdhPJyWV2wm2qUzZadyFmVGpXemi3RjGozVlGK9lceII69iave5aEwFVRHyyjRWmjoSbQsLUu6y7XU0Q/oc9XQYaCA=
X-Received: by 2002:a05:6808:3d5:: with SMTP id
 o21mr1328565oie.40.1589529748422; 
 Fri, 15 May 2020 01:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-31-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-31-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 15 May 2020 18:02:17 +1000
Message-ID: <CACzsE9o-eoAWpvkwsMyFAyZKQNd1gffoFv41J+9+X12hG=u45g@mail.gmail.com>
Subject: Re: [PATCH v8 30/30] powerpc sstep: Add support for prefixed
 fixed-point arithmetic
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mpe, and this thanks.
---
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1343,7 +1343,7 @@ int analyse_instr(struct instruction_op *op,
const struct pt_regs *regs,
         rd = (suffix >> 21) & 0x1f;
         op->reg = rd;
         op->val = regs->gpr[rd];
-        suffixopcode = suffix >> 26;
+        suffixopcode = get_op(suffix);
         prefixtype = (word >> 24) & 0x3;
         switch (prefixtype) {
         case 2:
-- 
2.17.1
