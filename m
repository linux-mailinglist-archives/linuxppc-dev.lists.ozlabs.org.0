Return-Path: <linuxppc-dev+bounces-904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F97969418
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 08:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wybmg1Q1Fz2xr4;
	Tue,  3 Sep 2024 16:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725346099;
	cv=none; b=XplIuBhU1huaFTEaJJVGq4bUtHTnX7g5dbXTzdoErUSkhnfnttSVYH0OQIut4Q2Pn6LjjKH60KAw8crPAytXCWHO5HvV1M0z/u4Xcy54nDtM5aLzuDAibDxGxGUX3SIbr2HgEVLaMcrjpRAe6NgKJXz3R+eIX54Cko+ee+Ax5pBsZ3fDhiw2IzK+GpX+JBE+0C5maHAIZRrJRaF1Q4Wc6vVTHctJZ8iD1GjOqFvj5I65vWO/0K6/VXGnhWdx7R839LVEbQD/D3Ua/7nq3zLDfqbn42Cj7vwxKn0LtZ4iemzLGwd6cH6SkSwDrZZw3giBWq5xDYYi+wc0+d11fxCOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725346099; c=relaxed/relaxed;
	bh=M3epQsUKJhzbx4cflHZxn6z4gD7cw0fgFe7nIBjpPlU=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=mSlREBDy5RsNDG937FCSZFDN5vVaotC4UVXEe/YQC3M2eWQOxLygmr9nj6Yk5vPTOiYPtq0ubOkUCE0IC5nJvUgc1LSDnx5Ue0b9sTtGeMfF/UXa04CWqXc4voyi5kQohY9yph93ByZZ54Vevn5MowcNNdkXc+yy16gbZ7+d4BD2TJicIe1jdmTglC+fU95Esde7uW98+GqeasHUABOhvsY7m0FEViNOkk8R3sYhI8tzm02WLMpmcQdMCjE0xS85z9GjpdpUqEqYLUV7l4a7jvMhyObm5QW8Gk4+q7OKifOsH6D4/83xfDXOvLA6ORUM5nmqOXFK2QXQr9HrWjAU1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=abSKDFpD; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=abSKDFpD;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wybmd6xpTz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 16:48:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725346091;
	bh=M3epQsUKJhzbx4cflHZxn6z4gD7cw0fgFe7nIBjpPlU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=abSKDFpD91bF6JK7v3JWap7RqTbP1xIyPnqTojelNm86rzr7LfsH+onAz9HFy4aFF
	 3aYhWkxUmHPDaYksi4L/FJqnCUEfKZYcTJf/Cz47dpigzLOUoiBvxLekE2iELXn60B
	 BYRZJZ2EUMR3MRmN73WJZFPEUrjzfLtSHJa55tS4ik3eWOou7Gs2prbeZhPHNGQZWU
	 ZGxf9swVExNqkogGyTZX9eeUVNtU2FXzSZmnAdQ6yRiOUOqEZUV1T5sbVp5arfYTbY
	 GfJpc4U81Q5Ls6BrsrSgWbOG0ih889sG0OziCv1MyPfwp8Sp7ITALf42QwDEugVYch
	 tvm4slcVDP6Rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WybmW2CH4z4wc4;
	Tue,  3 Sep 2024 16:48:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Abhishek Dubey <adubey@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mhiramat@kernel.org 
Cc: naveen@kernel.org, hbathini@linux.ibm.com, npiggin@gmail.com,
 bpf@vger.kernel.org, Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook
 on powerpc
In-Reply-To: <20240830113131.7597-1-adubey@linux.ibm.com>
References: <20240830113131.7597-1-adubey@linux.ibm.com>
Date: Tue, 03 Sep 2024 16:48:10 +1000
Message-ID: <871q216xn9.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Abhishek Dubey <adubey@linux.ibm.com> writes:
> This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> Replace kretprobe with rethook on x86") to powerpc.
>
> Rethook follows the existing kretprobe implementation, but separates
> it from kprobes so that it can be used by fprobe (ftrace-based
> function entry/exit probes). As such, this patch also enables fprobe
> to work on powerpc. The only other change compared to the existing
> kretprobe implementation is doing the return address fixup in
> arch_rethook_fixup_return().
>
> Reference to other archs:
> commit b57c2f124098 ("riscv: add riscv rethook implementation")
> commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")
>
> Note:
> =====
>
> In future, rethook will be only for kretprobe, and kretprobe
> will be replaced by fprobe.
>
> https://lore.kernel.org/all/172000134410.63468.13742222887213469474.stgit@devnote2/
>
> We will	adapt the above	implementation for powerpc once its upstream.
> Until then, we can have	this implementation of rethook to serve
> current	kretprobe usecases.
>
> Reviewed-by: Naveen Rao <naveen@kernel.org>
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---

Was Masami's objection to v3 resolved?

cheers

