Return-Path: <linuxppc-dev+bounces-16004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF10D3B1D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 17:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvxBG6dfYz2yql;
	Tue, 20 Jan 2026 03:44:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768841062;
	cv=none; b=fQfEYSX9Uj5OhOqxkj5RA+cQFFptzoCe8V4b4Z4n302BKuBlADJD2NSubNILXuTjMtNlYKKfMBgb8Ik9IHQtF5smOCkKKLJdQJf84cW6GbIvtMPoYh64VyYJvdruvG+mzNy1/KAAInxOSxLmBuB2lxQaW0baoT0330ojI2TuInOmUvDwW01+AGtDausfPoCqbZeabA6Pdl3olE0pzs9xg62VS6GmKl+5P9T7w+to/sxRhsRgiDyDNy9TjgBMvXvXehef4EOu1Sdq744knJ/zLF/+LxpH4D0HV50F4gD8DPGyArefTTiKFrdbQ0bp9Y3x4xA9hHVSPzWHmlRGwjEOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768841062; c=relaxed/relaxed;
	bh=Uw6KihBC1TRdvi5ZGo68c20jmI6Js3ekwsf6FSSvJdY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=b/eKxjZuDWbVYbW1ibOZywCogoIc4sVOyOqEjcW/qO/suqCTunyl9DPZ3dtPEHbZTE96xrmUvSZW1Bvz7pi/JQTn4MF+HvtJYabzrV+fd5N+S0n9xq4/HsZqRHCOe3Zj3N6rT5+fIg+wPCx0RUVCXE/1exqTMfZn6rf+nUtIsNT//MCThq36YPWbtJwirL0Z9rtsi3TkE80+8la5j/0LMTLa7tvByeWm8ZNAQzQ2saRtG5ewLfCTzbmRKc7uh3DfW1WxknWZK6yCUrl13JSIAgEc6LB6orRUNQaPhfi6/1zcnrt1RBD0MoiYHy7fiUQTCxjAEYTWgwJZ/orJHzOBvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0tAOJQS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0tAOJQS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvxBG05PMz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 03:44:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22A0760054;
	Mon, 19 Jan 2026 16:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80FAC116C6;
	Mon, 19 Jan 2026 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841059;
	bh=16FGOoiet4+IrVT+FcqrHcvY6YUTC0QcugfuzrxpDdk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=q0tAOJQSpR4lAPo9D9a0ZLzj9fmk4VEFSuwyHRGgr6m2/2bnlj2msqm1OK35ZA72i
	 BsoEW2Hi1Kd0mpXDYPCuFTDERjp9sFatntALxM7RaexoblAcWHEgiVDgn5GR/Cfhs5
	 lJ+7nmPuUhjsYr7LMg0JLovICzoM9fTlHD0eazCWxNpHY+vxS6kc8rz0ZKG0d1VEWg
	 IIhlCXiVHIe0pBTCOoVEENtJxJ+QEakuwJKi7yA2fm+eSBFbxX2gEsdDI8+DoA1Vyk
	 WSTb5IyXokPQcIaRg69SRVfbN0PLcfWUE2soFEJxCYrdO9X8LHmJmpvUejzzI3uzi8
	 2/W6/Js/SDGRw==
Date: Mon, 19 Jan 2026 08:44:17 -0800
From: Kees Cook <kees@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/3=5D_Fix_bugs_and_perfo?=
 =?US-ASCII?Q?rmance_of_kstack_offset_randomisation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com> <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
Message-ID: <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On January 19, 2026 8:00:00 AM PST, Dave Hansen <dave=2Ehansen@intel=2Ecom=
> wrote:
>On 1/19/26 05:01, Ryan Roberts wrote:
>> x86 (AWS Sapphire Rapids):
>> +-----------------+--------------+-------------+---------------+
>> | Benchmark       | Result Class |   v6=2E18-rc5 | per-task-prng |
>> |                 |              | rndstack-on |               |
>> |                 |              |             |               |
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>> | syscall/getpid  | mean (ns)    |  (R) 13=2E32% |     (R) 4=2E60% |
>> |                 | p99 (ns)     |  (R) 13=2E38% |    (R) 18=2E08% |
>> |                 | p99=2E9 (ns)   |      16=2E26% |    (R) 19=2E38% |
>
>Like you noted, this is surprising=2E This would be a good thing to make
>sure it goes in very early after -rc1 and gets plenty of wide testing=2E

Right, we are pretty late in the dev cycle (rc6)=2E It would be prudent to=
 get this into -next after the coming rc1 (1 month from now)=2E

On the other hand, the changes are pretty "binary" in the sense that mista=
kes should be VERY visible right away=2E Would it be better to take this in=
to -next immediately instead?

>But I don't see any problems with the approach, and the move to common
>code looks like a big win as well:

Agreed; I think it's looking great=2E

--=20
Kees Cook

