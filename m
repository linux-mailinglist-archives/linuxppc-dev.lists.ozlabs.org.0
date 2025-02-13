Return-Path: <linuxppc-dev+bounces-6157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98AA34E1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 19:55:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv4Bm4vvcz2yVD;
	Fri, 14 Feb 2025 05:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739472944;
	cv=none; b=ifQ5lvb/dOiBhNMb/q8eodKsqcUKmh1fmB2PGtiMqiFC61UJzDbK+lrdf6zEyW96hlDxR4L/IpfpK5dXcSCMYk1ZEKfSZ/OPPZPNqQZY0wIyCTtQBdK0YZNAr26A/i52m8VMtNGBOriVkgULIZq0VG4mx+Qq97fFZ/PHml1sPpZ4nuGQNzX7NYkkEe6yVHUYTBmtkEEvvPvk8mdISmiHwF9Jowdy2bwXJHBEhCBdJ3zC6D6CHpeszoG5FzXT1PoN473NqGAwh+JEqYxQ6x5qYb0qAL5fDJngxlHZNkqMADHjlQffQcVvJW/X7jCWJlVwPN4hyRZ6tq/325psy6tH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739472944; c=relaxed/relaxed;
	bh=ZdrIpFUACp7gTVtMZNb7YQs5vUA8VkniobVEiwGQ6HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUk3C6YolzGNIy5aht7yeBLyAOUu0r1RMlbWiVKqMT/h/cZitoVOFB4gGSK3DDfDosKrfjTIlADMCSexRLytcwziLmTw+ac2Legzzufp6NzlP6jhvj7JyM7i1EagWcdpZIT43PzklEtQ6SkUWW5nG24TP1sNZt3qXWlo1t3gB0JKygmgiDu2U60qpdu0/Nifgi/nYQgIwb4IruCZgBGUqi2I+xjwgfiNhgqqXFgBIvFgsVkRURAmOz7TYlXIarZN/HYa91dsYJSBmHDl+hhvzXFlHEadQB+t7dizcblqVcsXz2ek+nLEkIcFiUj0GerpUBpv1TdVJUZJ4ADtdUjZYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org) smtp.mailfrom=mit.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=lists.ozlabs.org)
X-Greylist: delayed 194 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 05:55:43 AEDT
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv4Bl3mYgz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 05:55:42 +1100 (AEDT)
Received: from cwcc.thunk.org (pool-173-48-82-224.bstnma.fios.verizon.net [173.48.82.224])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 51DIqMsE001272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 13:52:23 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 6A78515C0009; Thu, 13 Feb 2025 13:52:22 -0500 (EST)
Date: Thu, 13 Feb 2025 13:52:22 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-ext4@vger.kernel.org, fstests@vger.kernel.org
Subject: Re: [next-20250212] FStests generic/451 on EXT4 FS resulting in
 kernel OOPs
Message-ID: <20250213185222.GA398915@mit.edu>
References: <6f43bd29-d72b-4a39-b931-7b1b47c7cc06@linux.vnet.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f43bd29-d72b-4a39-b931-7b1b47c7cc06@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 13, 2025 at 11:21:22AM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> I am observing kernel OOPs, while running FStests generic/451 on EXT4 with
> linux-next kernel(next-20250212) on IBM Power Servers.

I'm running daily spinnner tests on the fs-next branch on the
linux-next tree, via:

   gce-xfstests ltm -c ext4/all,xfs/all,btrfs/all,f2fs/all -g auto --repo \
       https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next \
       --watch fs-next

The fs-next branch is a subset of linux-next which only has file
system related branches.  This avoids instability caused by non-fs
related changes.  I'm not seeing any kernel oops on today's fs-next
running on an x86 cloud server, using a standardized config.

Looking at the kernel stack trace of your report, it appears that a
linked list used by the workqueue handler (in process_one_work) had
gotten corrupted.  This could be caused by anything (which is one of
the reasons why I test using fs-next instead of linux-next; we didn't
want to spend time debugging problems that aren't under our control).

Is this something which you can easily reproduce?  If so, can you try
seeing if it reproduces on the fs-next branch, and could you try
bisecting the to find the guilty commit?  If this was something we
could reproduce in my test infrastructure, the bisection could be
trivially accomplished via:

   gce-xfstests ltm -c ext4/4k generic/451 --repo linux-next.git \
      --bisect-bad linux-next --bisect-good v6.14-rc1

... and then wait for an e-mailed report to land in my inbox.   :-)

Can you do something similar using your test infrastructure?

Unfortuantely, given the stack trace, I doubt kernel developers would
be able to do much more with your report.

Thanks,

					- Ted

