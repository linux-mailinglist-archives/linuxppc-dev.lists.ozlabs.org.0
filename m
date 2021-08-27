Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6D3F91F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 03:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwj1l36dZz2ywd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 11:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=avj7mC3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=avj7mC3x; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwj120vhPz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 11:33:55 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso7841626pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 18:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lReVvr7+NTRUSgKBR31mo8RSjg2frkLgUYxXDLE2Pyw=;
 b=avj7mC3xoW+Ek7+Gx4Jpk06LIl7OelP4UJR5dPmH03Ag13gOPBvmQAMT0qk3nyRUfy
 HR7XPcwWpgx22772UYw9aCHcggjDL9IxuzW0PvZCdKWpoixABFgNcndcOg7HbrLUmyS8
 jKgbjv5+t5W1qeO+iJOKThF3rYHfhBkLxnm1dD62drsWmX8R+OvyM7bUX+KIr7nX66TZ
 OMZc9cjci9QoZumQDTSaWalRQx/55aNw9XhTfrzPVoGYPSqQ1364vYC7YIeC7j9q2fxc
 s6A4hFIh8ak+WgXCOKJX4p5o+bU22jOjOu2qNVObBnStg2WTL5s3afu9sQyZOQ0gax3k
 4pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lReVvr7+NTRUSgKBR31mo8RSjg2frkLgUYxXDLE2Pyw=;
 b=mlKbX8hvdwnH8+pt3T4q5tNwhRoQ4ZxAvuogct/YFRHdxl7XySVdVvJS0sGJu9+kgY
 3FNitRrR+3/eiV2bfjEgJm42/tzWNR7NPvhbfODhsQn9sfsTXrI5uoX+2NiTKWa+k3Ip
 lw6klQX2nHyXeMP39Z4SisXcO2F6mFRjfIAWQiY40rUIEI2Djtl/cb5A6wzYTuDtnTQV
 wA34V26IcWa4RsxpI4bthfjYznsmLRpUSTo605Si6WhbrFpxy91IT8XV8d0hZ++X407S
 NNrcJkdp2bR5H65TjsOIg7RF76kblov9VAgenfzLZstwRuIujHldksoQlv6RdvglEas/
 vUpA==
X-Gm-Message-State: AOAM530tFNBtFy6Xksgijhv4hOmFx5u8gw++I35a30d1hLB1d7KxqrOe
 mmYaGQIzmRu2iZfa98YTxsLUy0PPXs4=
X-Google-Smtp-Source: ABdhPJwYRm3jzmelY/PlT1jqiJgxLNWN0PP+vBpH8oxRk33ElY4+fjz4jSL/+NFhycckKhaUwZbSbQ==
X-Received: by 2002:a17:90b:30c1:: with SMTP id
 hi1mr7467633pjb.187.1630028031653; 
 Thu, 26 Aug 2021 18:33:51 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id h9sm11038003pjg.9.2021.08.26.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 18:33:51 -0700 (PDT)
Date: Fri, 27 Aug 2021 11:33:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] powerpc/64s/interrupt: Don't enable MSR[EE] in irq
 handlers unless perf is in use
To: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
References: <20210825123714.706201-4-npiggin@gmail.com>
 <202108262232.PzC05uqr-lkp@intel.com>
In-Reply-To: <202108262232.PzC05uqr-lkp@intel.com>
MIME-Version: 1.0
Message-Id: <1630027985.jysxfzuv4t.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from kernel test robot's message of August 27, 2021 1:04 am:
> Hi Nicholas,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.14-rc7 next-20210826]
> [cannot apply to scottwood/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-=
64s-interrupt-speedups/20210825-204209
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next
> config: powerpc-allnoconfig (attached as .config)

Fix for 32-bit:

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/h=
w_irq.h
index 8c78c40c006e..55e3fa44f280 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -437,7 +437,7 @@ static inline bool arch_irq_disabled_regs(struct pt_reg=
s *regs)
        return !(regs->msr & MSR_EE);
 }
=20
-static inline bool may_hard_irq_enable(void)
+static inline bool should_hard_irq_enable(void)
 {
        return false;
 }


