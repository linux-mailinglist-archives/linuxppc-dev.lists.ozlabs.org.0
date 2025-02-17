Return-Path: <linuxppc-dev+bounces-6284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3DA38E0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 22:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxbVl02Wkz2yVT;
	Tue, 18 Feb 2025 08:33:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739827998;
	cv=none; b=HvfWknRTHL6QvGftnRY3yToHl6cVTXc7AztzlRsQa4dy+mpR0pGNRtdlCaG2JtT8W69kpg2Li/Fzn9xA8zXW19yMz7vHghRNjbsRPYbhLjFasROrYuJGoV6j3lIgRSKyJRzuF4ZPDV4nvzOgdvgw2vTYiBUlNUIkSTMScB6R5e9QC13z3QwykKW+I+N3kZrsKhCjYgUsnfArv7hUHoI6c23ZSfIw7++EbtUB/ahNIMtG/fmTEE4KY3q2kIzxrB/IvD56Y8f0LppoS9Q3Y6YdI69rFRpfSdGKl8vQtGRytKv99uah7VUQ+QhIbtK2Cq3U19m2IpOcWKl4CzgClxLerw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739827998; c=relaxed/relaxed;
	bh=id9LtZ/MnrzOfQ9ORPAl5IHzvJ8DzCDlRCApAuionLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3QD7S6moVg63+o2C+gr63HtdLZqSGktpsdk5YpxgrO022Gsx+U6/+njz0O/PwR7p4VoOX3sSuUbB0NbSIntsafYf1ZI0J00HITSqw66kD9VEBJvtlGv02GwirvsVz+qfsEaZ19G5CrHhukfp2U3Ypw+PKKEQwdg6w8fFjnXcY6AbrPphTu59LGXoyDMh5LBQ4+LFcot8n/Wjwq2Ilwu7ezzynxwJyiiq81hnzMNiiF9cyeajC6wjGhkJjroZXwLwfG0MO990wFwRHPFoNIE6H0KrmgUrK5Zit9OlsfkcB6BNYws1ShNYbBuzlnuZK/5bLSp2wz/3gm+eMQdD4nNkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxbVj4Z9fz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 08:33:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA0CBA40790;
	Mon, 17 Feb 2025 21:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723ACC4CED1;
	Mon, 17 Feb 2025 21:33:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arch@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon, 17 Feb 2025 21:33:10 +0000
Message-Id: <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
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
X-Spam-Status: No, score=-2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 17:06:16 +0000, Yury Khrustalev wrote:
> Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> 
> For context, this change will also allow for more consistent update of the
> Glibc manual which in turn will help with introducing memory protection
> keys on AArch64 targets.
> 
> Applies to 5bc55a333a2f (tag: v6.13-rc7).
> 
> [...]

Applied to arm64 (for-next/pkey_unrestricted), thanks!

[1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/6d61527d931b
[2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/3809cefe93f6
[3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
      https://git.kernel.org/arm64/c/00894c3fc917

-- 
Catalin


