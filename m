Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867377B2728
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:10:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tQiaTNqc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxR2H3KdFz3dTF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 07:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tQiaTNqc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxR1J0hh1z3dG9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 07:09:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0F2CCE222D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEB1C433D9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695935345;
	bh=7te1mmtwRAR7CnjCs+EpdXe/jmMMQFgw1qqKxIIPsH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tQiaTNqc8UJR/3iLTF+2e52J5yaQlugX9dYPBfhXXPbWQxi25MmCdMx7KF+e30vkP
	 YS4h5dG+L5T7DN/0q2Ils6qcU3UTuuvvBEZHrEm20IoG46Eo6KtYAk77eRgg8pS/NN
	 TeteGAvB/B3ggREcJXb5oAwesn4i2UeVRS4zWL0FG6FQ5fwXzCft3ERMfUa52mkBdh
	 OgK4HATQfZEDfZWoeLR+af26s6LzcgUbHUb3vNVdv7g2l+3stqlQWM+fHXynEKi3+z
	 9W9viwhlNIyNOWIhc9a4JMRPM7+lA7edwmDc2e9r7c6bL76jQXW4xv//G5DW9mTe64
	 316EZnJ0z+0tg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5045cb9c091so15171711e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 14:09:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YxXvV5Xwr8kg0imWBpJozH1BDxlojvPv6I+dCoJFqLJAchu2i5y
	229wet+FIj/enG95x8ZUFb1eiifeC2MOoEdAfXk=
X-Google-Smtp-Source: AGHT+IHxEtFCbxS9MI1VFWusXoUBlvfGE+D0KZwKEIE5zEdHhgaN5BXgPngRbRFOCYv1VllS5IeyhBSrtieUv01AUDc=
X-Received: by 2002:a19:4304:0:b0:503:7c0:ae96 with SMTP id
 q4-20020a194304000000b0050307c0ae96mr1876456lfa.20.1695935343374; Thu, 28 Sep
 2023 14:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230928194818.261163-1-hbathini@linux.ibm.com> <20230928194818.261163-3-hbathini@linux.ibm.com>
In-Reply-To: <20230928194818.261163-3-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 14:08:50 -0700
X-Gmail-Original-Message-ID: <CAPhsuW520Tw1eUBvAhSRrEJ5wy6x4zLjRZsNzr8Ca2U6a1_o4w@mail.gmail.com>
Message-ID: <CAPhsuW520Tw1eUBvAhSRrEJ5wy6x4zLjRZsNzr8Ca2U6a1_o4w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] powerpc/bpf: implement bpf_arch_text_copy
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

On Thu, Sep 28, 2023 at 12:48=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
> bpf_arch_text_copy is used to dump JITed binary to RX page, allowing
> multiple BPF programs to share the same page. Use the newly introduced
> patch_instructions() to implement it.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Acked-by: Song Liu <song@kernel.org>
