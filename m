Return-Path: <linuxppc-dev+bounces-9737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335EAE828B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 14:21:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS1Bv68sCz307q;
	Wed, 25 Jun 2025 22:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750854087;
	cv=none; b=Et1UZsm7FkxFYZc0ebKtSg8H6//iwIiNSiyVBEvutXmZz1x/wDSsfPNcsvCoxQ/Arpp+9XKotd9KZzIiBr69nxz8XlHU1TnBTSO1puJnIuFbnKgMdv3q67Qzw01168hpsl+D4nO4Tet4VgHlhot0cpEBcipfOboE9iNLFwUZ+OAidQxBbDXEChOhziFNslXLhMYzxkxb/heJKN6mUQ8/q9buGdq6vIikIXkRHhLMi0AnFhImDc0Ufai2wKmQ7AiOU+7Txn9NgrD4IdMEIv3umbqhPmpj7VnM0vOZZLrEdwLOlb6u6T7eyiykZqSLXYisFqZ0rVKDIFVvtsboMFAMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750854087; c=relaxed/relaxed;
	bh=j9lxAywOv5yt4LeQ6A3AxT624fpEB3GL4l9rgh6gKj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H04CCIpDzvZ5eYl4hsMY2lm3HlIR/8t5cLbARD/OsFJE7RZYcYIJuNGzGgUYb/radIJn1jRDof9rUlaw5g1gTWdwQYBE5xnr63F08Sq1yhXElrbbjRROKpgN+w0cvt2pQWBk7Otxb5FXjtAkUv4Hn9ymXjK83zUfnVPKcWK8mq3s6LzkKo2PIQuSjwtxvqSlqLHj8Twtqxq+a2Wpo2LfOq7DK2AKoIjsQYWjqSVTq/JYxp9cMIj923GhIKr+J5H9lQ2D9CSvQshboY9ad3jqn6BSyasyz1Xe+KOI2grvPB1b/jaRPouq2KBDB8WT4FXBhO9d58ZsKqyKqT6ADmvKNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=glta4lrE; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=glta4lrE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS1Bt2gCnz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:21:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=j9lxAywOv5yt4LeQ6A3AxT624fpEB3GL4l9rgh6gKj8=;
	t=1750854086; x=1752063686; b=glta4lrExfO7L4ju+9JaaGVY6tVfAfdoL8A5Unbfz1lYTli
	dniAwLWIoK2iNfu3zfzi5PGCecABE800eTjlh490RGOUXQ4MsTr/j5ljRJ0Q0cwfmRnkARxN+hOib
	e6JaKc01jjtPGajXuIbqhCzzb5TDcUXearOMojyqCsEkagDXUq5gZ9xtlva2WnVy1wW8FGuvC+nRF
	vlrhZMgVb+FsoW2iI2fq5qN9P1XsHgyjELpMsrwiJhljWYVvCD8cz0SSbTF4NbeRwODxZSSZalf9K
	u2CD16rbXK+KzbFxJbQVsoE+f+nYVrtBcOlg9moliKcQiJIAR/9khYGSTTtjGpXg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uUP7I-00000009xkX-2M7X;
	Wed, 25 Jun 2025 14:20:40 +0200
Message-ID: <dd87fa28e596126536d79281e87e2e0f52d9dfd4.camel@sipsolutions.net>
Subject: Re: [PATCH 6/9] kasan/um: call kasan_init_generic in kasan_init
From: Johannes Berg <johannes@sipsolutions.net>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com, 
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, 	npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, 	gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, 	svens@linux.ibm.com, richard@nod.at,
 anton.ivanov@cambridgegreys.com, 	dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, 	tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org, 
	tiwei.btw@antgroup.com, richard.weiyang@gmail.com, benjamin.berg@intel.com,
 	kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Date: Wed, 25 Jun 2025 14:20:38 +0200
In-Reply-To: <20250625095224.118679-7-snovitoll@gmail.com> (sfid-20250625_115328_891177_CC2D325A)
References: <20250625095224.118679-1-snovitoll@gmail.com>
	 <20250625095224.118679-7-snovitoll@gmail.com>
	 (sfid-20250625_115328_891177_CC2D325A)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-06-25 at 14:52 +0500, Sabyrzhan Tasbolatov wrote:
> Call kasan_init_generic() which enables the static flag
> to mark generic KASAN initialized, otherwise it's an inline stub.
>=20
> Delete the key `kasan_um_is_ready` in favor of the global static flag in
> linux/kasan-enabled.h which is enabled with kasan_init_generic().
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218315
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>

Looks fine, I guess. You can test/build it without qemu - on x86 - by
using 'make ARCH=3Dum' or so.

I'm assuming it'll go through some kasan tree since there are
dependencies:

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes

