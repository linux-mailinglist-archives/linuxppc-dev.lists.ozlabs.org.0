Return-Path: <linuxppc-dev+bounces-14628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C232CA5933
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 22:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMpKD6NMTz2xJ6;
	Fri, 05 Dec 2025 08:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764885472;
	cv=none; b=VF27Lh3EdcRhRNteIv4dPBOCcxbRMGhRK605PzGPnr3UiAozIwvuqwbIfSGTmOmbzV1pPUd0himmQ7PzwOjvgzdGmHNfHUNeI5QOY2GHEh59CxW9+9BjWTjMOoFXLoXXVXrjlv5j3YSJsWjdhbAokL08LgX4/urYTnQkUg5kL5P8bqv7u0hV7ByFUlvNmzacI5k0KVT5/UzPA+u2EQsck4xRjmGeHb/BB2DSW28tMatgq8N6AwaAOxGy+KXMwH4EEq/xJ3banG7g79id2rrSKKYERMvRzoZM1F7oFKKIl9imMQTLeLQ9Yz/TZPZRINLmS4GZRncHm261Jmu9DsEXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764885472; c=relaxed/relaxed;
	bh=u+UR/Bh5+3hB8Nh74pUKsNs06AZ2/n3PTN5NT1oU0pw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ad1Qpkx/xpsZYqPJBievN4tqOOSnOf1HGAszW8Fx5FGXMjMV3nyNMpIDkUVjNds0Sr2UqgBm8vTJ+QzSW4ywDbjoZQpO7EK1YBqVPv68RMiZEklCL42ii8PN7w4Yox5R2Lr/fuGixkXuMVDb6+WTeaRlwZ11/qMemNfzSKFzDJg7fgwcwFrcTEtK2tfLSBK0hrOVpROJcwZdIGMNFuHOi1dXwqduKVF99HPL7+Mefsj44rQQU9JHVhxcAGB4Yqicf1RV6IGiYeg1BctwsC8b5AlFg3a/nhmbAF1JPfNUOkZXdTorewIr6m22YgxOVO1sVmKQhvXVXBZiHR/z0dWxfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=k9q35YFw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=k9q35YFw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMpKC56Rhz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 08:57:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C38460202;
	Thu,  4 Dec 2025 21:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8EFC4CEFB;
	Thu,  4 Dec 2025 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764885468;
	bh=X9n/SI6IKvE+F0NdeSHaFU7vcgdgXOCeq4cTbmL1cFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k9q35YFw4ap/XLACqc1kqO+8+Ix4RJb9p5Wre06HB3UZOOw6lkzrZFHB/kRL5DRvS
	 9jYimUKT7EXuHJx89pikNeF1l9K/ZdtSDsNHRFZOgqkT47Wblto8ZYyM9jyIP5tyxf
	 rMM48sJsTXyDerFSED8Eaa2bIRcDIGTfhpX8ibAE=
Date: Thu, 4 Dec 2025 13:57:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: david@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, masahiroy@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Revert
 "mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb"
Message-Id: <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
In-Reply-To: <20251204023358.54107-1-skhan@linuxfoundation.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed,  3 Dec 2025 19:33:56 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:

> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
> 
> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> systems. git fetch-pack fails when cloning large repos and make hangs
> or errors out of Makefile.build with Error: 139. These failures are
> random with git clone failing after fetching 1% of the objects, and
> make hangs while compiling random files.
> 
> The blow is is one of the git clone failures:
> 
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
> Cloning into 'linux_6.19'...
> remote: Enumerating objects: 11173575, done.
> remote: Counting objects: 100% (785/785), done.
> remote: Compressing objects: 100% (373/373), done.
> remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
> Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
> Resolving deltas: 100% (9195212/9195212), done.
> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> fatal: fetch-pack: invalid index-pack output

39231e8d6ba7 simply shuffles ifdefs and Kconfig items, so I assume it
exposed a pre-existing bug.

Reverting 39231e8d6ba7 will re-hide that bug.

And that isn't a bad thing.  If we re-hide the bug in 6.18.x and in
mainline then that relieves the people who are hitting this and it
takes the pressure off David, Mike and yourself to get the underlying
bug fixed in a hurry.

So I think I'll queue this as a hotfix, plan to send it Linuswards in a
couple of days.

Or Linus may choose to apply it directly or to do a local revert of
39231e8d6ba7.  But I don't see how a local revert will get communicated
to the 6.18.x maintainers.

David, Linus, opinions please?

> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Let's have a cc:stable here, just to be sure.

