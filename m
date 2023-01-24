Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEA679EE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Xjk5KSFz3f9s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:39:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Xj848Dbz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 03:38:35 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30OGUo7N008108;
	Tue, 24 Jan 2023 10:30:50 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30OGUmel008107;
	Tue, 24 Jan 2023 10:30:48 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 24 Jan 2023 10:30:48 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <20230124163048.GL25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org> <20230123150716.GJ25951@gate.crashing.org> <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023 at 09:14:52AM -0700, Nathan Chancellor wrote:
> On Mon, Jan 23, 2023 at 09:07:16AM -0600, Segher Boessenkool wrote:
> > And here it is even more obviously fine.  If you need obfuscation like
> > in your patch, it is better not to do this imo.
> 
> I do not think this patch really obfuscates anything? The filtering is
> pretty clear to me.

And not having such filtering is more obvious and more clear.

It doesn't matter much for just this patch of course, but it will make
the code significantly harder to read (and deal with in other ways) if
this continues.

> If this is a real objection to the patch, I suppose we could just
> localize '-Qunused-arguments' to this Makefile and be done with it but I
> do not think this change is a bad solution to the problem either.

It is a comment about the direction this patch is moving us in.  I don't
think it is a good idea at all to try to avoid all warnings, and even
more so it is a bad idea to make objectively worse source code just to
appease a trigger-happy and questionable warning.

As I said, you can often avoid warnings by writing better code, like
part of the patch did.  That is a good reaction to warnings.  Making
worse code to avoid warnings is not a good idea normally.

Just don't use -Werror by default, and don't make other people suffer
its yoke!


Segher
