Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E48B29F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 22:35:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Z+gqGa8P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQSKm2Q52z3vbL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 06:35:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Z+gqGa8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQSK14Sc3z3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 06:34:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1714077293;
	bh=bZqtcMhFx7TDPaIgrLqyfpl0/OfmMPAKopBgZDQprIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+gqGa8PD+3BrRxF+Exe+s/+n1FrcsSYPFeQUrvoT2UUvEiGsEXMDYuXjYQJDYiRJ
	 9/0fJxtI2lDBLEHhkegO15rObvRhgIuWQMhE+D085PPIsVKHmI/z9Zz6qr7xUxUgOg
	 gdOVIytSYg1zquf83mxdxD8VyvGj7mHBMGjmlG8k=
Date: Thu, 25 Apr 2024 22:34:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <d11f875e-4fb5-46dd-a412-84818208c575@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <CGME20240425031241eucas1p1fb0790e0d03ccbe4fca2b5f6da83d6db@eucas1p1.samsung.com>
 <20240424201234.3cc2b509@kernel.org>
 <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 2024-04-25 13:04:12+0000, Joel Granados wrote:
> On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > > The series was split from my larger series sysctl-const series [0].
> > > It only focusses on the proc_handlers but is an important step to be
> > > able to move all static definitions of ctl_table into .rodata.
> > 
> > Split this per subsystem, please.
> It is tricky to do that because it changes the first argument (ctl*) to
> const in the proc_handler function type defined in sysclt.h:
> "
> -typedef int proc_handler(struct ctl_table *ctl, int write, void *buffer,
> +typedef int proc_handler(const struct ctl_table *ctl, int write, void *buffer,
>                 size_t *lenp, loff_t *ppos);
> "
> This means that all the proc_handlers need to change at the same time.
> 
> However, there is an alternative way to do this that allows chunking. We
> first define the proc_handler as a void pointer (casting it where it is
> being used) [1]. Then we could do the constification by subsystem (like
> Jakub proposes). Finally we can "revert the void pointer change so we
> don't have one size fit all pointer as our proc_handler [2].
> 
> Here are some comments about the alternative:
> 1. We would need to make the first argument const in all the derived
>    proc_handlers [3] 
> 2. There would be no undefined behavior for two reasons:
>    2.1. There is no case where we change the first argument. We know
>         this because there are no compile errors after we make it const.
>    2.2. We would always go from non-const to const. This is the case
>         because all the stuff that is unchanged in non-const.
> 3. If the idea sticks, it should go into mainline as one patchset. I
>    would not like to have a void* proc_handler in a kernel release.
> 4. I think this is a "win/win" solution were the constification goes
>    through and it is divided in such a way that it is reviewable.
> 
> I would really like to hear what ppl think about this "heretic"
> alternative. @Thomas, @Luis, @Kees @Jakub?

Thanks for that alternative, I'm not a big fan though.

Besides the wonky syntax, Control Flow Integrity should trap on
this construct. Functions are called through different pointers than
their actual types which is exactly what CFI is meant to prevent.

Maybe people find it easier to review when using
"--word-diff" and/or "-U0" with git diff/show.
There is really nothing going an besides adding a few "const"s.

But if the consensus prefers this solution, I'll be happy to adopt it.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/commit/?h=jag/constfy_treewide_alternative&id=4a383503b1ea650d4e12c1f5838974e879f5aa6f
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/commit/?h=jag/constfy_treewide_alternative&id=a3be65973d27ec2933b9e81e1bec60be3a9b460d
> [3] proc_dostring, proc_dobool, proc_dointvec....


Thomas
