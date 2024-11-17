Return-Path: <linuxppc-dev+bounces-3357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B779D0367
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqDk6dKzz2y8k;
	Sun, 17 Nov 2024 23:04:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731845062;
	cv=none; b=IDCCB09RVbUTe1mAZ+7NkVx6o5JwhirfbVDjJci45PAjYKgZ7TBfr5kwUjgdNMW5EAxYegTthcyQ7dU2+5ojgyGTRLGL2tzdBU7CLbt6v4xLhWXqtARSoPlJufkpV1fAbq42rCNhlOqeuIpPrrUyheG4xN4mPrr2Iwpab4xGwyU9dGEJMVG5ucTwkgcTKIZgnK7BIFTR28Jq7RJvwTT9f7PqPWM73KKNVzyXf71/acXAaLKhYN8zGc0NCC4/YkepoYvD6vVDHyrd/1ISWsNoejOibSRy84FjorwgYPwigSghijqMf/dyL7wfnNVlLMao/YZ9/yIGSZWfXAD9SjPVig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731845062; c=relaxed/relaxed;
	bh=tllPr++YWNmN/ICehcrJsGBTpJU5ev+6G1o94E8aVEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hd7HWMhlll25CHuoaHhczA4cYKEmYrfsU4/kr8nD8rUi8+7Dj9rEDcocpLO2lAmrJ0935pxi6bFF+dOjqvlV/kDLDGeP+TvlZDhg4QussVpnIp7/KyYRRIwvpsdJ9cWtU+N97l2VzdSZXT0DUBfGCbtKPCu1b7NiLYsKfvO/AIzz3O8ExGUf0UOKj2IaSOlJihYqMmcNofngv8W7dqZoNasfT8FEbWpCy1ZjIKUzQm4AOwAwlel/ogfGtcrsdK3/0WyVWw/GOZuLYC26KAFYrrGBaaLPgwRtuiVe4sWvM8A2b4/FG/cFn8pggX0WIFLDOls4AG9Gkj7z/DXr64Bkmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bHCwnzmC; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bHCwnzmC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqDk3vjhz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:04:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731845059;
	bh=tllPr++YWNmN/ICehcrJsGBTpJU5ev+6G1o94E8aVEA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bHCwnzmC4Wn699TTaIvMmA7oqAQUCB0vBZAcYQFnrPziGiTbunbYU+CXdS38yDvH6
	 YU112WNOjKnnI7JSMJzmw/a0svprG00zS9a6LPP4NJJT/jjzlFbVdAm/RM/h/U+tns
	 TsykHb5IN7FOSJM573KL+qqNfifuTL8r1hG6UNvh5joUZD+KBNkc1Fn7IYJrs5Ptwk
	 QPaqtA4agDbcLESUFhw4fys+mFWvc6kPxuKH/D9lsAIxlZt3ypiZTruEU9Mv61lufm
	 a1hIO9QaUkphJcq/soI8cLFSVRrGlaI+MEFOmOa7tMCM3TlCNsxG9p8p3+SqPMR261
	 Neh+mkXQjvunQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqDc2cRjz4xdS;
	Sun, 17 Nov 2024 23:04:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-nfs@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, vbabka@suse.cz, paulmck@kernel.org, Tom Talpey <tom@talpey.com>, Dai Ngo <Dai.Ngo@oracle.com>, Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>, linux-can@vger.kernel.org, bridge@lists.linux.dev, b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com, netdev@vger.kernel.org, ecryptfs@vger.kernel.org, linux-block@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/17] replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Message-Id: <173184457524.887714.2708612402334434298.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 22:56:15 +1100
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

On Sun, 13 Oct 2024 22:16:47 +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[13/17] KVM: PPC: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
        https://git.kernel.org/powerpc/c/1db6a4e8a3fc8ccaa4690272935e02831dc6d40d

cheers

