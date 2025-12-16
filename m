Return-Path: <linuxppc-dev+bounces-14822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA84CC4D38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 19:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW4t45cWMz2yF1;
	Wed, 17 Dec 2025 05:18:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765909084;
	cv=none; b=CzBt+DW0rfeYAveNX5iKnqv1hWurH/tYOdf9/qw0SJIN9McjsjY7qEeHZVnY/q6SfXR6aLQ26+/BKybvlfqY9HhgLqF9/1Fl4KEEioIZOGYkvq576uEFSZv1GyvJWokBKacrxQNSlJ/O30oFg7Hg6S6YUKGItve0lX8WrfiJWkdU3EGqUQaX+5LYu+rpgICoJg18MfPhaaYOEkxlR+YsfWKE63RayZjx6im0sp8yRi/8Fzbzwi3Bf6Q1EZgaWE+ODKSZg3DL5S6qOlDs5imSwWBLLsvuABfo93rDutG9EomA8MHfNHkR/jqYPEl9LZ02/rWUucoE8uA/Y/n0KqQptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765909084; c=relaxed/relaxed;
	bh=DqdwfT9jQv14SWCzH+5xSCjiylSXLId1RXHgfGmZ+fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeASadfbLmUR1c8WNbgxjCiXwdmxgtaK5OBy58sH5zs3wPzioJ0tF9LzYMQhXjmzILjvED/hey7XSbhLyoIVm14fDcxsdLrlVAXYJX0eFEJhBpEbejk0Rr3ceP9W7HLSzO8UJLhpbdTZ1wKYU5s9Re6yc69gqxydVUNgSgyemMxf0GFDHiNd1qAuaDwwqZNp3vAEioIRoH7bRyZUifVMOqVhSx+oeFA9OJZSIucBC0LSf85XCk7K+7JCF6ITowcyJ0X14R+BxN2tSuWZV3i4jhoZb9FRScUPzuUGQ5h1+tbuN5PLBDjqhxiIBmKLBq3r23FN8a+BLrwEcIZk1VQhnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a/9UYtyT; dkim-atps=neutral; spf=pass (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a/9UYtyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW4t31h4xz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 05:18:01 +1100 (AEDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7f1243792f2so3294072b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765909020; x=1766513820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqdwfT9jQv14SWCzH+5xSCjiylSXLId1RXHgfGmZ+fk=;
        b=a/9UYtyTk1g+qWOoqYCp8XoOS4T0foI7XDaaxY/vva0nmaS1zfS9Hjy5gqVGF+xppf
         fZcx5KZMk2wC4OxfXRBPuS+rBy0AhN1MoKab7JElLHwOYgsgNuHeZNMlvTtzyYa8HGDk
         2GEhxgG0enx9bYMcFtK++rxgOULP2udBf9lDf/V2VzK6fk8U5OgGwsgvyooG770GxSGk
         hGSsOjiNEVQFqmDa5x4PqJ3sSiPF3feiBFkOeOtUP8Dc6h1cN1d03JigAehQF/foUxsT
         gFEIwb4SczbN2sSCJu1I0a7Ye8pfgWR9I3wFo01FyTu7OhI7PriJ4c5aPIc/gLuXPR20
         +Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765909020; x=1766513820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DqdwfT9jQv14SWCzH+5xSCjiylSXLId1RXHgfGmZ+fk=;
        b=jYx71+VJ/1ZKQXM7X31u/YrsjF/RvPVaPi2wOAvvBVOzMddZzO7v0aUWlzEJqcKahv
         IYXcJJKfYCqdPJC68MxWL65gSE0RJggQln3/vXA6XpiGHommRdLQkrwqK601LAjgBZ3V
         o1pDpZ5StfZfmtbjZJg5DCE2ja3r5Gmvdn31E/Z+NWKf/vfBt9BAItcgVmtXvvpwtbxa
         30QiSNm2GLlr+OLyjip6EmvRooq+HXijAhb6QhITEfUwmHHi793Bl3dcHa9nG9DYZ7RJ
         iIveaWbY5ck7Z4i1c1hBjh+tUnOrvBxYDPhdQT6koo+SyHIWA+RiNqs/8/MTJ4LsLC87
         4pEw==
X-Forwarded-Encrypted: i=1; AJvYcCXaYvMJtYQRIS3simOgzK97hvfxKlktOtgdE7SjWNdxeKt+TqGJjkETzZ6MYQO+ZrLREVb2CsRH5ZUTZB8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBFgGq8slx2rHzqXp8cAxPsrCD3JyIGE7pYTM4vRfsryXKUMS4
	ffDoq9xXe4KkpakhZAIp1QOfVp/WWIrfzUL/qGGgSm7VZD+B18AeyswGyzQOVKZpDUbdOITOS1L
	FmuNLH0ujVdDAV2fjPSp3gj2Hskmu5Gg=
X-Gm-Gg: AY/fxX4sXf9sceae0No+6rrLu0GR7I/b+wpskW3zYdxqI6tasQCkXgHLt+ub7TwvhUe
	bmiqe8EoclyQAXPB/k/dDkNZSLO3JQ1DHG2gXkMBQLOIqBttNvQiuN7rmjB8/4RWrIsoxdrnpuG
	Mcj0d6P5N4QxXcfz3P7petlmDfESjdeLhfbYe47an9Shyhh6V/6laDfmfzlLL3KwkAVLjegplsY
	4krigdje0G3IJeWTbwBYasZiKvYbTiW4NvTCStZRGDrdpwOz3e43bf8ZudtsGD0h44db6VScKoq
	wm4LYaJ6dME=
X-Google-Smtp-Source: AGHT+IGPlVPwrzSdeGZl65PGmpEh+HjErNUvKnuS53Fu7z5APtZFChtUYfm2RrnzI0QL7QktR/aAVL+xvxr1o7nZbfA=
X-Received: by 2002:a05:6a20:2443:b0:35d:d477:a7e9 with SMTP id
 adf61e73a8af0-369ae0ac3acmr16280227637.35.1765909019519; Tue, 16 Dec 2025
 10:16:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1765343385.git.skb99@linux.ibm.com>
In-Reply-To: <cover.1765343385.git.skb99@linux.ibm.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 16 Dec 2025 10:16:47 -0800
X-Gm-Features: AQt7F2rnNRMrfQOUmQAMtLTW3ciVgE59OOt1kNPKB6b0_n4gpnuuStY7i-VF9zM
Message-ID: <CAEf4BzbiyJwSoaSRDtSRetze-yST-NQX83FyECSmRex9szx0NQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/2] powerpc64/bpf: Inline helper in powerpc JIT
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, sachinpb@linux.ibm.com, 
	venkat88@linux.ibm.com, andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 9, 2025 at 10:51=E2=80=AFPM Saket Kumar Bhaskar <skb99@linux.ib=
m.com> wrote:
>
> This series add support for internal only per-CPU instructions,
> inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
> helper calls for powerpc BPF JIT.
>

This is marked for bpf-next tree, but I think this should actually go
through ppc64-specific tree, is that right?

> Changes since v3:
> * Added break after computing per cpu address so that the computed
>   address is not overwritten by src_reg as suggested by AI bot.
>
> v3: https://lore.kernel.org/all/cover.1764930425.git.skb99@linux.ibm.com/
>
> Changes since v2:
> * Collected Reviewed-by tag.
> * Inlined bpf_get_current_task/btf().
> * Fixed addressing of src_reg and BPF_REG_0. (Christophe)
> * Fixed condition for non smp case as suggested by Christophe.
>
> v2: https://lore.kernel.org/all/cover.1762422548.git.skb99@linux.ibm.com/
>
> Changes since v1:
> * Addressed Christophe's comments.
> * Inlined bpf_get_current_task() as well.
>
> v1: https://lore.kernel.org/all/20250311160955.825647-1-skb99@linux.ibm.c=
om/
>
> Saket Kumar Bhaskar (2):
>   powerpc64/bpf: Support internal-only MOV instruction to resolve
>     per-CPU addrs
>   powerpc64/bpf: Inline bpf_get_smp_processor_id() and
>     bpf_get_current_task/_btf()
>
>  arch/powerpc/net/bpf_jit_comp.c   | 17 +++++++++++++++++
>  arch/powerpc/net/bpf_jit_comp64.c | 21 +++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> --
> 2.51.0
>

