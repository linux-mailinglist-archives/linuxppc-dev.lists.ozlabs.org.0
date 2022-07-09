Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86356C79A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 08:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lg17l6JBkz3c73
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 16:53:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YXYFt0E8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YXYFt0E8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lg175297zz3brp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 16:52:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B86260C72
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 06:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6ABC36AE2
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657349565;
	bh=OItCzHGXam6f2RpFSde10A15StjZbNKKbQYgGQWL2X8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YXYFt0E8Ij3TgCUsoJLhq07xJOnDEU7zvUw1pDlWBWVtYAeRlTzPo0WnyE6pAWxtS
	 Wz0OzuoKZtFXMr8oGb0REQjuF1MDG5iVNs69CRGEV7Bow5UEKaQPXR9DV1NU/kDYv4
	 58yKRd25CSBnsOav4LnMTyDIMCAzREvO3I8lLvTK/U8qQcDPlut4I2biLvyU30UmA4
	 7eI70hMQNcSP2tS/A/Ga2ou3NVv0CtwI1bYQDXOUazMReVaJxPuYigQtH6QnIAJLo1
	 5q2PsqSEmMIznJRpTuh0e4tdAK+hDQNZLYIQzDuhWNJJfRwDVAURMOPZFz72X0VgwC
	 lCRR31TOKW0jQ==
Received: by mail-ot1-f43.google.com with SMTP id m24-20020a0568301e7800b00616b5c114d4so630195otr.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 23:52:45 -0700 (PDT)
X-Gm-Message-State: AJIora9re1mKmDbp/9YWFQIikbXnr5Ul9ytlWMlWlftcEBFnlcWp92yd
	FdhScwM3G9LZkQkBLk3iKSXwBHdnsZYIfQ+8UiY=
X-Google-Smtp-Source: AGRyM1v/vL19VArStGC5zZnGKw+rHp1LFl+18klaQ+vaUgTkXmX9bHLGmj/xFc/D4rPKBlkGaqozxcRH0jc+EUKYeYo=
X-Received: by 2002:a05:6830:4420:b0:616:e569:8ae9 with SMTP id
 q32-20020a056830442000b00616e5698ae9mr2892555otv.265.1657349564339; Fri, 08
 Jul 2022 23:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301423.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1657301423.git.christophe.leroy@csgroup.eu>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 9 Jul 2022 08:52:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFqs=YAbTDJOgzpse9ZkggSxPNNJJphEA=J94FQzF55qg@mail.gmail.com>
Message-ID: <CAMj1kXFqs=YAbTDJOgzpse9ZkggSxPNNJJphEA=J94FQzF55qg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Implement inline static calls on PPC32 - v2
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
Cc: X86 ML <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Chen Zhongjin <chenzhongjin@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Baron <jbaron@akamai.com>, Ingo Molnar <mingo@redhat.com>, sv@linux.ibm.com, "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, agust@denx.de, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe,

On Fri, 8 Jul 2022 at 19:32, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> This series applies on top of the series v3 "objtool: Enable and
> implement --mcount option on powerpc" [1] rebased on powerpc-next branch
>
> A few modifications are done to core parts to enable powerpc
> implementation:
> - R_X86_64_PC32 is abstracted to R_REL32 so that it can then be
> redefined as R_PPC_REL32.
> - A call to static_call_init() is added to start_kernel() to avoid
> every architecture to have to call it
> - Trampoline address is provided to arch_static_call_transform() even
> when setting a site to fallback on a call to the trampoline when the
> target is too far.
>
> [1] https://lore.kernel.org/lkml/70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu/T/#rb3a073c54aba563a135fba891e0c34c46e47beef
>
> Christophe Leroy (7):
>   powerpc: Add missing asm/asm.h for objtool
>   objtool/powerpc: Activate objtool on PPC32
>   objtool: Add architecture specific R_REL32 macro
>   objtool/powerpc: Add necessary support for inline static calls
>   init: Call static_call_init() from start_kernel()
>   static_call_inline: Provide trampoline address when updating sites
>   powerpc/static_call: Implement inline static calls
>

Could you quantify the performance gains of moving from out-of-line,
patched tail-call branch instructions to full-fledged inline static
calls? On x86, the retpoline problem makes this glaringly obvious, but
on other architectures, the complexity of supporting this model may
outweigh the performance advantages.
