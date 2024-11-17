Return-Path: <linuxppc-dev+bounces-3361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B299D0384
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhp07qSz2yF7;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846313;
	cv=none; b=Mx3IJRXPfVA2zO9TsZOTSnPYPJVKmnC3b+7E3rbsexuVH4OsaBBrEZ17WCQRY6I5TelKexbp6Dxe3PA85IOnLqSzR6A6S2ep1NLAreQF5hVnGTLTe5tvfMm0d5ADmKFRTL+ZRygJLmSZ1J2Iqw7Z4jUYLEJ1Rr1rc0dutIbsm/VqW2h2yosdegdhdvcqf5UkFX0fMrtR2kXMSWjpxzA4FWHfGXF91cGO5szF1fl4A4JDG3VPGW1U7ct3FsQXalAAaDILQiP3C6H3c/bY/u71pNWpA/eLuIWSEnj/4HEWEanASLclpolL0r/NXaHgjJ60OZJJ7XQF9bj6QFKc65PNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846313; c=relaxed/relaxed;
	bh=qF2IDG5jDaK6lbCWpF3L9oneS42KDrLsFyhw6rcafTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fjWJnopF+4TLE+YmiAMvzFaPyS3TEThSXh+8ZrXyBS82wk/MnTkO/A51asjpfRXbevEXgkyBKY96OhyioQiHaU73OfpSNWXGiUFOj7dOoyTDNNffm6OKJJIqrYBUh7K2BHZuJ1IALZPX0Nr9BzpG7UtRZX77GBc+HiMgcovucUnKIA94lENeYKVQcbAC2JyuzjOvJBO4aroy5gLuE2yx7TIgBg6Qf/5r5nVDppOJyvns2PO4cruv9m2oWEMPc2bcisdqj+7kWE6mWViKFpTYqGWQkVDF/+LYl+x9znksj9H5yjSHY/NMekQ1tVXJOVI7JaJAQUEsTevrOqrRXXUTKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KA9OlNcH; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KA9OlNcH;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhm72Jmz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846309;
	bh=qF2IDG5jDaK6lbCWpF3L9oneS42KDrLsFyhw6rcafTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KA9OlNcHEDgUXSda7Y3LLmEkqpD0Bnm8E+qF4zoGGTaaVrKn/ACi3HGGDqAHDxJr0
	 eo5kpgLKLV76wvSM4WF0O1PwOVqyUQz4trx598ovCRKNnpXK8njPxrEOwMGVEMX3q+
	 Rojd2afOi5B1UgdkkiXtH2Vv2gJZqhg28rD0QL3af2bxneQz0ANLKq2FaInGHPG13v
	 zrKy+1JJ2Bn+UUEzXt8lJ92tZB5QX7JiEEJ7ISXViN5uYrXgOMn9Y1yYCkCD+VDTcg
	 6ZfHrh0WWlgVjncHQ8r3L9K8mnVbwx0pEVYXR7W1+4/hMmRljdnCi9+8RhRdCnAOTm
	 MQlPuTypNSblg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhj658dz4xdg;
	Sun, 17 Nov 2024 23:25:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
In-Reply-To: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
References: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Add __must_check to set_memory_...()
Message-Id: <173184539745.890800.1324374267982130078.b4-ty@ellerman.id.au>
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

On Sat, 07 Sep 2024 17:40:41 +0200, Christophe Leroy wrote:
> After the following powerpc commits, all calls to set_memory_...()
> functions check returned value.
> - Commit 8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and
> mark_initmem_nx()")
> - Commit f7f18e30b468 ("powerpc/kprobes: Handle error returned by
> set_memory_rox()")
> - Commit 009cf11d4aab ("powerpc: Don't ignore errors from
> set_memory_{n}p() in __kernel_map_pages()")
> - Commit 9cbacb834b4a ("powerpc: Don't ignore errors from
> set_memory_{n}p() in __kernel_map_pages()")
> - Commit 78cb0945f714 ("powerpc: Handle error in mark_rodata_ro() and
> mark_initmem_nx()")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Add __must_check to set_memory_...()
      https://git.kernel.org/powerpc/c/2abbd6d5fbe0eae3752b44c963248e19292e5104

cheers

