Return-Path: <linuxppc-dev+bounces-17772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNG4BE1aqWkL6AAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 11:26:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDDE20FA97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 11:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRQgC4Ntlz3c5j;
	Thu, 05 Mar 2026 21:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772706375;
	cv=none; b=ibl0wHoaVWfsGDgZy5YDntumaY17EwlwbiO5G0I1VXBNYAos/zXm1uG5SbNPBv31rKeTwf7isJqhbGYp40Dycp7BEdsPuWELaPOX3ljkllDekFo0Lk+zS2D8Xq/AsS3dz/VRxC04V+nR1Kf6E4r+uBA3jgHg1EmaDL4X/Ez5D1bEPsalKtLQY7wbJ9ohM7eKY1TbE0gRMKAz/I5uGFf3c0V2rkUhJDZRbBN3zeXcxzPW1iXE4pvKlBPL82JCR1WIfEIuhHlH3sFxLUlvIE7mqth8IdaNbIm/5eVdtJLk24msn1uyxN1me9fjOGs6Fcjk7hdhBQ79wuDxY3X0fIzv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772706375; c=relaxed/relaxed;
	bh=gcVApjQ1o1JVCGuBa6YFi63UPRhbqz227MwCDIrxk4E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=L4DbL43eB1Aph1UpBoxAcSRKQw4CSar4fVcqsC9mjs8Jbq/Fezjg3W/BKZLZamBLEvba8nemO2wf7kgpD1GJCfB5U0B+B3CrbKqR3GbzMLoi5IeQECU+CrWAbt/ZMwaF8vlKJTWKmzUckrGfjdFKjXbm8D4tWp3kawdfB7J3aawIANvp8TUjf9+QDZixEp4+K8OaX45EPOjI5VKAaTCiHXpAzhrlhTtsnvkVUqtK4aEhO0VXqZsR8iwtvcGcmPEyZViMdGn5J33ROxHuSFcVJXRKT3E5WYgrWAiBpijPjElk0BdwN2ZoSqeb+JsKwHmHbdca9FHwf2FiK2LKbzBgEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FJavDVBx; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FJavDVBx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRQgB3nQzz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 21:26:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06788419D5;
	Thu,  5 Mar 2026 10:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCBDC116C6;
	Thu,  5 Mar 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772706371;
	bh=yN3P+dfcabxAsputqX2/k7Zr9ICjFZ2rKGQwcJ77ONY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=FJavDVBxKwwmbEjYfckKeUlfCtzMeXpgCqvyUVluMmj92x2uHE5fETjD/KdfhaGmp
	 W69DhQVjX5f2Bggj687uC072S8pKdkl3r/K6fopCoZrrggIIHKq3IbBQJ0QzlZEM6i
	 d01z8oNDXHqv0upfXsyrDrSO7Awi8f8Mlk0kk130h9/4SGOrW8Y3c+7jlDXl+pVIZd
	 FxSD53/g5n9tZ/N+BaDWwwgNi/X/RhTMQ4Dh1YEyXCNDNiRLogolhRakJO+fZHVXNo
	 nZt8YOThjrFK9zPioKTSC0vKnSb34kxK+cW0/V7t8/lmbA2N1l+7otpwsfJAa1YMQK
	 X6BJSOlBpVPQA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
Date: Thu, 05 Mar 2026 11:25:55 +0100
Message-Id: <177270635550.104478.3620211579416140490@derry.ads.avm.de>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=yN3P+dfcabxAsputqX2/k7Zr9ICjFZ2rKGQwcJ77ONY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpqVo1djCIKUbWSXBEArtpABeIBK+n1YrI8VPfM
 6rRmf720ZWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaalaNQAKCRAHUgpwFiYS
 acK1D/92cHSfhwuIxsSSGbf7AoMStLJHAyJ9ekSE905rEEJRKebqeuxxJKFxr9E/3hV9eT4T1Mf
 Zy0/lwNJvAl0P+2Npsjg3RW/VvZGx3HkeTGOIFKFa7cu/sJAK7CDAG1uksbjMoYrxkL0EQbWWvx
 o5AnNIPZiGrG4LbGLZXw9+m2OZ8nvR0fwwDn/wCe1qlz3uv/Lt5jZZCSRzYvYdOqX98An9l0IxY
 ghkLt9IwT8q2W+6Gt1lCl16CbGnQQCv+gZ5zaJ4rRAcMxVMzd4hnsOCnHXQReJPpdJD632TdLDK
 C0Eq7DwWxusmyDJ7DJdBFs/GyOo5KFuhwPDHGyIJ73OMBlatww/k4TIz6yxvX8iQc4iozm5XGv4
 oIpH0FK9SPTd9aI2pdYFI2B9K88SC904VWodBYOGEqYlReL+u4hQGXbf04M5wP3M0vimqB+im2m
 fOzd8uqOhnQHW7ZQ6E2Uiq+5wwj/ONcO8OhJVYsGYKNxpjpYsf3S/c/ZHL3aopsAuZX6IQR0Rrm
 euDSGTLgYKvNl7pLI/Z+S3kMM+PVUoqeftWN9VrNHhXqAcmteIHQOHXE1R3YekPTKhjZ02E2dO/
 +2jvsUWph7hAsv7v5WBQPblz5x7EBO406DhrYA+ycdR0eWd0gDBYPr2QkniMoO4M6rdqvkgfCKl
 Px5LzhExqCJxAow==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2FDDE20FA97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17772-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:
 lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,xen0n.name,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 12:10:29 -0700, Nathan Chancellor <nathan@kernel.org> wrote:
> Clang recently added '-fms-anonymous-structs' [1] to specifically enable
> the Microsoft tagged anonymous structure / union extension, for which
> the kernel added '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions"). Switch to this more narrow option if it is
> available, which would have helped avoid the issue addressed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). GCC has talked about adding a similar flag [2] as
> well but potentially naming it differently.
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


