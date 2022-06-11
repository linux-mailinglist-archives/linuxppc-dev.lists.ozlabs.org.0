Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BE5475C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 16:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL1162PXYz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 00:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=E+GwPZbQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=E+GwPZbQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL10T3TYvz3015
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 00:48:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1C4DB80139
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D716C3411C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:48:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="E+GwPZbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654958882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvbZPzkw/avTJd3PDrjqFs2/jjR0Wrowg5/jhXGMgzI=;
	b=E+GwPZbQn5HZkZ/Je4U2iWkYH800EZbWyPVtmRulfQOWzhqY66T7kchVriEcoTHzF5Rrlj
	KN/yWl8n0aCWdUS0NoYAgvpEWV4ep1tefZMlmFIu63U/CS64oDaLESnT7arVBLlS2ndvrT
	sOXIcAr899zw5akiFQw9Zbs/rBHQNm4=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 957d8938 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Sat, 11 Jun 2022 14:48:02 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3137316bb69so15506937b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:48:02 -0700 (PDT)
X-Gm-Message-State: AOAM533ESRhIA11+q6P2+3d4zHPoyQPSjjK1Q2Zw0i5OCosEwSKaSdA5
	9qTgMqoHhImz1eQiR0VvzQxTZHQQBZyXbehiqM0=
X-Google-Smtp-Source: ABdhPJzzArFp2ddzM7VediG5TtTJ+j9tfjhdRZOJPfFq+eFrP3f9rqrR2Ogp08DsPZj5Pzv3mdiHrltJXT+JUtjiBUs=
X-Received: by 2002:a0d:e28d:0:b0:30c:572b:365c with SMTP id
 l135-20020a0de28d000000b0030c572b365cmr56411692ywe.499.1654958881016; Sat, 11
 Jun 2022 07:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220611100447.5066-1-Jason@zx2c4.com> <20220611100447.5066-3-Jason@zx2c4.com>
 <d310a8cf-79f8-89ed-41fd-ebe0281a67f4@csgroup.eu>
In-Reply-To: <d310a8cf-79f8-89ed-41fd-ebe0281a67f4@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Jun 2022 16:47:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9rZSbvxaWQbVX6C001SUbkS3ryyAJds6KYu-42uhuN7tQ@mail.gmail.com>
Message-ID: <CAHmME9rZSbvxaWQbVX6C001SUbkS3ryyAJds6KYu-42uhuN7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] powerpc/powernv: wire up rng during setup_arch
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 4:42 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Same here, the prototype should go in a header file., should be 'void
> __init' (and indeed the __init is pointless in the prototype, only
> matters in the function definition).

I'll change the order, but I don't see a good place for the prototype
other than the .c file. It's not a big deal to keep it there.

>
> Maybe the name should be pnv_rng_init() like the setup arch below.

All the rng.c files are powernv_ prefixed, not pnv_ prefixed.

Jason
