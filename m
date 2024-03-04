Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E7871144
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 00:42:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=C8+DI2f+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpZxm5dCTz3cgJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 10:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=C8+DI2f+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpZx33xcKz307y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 10:42:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90A736121E;
	Mon,  4 Mar 2024 23:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54BEC433C7;
	Mon,  4 Mar 2024 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709595731;
	bh=ODwOIJnsoYs+tJJkR4iryVyJ94Y2iXW5AzaX0Y/ymF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8+DI2f+U1Q5qSovuUQRTgF394V3BApAvw58oB8pVEJobwGWAxfp8K0NOuRoR2UE1
	 Mx0E3R1ykV0mDUzu7P8md/Sk1Ew81aLHDbPamtuAzDHAEf6qM4P2ATyID1O+MkQxaV
	 Mfpfy4PMzQWJLT2qPlNBJXvbInVKcLZ7W6EaynvY=
Date: Mon, 4 Mar 2024 23:42:08 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/11] misc: Convert to platform remove callback
 returning void
Message-ID: <2024030453-charter-villain-8393@gregkh>
References: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
 <d6c4ff9e-756a-4604-993a-cf14cfdbc53c@app.fastmail.com>
 <p2rqzrmgfaqdcwj2hlgt7u2yrgfrf4dwizecicdpdmb3jezoky@zmkxw5vt7qyi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p2rqzrmgfaqdcwj2hlgt7u2yrgfrf4dwizecicdpdmb3jezoky@zmkxw5vt7qyi>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "derek.kiernan@amd.com" <derek.kiernan@amd.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, Frederic Barrat <fbarrat@linux.ibm.com>, John Stultz <jstultz@google.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Justin Stitt <justinstitt@google.com>, Michal Simek <michal.simek@amd.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Amol Maheshwari <amahesh@qti.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 11:36:23PM +0100, Uwe Kleine-König wrote:
> Hello Arnd, hello Greg,
> 
> On Wed, Feb 21, 2024 at 02:52:29PM +0100, Arnd Bergmann wrote:
> > On Wed, Feb 21, 2024, at 10:53, Uwe Kleine-König wrote:
> > > Hello,
> > >
> > > this series converts all drivers below drivers/misc to struct
> > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> > > Provide a remove callback that returns no value") for an extended
> > > explanation and the eventual goal.
> > >
> > > All conversations are trivial, because their .remove() callbacks
> > > returned zero unconditionally.
> > >
> > > There are no interdependencies between these patches, so they could be
> > > picked up individually. But I'd hope that Greg or Arnd picks them up all
> > > together.
> > 
> > These all look good to me, whole series
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks.
> 
> You (= Arnd and Greg) are the listed maintainers for drivers/misc/. How
> is this series supposed to be merged? Would a pull request help?

I can take the patchset, let me catch up...
