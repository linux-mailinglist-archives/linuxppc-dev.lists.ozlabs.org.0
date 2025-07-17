Return-Path: <linuxppc-dev+bounces-10308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B49B0960A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 22:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjlbT69S6z30Vn;
	Fri, 18 Jul 2025 06:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752785813;
	cv=none; b=QQ+D5W8KDRrxrVmxLeqodsSwX1WJj5qAh4+StLVZvJsgSpk0m0i+pnxoDRF3/buZIdqGhFkHX9bKx68ZHq/pJWG/W+Pbf1luR2jndFjlZ6flqaJMcjVJTmLbgYiYV2hL+/RxRwkM1DGhFy18NQrCQNk9SaDloPhpQFvByUU5G0eS1SRFCTddoTBoo8UuXEh5wCBTNmvriBcvHpFbT5rRthVEoDE50tVmfWKX/HKrdq+8MvjFch+t9XNZhDBte9Vut30LskUxBzev0+J+qgHrEHq/1E2jQnBUna+7H3qXz4TUCSJ3X3Etnq1yPDIJkmSjbgu7aWcwqkdTYv7W/XB+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752785813; c=relaxed/relaxed;
	bh=qok/91CpfMpYj1F1RrwvnsPP6XEZsJNQymYAjgXzrq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FZ0XIXIZpsyh53/T5+1TTIyRgUrOilAVyPkx3vxY7KZc7fPajSQwaheGHMWzg0fU03G26dRKRZ61C0cp32o6hPkRJLqSzXnD5LHD2cFpcrK6TvFTZp9aozNFxmpffuaF2D92Pax+w0ZbIYLkmr77PiCfNGF0fNEm77zgYshcsJco+LI2AXHEugiZTuvKM4cRAXvYsy4PJjGrVZS1IYbdwYmjmbrO+L6Urw8pf89Bwws8R1ziOXy+Ds8yT+zdjuVEpHT0BC5bd467Hz9QuKXB/8KhBBKX0rJvb/idOr3k+O5prqED7Sx/OhTFPFbYjP33MwUBGoAEpLPGe3qYp044PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWA/cVgw; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rWA/cVgw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjlbT0WTdz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 06:56:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFE8A5C59D7;
	Thu, 17 Jul 2025 20:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48843C4CEE3;
	Thu, 17 Jul 2025 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752785809;
	bh=Ys203Svg62wgyIV0TPHIA8gLtygtPUojKJwCWhI3mMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rWA/cVgwaGrm6pq4B7i4gDgcU3D87a0eBpWBu6FZZv6GNu/oXL0sn2F7la8RX9keL
	 ZIaOeZynH3rSAnQr7/ivnd9PGS8+RxmcNv7IqrApDqvJqViLlUEF/a+vIRWMtN3L0v
	 VM/T8+IiOeS6/oba0yONX3gEq6E5ZJHPQQf5/3VXBcXoCm4SG56nnjD0x3ygYC9uU4
	 VqWtTn4aaJQ6x53maV01dTbDeTI94kdV875y9BOY6yvUEg6Ip8QOfCumfCnINkJwHI
	 aJweomH1oTn2dEaoxKbr+ft7C1RdnxvFMD3+5tgWKhHpIbXdFsiO7fir+0B6ws+nS1
	 C4NK478mZE6wA==
From: <puranjay@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Hari Bathini
 <hbathini@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, Mykola Lysenko
 <mykolal@fb.com>, Peilin Ye <yepeilin@google.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 lkmm@lists.linux.dev
Subject: Re: [PATCH RESEND bpf-next 1/1] powerpc64/bpf: Add jit support for
 load_acquire and store_release
In-Reply-To: <20250717202935.29018-2-puranjay@kernel.org>
References: <20250717202935.29018-1-puranjay@kernel.org>
 <20250717202935.29018-2-puranjay@kernel.org>
Date: Thu, 17 Jul 2025 20:56:45 +0000
Message-ID: <mb61pfreuy1rm.fsf@kernel.org>
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
Content-Type: text/plain
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Puranjay Mohan <puranjay@kernel.org> writes:

Somehow the cover letter for this patch was missed, adding it here:

To test the functionality of these special instructions, a tool called
blitmus[0] was used to convert the following baseline litmus test[1] to bpf
programs:

 C MP+poonceonces

 (*
  * Result: Sometimes
  *
  * Can the counter-intuitive message-passing outcome be prevented with
  * no ordering at all?
  *)

 {}

 P0(int *buf, int *flag)
 {
         WRITE_ONCE(*buf, 1);
         WRITE_ONCE(*flag, 1);
 }

 P1(int *buf, int *flag)
 {
         int r0;
         int r1;

         r0 = READ_ONCE(*flag);
         r1 = READ_ONCE(*buf);
 }

 exists (1:r0=1 /\ 1:r1=0) (* Bad outcome. *)

Running the generated bpf program shows that the bad outcome is possible on
powerpc:

 [fedora@linux-kernel blitmus]$ sudo ./mp_poonceonces
 Starting litmus test with configuration:
   Test: MP+poonceonces
   Iterations: 4100

 Test MP+poonceonces Allowed
 Histogram (4 states)
 21548375 :>1:r0=0; 1:r1=0;
 301187   :>1:r0=0; 1:r1=1;
 337147   *>1:r0=1; 1:r1=0;
 18813291 :>1:r0=1; 1:r1=1;
 Ok

 Witnesses
 Positive: 337147, Negative: 40662853
 Condition exists (1:r0=1 /\ 1:r1=0) is validated
 Observation MP+poonceonces Sometimes 337147 40662853
 Time MP+poonceonces 13.48

 Thu Jul 17 18:12:51 UTC

Now the second write and the first read is converted to store_release and
load_acquire and it gives us the following litmus test[2]

 C MP+pooncerelease+poacquireonce

 (*
  * Result: Never
  *
  * This litmus test demonstrates that smp_store_release() and
  * smp_load_acquire() provide sufficient ordering for the message-passing
  * pattern.
  *)

 {}

 P0(int *buf, int *flag)
 {
         WRITE_ONCE(*buf, 1);
         smp_store_release(flag, 1);
 }

 P1(int *buf, int *flag)
 {
         int r0;
         int r1;

         r0 = smp_load_acquire(flag);
         r1 = READ_ONCE(*buf);
 }

 exists (1:r0=1 /\ 1:r1=0) (* Bad outcome. *)


Running the generated bpf program shows that the bad outcome is *not* possible
on powerpc with the implementation in this patch:

 [fedora@linux-kernel blitmus]$ sudo ./mp_pooncerelease_poacquireonce
 Starting litmus test with configuration:
   Test: MP+pooncerelease+poacquireonce
   Iterations: 4100

 Test MP+pooncerelease+poacquireonce Allowed
 Histogram (3 states)
 21036021 :>1:r0=0; 1:r1=0;
 14488694 :>1:r0=0; 1:r1=1;
 5475285  :>1:r0=1; 1:r1=1;
 No

 Witnesses
 Positive: 0, Negative: 41000000
 Condition exists (1:r0=1 /\ 1:r1=0) is NOT validated
 Observation MP+pooncerelease+poacquireonce Never 0 41000000
 Time MP+pooncerelease+poacquireonce 13.74

 Thu Jul 17 18:13:40 UTC

[0] https://github.com/puranjaymohan/blitmus
[1] https://github.com/puranjaymohan/blitmus/blob/main/litmus_tests/MP%2Bpoonceonces.litmus
[2] https://github.com/puranjaymohan/blitmus/blob/main/litmus_tests/MP%2Bpooncerelease%2Bpoacquireonce.litmus

