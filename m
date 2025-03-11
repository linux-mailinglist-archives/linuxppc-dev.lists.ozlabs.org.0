Return-Path: <linuxppc-dev+bounces-6905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF6A5CBE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 18:18:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC0ny4zJGz3bs0;
	Wed, 12 Mar 2025 04:17:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741713478;
	cv=none; b=Jldm/wbtp+AJXo9+TpT0h1TqFTVqx4yoBMw2rZrpEXD4sdwsoZHlbm9lld6+zFevNTNmlwccXhRdGQPDXCg7u5AfHIWGaxj+OlvtGKZJMujbAeT4Uy7R3NrLwVDBBTy0YR3/BBXBc3Y37s5ZVD+9thfEM7w5xC57aRCm8q2UI1Hfcy46LLQjH+VI67wJDl5rUCqeWJlic+C7wkUlXP36c+mRiXpJT7uOML8ts7c9U+zUG8qkob9mAiF0eAL/8hKR9bJoHLp31yL8akPznaofF+4kb5cCT5D8fcwycuCvN3mBLkR3HV5/jNhjfMNSGZvOthli6Be/pSniE5tfybYgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741713478; c=relaxed/relaxed;
	bh=hepm8BAoxo/Ngcm/vlAF6o0xVWUqWkwjKGAY/RnUeYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OoWKpjL3aP6ptuqCCXgwfqAS+1dXG0xhEsrytSNU08fOipt4E04IttWfJDW9eIFkJ0IkyMSATAmsqtanyvA7k1AVHmX3+Snm9aa8y/JFrgszCeXLqDuJBIMNplntNHiA8IuAq2SQVXfWN8goweFR2pGBkqckNWJ5qgMHG6PApr6Mak/dEiyFmhRIrEjCOCsl92DIJdELiew8c2J0ebquEXZveMs00e9i6L7F+9gbEqrTH14DbwcyYWC8GorChAWj/mQtUXARTjbLg/lvUvSkZtPB7L3KWCeOpzCXjgxXqw1O+GprtFjHCAQ6lgH9Abkd/OtVyPrQLIf56JWrL+w7JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC0nx2hPHz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 04:17:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6975E5C6360;
	Tue, 11 Mar 2025 17:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BB2C4CEEA;
	Tue, 11 Mar 2025 17:17:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: shuah@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	yury.khrustalev@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
Date: Tue, 11 Mar 2025 17:17:50 +0000
Message-Id: <174171346335.3659993.17442583301270023148.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311084129.39308-1-maddy@linux.ibm.com>
References: <20250311084129.39308-1-maddy@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 11 Mar 2025 14:11:29 +0530, Madhavan Srinivasan wrote:
> Build break was reported in the powerpc mailing list for next-20250218 with below errors
> 
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>   CC       pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm64 (for-next/pkey_unrestricted), thanks!

[1/1] selftest/powerpc/mm/pkey: fix build-break introduced by commit 00894c3fc917
      https://git.kernel.org/arm64/c/73276cee1a25

-- 
Catalin


