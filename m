Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 961137B272B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:10:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PglCb2mT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxR3D3drDz3dfk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 07:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PglCb2mT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxR1t5rHsz3dKf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 07:09:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 97455B81E00
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB18C433C8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695935374;
	bh=DOYtT8XqWvaKAWXjcDsdY5Ix4lfUlVYiGzpyiAu7WjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PglCb2mT2oev2Olo975Shfw6rH+q8o5CA88LGaUQCMlr8YAxb4TUhLzvTkHjWRntA
	 Cf/1nUsX21ZeouR/28Q4Ck3lEaasKeHD6aw0wDMvu2pNNI7Oj+hRiLxIyzf0Kj8ySp
	 ISgPfPIaF1uusOib9F8KL3wmB7j4fVyQbqY24MhLE2zPtuBktalKDv9TEzc4Ap7jFv
	 ceLm2Cpvtv6bewPqnGwWe4eT9wuSyriz7/RPV3HaqHfUhrx1ZOVA7pMLoVDMC7T+BF
	 JXLxm1ieTr8F7lhvWYq2EZCPSc3SrpUnXEVHhhZO6bCsK24yldxM87dB01D1o95hwj
	 7YB8Ma+e5bVtA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-503065c4b25so21160800e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 14:09:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyj5wp87NgRzVwm55LN/TgBpeaHv5XinTg3Pe67n9Fy4MKVHYSk
	rzJEYPJx4PxjK61w/0LvVAS0ATm0ra916kyx+ts=
X-Google-Smtp-Source: AGHT+IHtMR6OkeIBT4okRR6COTrfyiA8wsez9F9aBZFhUSyDUgbI8N7ZIA0ELzokJn8uKzfN8L6mJ1DVH+w+tjlOFyo=
X-Received: by 2002:a05:6512:47c:b0:503:38ef:eb54 with SMTP id
 x28-20020a056512047c00b0050338efeb54mr2210868lfd.37.1695935372169; Thu, 28
 Sep 2023 14:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230928194818.261163-1-hbathini@linux.ibm.com> <20230928194818.261163-4-hbathini@linux.ibm.com>
In-Reply-To: <20230928194818.261163-4-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 14:09:20 -0700
X-Gmail-Original-Message-ID: <CAPhsuW70FyyLnn-JUXrJke6V9srguKL6yrUP4hqW1eWcxCaZwQ@mail.gmail.com>
Message-ID: <CAPhsuW70FyyLnn-JUXrJke6V9srguKL6yrUP4hqW1eWcxCaZwQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
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
> Implement bpf_arch_text_invalidate and use it to fill unused part of
> the bpf_prog_pack with trap instructions when a BPF program is freed.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Acked-by: Song Liu <song@kernel.org>
