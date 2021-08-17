Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6133EE5B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 06:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpdYr5Mtmz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aJMAL/T6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aJMAL/T6; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpdY65rGgz302d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 14:37:13 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id t68so21710433qkf.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vx1U37KNtff16Ngd5RblG4qptTiN5ck65qrTOS1H5aA=;
 b=aJMAL/T6rfjwfgRZMDZbqh1Xro2sXSMtgXYNl/Vk/l85iwXOd34EGK4MNy/PsOQ0AA
 KcEgiGRe+ycv/7dBHXnCA2i16ib0zHxkyRiV5M54mYL6sZjQxtNDTlBEfDwqRxa4OOku
 pMG9UqHna8gXXUeM+QpiDFJs56UWSKUF7KrCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vx1U37KNtff16Ngd5RblG4qptTiN5ck65qrTOS1H5aA=;
 b=I5/tQS6u/4cR2ifqSlcYFpKbfRyYZqDbyi6NnFshvxaoba4QSsQhU42Ci4bhovLETA
 12XjjkZtTfPajoRYzhGiNnfGC/AImjofOHrfV3geHOTdQLLmqVl1YGCNfc2z+Mn+Aumr
 IwjNnD+qvPuNHSBteLFrFW7IajuOxwrUsD5Nyt9uVD7egIM17oA9bx/HhBinLlKGM2U0
 K8pdF4l4L1KPk/Bx7sctOaaEKEHq1+kC2cMOCzXUR9XAnFetZAj04VOohH5mF+AOgkU4
 V23i2Gbt1uhiV8qUUIJ2hN0zirjWcWeKycN7lwYbSpMMp2LOWjxw4EPa0GFyWPnM3kdE
 BmSg==
X-Gm-Message-State: AOAM532Z5P0RdObkg2i6mrbKkYpEzLkpwzoQNDQA/V3CXf9yht16tT9u
 djc8NC44u7iueMQwZ4/hFhml6NiLzbzZEllQ1Ak=
X-Google-Smtp-Source: ABdhPJwzZNL8SnZ1e4ABpz6lg80o2wzSvUKLaMll9V77hluPOEQsIne6YyOW0oJCrldYC6aRhE6GT1tq/VPay33MNpE=
X-Received: by 2002:a05:620a:19a8:: with SMTP id
 bm40mr1883547qkb.66.1629175030177; 
 Mon, 16 Aug 2021 21:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210816083126.2294522-1-joel@jms.id.au>
 <20210816083126.2294522-3-joel@jms.id.au>
 <f02e97f3-5081-38c2-fabb-9ad4eae2c649@csgroup.eu>
In-Reply-To: <f02e97f3-5081-38c2-fabb-9ad4eae2c649@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 04:36:57 +0000
Message-ID: <CACPK8XeNBevr4aULVpgshYA+5Ek0ndoLgD5W3e7OvBC8+n_mpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/configs: Regenerate mpc885_ads_defconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Aug 2021 at 08:49, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/08/2021 =C3=A0 10:31, Joel Stanley a =C3=A9crit :
> > Regenrate atop v5.14-rc6.
>
> Typos.
>
> You mean you did redo a "make savedefconfig" ?

Yes, I did.
