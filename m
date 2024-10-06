Return-Path: <linuxppc-dev+bounces-1778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A809921B1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2024 23:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMFqw267Zz2xdY;
	Mon,  7 Oct 2024 08:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728226766;
	cv=none; b=RZ6aaULcsziKxyZdL0vhPtereGQwZkZk/66bwgmhx/08idgiPGJ2k2fb7n3H0FUPNAuIbmQSMGGjFeRvzQBM7tHtG20llPG0ZK9f2AFHC1Nh8s7O4FzHQITqoTaXK5NelFIBQjsgKlPuA4wm3URhCocQS0X5fZsNcoUVITCRupLuk0Jiu1iRx100mKXjWQ/DeZEWL4Db5T6zCk584tYN1GiOAHLc8el776eAJgPbb8IC2fskPLdeDQW/98Q4gb7sF2iyVCDQuYrS1oYlfyM3iIeuCIWSNkXMe0lzTVsrCaL4awaIvoCJafdYiAy8DXmIKDb4d4/3GrrkeKCj9WSZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728226766; c=relaxed/relaxed;
	bh=QjaM5k9qqJvchGVL0bXBB8KvEd+WrkzXBDa2YMdrjdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLHR5Mo75t+NBqdPQ658YozK+GQirq9b+byjgRrfZfbVuCDXiw1vK9YCu2mGCBDTddH8l2HaNQDVTqwOPp2o9RJBeiIuGNllNHUI8FHECtj4xv6bqROEosWhXIGjdBodfUF1UIWC7j+tgsyPJJyJtOE7zmfxupgM40iN4a29r8hVlVZo90HnfbMsYZN82/K4TaASGMecAa/kwIOAw47NnaLPiNTj1atiyzHvK0oMTEhI8w3JHFSpyPFZrp6g2LFqCxYgUt0S5oHnSWc0nectK/iXAO3xTWcbRWLEtLqnxVKHz2D1hOanD7jlljlj6v+94eR7Ixl/98LCrIOibKw/Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ym5kQUjt; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ym5kQUjt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XM5614Yrcz2xY6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 01:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QjaM5k9qqJvchGVL0bXBB8KvEd+WrkzXBDa2YMdrjdE=; b=Ym5kQUjtP6Dd9OwFUXGvXnWioY
	wZDDdxmGBO5Nh6hBKstzXXUHYdcnxEuktG17KW4lqXwW2x5sqvFM7mFPaNJPWOFyxIz+rbVF9HNs5
	sTl+zw6W+PsAb83XpQOTAgQaZFbLwWTz5Ne0oSzir8MLlnz1+bijsRoiBOGoSSyv908vaVW3H3Mtc
	dnd09+IPd5K6u683QoytSS3TepbbHEzHzcYWNO3tMcVIXt/bmeK6F6o+DoP4sVS3lmun60RRoABep
	5azAeIBPC110DvZjWc43lgMUVLlpFwZAKrqbKELDkwbyv27ERTUmyioMtaoYcIdEXgGOo3Stavnop
	RNNpg/bw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sxSiu-00000001MPd-0X0j;
	Sun, 06 Oct 2024 14:59:04 +0000
Date: Sun, 6 Oct 2024 15:59:04 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <oliver.sang@intel.com>
Cc: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-fsdevel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	audit@vger.kernel.org, linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [viro-vfs:work.xattr2] [fs/xattr]  64d47e878a:
 xfstests.xfs.046.fail
Message-ID: <20241006145904.GE4017910@ZenIV>
References: <202410062250.ee92fca7-oliver.sang@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410062250.ee92fca7-oliver.sang@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE,SUBJ_LACKS_WORDS autolearn=disabled
	version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 06, 2024 at 10:20:57PM +0800, kernel test robot wrote:

> xfs/046       - output mismatch (see /lkp/benchmarks/xfstests/results//xfs/046.out.bad)
>     --- tests/xfs/046.out	2024-09-30 21:13:44.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/046.out.bad	2024-10-06 05:31:50.379495110 +0000
>     @@ -34,4 +34,8 @@
>      xfsrestore: restore complete: SECS seconds elapsed
>      xfsrestore: Restore Status: SUCCESS
>      Comparing listing of dump directory with restore directory
>     +ls: /fs/scratch/dumpdir/sub/a-link: No such file or directory
>     +ls: /fs/scratch/dumpdir/sub/b-link: No such file or directory
>     +ls: /fs/scratch/restoredir/dumpdir/sub/a-link: No such file or directory
>     +ls: /fs/scratch/restoredir/dumpdir/sub/b-link: No such file or directory
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/046.out /lkp/benchmarks/xfstests/results//xfs/046.out.bad'  to see the entire diff)
> Ran: xfs/046
> Failures: xfs/046
> Failed 1 of 1 tests

*stares*

D'oh...  Inverted sense for AT_SYMLINK_NOFOLLOW => LOOKUP_FLAGS...

Try this:

diff --git a/fs/xattr.c b/fs/xattr.c
index 0b506b6565b7..b96cca3f4bf8 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -721,7 +721,7 @@ static int path_setxattrat(int dfd, const char __user *pathname,
 	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
 		return -EINVAL;
 
-	if (at_flags & AT_SYMLINK_NOFOLLOW)
+	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
 		lookup_flags = LOOKUP_FOLLOW;
 
 	error = setxattr_copy(name, &ctx);
@@ -880,7 +880,7 @@ static ssize_t path_getxattrat(int dfd, const char __user *pathname,
 		return file_getxattr(fd_file(f), &ctx);
 	} else {
 		int lookup_flags = 0;
-		if (at_flags & AT_SYMLINK_NOFOLLOW)
+		if (!(at_flags & AT_SYMLINK_NOFOLLOW))
 			lookup_flags = LOOKUP_FOLLOW;
 		return filename_getxattr(dfd, filename, lookup_flags, &ctx);
 	}

