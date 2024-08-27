Return-Path: <linuxppc-dev+bounces-574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CA9602B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJgt4FBnz2xHP;
	Tue, 27 Aug 2024 17:14:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742858;
	cv=none; b=DE4b2pXwgq5qUAvD9sfS88/CK0Rm+xJJK3Y/TRtSgfz7jzzju9I9j3e2DAX+umhyR0LtVDXrMlfw3E52/SzJ9vDVZHLkUGdhKLXsu1TGs5jRK54eDLAN/Uoz7mknb0bsTBiPduYHsrBrFmsccs3xbkj3/8oM9xBWrTBSJ8oSPn5EZStu2lZybeeMMqtM4ywpei9Yay9NMvVaE8qQzxaVUqR/3DhpdKxqX2Lyvp17noHkn1XTe7636FThXz/XKePAXVBxcHKAaIxMQY6KK2qkbpZMQ+LWYH79mWZ48JZJVjNuqZjMgw9yfKvtzsju+w/b3xmOQuzysaCn1fpw7EI9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742858; c=relaxed/relaxed;
	bh=sn4KBq9Rs8ys6uGPYdWo3c96P/CNyog6cJaKhR1Vg18=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=gQ1flyQctOkjtAt0AdyMPGFvi5yHD8O5LnvZiaK6FX7aUCUEUDEGhbSAfF6tlmY+wt79JsHilq9x5Qw3uRoCcQ8L4Doq+I1+cG1HlwjBXFH4g+7uGxRDSViB7JC8SeQLm5FWZR2rnsNMVWPVyS9dab2CERElLC5SfY8v5LlevofgdQ34nWAEcco1D4MWYISbfzwNGqOZOEL+8xtjYkrxQONg6/ky1zX6Noxd2wqkQXQfmQ8i0lVoOFdKvVg/ri8XDl61ZbJLwYFvJohDcrqHVWZvIcVJOx2vG5Olu3XDOSIBAjtJmgeKVlko4W9uFiI6M3Jb9Lb1XFVvmRUhDXJIeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HStgJ7+s; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HStgJ7+s;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJgr42hDz2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:14:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742856;
	bh=sn4KBq9Rs8ys6uGPYdWo3c96P/CNyog6cJaKhR1Vg18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HStgJ7+sYmBdYWuToiD/6tJBEsx6Z8LKJvErI82Pj0IPqZtDAC1OO+1ePHpk9DoJX
	 piIhqgB1oIZ9LgziPRA30+lFP3CtMuiz+ChXYecszaH0kXAgjHhohh0yAx/vzrd4zG
	 HpQHDmQU5wjUjJKEsmYYhCYRKqi46FR0vQyxv+gtHaqkK72vQRoyJ0S4zk/dC7o8Ed
	 jHaanRUZQmnYHLZZvqCK+oIDjdTQF7PAE2zrCkq3GCo1sKjXECC+pO06tE2hs1iEl6
	 AoehBv+2P4ttjJoBejyQDbFeoAiw0ScgXSFgWNHUNsiJ560rbFxbWn6nY+EWvgmxcb
	 YwBvJL4O5Dj8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJgr0RG7z4x2g;
	Tue, 27 Aug 2024 17:14:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20240515024445.236364-1-bgray@linux.ibm.com>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v4 0/5] Add generic data patching functions
Message-Id: <172474280311.31690.1489687786264785049.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:13:23 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 15 May 2024 12:44:40 +1000, Benjamin Gray wrote:
> Currently patch_instruction() bases the write length on the value being
> written. If the value looks like a prefixed instruction it writes 8 bytes,
> otherwise it writes 4 bytes. This makes it potentially buggy to use for
> writing arbitrary data, as if you want to write 4 bytes but it decides to
> write 8 bytes it may clobber the following memory or be unaligned and
> trigger an oops if it tries to cross a page boundary.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/code-patching: Add generic memory patching
      https://git.kernel.org/powerpc/c/e6b8940e7e80cdfe98ba8493214922998920dd9c
[2/5] powerpc/code-patching: Add data patch alignment check
      https://git.kernel.org/powerpc/c/dbf828aab466c6534711d1f1454c409ea68d18d0
[3/5] powerpc/64: Convert patch_instruction() to patch_u32()
      https://git.kernel.org/powerpc/c/90d4fed5b273155c378b1d37595f2209f0a92bed
[4/5] powerpc/32: Convert patch_instruction() to patch_uint()
      https://git.kernel.org/powerpc/c/5799cd765fea93e643d81dbdae76a9c34e06dd18
[5/5] powerpc/code-patching: Add boot selftest for data patching
      https://git.kernel.org/powerpc/c/b7d47339d00d89af559a7068f4a640fc828177ad

cheers

