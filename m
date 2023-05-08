Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C356F9E60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 05:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF6fS3xSdz3cJG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 13:46:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=sKT5b9Pi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WsQXHezk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=sKT5b9Pi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WsQXHezk;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF6dY6WCRz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 13:45:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BA0763200913;
	Sun,  7 May 2023 23:36:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 07 May 2023 23:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683517002; x=1683603402; bh=vwogukTrBUphYUT11x4lv0tsM1CKNr0H6jl
	9qFUGAk4=; b=sKT5b9Pi7k5FinKQG5vGU+L4+OFiPL6Oftk6LG/iebaVCWlfMBs
	LQh+9RL2V5EzSquLQdX+SFBO85ZE3ToNYXotZGVj1C3KhaE1tlmKkhUtHW8rSOJk
	I7tR9DurqNfXzaPstfjKeaYmQTv8Ye2ZnO0gdqeFi8IA4DTQOenPp1BOMhajjxM9
	58co30Y4h+0Sm2Rd7T2uVyQDdkfijUJZcv8Afy0QaeM9T5cYFP1qMZUZc7kqDjGL
	g0trKYmlqQgUQJG/4Ho6BQUe1yhac0q67SL6ml45rGSi4lHnC9wNDpYCtBctz6DW
	t0yqLCQ7KyNDaErVviTT8Sbgj1hINv+vPHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683517002; x=1683603402; bh=vwogukTrBUphYUT11x4lv0tsM1CKNr0H6jl
	9qFUGAk4=; b=WsQXHezkbl0WcxrWTGQHzpJCCB31DLGm/s9Y64Vtkxg7tcZuW/T
	01pLFCJz1bF/7aSKamYV/zR3ZzBydUIvuzgFNx63uzmQmzmTgEFyiKC3DpvjpN/l
	h9XFy6Uz6vn7re5lu8bTHHmj7Vg4mHv5HMHGtBtpvvJF7S5WOolL55Sjfl+4Ptag
	Otla4XllD9vgsFyD1n7qxKRr1bUro6CayDbsSK3RzaFa/l/UBGayFeMjzXlEn1vK
	U9hQ1YJjq9+syVuC5kX0b7wZoGNCWOUxTmvvsgA127zcCo9NEISnVvUxndK1AQJK
	y0RNoy8jxxFbaluzJJR2+tyC2B+bpOrHt5Q==
X-ME-Sender: <xms:Sm5YZNm3u3WkomTd52K20g-jJtFHUaHKLHiJ0D4ADg_fqNGvkJihXA>
    <xme:Sm5YZI1ZHLrCElKFW8sxOdwbFlVXpae7H60yD61jlrvAvz89iOHtkXViIssCIfMxK
    f3UPUINy5aQKbNIwA>
X-ME-Received: <xmr:Sm5YZDon44G8TShRS8jgNoVWC1aySY5D0bWWrrpaTqOvvw7DI6o663BZVnyklqRc8I7reA8dqi0A55Zpn-vkjt2Ug-k-lLPa1d383iFrn7NjlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:Sm5YZNk7UR3VJLdCOcUW1SUgo3PUQNwSHALdJSuUs8-c71ivXefDNA>
    <xmx:Sm5YZL01qw26gble7d9yLkew4HFKJ2gJ83IpGpmdHy9GzseXn9xDkw>
    <xmx:Sm5YZMtLUJWNZp_qkpLi0AiVi3VdyRTyDAkbudT1YjiCxpGOr6jb9g>
    <xmx:Sm5YZE-JWMSE3H4J_RYdwf9Bnrlq1OUP86n2AxdH63r1M_fV0Cdf-g>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 May 2023 23:36:40 -0400 (EDT)
Message-ID: <f242e2118d3da54413ab5456bb6647dbfb0789ed.camel@russell.cc>
Subject: Re: [PATCH v2 01/12] powerpc/book3s: Add missing <linux/sched.h>
 include
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 13:36:36 +1000
In-Reply-To: <20230330055040.434133-2-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> The functions here use struct thread_struct fields, so need to import
> the full definition from <linux/sched.h>. The <asm/current.h> header
> that defines current only forward declares struct thread_struct.
>=20
> Failing to include this <linux/sched.h> header leads to a compilation
> error when a translation unit does not also include <linux/sched.h>
> indirectly.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
