Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE76562E72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 10:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ7q74X11z3drM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 18:37:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JZ7GDg0i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=1wh/=xg=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JZ7GDg0i;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ7pV2ksTz3bll
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 18:36:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FAB3620C9;
	Fri,  1 Jul 2022 08:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D86CC3411E;
	Fri,  1 Jul 2022 08:36:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JZ7GDg0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656664588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5YHK9JUQuRQtxBfWqZdXtRChtOLIrGNgp/fqMbmHZpQ=;
	b=JZ7GDg0iF4bpFyUdLBJI4wiLvs9e/qwYUz6udFAlVDGhcr9WcQXJBaswrvYxcJ1lzRCTSR
	hYfa7rVxZaaZaTccJoyfKn8wepUNxAdSEJciDcyRLAQHR/tLUxp3RHFcEnVWqjL+tjCHIb
	Fsl8KvsKpc/hVwSTqJfrrfbu4AQgeWc=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 108ef2c9 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Fri, 1 Jul 2022 08:36:28 +0000 (UTC)
Date: Fri, 1 Jul 2022 10:36:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 0/2] powerpc rng cleanups
Message-ID: <Yr6yCukbkdOM2Ua7@zx2c4.com>
References: <20220630140108.129434-1-Jason@zx2c4.com>
 <DFCB9812-6138-400F-9AF8-DE18B61C3667@linux.ibm.com>
 <CAHmME9oJuFzoQ7ARuMQd8AKpofUWEnFauRCxJbvymrp8cWj6fg@mail.gmail.com>
 <c075b458-a348-40b2-9f9f-c7daacba98ac@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c075b458-a348-40b2-9f9f-c7daacba98ac@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 01, 2022 at 07:24:42AM +0000, Christophe Leroy wrote:
> When DR is set you are in virtual mode
> When DR is unset you are in real mode
> 
> Extract from documentation:
> 
> DR Data address translation
> 0 Data address translation is disabled.
> 1 Data address translation is enabled.

Thanks! So I just had it backwards, no wonder.

Jason

> 
> 
> Christophe
