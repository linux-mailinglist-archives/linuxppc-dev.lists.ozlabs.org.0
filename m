Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B18D6E80
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:35:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=05bGu4sw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vrqwh0xFPz3bqC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=05bGu4sw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vrqvx3l4Kz2yvm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:34:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BC18CE1CF8;
	Sat,  1 Jun 2024 06:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C48C116B1;
	Sat,  1 Jun 2024 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717223652;
	bh=EEzU5dGaHU9UQkrHXJaNA4lg0FFzlwxUvS1ydOAxB50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05bGu4swaVZhwATYytBEYpGFYHkJRtGe4LQYqn2XcOZ5zgJzeOlt5p9wq+tD24YCH
	 AA9kfPDTxr86r36CueyR9lUGEeEyDspaGaqO97MTkr7af6XqkMrrFSxSqrpdillLXC
	 7g1wdYjYb/MPr9Slpwgkw8f1CumSmsqD6mEBemNo=
Date: Sat, 1 Jun 2024 08:34:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
Message-ID: <2024060155-chemicals-carrot-ea58@gregkh>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
 <87plt22w1k.fsf@mail.lhotse>
 <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
 <2024053128-pueblo-skid-585e@gregkh>
 <2024053145-tapered-kleenex-d647@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024053145-tapered-kleenex-d647@gregkh>
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 12:16:50PM +0200, Greg KH wrote:
> On Fri, May 31, 2024 at 12:02:15PM +0200, Greg KH wrote:
> > On Fri, May 31, 2024 at 11:19:34AM +0200, Thorsten Leemhuis wrote:
> > > On 31.05.24 11:03, Michael Ellerman wrote:
> > > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > >> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> > > >>> On 28.05.24 22:00, Christian Zigotzky wrote:
> > > >>>> Hi All,
> > > >>>>
> > > >>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
> > > >>>> with the VirtIO GPU and with some Radeon cards.
> > > >>>>
> > > >>>> Another error message: Failed to start Setup Virtual Console.
> > > >>>>
> > > >>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
> > > >>>>
> > > >>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
> > > >>>>
> > > >>>> Could you please test Xorg on your PowerPC machines?
> > > >>>>
> > > >>>> Thanks,
> > > >>>> Christian
> > > >>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
> > > >>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
> > > >>>
> > > >>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
> > > >>> Inappropriate ioctl for device.
> > > >>
> > > >> That is presumably because of this:
> > > >>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > > > 
> > > > Attempting to regzbot this.
> > > > 
> > > > #regzbot introduced: 8c467f330059
> > > > #regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> > > 
> > > Thx, I already had an eye on this, but thought tracking would not be
> > > needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
> > > macros to define ioctls") two days ago:
> > > https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/
> > > 
> > > But that commit is not yet in -next afaics. :-/
> > > 
> > > /me meanwhile wonders if it would be wise to fix this before -rc2
> > 
> > I do, sorry, been traveling this week with geen vrije tijd.  Will get to
> > it tomorrow.
> 
> Ugh, sorry for the dutch, I have "no free time" because I am studying
> the language this week.  It is bleeding over here into my emails now...

Pull request now sent:
	https://lore.kernel.org/r/Zlq8yMiUBTOisuWp@kroah.com
