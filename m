Return-Path: <linuxppc-dev+bounces-14635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4CCA64B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 08:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN2Nf5rdCz2xrk;
	Fri, 05 Dec 2025 18:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764918098;
	cv=none; b=aIuJkZwMe4GxVEPVfrXc08AeuEF9Eqycax+s1jFqKEaYnE9P7yhbHpQummhT+3ZAF1TYeHFk94GCWFy4npHYOJ01pUiRlScQrzZWil32D276N1vKb8KHzIwWkhp6fAGJhbWYyC2KnWakJ5saeRsNUd5fAr2mlVCgMsAmD4p+svnNr5ihfhL6Zod1EKzE3Df4O9IQa7w3eWUCGgk/DO7fjWEsl3Cqfr39tbQjAP+sVe5chC2ZoHGAYHXwph6RuG+7K6O5IK1iB2iaI7A+iKucUC+UZMAuJs/NmQB0SDvhyc3QKOqiRP3MOdNAo6ot9+ZQRPv3Ru89Dow8DeyEtEjrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764918098; c=relaxed/relaxed;
	bh=UPMD4sKHMKOjTUKItqivPia5Qzs6WBPRbvF5ORDkKa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foloe/mYEfxTXb5eas1H7UxPNH9vN5p/ZAgadpQ0O1AENtZws8qybJKQvAGSCPk1j6XtVMkNmS+nRUPLrW2tYdcOqHtvmJSM0r9HXAmdIAQB623HK+WEGUQ8CBW1rXQ6f18v1TkdEARhbOinSg9IalAj76Y1UR/3X5o/mzbKqRmHBAqBZx5mYxLd4LmCo5m3JZDBWe4EiSKm8ECGErW3FTHLLyJ9iXswZn9Hb1WzxsNwxC33gU6DoALoGB1gw11grmBi38AeQrpkAznRAzHkkTBV+4S5D5iZVG1nwnrkipCHimqQ+GSMTwB73vZKRdC+OZv8uhNyl8r7UyMayYKeRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GgPY+DoN; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GgPY+DoN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN2Nd5MMKz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 18:01:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8DEF41688;
	Fri,  5 Dec 2025 07:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915C5C4CEF1;
	Fri,  5 Dec 2025 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764918093;
	bh=fBB52+FpmiRjld7TBCQI6MHpA8C2/HNb3RkNEkzbihM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgPY+DoNZhiHH3jItOJ3AYgP5WTSiMtpLCZSWOmEK7RicGrrRqMeWPT8B4Vl1nQCx
	 JYntcXZRE3K6JabczWDsVjntVOkYV8FEdRNFsepd3p56NPUo7JqQMmI582XOmaBMpJ
	 87Y3iQUR+WG5fLuEHFeLat/QHKBLHKVuRS/ElFoCFupAhWni4rxoIHbZ93xDq5Y2yA
	 89Gm9E2xFp/Y5EnWo0Jv26IpBbCweuq/Cl/aZv2HztATkK5E5lCifF+oU9qvZO0/qo
	 JYHrYFMDtgc5Ytnto1g8r6P3+PtBC0ECvHdcFkCsnFMi0wRKVodMizWY0Y2vj09Je6
	 XKldPNeaY+qgQ==
Date: Fri, 5 Dec 2025 09:01:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, david@kernel.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, masahiroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
Message-ID: <aTKDRF2sMdM_5aRB@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 01:57:46PM -0800, Andrew Morton wrote:
> On Wed,  3 Dec 2025 19:33:56 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
> > This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
> > 
> > Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> > systems. git fetch-pack fails when cloning large repos and make hangs
> > or errors out of Makefile.build with Error: 139. These failures are
> > random with git clone failing after fetching 1% of the objects, and
> > make hangs while compiling random files.
> > 
> > The blow is is one of the git clone failures:
> > 
> > git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
> > Cloning into 'linux_6.19'...
> > remote: Enumerating objects: 11173575, done.
> > remote: Counting objects: 100% (785/785), done.
> > remote: Compressing objects: 100% (373/373), done.
> > remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
> > Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
> > Resolving deltas: 100% (9195212/9195212), done.
> > fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> > fatal: fetch-pack: invalid index-pack output
> 
> 39231e8d6ba7 simply shuffles ifdefs and Kconfig items, so I assume it
> exposed a pre-existing bug.
> 
> Reverting 39231e8d6ba7 will re-hide that bug.

Shuah confirmed that the bugs were on v6.18-rc6 and they were fixed in
6.18 [1].

I verified that reverting 39231e8d6ba7 from v6.18-rc6 does not solve
anything, but applying 5bebe8de19264 does [2].

So reverting 39231e8d6ba7 does not change anything and there is no bug it
hides. The bug was introduced by adfb6609c680 ("mm/huge_memory: initialise
the tags of the huge zero folio"), was fixed by 5bebe8de1926
("mm/huge_memory: Fix initialization of huge zero folio") ...

> And that isn't a bad thing.  If we re-hide the bug in 6.18.x and in
> mainline then that relieves the people who are hitting this and it
> takes the pressure off David, Mike and yourself to get the underlying
> bug fixed in a hurry.
> 
> So I think I'll queue this as a hotfix, plan to send it Linuswards in a
> couple of days.
> 
> Or Linus may choose to apply it directly or to do a local revert of
> 39231e8d6ba7.  But I don't see how a local revert will get communicated
> to the 6.18.x maintainers.
> 
> David, Linus, opinions please?
> 
> > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Let's have a cc:stable here, just to be sure.

... and we can skip all this hassle.

[1] https://lore.kernel.org/all/317deba2-e560-44ed-a9f7-3c6fdc446b6d@linuxfoundation.org
[2] https://lore.kernel.org/linux-mm/aTKAo7JgBX0X_pBl@kernel.org

-- 
Sincerely yours,
Mike.

