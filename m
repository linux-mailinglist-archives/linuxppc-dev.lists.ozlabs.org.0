Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217967AA24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 06:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1tN736BWz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 16:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MkZysPwq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MkZysPwq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1tMD09Sbz3bpH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 16:54:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2C3B61388
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 05:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E057C4339C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674626052;
	bh=JIber7cTfE9ThxMrYyG/mxwkbRzILpS6h12Z6O1fhcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MkZysPwqbD6HWPhFavr6Z+uZa5RCwE0rTC1iC87F4+bWo0kZ0wVUe/sLgSOEJuaJb
	 Pr4V8dbEiTwOXcMgUFWpZl02JaVM/N2ZHa+xvnmI9DKqdM/hj/r750X2oW4CdTOZPv
	 tnldu7QNioehfjwh3MKWekpzNFDYAEyg9RvCG10oYn5zXLV7twWU3YNgvxN67e3n8F
	 WdyLYrc7+N0/4yqMEirm9tB2wc39ccGkJT5BRyQL6hbjkU755zkP1pkY+pMm5sCFkD
	 Sm60X7pFWBazZGXpUkxJ/fPLqUHGinWytoN9YitlSO5Fhha+AYRZW5JA1Engy73NtU
	 zU1TCD2CeXZrA==
Received: by mail-lj1-f169.google.com with SMTP id a37so19198160ljq.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 21:54:12 -0800 (PST)
X-Gm-Message-State: AFqh2kp3BGtxDBv0dHLKFrlDPS41/fGDKKjDGV/ber26VSk2pchVF21s
	2R2ClPR0Y3DlW+0qKL44sp/eSbXmNIgAKBjq+PY=
X-Google-Smtp-Source: AMrXdXvwTh3TnItQH+Of30p8yazMgU0vmxKOZ3BJ+NF7tXNDrhWd6Q3bd7TrD/6soqGyBgQ+RLdt+h4NEd3WVYVD+B8=
X-Received: by 2002:a2e:a304:0:b0:287:14be:5d05 with SMTP id
 l4-20020a2ea304000000b0028714be5d05mr1494540lje.495.1674626050411; Tue, 24
 Jan 2023 21:54:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674617130.git.jpoimboe@kernel.org> <15baf76c271a0ae09f7b8556e50f2b4251e7049d.1674617130.git.jpoimboe@kernel.org>
In-Reply-To: <15baf76c271a0ae09f7b8556e50f2b4251e7049d.1674617130.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 24 Jan 2023 21:53:58 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6Ee+RT86MUffgS+4zvJjG3JFAz=qp=LHeTW=RWPhCYzw@mail.gmail.com>
Message-ID: <CAPhsuW6Ee+RT86MUffgS+4zvJjG3JFAz=qp=LHeTW=RWPhCYzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/module_64: Improve restore_r2() return semantics
To: Josh Poimboeuf <jpoimboe@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023 at 7:38 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> restore_r2() returns 1 on success, which is surprising for a non-boolean
> function.  Change it to return 0 on success and -errno on error to match
> kernel coding convention.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>
