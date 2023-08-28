Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613978A5A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 08:19:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JTyQZFDq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ0km14R9z3cV4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 16:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JTyQZFDq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ0hX21CPz3c51
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 16:17:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693203432;
	bh=RLh/iKkhkkusFbJvY334+vB2M1uIDZ/5pE7VOu44/vs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JTyQZFDqNMeMVmO4EfPbcnBAZ1DuSvbuwFjAnB8hSINbPAT7GN+TCyGskVksx4HqU
	 qlglGjm7W6QpmD7R7ZY055gnq3+8SzUN1VvjbGgrCt8xLS9ywu8I2IEGj4hyM/rFrs
	 EKBPeTE+KGWADe4s4DSkURpDjiH+ruEWVi6fPTUSRb86CcALzqCZc2iaDeQZOJC0xR
	 ai+fS4iHyIw2BWPMTGlKuLeyZyb6kxF0Csk351GZU+Rfl0awmhXkm90BAZ4gsOMSiU
	 7QdNfRvx++uGuFtP9TmDplcr+JF1HigKcAAfv4Kangxy0rMI5AHg4zzZ1CgZ5knBpH
	 m//LD/elqaqXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RZ0hQ2vSYz4wxQ;
	Mon, 28 Aug 2023 16:17:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
In-Reply-To: <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
Date: Mon, 28 Aug 2023 16:17:07 +1000
Message-ID: <87ttsjlmho.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromium.org>=
 wrote:
>>
>> Hi,
>>
>> This is my series to show *.config targets in the "help" target so these
>> various topics can be more easily discoverd.
>>
>> v2:
>>  - split .fragment from .config to hide "internal" fragments
>
> Please do not do this churn.

That was my idea :}

> Like Randy, I did not get "why" part quiet well,
> but if you are eager about this,
> you can show help message only when the following
> ("# Help:" prefix for example) is found in the first line.
>
> # Help: blah blah
> # other comment

I did think of that, but wasn't sure how to do it in make.

cheers
