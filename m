Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8D072F42B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 07:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pU3WAEuf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgvFr3wzhz30hG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pU3WAEuf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgvDv60l9z305R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 15:31:57 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-25df7945508so236697a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686720713; x=1689312713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX0xagCp7H/AlKSWf34pxZBZXAtOTLVqj1yBliS9iBY=;
        b=pU3WAEufdsyFixiUQFDuBcrlrm8ERPFw43lDMXts2FCmK1xHrCkO0kPI+c1yyvOfAh
         k/hN/qXfIThFYdHq4yG7CBki1Bx+3N83mNCT/3513gD+pprxP+Ewk20jLDJ4JNi3BJGm
         U4Vlp7+CWqKId2NfwAfLh77TT5/yC9WEqra0RNUoAd1F6B01aXPq4Tm+LtG2YBgYXxPD
         VCyaiFTAtN+WbEsLeBdzyGFwMkcbLyRljCjbz6/4ap0rzyz63piRDQz6QoBnF3cUi255
         QMESI7/Ig4udrdqazTP/24Iq6x4I7YuRFh8JUwtO2veFZ73GiGDlDuF/3aQBwa/0lHNy
         MSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686720713; x=1689312713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZX0xagCp7H/AlKSWf34pxZBZXAtOTLVqj1yBliS9iBY=;
        b=QJGXk0Ax1DVOy5DyJMH9G/fEubFQcMvtVvKUuFyBXJIIqYBInuIRUuy8xmIqFcBKqv
         Pkx3mVuh9nyv3QDfZyIhSvHEZminvc/OOipN9vCzyApMmiWIfUNukPNaC3fRvEq1V14c
         LClfUGoVRAgogj5rofDSPfFhGUiAx58XaoWCB48Zo67AM9NeRXJsewGhw8yyRGjWBC43
         XuzXjyig5Yi89fe2goj9VEMgYN4ogUTWNI7pCyYoMhtTOfYOV8d+rJXE9uurhxqINzCZ
         2LXZjS+6YgCxML5DPhPeydx8aR+M0XqAU1Jq8wqNBOQI+TO+tGP/IlFbUZixcWTr9QMF
         WoAQ==
X-Gm-Message-State: AC+VfDxVy2K13dBB0C+rdi2HLvaXd242wiA9x6E8NXtO9WT+KkZOocp5
	PK5dwppuIHhyLpi4HnZf+lTnPZNMVgQ=
X-Google-Smtp-Source: ACHHUZ6ROeb2Mmct2XwdjTe8k3xtDaHnBGu9uIJPhH+iYH3FWV78ei1G6yGfbPY/EQWi/aOJ6WoUJQ==
X-Received: by 2002:a17:90a:6d8f:b0:25b:acaf:2e3d with SMTP id a15-20020a17090a6d8f00b0025bacaf2e3dmr668924pjk.30.1686720713323;
        Tue, 13 Jun 2023 22:31:53 -0700 (PDT)
Received: from localhost (220-244-204-78.tpgi.com.au. [220.244.204.78])
        by smtp.gmail.com with ESMTPSA id s23-20020a17090a1c1700b0025be4c602d5sm4949353pjs.38.2023.06.13.22.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 22:31:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 15:31:48 +1000
Message-Id: <CTC4L8IXCXYK.2HXFG6XONKVBA@wheely>
Subject: Re: [PATCH 2/4] powerpc/64s: Add POWER10 store sync mnemonics
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Joel Stanley" <joel@jms.id.au>
X-Mailer: aerc 0.14.0
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-2-npiggin@gmail.com>
 <CACPK8XfpK4A2voTXcjsXh91QdDMUB65vwQimb3vD6pfx2ovaUA@mail.gmail.com>
In-Reply-To: <CACPK8XfpK4A2voTXcjsXh91QdDMUB65vwQimb3vD6pfx2ovaUA@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 13, 2023 at 3:31 PM AEST, Joel Stanley wrote:
> On Fri, 9 Jun 2023 at 10:01, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > ISA v3.1 introduces new sync types for store ordering.
> >
> >   stncisync
> >   stcisync
> >   stsync
> >
> > Add ppc-opcode defines for these. This changes PPC_RAW_SYNC to take
> > L,SC parameters and adds a PPC_RAW_HWSYNC for callers that want the
> > plain old sync (aka hwsync).
>
> I checked these against the ISA and they seem correct.
>
> Did you consider changing LWSYNC to be defined in terms of your new
> PPC_RAW_SYNC?

Oh I haven't but it would be consistent to change that wouldn't it?

>
> Reviewed-by: Joel Stanley <joel@jms.id.au>.

Thanks,
Nick
