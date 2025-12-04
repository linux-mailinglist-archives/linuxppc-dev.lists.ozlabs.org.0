Return-Path: <linuxppc-dev+bounces-14627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F8CA5770
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 22:27:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMndw3sz5z2xHP;
	Fri, 05 Dec 2025 08:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764883636;
	cv=none; b=Os8GTjO/kiOFRBUIP7i52s7m719aOBymxP2pcathh1r4I/G1rqQ5gcqZCfW14sOBbhUXBoRYvx4aUAmuvQHenSswlX724n2JQ/S4EZ41sJ1gA+K5o0azoWhGYozWUWn97l9TMNlTbo+EtM1KrDggEHsOORv27AQoxOYFmDb+pL1gtOvTruWvUR2r0We/BGcBuk08i+lC7TBu+DtGNfgFBM14rwPt92Nm3TqyCQ+yU/zaq74qCSzl8TPAGvSHLu+TuPHV7a6q91UuvNsZnHFeO9fbtRv+QAmHuHjw1XdWlHPPOAKFquqaUHLA6P+LibBt3xeOuD5ganlPOEjHMOLyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764883636; c=relaxed/relaxed;
	bh=09mxmHg2Z/Wa1Y7NAyngo1yrqctVpyeDUcumoglVSpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwMekTsRIELPQI+6h7jFqe79ihOoCBX57+MVFy5/hCVfhpCYPRsyXd8IS+r/EMQB2T7Qf35YPpkIvNDCbA85sRrNqaAfsQPCwO3LkCNP76Y4QyTkzs/5i1iAZYswypXSV/ce8K/dAeuYxOwmLmjryLH4D8uusSXiFr3AbM2+HK9+DbslXJTjkYx46HGxXGRUVBR3HVcWmtT1jlM8JcVnUuvAT3kgQ987+gozzzZGZVSVCu/QQd0gTJdV85Xvy3Gmqm1I+sjl/rYefuLeo1/FzEtygj7SrFHdXrYijD1ARhy075Wpwgmfw1/Fde2K/0QrCr4xSqH0I6+/AZ43QGbzVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SwZMdJYi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SwZMdJYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMndv3MpFz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 08:27:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9D6660204;
	Thu,  4 Dec 2025 21:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18577C4CEFB;
	Thu,  4 Dec 2025 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764883632;
	bh=+/9nEHZ6AaSyxVANsChIx0fzl5kuKPosTq+Q94nXS5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwZMdJYi3acOG/EsgN2/8AAaszdXWocRoZuqwRdsYLDUgBWGzYM3cP1VoOaV4gkIt
	 22FZ9t/PaZiAkr3gGJTCaJE/8eBSb4hL5Xh663kXBWjQQgMfLvYKDy2f6BuwzUq9nf
	 Vf/aS0zVEeRkFKaM1y46tT37+45wn3wdKXw843pHDvXybr5OC/ESU+20gGjhHelW5p
	 HiuegQ60VJXdWExXgBK+/Z0f3RmHMe2jTMnxJ2SlsUmS/6XxNCM4DppLuLt4RTratl
	 2Fv3iRhSqCR2aPs4RXQQA5/o9xrHZvlRWDmIkq0XEKj8PvGVUvA6t7y2TH7UZMMgUW
	 o03GHxRje/JPA==
Date: Thu, 4 Dec 2025 23:27:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: akpm@linux-foundation.org, david@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, masahiroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
Message-ID: <aTH8qCZinkL-4SDa@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
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
In-Reply-To: <20251204023358.54107-1-skhan@linuxfoundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shuah,

On Wed, Dec 03, 2025 at 07:33:56PM -0700, Shuah Khan wrote:
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

Do you have the kernel log for the failing system? 

-- 
Sincerely yours,
Mike.

