Return-Path: <linuxppc-dev+bounces-3445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FD9D353D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 09:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtZ5k2tDBz2y72;
	Wed, 20 Nov 2024 19:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732090762;
	cv=none; b=lztpNCMsPlYDy8P/vwWfqDUKJZz1ghETwQ6jRjnVNWpKszE/d1MTWMy9xLNykL7pjIPkt9EsRCE3rxYuewu6U7SgHGUBczY9ZY4xpv+9EhHiSw+EPpGr++Bm//OaseeLB9Yat1JHx/u9qLjwu56o5q2/6FeqwC/eY4iFRsn5pXxYG8ttqIRi1L0Bw1pJA+lQ/aMRkVfqEnRIFVxUHl6S3zO1gBblLwaF35rMIQwqdtCe9dtoBJjdekPtDdtiq0MSENxeRyaAua8jNYLM6XuyNGYMqrjMjn9KZAqn0iyI//IumKHcpZWWcb8uq7nRpwoV0nvtkvklEcsv+6XEjoHrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732090762; c=relaxed/relaxed;
	bh=RlxMT8FHx1zem6jgssUsI5OfLJIytBiyUdtowDzthDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbyimLHHub35OFiQeFJkLOm3mYVqPMkUstaLP781AnEZLdDoAT3VEspDtiZLXWLYrZFrgjz3fe7EouujThQjuuTYiV5VJfCZjdoXTRNn31Pno3kszlHTUiMKU4ToM5Zr3iErbaGshU/prMYFsrF0BQSJrdZIiD2z5dx0AqJJ5iJfO/Fx4OmZVZL0fpH9d/4o6wpenCzLS/RModjcbOQ8zXjyn6NcOVkJX09AtN72XVr4cwvwC+js8tck2tT/TNDoUc4xpa1nTxZzoGfhFuDZaSywxjlQF6Iwni+owC3zt6f8ARC2DbFnEqCjvfycJ1HwXshpuVDqVEv7bh9aTTe6Sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2GGnhXC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2GGnhXC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtZ5g2Tblz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 19:19:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9F5A5C5B11;
	Wed, 20 Nov 2024 08:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1D2C4CECD;
	Wed, 20 Nov 2024 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732090756;
	bh=9TI0HM4Dy8p7o0uGW4XXWqn7s6R1nhPDekk9NNPZafI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2GGnhXCZHnauYXaZWgw/m6Gw4+zTvKgGg+Scx3b08xVvwSKBu0OExkO4Q8tBvnho
	 tRg95NPzUUXud5kmpweVM//uN00Ll6HGDk/uyhKEyHF5wQBZY0U27kN6vr5F/Zep0O
	 xQ4+AaUjcoJy+uVaGMmYX0UoXOWtrHJfE8i9NmdlrjOes8SgJl8ZIM6Ad3SBsEBg7e
	 sHCuKjD/lCX0qlM/TAV8E8ouSHxJ8TYaCqRsEuZP+CMbQcjqvduq8KVL/sUFfdltM7
	 8gFFHAsNE0sjUT3Q8/ZGPFwbtpwRQWxpNkzibqfroUVWIqFiGmdqiA8Fi0w844sK72
	 bkbFkku44e7UA==
From: Christian Brauner <brauner@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christian Brauner <brauner@kernel.org>,
	sforshee@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mount_setattr: Fix failures on 64K PAGE_SIZE kernels
Date: Wed, 20 Nov 2024 09:19:07 +0100
Message-ID: <20241120-ausnahmen-vermocht-cbee4e244bbd@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241115134114.1219555-1-mpe@ellerman.id.au>
References: <20241115134114.1219555-1-mpe@ellerman.id.au>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=brauner@kernel.org; h=from:subject:message-id; bh=9TI0HM4Dy8p7o0uGW4XXWqn7s6R1nhPDekk9NNPZafI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTbzq7z5f9Wb3uI12Prb82N350iDl38HLv/c4rH4S5HO Tuzb5eZOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACay+w4jw4/LFacDdnO9b93k POWVjizvtRv/7hnsLZvMFnTi3gJfriZGhm0L/2y+WcXCsMAr4uTH09fv+S9cOPn7m9pq77qoMOs XT5kA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 16 Nov 2024 00:41:14 +1100, Michael Ellerman wrote:
> Currently the mount_setattr_test fails on machines with a 64K PAGE_SIZE,
> with errors such as:
> 
>   #  RUN           mount_setattr_idmapped.invalid_fd_negative ...
>   mkfs.ext4: No space left on device while writing out and closing file system
>   # mount_setattr_test.c:1055:invalid_fd_negative:Expected system("mkfs.ext4 -q /mnt/C/ext4.img") (256) == 0 (0)
>   # invalid_fd_negative: Test terminated by assertion
>   #          FAIL  mount_setattr_idmapped.invalid_fd_negative
>   not ok 12 mount_setattr_idmapped.invalid_fd_negative
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] selftests/mount_setattr: Fix failures on 64K PAGE_SIZE kernels
      https://git.kernel.org/vfs/vfs/c/f13242a46438

