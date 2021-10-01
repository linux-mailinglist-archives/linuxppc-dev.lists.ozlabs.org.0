Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6841F719
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLkHf0kPTz2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:47:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pl7Bh6Sb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pl7Bh6Sb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLkGz51ZDz2ywD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:47:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AABE0619E9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633124841;
 bh=K15d2htnQQRQGjSh1KETNXGrI6qWCe4RIy/ofj0rvFU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pl7Bh6SbauOYHQHTtCVn08y5cKd/NTs81T/kdX0b5uznQurLwBb5XQ+IeV0Tkkrmn
 a1/rtkLoQfHDS+7ioJX4EzVnxiDkvtHbcC82kYV8BK7jkICWdSNBNpT18VWp6jzTGl
 /ktMKBaDYkCPf8hi5zZP4C5VUFdBi+/3McR1x4UyDwKnOhGhWVKPwflI5Wxbkmvt1W
 GSgUwMoq81FshwBQiH3jmMXh+FSbc6Txg73YQ78PDv2vXL7ZsynMsURPMdLxYQLqr/
 8Z06oB/gbMVieHvOUFVjF3kfQrgEH8UmUdDE3eJiy5IxWxB3URUR15hLMzxqjnEVDH
 zetXca+bj6cQQ==
Received: by mail-lf1-f49.google.com with SMTP id z24so43881436lfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 14:47:21 -0700 (PDT)
X-Gm-Message-State: AOAM533edRMDyTwq4f4ghJIAM2M/ZFX8lvcYtakc8/pr3XP51UFjgLLt
 ZfTx/9qRNG50pbagnDdBX0x/LJnzbujWkPk7M9k=
X-Google-Smtp-Source: ABdhPJzJtB3ipPnC4kLyUHDhkTd9/lZ0YzwbjDxV9lloxrVPznT2/i+4ojmIh5hqpCVie1sVhz/DdNKHUzCQpQiSYrg=
X-Received: by 2002:ac2:5582:: with SMTP id v2mr361410lfg.143.1633124839988;
 Fri, 01 Oct 2021 14:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <92fcd53a43dede52fbba52dc50c76042a6ce284c.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <92fcd53a43dede52fbba52dc50c76042a6ce284c.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 14:47:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6LjB2-OaeHtePeM_v16oSOw5+3uJuUVNKqY6XEKjyg0A@mail.gmail.com>
Message-ID: <CAPhsuW6LjB2-OaeHtePeM_v16oSOw5+3uJuUVNKqY6XEKjyg0A@mail.gmail.com>
Subject: Re: [PATCH 3/9] powerpc/bpf: Remove unused SEEN_STACK
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 2:16 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>
> SEEN_STACK is unused on PowerPC. Remove it. Also, have
> SEEN_TAILCALL use 0x40000000.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  arch/powerpc/net/bpf_jit.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 7e9b978b768ed9..89bd744c2bffd4 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -125,8 +125,7 @@
>  #define COND_LE                (CR0_GT | COND_CMP_FALSE)
>
>  #define SEEN_FUNC      0x20000000 /* might call external helpers */
> -#define SEEN_STACK     0x40000000 /* uses BPF stack */
> -#define SEEN_TAILCALL  0x80000000 /* uses tail calls */
> +#define SEEN_TAILCALL  0x40000000 /* uses tail calls */
>
>  #define SEEN_VREG_MASK 0x1ff80000 /* Volatile registers r3-r12 */
>  #define SEEN_NVREG_MASK        0x0003ffff /* Non volatile registers r14-r31 */
> --
> 2.33.0
>
