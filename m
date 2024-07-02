Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D9924C65
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 01:50:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=YbFMgg5b;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=pyQNKyHX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDKRB5M9wz3c2K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 09:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=YbFMgg5b;
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=pyQNKyHX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=185.185.170.37; helo=lahtoruutu.iki.fi; envelope-from=jarkko.sakkinen@iki.fi; receiver=lists.ozlabs.org)
X-Greylist: delayed 103661 seconds by postgrey-1.37 at boromir; Wed, 03 Jul 2024 09:49:07 AEST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDKPb1MFLz3cXM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 09:49:07 +1000 (AEST)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4WDKPS3XP3z49Pxq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 02:49:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719964140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90b13T27WVDefVQ9TFMIUOTIGoYWnvBBve830JPz5uc=;
	b=YbFMgg5b3FY0+1jnlR4Ka7QeUfMEIOfYRycIwrqEMrcGjjlEQjzQuD1H0ddxLoffGKGURm
	Zfn/f8jPkBGCc7Tsqtmluytrsb7QJ0ySvSKwtx52RLU/wgHfUf1Sup1tjkA+R1Gqgf7DNg
	GlAsXI04o0lGXdBXVGX60ONY6wbulwAI2liU7AOIXbxEyc9lFVc76nqfUP/R1zL3RnnJ0k
	tjqYMrf55BPQ14TlJcmqeG8VCUfZXmwMCZkRTArnp+JXAtn9ERWf73U8tIzmb7+JN/RI/0
	6LGDbWya5tciHLGqg/kDcNSrEvWyixjhI0SCKvZYHhPXxHE6Ii+DL30HEww9yw==
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WDKP33tvPzyTK;
	Wed,  3 Jul 2024 02:48:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719964120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90b13T27WVDefVQ9TFMIUOTIGoYWnvBBve830JPz5uc=;
	b=pyQNKyHXp39EAf5Qlg0oPHmathCHi9DXuB8SJxSP4UnJjkKXlBJwpqWr150clD70HDqjjB
	W+8d1isZg9nJjodxdv9Yy9+o5pn49jSx/EsP0rdWM8+f+WwH7me/RcI7CmYjfQDm7NoHp1
	RRGMSZ9/xgGQGSPFXdU1LvwYB3sKrHM=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719964120; a=rsa-sha256; cv=none;
	b=dIV5AhFDjU0eFidNIvVfjBgVwP07smKHAjGKaDFD2/b9VOi6T3xvX5gueQ7bDeqdVkfAz5
	axjvq8NAAAmFz7FthJsjSsp3l/4zrpDmYrUaivn6BFPVgYGCpZCAwr66vQ7yHZXe59DTKp
	4Uy44jpNG1LCq3OPg2EeYR5jQtclOpY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719964120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90b13T27WVDefVQ9TFMIUOTIGoYWnvBBve830JPz5uc=;
	b=cqjXrtof80qPRszwXMneHjrKuZT+XYUAXgsHM0qfCgfczmSXpD+RRY4qy7yAJgYLTbrBlt
	dsIX9PXJq1RF9m0boyXJ/KFP2Dec6rRo5DNN3ylWXge0yyn3whuWIsGQWxf+ohI8e6NOYp
	735GZdN11M1phMS9bIv3+poJf6wItSM=
Message-ID: <b7559dbb323d16fb334f8f8f35b8fda3fb6e481c.camel@iki.fi>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Stefan Berger <stefanb@linux.ibm.com>, Linux regressions mailing list
	 <regressions@lists.linux.dev>
Date: Wed, 03 Jul 2024 02:48:37 +0300
In-Reply-To: <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
	 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
	 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
	 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
	 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
	 <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
	 <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-01 at 15:14 -0400, Stefan Berger wrote:
> Applying it is probably the better path forward than restricting HMAC to=
=20
> x86_64 now and enabling it on a per-architecture basis afterwards ...

Why is this here and not in the associated patch?

Any, what argue against is already done for v6.10.

The actual bug needs to be fixed before anything
else.

I can look at the patch when in August (back from
holiday) but please response to the correct patch
next time, thanks.

BR, Jarkko
