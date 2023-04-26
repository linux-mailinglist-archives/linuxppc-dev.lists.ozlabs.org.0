Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE406EF5B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 15:45:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q60Vr4vM2z3f5j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 23:45:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=DChMHSbV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=DChMHSbV;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q60V019GZz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 23:44:38 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b8f599b9277so10723469276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682516674; x=1685108674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlzacH95S9G7WQYp+n1NPz67OBwaM3/l9HiCCYW0Vx0=;
        b=DChMHSbVBySgl3y5N6nCQPhXy7ImLFSFkKAR/Jszb2rzvjrN589ggtoht5HpDQJVWX
         UNTPvCLGnJY7mgve07WL+obQWUBbz99i4YJcMulOtipltF6CLhrn2iqVvLrsUODk5QDA
         bSt/W/8rVjne4zvyZ015pAZtm4RkbOQgtBmg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682516674; x=1685108674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlzacH95S9G7WQYp+n1NPz67OBwaM3/l9HiCCYW0Vx0=;
        b=cvqtnYwpRk745nEnYwjEObBWgvP9BZxqLT2f27mRApk1ELi/iEwA8wLPwIeNNs2ZuX
         tyYjwYAU+Dts1f9KnOWNCeEl1tH29M8BUmduOlpICipgCn759C1B6hLp+4ZTrDExekCZ
         KAYxSahv9z7c4zdD5AIs3SCkRgLIPbgQfa6jv1Qt2+f2nbSBr2eekra+WMREQ4fLKGyc
         z9hRB+60FaZwNE2Vnmv54MlHn1E71B645SfqTy/04UPFNn8fwt8DkhaZp+9aOTNhyUIx
         Phkuj77pAGPtQmxME+1j5129GxkS7c2D7F/7Eu1CQhq1RbgULnRF1AqoRdmbasbg5Iew
         wUTw==
X-Gm-Message-State: AAQBX9eqB31VEEMnlQtLWjmATBe+G8vYPR/F+oiudOK1FbZmcOqm7gDe
	US1bOf/+GFr+ve9kToI8zX4MZqMXHmhfDVo9uc5DGw==
X-Google-Smtp-Source: AKy350ZN41b3pj65jdJxWoNccD5sj1/xopSHqVqNgPFtkjk/m1LDrR32lA4C+SkQh2ViVhBrymcby2pu2QkcbGoeoUg=
X-Received: by 2002:a25:34d4:0:b0:b8f:32aa:1d50 with SMTP id
 b203-20020a2534d4000000b00b8f32aa1d50mr12351252yba.55.1682516674401; Wed, 26
 Apr 2023 06:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com> <877ctyzv08.fsf@mail.concordia>
In-Reply-To: <877ctyzv08.fsf@mail.concordia>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 26 Apr 2023 09:44:22 -0400
Message-ID: <CAEXW_YR4rmNY5JF-077EUpriF=PP9uML+_WMDSVi-L3G6_FOdw@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 26, 2023 at 8:30=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Joel Fernandes <joel@joelfernandes.org> writes:
> > On Tue, Apr 25, 2023 at 6:58=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.c=
om> wrote:
> ...
> >
> > Out of curiosity for PPC folks, why cannot 64-bit PPC use per-task
> > canary? Michael, is this an optimization? Adding Christophe as well
> > since it came in a few years ago via the following commit:
>
> I think Christophe also answered these in his reply.
>
> We do use a per-task canary, but because we don't have "current" in a
> register, we can't use the value in current for GCC.
>
> In one of my replies I said a possible solution would be to keep current
> in a register on 64-bit, but we'd need to do that in addition to the
> paca, so that would consume another GPR which we'd need to think hard
> about.

Makes sense. I'd think it is not worth allocating a separate GPR just
for this, and may cause similar register optimization issues as well.

> There's another reason to have it in the paca, which is that the paca is
> always accessible, even when the MMU is off, whereas current isn't (in
> some situations).
>
> In general we don't want to use stack protector in code that runs with
> the MMU off, but if the canary wasn't in the paca then we'd have a hard
> requirement to not use stack protector in that code.

How could you control which code paths don't have the stack protector?
Just curious.

thanks,

 - Joel
