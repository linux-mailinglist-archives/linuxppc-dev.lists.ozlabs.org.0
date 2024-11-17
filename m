Return-Path: <linuxppc-dev+bounces-3366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A39D038E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhs29Gxz305D;
	Sun, 17 Nov 2024 23:25:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846317;
	cv=none; b=iTWtS/ft0UMpqCaZAIYChDYoctyA1MZFBToKp9ISiX7yG+nc0hfxisNyRWMTzkykh5hgCIoX7jq010OcbYkPN+hrbtl2i8nJVcE3QfGQyqx03cEKzuCjfHim1qN4YnxBQLOKJE5wMnyGb1BOwmEb6x0LX/y9eGuWgFsYcbFKPl4ry2UXOJ4TNs1wlrB+14gdo+q0I3cNmbpSLzYQ3qrX0argKqdRJkey+VRvIJ0jEa31gxJ5rdn1DTRXJIpe1AU840EBKqsgrsQZQ+tkoS//r+O4jzF/ES7KfP6Uf5JVpYc43KffVhMBzuPwD/KTF31zN/h8mHevDGDAyu8EDnpTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846317; c=relaxed/relaxed;
	bh=CKG84+r0siAfokontrKDesX9uTEGP18Q8+N/CJSOFJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CocRsckL+7sLGQHcBb3n8pupBRsOAndeBRAuObOQNJyANvscsQKW6eIvD/PZjhSfo2HjjNlyrQsA/e3kIH4B2sLkbo4JLmc4HH3jr/eCuGOkLp1j6EAd0JCgG/R9qtYPBeXZkZjYGT9FS9OD4IGAjPBJEF4OPEraEARlNGVnu1oJ04A6KEsBrknvfPznYB86MDCjMkGKCQkr4MkwPkxeCrYIeUzSFGLBz4b/AIWBdxJ1kH7QU9cKBCql91aLQcJlw8HOqMSIu4pTmZX3QVF50zVZk7xXzimFQCFPW+SombvAuqqgkWkg7ubK6RJzoTAEDLF3k+63ypWikoYMRalUAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bRilmn7a; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bRilmn7a;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhr6dhpz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846313;
	bh=CKG84+r0siAfokontrKDesX9uTEGP18Q8+N/CJSOFJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bRilmn7aPuUE951f/FQt4pJwT66UGKJxBCurd84j9mebMk3SAQv2CKRe1HGN4gdt7
	 a6QhHIZpc4TsNhS9fdRhd+R1DDukcGKY2oTTSGKwwET0khacffUaR7NiPps9CLNxFK
	 G2nfabb5q0bGbN/WpKNM3O3FGYaULt24S3xR0+T1jLXkPiUmuyOUyJaKo/u1jyQiP1
	 MsUAzPD/iRBfjq4DaG2ALsxM+Da0gzMdKl3TDguoTnEgmyhq/qqdCyfXdx+8VgnNzX
	 T8d8ubZTpPNcUgIj1B1k25xhcgR9CwtN9RU7XDuDezhqeta9Ful3cRhUcuur1s5pnF
	 8o4qkBgk7s/ZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhm4PfHz4xdy;
	Sun, 17 Nov 2024 23:25:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v7 00/17] powerpc: Core ftrace rework, support for ftrace direct and bpf trampolines
Message-Id: <173184539742.890800.10627378696586118580.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 30 Oct 2024 12:38:33 +0530, Hari Bathini wrote:
> This is v7 of the series posted here:
> https://lore.kernel.org/all/20241018173632.277333-1-hbathini@linux.ibm.com/
> 
> This series reworks core ftrace support on powerpc to have the function
> profiling sequence moved out of line. This enables us to have a single
> nop at kernel function entry virtually eliminating effect of the
> function tracer when it is not enabled. The function profile sequence is
> moved out of line and is allocated at two separate places depending on a
> new config option.
> 
> [...]

Applied to powerpc/next.

[01/17] powerpc/trace: Account for -fpatchable-function-entry support by toolchain
        https://git.kernel.org/powerpc/c/0b9846529e29ba988ce88b98df633de79675fcb3
[02/17] powerpc/kprobes: Use ftrace to determine if a probe is at function entry
        https://git.kernel.org/powerpc/c/be87d713eaddf0421ccd61cc060c4c29bc36fc9b
[03/17] powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc v5.x
        https://git.kernel.org/powerpc/c/161d62c2b067c4071cb515efe16475171e1c051e
[04/17] powerpc32/ftrace: Unify 32-bit and 64-bit ftrace entry code
        https://git.kernel.org/powerpc/c/654b3fa61b817a46037197b73a7ac6d36d01df7e
[05/17] powerpc/module_64: Convert #ifdef to IS_ENABLED()
        https://git.kernel.org/powerpc/c/c12cfe9dee077763708e0a5cf3aca02a85b1e8ba
[06/17] powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
        https://git.kernel.org/powerpc/c/8b0dc1305ea0bbb015b560193cdd76fd4100f062
[07/17] powerpc/ftrace: Skip instruction patching if the instructions are the same
        https://git.kernel.org/powerpc/c/1d59bd2fc07f0b2e643b2a07405cf0717b93984f
[08/17] powerpc/ftrace: Move ftrace stub used for init text before _einittext
        https://git.kernel.org/powerpc/c/ed6144656bb1ea29ad83671b48a21c89e7873b8a
[09/17] powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into bpf_jit_emit_func_call_rel()
        https://git.kernel.org/powerpc/c/9670f6d2097c4f97e15c67920dfddc664d7ee91c
[10/17] powerpc/ftrace: Add a postlink script to validate function tracer
        https://git.kernel.org/powerpc/c/782f46cbce5328da9380f166bd31cd17a04a7b10
[11/17] kbuild: Add generic hook for architectures to use before the final vmlinux link
        https://git.kernel.org/powerpc/c/1198c9c689cfdaa2d08eb508c13ff116043f07b7
[12/17] powerpc64/ftrace: Move ftrace sequence out of line
        https://git.kernel.org/powerpc/c/eec37961a56aa4f3fe1c33ffd48eec7d1bb0c009
[13/17] powerpc64/ftrace: Support .text larger than 32MB with out-of-line stubs
        https://git.kernel.org/powerpc/c/cf9bc0efcce2c324314cf7f5138c08f85ef7b5eb
[14/17] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
        https://git.kernel.org/powerpc/c/e717754f0bb5c5347aac82232691340955735ce1
[15/17] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
        https://git.kernel.org/powerpc/c/a52f6043a2238d656ddd23ce0499cf4f12645faa
[16/17] samples/ftrace: Add support for ftrace direct samples on powerpc
        https://git.kernel.org/powerpc/c/71db948b9d2744e92124720f682ed2c26f0de75b
[17/17] powerpc64/bpf: Add support for bpf trampolines
        https://git.kernel.org/powerpc/c/d243b62b7bd3d5314382d3b54e4992226245e936

cheers

