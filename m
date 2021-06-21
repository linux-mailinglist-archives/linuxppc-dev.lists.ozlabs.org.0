Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206D3AF3C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7y6T1sGRz3bsN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QODfhnKy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QODfhnKy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7y623msHz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 04:02:02 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53FC560698;
 Mon, 21 Jun 2021 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624298519;
 bh=kkst86FkoHM+pRUOoeZDPqsO3ZnzxMS988/ImEZ57Lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QODfhnKyo0ngjkOIeYBrnKGsMkqNVm66f1zG/7m94jOrmv659GzDGw6t+QxZxuCL8
 L6viQNkCYFvFeTQjdurCYqOJ13GPbxi26WAo+TV3zgmU9+tgLG1b/zWE8hPfXY9T9z
 LE4XiZOpSFQXrjvNKG63mr03i2MiN6fIOPkmjjt1boDFTfsx422lNGAcTqeQDrnWVj
 4mYPzAyTeWuUgRwTy1mMRB7syGJOh1pXyn6/+wMa0aD4Rd6piDnm+WaxFB28ohbUMk
 16F5DZk63cE0D8oQ/fPeqYQp7wE37tE5A3AS7T7TlRKNVzeP6JZCpZqNalFB66i3kv
 3ddJI7/xTyoBQ==
Date: Mon, 21 Jun 2021 11:01:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: arch/powerpc/kvm/book3s_hv_nested.c:264:6: error: stack frame
 size of 2304 bytes in function 'kvmhv_enter_nested_guest'
Message-ID: <YNDUEoanTqvayZ5P@archlinux-ax161>
References: <202104031853.vDT0Qjqj-lkp@intel.com>
 <1624232938.d90brlmh3p.astroid@bobo.none>
 <e6167885-30e5-d149-bcde-3e9ad9f5d381@kernel.org>
 <87im273604.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87im273604.fsf@mpe.ellerman.id.au>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux@googlegroups.com, kvm-ppc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 07:46:03PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > On 6/20/2021 4:59 PM, Nicholas Piggin wrote:
> >> Excerpts from kernel test robot's message of April 3, 2021 8:47 pm:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >>> head:   d93a0d43e3d0ba9e19387be4dae4a8d5b175a8d7
> >>> commit: 97e4910232fa1f81e806aa60c25a0450276d99a2 linux/compiler-clang.h: define HAVE_BUILTIN_BSWAP*
> >>> date:   3 weeks ago
> >>> config: powerpc64-randconfig-r006-20210403 (attached as .config)
> >>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 0fe8af94688aa03c01913c2001d6a1a911f42ce6)
> >>> reproduce (this is a W=1 build):
> >>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>          chmod +x ~/bin/make.cross
> >>>          # install powerpc64 cross compiling tool for clang build
> >>>          # apt-get install binutils-powerpc64-linux-gnu
> >>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=97e4910232fa1f81e806aa60c25a0450276d99a2
> >>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >>>          git fetch --no-tags linus master
> >>>          git checkout 97e4910232fa1f81e806aa60c25a0450276d99a2
> >>>          # save the attached .config to linux build tree
> >>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64
> >>>
> >>> If you fix the issue, kindly add following tag as appropriate
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> arch/powerpc/kvm/book3s_hv_nested.c:264:6: error: stack frame size of 2304 bytes in function 'kvmhv_enter_nested_guest' [-Werror,-Wframe-larger-than=]
> >>>     long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
> >>>          ^
> >>>     1 error generated.
> >>>
> >>>
> >>> vim +/kvmhv_enter_nested_guest +264 arch/powerpc/kvm/book3s_hv_nested.c
> >> 
> >> Not much changed here recently. It's not that big a concern because it's
> >> only called in the KVM ioctl path, not in any deep IO paths or anything,
> >> and doesn't recurse. Might be a bit of inlining or stack spilling put it
> >> over the edge.
> >
> > It appears to be the fact that LLVM's PowerPC backend does not emit 
> > efficient byteswap assembly:
> >
> > https://github.com/ClangBuiltLinux/linux/issues/1292
> >
> > https://bugs.llvm.org/show_bug.cgi?id=49610
> >
> >> powerpc does make it an error though, would be good to avoid that so the
> >> robot doesn't keep tripping over.
> >
> > Marking byteswap_pt_regs as 'noinline_for_stack' drastically reduces the 
> > stack usage. If that is an acceptable solution, I can send it along 
> > tomorrow.
> 
> Yeah that should be OK. Can you post the before/after disassembly when
> you post the patch?
> 
> It should just be two extra function calls, which shouldn't be enough
> overhead to be measurable.

The diff is pretty large so I have attached it here along with the full
disassembly of the files before and after the patch I am about to send.
I will reply to this message so the history is there.

Cheers,
Nathan
