Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE0F53303D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L72Pp38Qbz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:13:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JKhfeDp2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JKhfeDp2; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L72PC1SWzz3bZc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 04:13:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEE1FB817F2;
 Tue, 24 May 2022 18:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D58FC34100;
 Tue, 24 May 2022 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653415978;
 bh=KKmMzhfMf2IUd80WmWmo3TqKi63TjvQ6ruuivE274NE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKhfeDp24SV7L2MG5nT3JiaoEWk7MC6y/f25RRCQNNA885YCRwhNSQOAK1HuTXtMW
 x0gruMGOJwK1JtKvfnjDrCJ/LP6hd6kgiXO5VJZFMdP6L6i/+oPA4Ng6Cs+IWDUvqJ
 CLVizSwmt5oIdFUAsr/HuShZ5fOeRIxjBqfneZLqcDuOFcRkK5COjRxxL7jBda/+1N
 /XCx46wQhIhZYtXatGNW4c7JWCgsBTRIxygEoM6vfYnbN68D2viVOqshKshd5o4Hjv
 5bBJcgS/QTh3RCLrQrR5Xtxafl3bR1M98AllZHWSE62zLXaBTGnKNf1cxd1BJDXcUL
 B5Mn4Vast99tA==
Received: by pali.im (Postfix)
 id 37C6F9ED; Tue, 24 May 2022 20:12:55 +0200 (CEST)
Date: Tue, 24 May 2022 20:12:55 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220524181255.bmszzxmbwzv7zed7@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220524175955.GI25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524175955.GI25951@gate.crashing.org>
User-Agent: NeoMutt/20180716
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 24 May 2022 12:59:55 Segher Boessenkool wrote:
> Hi!
> 
> On Tue, May 24, 2022 at 11:39:39AM +0200, Pali Rohár wrote:
> > gcc e500 compiler does not support -mcpu=powerpc option. When it is
> > specified then gcc throws compile error:
> > 
> >   gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> >   gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> 
> What?  Are you using some modified version of GCC, perhaps?

Hello! I'm using official gcc version, no special modification.

> No version of GCC that isn't hamstrung can have this output.

gcc for e500 cores has really this output when you pass -mcpu=powerpc.

Upstream gcc dropped support for e500 cores during development of
version 9. But you can still compile and install gcc 8.5.0 (last version
of gcc 8) which has this full e500 support.

Really, you can easily try it. Debian 10 (Buster) has gcc 8.3.0 in its
default installation and also provides packages with cross compilers.
Just run 'sudo apt install gcc-powerpc-linux-gnuspe' on desktop amd64
version of Debian 10, it will install e500 cross compiler.

-mcpu=8540 specify e500v1 and -mcpu=8548 specify e500v2
