Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F76753F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 12:57:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nyyf36DRrz3fJ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 22:56:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K1pMFFR3;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qUtBKMDM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K1pMFFR3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qUtBKMDM;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nyyd51J7nz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 22:56:08 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 829995F926;
	Fri, 20 Jan 2023 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674215765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmxlaHwqwEwlYZxNi7TSn7Pn+e4wDn9EcH61dUWGbAI=;
	b=K1pMFFR3WpN92t04sWzitdshFwaXjucdnBZMKmXk0Jykfe+amcMDHaPql5d+Vlkebpah8Z
	uKNxp2HVplRkmjdgvdfKia6eYiaEh+EtLnk/onXQqu0MFPYnCJvUt+TNnb9IR0r0CFTNa1
	sHCbNWz5t8CLvDcCVUAZoKO+83w+Ans=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674215765;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmxlaHwqwEwlYZxNi7TSn7Pn+e4wDn9EcH61dUWGbAI=;
	b=qUtBKMDMoNhxVCuDh8+6xLeM6CnbpSBkkxOH92PjplJ1raxUGMkmxMZ/oz4KJR3gp5tkv1
	ygWQeS1iczdIQgDg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 528242C142;
	Fri, 20 Jan 2023 11:56:05 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:56:04 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Message-ID: <20230120115604.GT16547@kitsune.suse.cz>
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
 <57e026bf-c412-0c47-8956-b565894948e0@suse.de>
 <20230119132330.GP16547@kitsune.suse.cz>
 <190c1c68-0249-a291-f2ab-45c9a7f716d7@suse.de>
 <20230120112759.GS16547@kitsune.suse.cz>
 <c51c25e7-a020-77c2-47b0-1e34b433116a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c51c25e7-a020-77c2-47b0-1e34b433116a@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 12:39:23PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.01.23 um 12:27 schrieb Michal Suchánek:
> > Hello,
> > 
> > On Thu, Jan 19, 2023 at 04:20:57PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 19.01.23 um 14:23 schrieb Michal Suchánek:
> > > > On Thu, Jan 19, 2023 at 02:11:13PM +0100, Thomas Zimmermann wrote:
> > > > > Hi
> > > > > 
> > > > > Am 19.01.23 um 11:24 schrieb Christophe Leroy:
> > > > > > 
> > > > > > 
> > > > > > Le 19/01/2023 à 10:53, Michal Suchanek a écrit :
> > > > > > > The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > > > > > > breaks build because of wrong argument to snprintf. That certainly
> > > > > > > avoids the runtime error but is not the intended outcome.
> > > > > > > 
> > > > > > > Also use standard device name format of-display.N for all created
> > > > > > > devices.
> > > > > > > 
> > > > > > > Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > > > > ---
> > > > > > > v2: Update the device name format
> > > > > > > ---
> > > > > > >      drivers/of/platform.c | 12 ++++++++----
> > > > > > >      1 file changed, 8 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > > > > > > index f2a5d679a324..8c1b1de22036 100644
> > > > > > > --- a/drivers/of/platform.c
> > > > > > > +++ b/drivers/of/platform.c
> > > > > > > @@ -525,7 +525,9 @@ static int __init of_platform_default_populate_init(void)
> > > > > > >      	if (IS_ENABLED(CONFIG_PPC)) {
> > > > > > >      		struct device_node *boot_display = NULL;
> > > > > > >      		struct platform_device *dev;
> > > > > > > -		int display_number = 1;
> > > > > > > +		int display_number = 0;
> > > > > > > +		char buf[14];
> > > > > > 
> > > > > > Can you declare that in the for block where it is used instead ?
> > > > > > 
> > > > > > > +		char *of_display_format = "of-display.%d";
> > > > > > 
> > > > > > Should be const ?
> > > > > 
> > > > > That should be static const of_display_format[] = then
> > > > 
> > > > Why? It sounds completely fine to have a const pointer to a string
> > > > constatnt.
> > > 
> > > Generally speaking:
> > > 
> > > 'static' because your const pointer is then not a local variable, so it
> > > takes pressure off the stack. For global variables, you don't want them to
> > > show up in any linker symbol tables.
> > 
> > This sounds a lot like an exemplar case of premature optimization.
> > A simplistic compiler might do exactly what you say, and allocate a slot
> > for the variable on the stack the moment the function is entered.
> > 
> > However, in real compilers there is no stack pressure from having a
> > local variable:
> >   - the compiler can put the variable into a register
> >   - it can completely omit the variable before and after it's actually
> >     used which is that specific function call
> > 
> > > The string "of-display.%d" is stored as an array in the ELF data section.
> > > And your char pointer is a reference to that array. For static pointers,
> > > these indirections take CPU cycles to update when the loader has to relocate
> > 
> > Provided that the char pointer ever exists in the compiled code. Its
> > address is not taken so it does not need to.
> > 
> > > sections. If you declare of_display_format[] directly as array, you avoid
> > > the reference and work directly with the array.
> > > 
> > > Of course, this is a kernel module and the string is self-contained within
> > > the function. So the compiler can probably detect that and optimize the code
> > > to be like the 'static const []' version. It's still good to follow best
> > > practices, as someone might copy from this function.
> > 
> > If it could not detect it there would be a lot of trouble all around.
> 
> The issues definitely exist in userspace code. Kernel modules are simpler,
> so compiler optimization is easier.
> 
> But I'm not really trying to make a technical argument. My point here is
> that someone might read your code and duplicate the pattern. That's not
> unreasonable: it's core Linux code, so it can be assumed to be good (or at
> least not bad). But your current code teaches the reader a bad practices,
> which should be avoided. It is better to do the correct thing, even if it
> makes no difference to the compiled code.

The point I am trying to get across is that besides the original
objection about missing 'const' this code is not bad. Loading a string
constant address into a local variable and passing it as function call
argument is perfectly fine.

If you get any advantage by the alternate convoluted construct it's
more likely than anything else a bug in the compiler you are using.

It may be necessary to work around such bugs in performance-critical
code but not in driver probing code that runs exactly once during boot.

Thanks

Michal
