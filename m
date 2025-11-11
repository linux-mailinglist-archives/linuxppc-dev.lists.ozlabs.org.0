Return-Path: <linuxppc-dev+bounces-14087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05FC4CC4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 10:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5MG76v6tz30FX;
	Tue, 11 Nov 2025 20:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762854607;
	cv=none; b=gWhPK/A4DGD+s9a24RroapXb1PnLTaf76CyqUGMhe8uZycSpkiQwshujjpf6mIYprLp/lzNkR8Lt9+b8Cmo22vxa8hldlAnCiRKciTT8uz+fdEJf9JkE/5HwUb3TaXd5D2Hv2DVo15jPou5utQE6qp6/zFbMQJKgYQQ2p+yggSBCmnjJmeGqWGQQqB7AQ0URLX5aXo6yYDX6dxm7Xl322Wz5c/am/74PRKQCVkBMPeXWJZSuGlVPv84DVZB+mI2zn73E2i7lSIyyxOEvM/JCS1Qvuat3bf83fT/nborIyYLzta5a8PwwP+wbAWBa8i1eKCmui0UUuT1LKDz2hz5Shg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762854607; c=relaxed/relaxed;
	bh=6bsPdtBaqJ4UPF5R7K+ouK1dJ6DCyxBWv0w/QZnr7cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYhWU32qdfTuQ7ak2e+HxiXVl2J9TIWRaCV6p1ixbr+snhpCuMt3IL4+NhccyfNhKB+MKAPBsCt+PjCYZv/jJMaqFdGPr9WSSYhGOHJn4xxRm8jADmfGnSOQJxUEfXFr7oX83NyQzAht1U5M/9NFOHdE6zGvqmm7kNyysyNi2a1C1FXQY8QKcnZYP644d2+T9vwKgcJfr285pYx4KVhQf2A5gLH0BWK1WAgQK2wRS+MKmV1dF+CP3qt9BLWcRfJgm25wBWpioo6BEL+wfWJnxGi0ZbFPYRrt7M0Hydo6H8CFlaW/XAn5mghTjB2AZX3gxd42lyIS5PJzp0boezBOKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WXA69s3/; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WXA69s3/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5MG6607tz30F0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 20:50:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6bsPdtBaqJ4UPF5R7K+ouK1dJ6DCyxBWv0w/QZnr7cE=; b=WXA69s3/ndSSCDKncRmaO/hjic
	O1y94fGm7YG4wpp1EnXG6yDbvuMjQmTNWvtrC7zZiZbJKSJQ3qPVVV+wFbvU9CFAsYmwuwFWd9TQz
	502RxsFSRuMlb+ZsoiAw/Eyy0gQ2krWPMw0fEZQ3Z1ZbYzdnWOQhbqHDcknhoQE/b6LUe5OiGj/uX
	ilItJNCZJAw3WeivKD5Fmg/6ibDscl4juFxBkBG0efupSFSIBUUIdS3DG4fn/rMt/0u9B5d/iqbE3
	VTHj0bLhd9xu7SVaxQVogoLmue/J7I9fcpgSO2MhCBANTrOxCwyy94lXIyVk5oV9wmikQTnsNUf6U
	oFmhH9OQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl0f-0000000FPaa-0OxV;
	Tue, 11 Nov 2025 09:49:57 +0000
Date: Tue, 11 Nov 2025 09:49:57 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: bot+bpf-ci@kernel.org
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 34/50] selinuxfs: new helper for attaching files to
 tree
Message-ID: <20251111094957.GT2441659@ZenIV>
References: <20251111065520.2847791-35-viro@zeniv.linux.org.uk>
 <70d825699c6e0a7e6cb978fdefba5935d5a515702e22e732d5c2ad919cfe010b@mail.kernel.org>
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
In-Reply-To: <70d825699c6e0a7e6cb978fdefba5935d5a515702e22e732d5c2ad919cfe010b@mail.kernel.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 07:53:18AM +0000, bot+bpf-ci@kernel.org wrote:

> Can this leak the parent directory's reference count? The parent inode's
> link count is incremented with inc_nlink(d_inode(dir)) before calling
> sel_attach(). When sel_attach()->d_alloc_name() fails and returns NULL,
> sel_attach() correctly cleans up the child inode with iput() and returns
> ERR_PTR(-ENOMEM). However, the parent directory's link count has already
> been incremented and is never decremented on this error path.
> 
> In the original code, the parent link count increment happened after
> d_add() succeeded, ensuring it only occurred when the full operation
> completed successfully.

All callers of sel_make_dir() proceed to remove the parent in case of
failure.  All directories are created either at mount time or at
policy reload afterwards.  A failure in the former will have
sel_fill_super() return an error, with the entire filesystem instance
being torn apart by the cleanup path in its caller (get_tree_single()).
No directories survive that.  A failure in the latter (in something
called from sel_make_policy_nodes()) will be taken care of by the
call of simple_recursive_removal() in the end of sel_make_policy_nodes() -
there we
	1.  create a temporary directory ("/.swapover").  We do *NOT*
use sel_make_dir() for that - see sel_make_swapover_dir().  If that has
failed, we return an error.
	2.  create and populate two subtrees in it ("booleans" and "classes").
That's the step where we would create subdirectories and that's where
sel_make_dir() failures might occur.
	3.  if the subtree creation had been successful, swap "/.swapover/booleans"
with "/booleans" and "/.swapover/classes" with "/classes" respectively.
	4.  recursively remove "/.swapover", along with anything that might
be in it.  In case of success that would be the old "/classes" and "/booleans"
that got replaced, in case of failure - whatever we have partially created.

That's the same reason why we don't need to bother with failure cleanups in
the functions that populate directories - if they fail halfway through, the
entire (sub)tree is going to be wiped out in one pass.

