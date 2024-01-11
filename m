Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821A82B557
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 20:40:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SPPtBjPT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9w550ZsGz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 06:40:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SPPtBjPT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9w4C34KWz30gr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 06:40:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7724617A3;
	Thu, 11 Jan 2024 19:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE49C433C7;
	Thu, 11 Jan 2024 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705002004;
	bh=DmkLUwPO5pHCJHvVcwPy1P4sgjTzQNNak+Eq1cUdG4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPPtBjPT+YAd4ocTNd3PGbSKeEby62sm5DsaPgCv2HqVIW9AA61WpCKjUG1nFowUj
	 3KfWsd59L33mr3lPW1pODJ4DxPp3c0FvcL65M+M43Xd0dsozkiXoWTzMQXYyp+ok+1
	 Cb30aWs3Sxk5AodiSlMI4eMG+NABT1HgniB893pjpYDswpLiHA/yPSOP9UoGeJLbKt
	 bnTkQNlGsDQqy8YOmI7KSXeLlghLdU+zlsbZoTu+RaMYkcWjxf+xdeMOQ8myzu+KXS
	 4DFQ7cH+eAqKWFGmhszUBwC2NDKu/wiPRUDEP+5/MhjNc4xXnfccYuJTOa5a8NwKDV
	 Z7nFRX4xsl/qg==
Date: Thu, 11 Jan 2024 12:40:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yonghong Song <yonghong.song@linux.dev>, akpm@linux-foundation.org
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
Message-ID: <20240111194001.GA3805856@dev-arch.thelio-3990X>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org>
 <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, ast@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mykolal@fb.com, daniel@iogearbox.net, andrii@kernel.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, patches@lists.linux.dev, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yonghong,

On Wed, Jan 10, 2024 at 08:05:36PM -0800, Yonghong Song wrote:
> 
> On 1/9/24 2:16 PM, Nathan Chancellor wrote:
> > reviews.llvm.org was LLVM's Phabricator instances for code review. It
> > has been abandoned in favor of GitHub pull requests. While the majority
> > of links in the kernel sources still work because of the work Fangrui
> > has done turning the dynamic Phabricator instance into a static archive,
> > there are some issues with that work, so preemptively convert all the
> > links in the kernel sources to point to the commit on GitHub.
> > 
> > Most of the commits have the corresponding differential review link in
> > the commit message itself so there should not be any loss of fidelity in
> > the relevant information.
> > 
> > Additionally, fix a typo in the xdpwall.c print ("LLMV" -> "LLVM") while
> > in the area.
> > 
> > Link: https://discourse.llvm.org/t/update-on-github-pull-requests/71540/172
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Ack with one nit below.
> 
> Acked-by: Yonghong Song <yonghong.song@linux.dev>

<snip>

> > @@ -304,6 +304,6 @@ from running test_progs will look like:
> >   .. code-block:: console
> > -  test_xdpwall:FAIL:Does LLVM have https://reviews.llvm.org/D109073? unexpected error: -4007
> > +  test_xdpwall:FAIL:Does LLVM have https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5? unexpected error: -4007
> > -__ https://reviews.llvm.org/D109073
> > +__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d
> 
> To be consistent with other links, could you add the missing last alnum '5' to the above link?

Thanks a lot for catching this and providing an ack. Andrew, could you
squash this update into selftests-bpf-update-llvm-phabricator-links.patch?

diff --git a/tools/testing/selftests/bpf/README.rst b/tools/testing/selftests/bpf/README.rst
index b9a493f66557..e56034abb3c2 100644
--- a/tools/testing/selftests/bpf/README.rst
+++ b/tools/testing/selftests/bpf/README.rst
@@ -306,4 +306,4 @@ from running test_progs will look like:
 
   test_xdpwall:FAIL:Does LLVM have https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5? unexpected error: -4007
 
-__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d
+__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5
