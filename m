Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13D842DCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:28:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BoHLiJty;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPcFL2T1Cz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 07:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BoHLiJty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPcDT2yclz30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 07:27:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=KF0eA11IhH1RKliosU16MNbkjO0cWVDLOUxDSxK6czs=; b=BoHLiJtytJma/rBq+XUDY19xyn
	+zF+XyExGa3ZC59LtZpu1AOY7JeLTUHTfaoFtNTpKyPQM8LZWN3aj0E4drJCn1rcgP5TJY9Dp3bbV
	E7BNaIT+n7KVtYzDm/rajfb48s1+yLIHsSG//4oEPyjOytYA1w25hMLzgWHAjGcH9oiyWFLo47hkU
	jyFj4D2GZFEU295kPldN+c6bQmq0B8lgWIzPYKa68D/cGSkjsZhVYRZ91vw/jTqO5mlBF6NxPB4Y1
	sGYhSVCseNdKyh9IcN0/guh5Dxl0WxX0F+x+bnrwKGD9/5dHVyx19xESEUjhDtzSbZR86cO4c+M5Y
	EcBFtR7A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUuhk-00000000Sqp-25pi;
	Tue, 30 Jan 2024 20:27:36 +0000
Date: Tue, 30 Jan 2024 12:27:36 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Message-ID: <ZblbuHLaK2_Xhff_@bombadil.infradead.org>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
 <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
 <CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
 <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 06:48:11PM +0100, Marek Szyprowski wrote:
> Dear All,
> 
> On 30.01.2024 12:03, Christophe Leroy wrote:
> > Le 30/01/2024 à 10:16, Chen-Yu Tsai a écrit :
> >> [Vous ne recevez pas souvent de courriers de wenst@chromium.org. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> On Mon, Jan 29, 2024 at 12:09:50PM -0800, Luis Chamberlain wrote:
> >>> On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
> >>>> Declaring rodata_enabled and mark_rodata_ro() at all time
> >>>> helps removing related #ifdefery in C files.
> >>>>
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>> Very nice cleanup, thanks!, applied and pushed
> >>>
> >>>     Luis
> >> On next-20240130, which has your modules-next branch, and thus this
> >> series and the other "module: Use set_memory_rox()" series applied,
> >> my kernel crashes in some very weird way. Reverting your branch
> >> makes the crash go away.
> >>
> >> I thought I'd report it right away. Maybe you folks would know what's
> >> happening here? This is on arm64.
> > That's strange, it seems to bug in module_bug_finalize() which is
> > _before_ calls to module_enable_ro() and such.
> >
> > Can you try to revert the 6 patches one by one to see which one
> > introduces the problem ?
> >
> > In reality, only patch 677bfb9db8a3 really change things. Other ones are
> > more on less only cleanup.
> 
> I've also run into this issue with today's (20240130) linux-next on my 
> test farm. The issue is not fully reproducible, so it was a bit hard to 
> bisect it automatically. I've spent some time on manual testing and it 
> looks that reverting the following 2 commits on top of linux-next fixes 
> the problem:
> 
> 65929884f868 ("modules: Remove #ifdef CONFIG_STRICT_MODULE_RWX around 
> rodata_enabled")
> 677bfb9db8a3 ("module: Don't ignore errors from set_memory_XX()")
> 
> This in fact means that commit 677bfb9db8a3 is responsible for this 
> regression, as 65929884f868 has to be reverted only because the latter 
> depends on it. Let me know what I can do to help debugging this issue.

Thanks for the bisect, I've reset my tree to commit
3559ad395bf02 ("module: Change module_enable_{nx/x/ro}() to more
explicit names") for now then, so to remove those commits.

  Luis
