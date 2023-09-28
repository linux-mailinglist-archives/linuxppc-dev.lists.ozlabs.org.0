Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617F7B273E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:13:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIlYOoaB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxR5k0mSCz3dFl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 07:12:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WIlYOoaB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxR4v14rRz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 07:12:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5541961BC5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06251C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695935533;
	bh=qGYf0Ot6wDp4Tf3fgiYIzUrKLJOt5tM0YIMbv15baXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WIlYOoaBv3SfCBFg3U6tH82eGrGEAZHhue7xoznsz+aFaFJzo9r3vIti4hh80TZhU
	 32/a5908t7H+5v6vKi2Ed4cDha5nusHXP6hf2gYzo3v2bQotIYjokDVdRO5U30z2uC
	 QVi5rACVPEmjpsAwcE+GhDM+ThjCpWFWtGTAy+DoNa/2diAL0OkmdICsMMhmufb8iG
	 1/Gq+twqKEaLqLvQiKKjqnnUejY+fGN1o0XMx2poRltbfkmlYKzeR+/U8AlD3Bx3Rl
	 PO4TYzQRECX4ax/2OPrQGOQRC1Sv2D7Y6T0fRVmXtcWpenLBIvt3VbTS4TOOjqDbqC
	 sr2ndDQfGUliw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5045cb9c091so15175009e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 14:12:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyg8RU7puypSeXqzha4edptiBoURJdDtDA9La72T3KttJplOq+T
	SWnFuPhJPjLUQcUw9wBpImGMndiOLIgIp//pu3c=
X-Google-Smtp-Source: AGHT+IEh4Ki/LitKTQkP2Eoj8RzO9bXbkxs3ZzcTN0vMDDoY+OlegyBlrv9S1uz3Z9WvEeeZlOiAUMWOhAVFQAQAu8s=
X-Received: by 2002:ac2:549a:0:b0:500:75e5:a2f0 with SMTP id
 t26-20020ac2549a000000b0050075e5a2f0mr2208799lfk.51.1695935531220; Thu, 28
 Sep 2023 14:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230928194818.261163-1-hbathini@linux.ibm.com> <20230928194818.261163-6-hbathini@linux.ibm.com>
In-Reply-To: <20230928194818.261163-6-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 14:11:59 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Pb+jXMopC7CACJ=2qHDYxMQrw+xgxm4DLHBa4+PBW_w@mail.gmail.com>
Message-ID: <CAPhsuW5Pb+jXMopC7CACJ=2qHDYxMQrw+xgxm4DLHBa4+PBW_w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
To: Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 28, 2023 at 12:49=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
> writes the program to the rw buffer. When the jit is done, the program
> is copied to the final location with bpf_jit_binary_pack_finalize.
> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
> if necessary. As bpf_flush_icache() is not needed anymore, remove it.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Acked-by: Song Liu <song@kernel.org>
