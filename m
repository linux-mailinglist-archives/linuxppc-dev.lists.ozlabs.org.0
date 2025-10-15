Return-Path: <linuxppc-dev+bounces-12929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D99BDFD6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 19:26:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmyfy5HZvz3dTN;
	Thu, 16 Oct 2025 04:26:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760549178;
	cv=none; b=cuJsho8q4TAEUX1xGZB2haPIgXiRX/zq9giN8XB8VPnHLu7nq09Gw95oCfHjFJm5mgM2zyni84rdwFpLRby93F3LXGh35U6xjBaKjQeCdthpHbNMQ/utFF6Sucr8U+r8Uhf2nfRd7GuLNA/H/448UrFhSYcY9H9FHhOEbaBO51pndJimd8baRu8R8tPqTv0N8jtHGGE3CNuaJDUJoz+p5pUglAWy0EABR4VhaJs1x2pFOMAEOTchXQ/LhVN6Kz2HXsnmVopr4E+es+OvucrNkXJ4RejtnK9+PEQX9rCl08giXUbhRglE5+ZTVIkVxeWbBpGoKumBEfIneGWW6E2sow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760549178; c=relaxed/relaxed;
	bh=yQZpbRRSeXhqck6KWzejU4ySPcJxpAvSTRDOqN4La38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXNRC7JEC4HI1SsKalF0VhaTey7lCqammHmjfe21zorhnRwPdoT1uxi9B5dSZZUHAATI/oCBOKJymhrqlYajBBQbLyTWRs6XhAD7a3QHN2XP3uOOeMYOJ6DRtGpPCcVxcsu7Snni49P7BUvH2vCUTkyoiFJFsgYMRfSQEW8yZWxdIIBYrW9UVZEOwH1/XjKQtoZ07WG+XstDsSrbB2eV1tvl88gR1/O4jFMhSIcLNsdW53OwAug0cJhwYAgfH5MwVW7e8lJS2lslFEuAbhPBatSEja0Q8/LTRMZyW4xs/E9UkHq4+kH/qy6qz2I6tHBrxJpGLnJHPPPeB/Ut3g5V7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hA5+vBqM; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hA5+vBqM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmyft10SRz3dSr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 04:26:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 264F2602CB;
	Wed, 15 Oct 2025 17:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B3FC4CEF8;
	Wed, 15 Oct 2025 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760549170;
	bh=EBPP//KAlBskb9pMhxaBL7Kga+U6vtFga53T2SeQa9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hA5+vBqM9+KAbQ2ZLh7xQyiaPk15CQAjVlTcxPL7on3gUbUnV5A9Zz4mGOXglD3qf
	 kC54OsUK04mRPIzbcfAB2XY0uYmS1yrt3fKFMOn3J3rRnP9gKLoVN7ahh0rKEOZlLz
	 Mg+hR1OoHGMmWrFZfURy66L9UrkbTAoX/JjzMFPGSSpyhoeLM2GjmMFJnNfsjgnqkp
	 YlKLClzCBN9+FfBQdc8eIsjh19j+C53f6pBwkHcZ+XMa9sA958ZqqaeJFvrD4ZRgDh
	 EPt+SUwO5Wif8Qh1Eoq7XKuEX2DfGOu0WsDI7vvhyH+1qVgK3NK+eOF3zbctTZQ9gQ
	 V0LVOVJeJklDQ==
From: SeongJae Park <sj@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v2 1/2] drivers/base/node: Fold register_node() into register_one_node()
Date: Wed, 15 Oct 2025 10:26:00 -0700
Message-ID: <20251015172601.69756-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
References: 
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 14 Oct 2025 21:09:16 +0530 Donet Tom <donettom@linux.ibm.com> wrote:

> The function register_node() is only called from register_one_node().
> This patch folds register_node() into its only caller and renames
> register_one_node() to register_node().
> 
> This reduces unnecessary indirection and simplifies the code structure.
> No functional changes are introduced.
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

