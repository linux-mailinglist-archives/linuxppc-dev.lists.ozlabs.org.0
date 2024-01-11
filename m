Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9182B5D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 21:21:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pz76U6jP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9wzH0tlYz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 07:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pz76U6jP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9wyP1lWWz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 07:20:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B49E1B82143;
	Thu, 11 Jan 2024 20:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C575C43390;
	Thu, 11 Jan 2024 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705004407;
	bh=+QavJfo5shHsDI54vIkucOEkmDxcfkwD6QfPD3io40U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz76U6jPieOUiWYaAgRMSZ0RaLxs3b1cj+yfIzSrgCEHRBjcAABzNWoHXXaVgbbVR
	 JNL9z6/6pKRr8TJbyGaLt7nR6s0+DfKU4aAcu4ZDw5Do5dHTvwf4BPKmoh0ZdmM/wj
	 jISSXv6Gt4afZr8OahwxcH5973TMwOHw2ZxyVygTiXXrAn8B+w5p4KN/47VPigb+oS
	 lYek+N6adK2I8qsxnhvl1i233QVbL1Z/OOAND2xJb1gcc/MqtuOAhpUYiVLBzA8k05
	 Pn5/fUyVcxSYy0zI54/QOKcb1yk1mCMG9Vo/M2TPP27bkS1dSLsIkepje263KX/Vl3
	 DZj5TG7UMZ1Rw==
Date: Thu, 11 Jan 2024 13:20:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
Message-ID: <20240111202003.GA3418790@dev-arch.thelio-3990X>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org>
 <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
 <20240111194001.GA3805856@dev-arch.thelio-3990X>
 <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
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
Cc: linux-efi <linux-efi@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kvm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, kasan-dev <kasan-dev@googlegroups.com>, Yonghong Song <yonghong.song@linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Mykola Lysenko <mykolal@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-media@vger.kernel.org, Linux Power Management <linux-pm@vger.kernel.org>, bridge@lists.linux.dev, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Network Development <netdev@vger.kernel.org>, patches@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, Linux Crypto Mailing List <linux-
 crypto@vger.kernel.org>, bpf <bpf@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexei,

On Thu, Jan 11, 2024 at 12:00:50PM -0800, Alexei Starovoitov wrote:
> On Thu, Jan 11, 2024 at 11:40 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Yonghong,
> >
> > On Wed, Jan 10, 2024 at 08:05:36PM -0800, Yonghong Song wrote:
> > >
> > > On 1/9/24 2:16 PM, Nathan Chancellor wrote:
> > > > reviews.llvm.org was LLVM's Phabricator instances for code review. It
> > > > has been abandoned in favor of GitHub pull requests. While the majority
> > > > of links in the kernel sources still work because of the work Fangrui
> > > > has done turning the dynamic Phabricator instance into a static archive,
> > > > there are some issues with that work, so preemptively convert all the
> > > > links in the kernel sources to point to the commit on GitHub.
> > > >
> > > > Most of the commits have the corresponding differential review link in
> > > > the commit message itself so there should not be any loss of fidelity in
> > > > the relevant information.
> > > >
> > > > Additionally, fix a typo in the xdpwall.c print ("LLMV" -> "LLVM") while
> > > > in the area.
> > > >
> > > > Link: https://discourse.llvm.org/t/update-on-github-pull-requests/71540/172
> > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > Ack with one nit below.
> > >
> > > Acked-by: Yonghong Song <yonghong.song@linux.dev>
> >
> > <snip>
> >
> > > > @@ -304,6 +304,6 @@ from running test_progs will look like:
> > > >   .. code-block:: console
> > > > -  test_xdpwall:FAIL:Does LLVM have https://reviews.llvm.org/D109073? unexpected error: -4007
> > > > +  test_xdpwall:FAIL:Does LLVM have https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5? unexpected error: -4007
> > > > -__ https://reviews.llvm.org/D109073
> > > > +__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d
> > >
> > > To be consistent with other links, could you add the missing last alnum '5' to the above link?
> >
> > Thanks a lot for catching this and providing an ack. Andrew, could you
> > squash this update into selftests-bpf-update-llvm-phabricator-links.patch?
> 
> Please send a new patch.
> We'd like to take all bpf patches through the bpf tree to avoid conflicts.

Very well, I've sent a standalone v2 on top of bpf-next:

https://lore.kernel.org/20240111-bpf-update-llvm-phabricator-links-v2-1-9a7ae976bd64@kernel.org/

Andrew, just drop selftests-bpf-update-llvm-phabricator-links.patch
altogether in that case, the other two patches are fine to go via -mm I
think.

Cheers,
Nathan
