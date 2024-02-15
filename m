Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39A855C36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 09:19:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RI2mOhZe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tb7JJ5bslz3vX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 19:19:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RI2mOhZe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tb7HW64zrz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 19:18:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76809CE2567;
	Thu, 15 Feb 2024 08:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4366EC43394;
	Thu, 15 Feb 2024 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707985107;
	bh=NEWD24GsuqxxNTq5YzGqWj/5Tc8Dg9+/4oyhQh0vAoc=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=RI2mOhZerlcJeWdxcgS9GAF0WVcFz0gTdhizDRZrhvX7nbJ0dQmULNaS5IMxZ60vB
	 Ho0x0k6qUX3D2khqcpIUoijc/1NtJulkMAMThldsJz8dUmJWUfogSDYu0Y1cl67Tqs
	 7X7AWDGj2xVaFuCQTiF5+drthE+6VOuRi0EA+7+tOEgX5w4oFqTatq9MR8stbYWTT0
	 YYtzze+07Kuq+lcTk2tBRl8T6oPHuxMnEYr53fLML3ZJivwuPtTSUQ8YflXSBVReen
	 Qf3jkSEp6svCGEHxSK9k0amZcgDoKC65zD3xZQGsGhC1JEKataG+bIdVSKLx+fdvKk
	 +AdFi8ftPfenQ==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 1E8601200043;
	Thu, 15 Feb 2024 03:18:26 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 15 Feb 2024 03:18:26 -0500
X-ME-Sender: <xms:0cjNZfYo_g1Ix0DrwBz4KuX7VjNNIZyEdOV6Xg3RnAP2TyhBT5pFYg>
    <xme:0cjNZeaQwqznnRtCmDDh24_BwM7Kf5pxIbgz4hgSQd21fJCsBfQwvJO2n6uwLAMd3
    2e0XmzLvthFrjGKiL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeehudeg
    tdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:0cjNZR-ublyObQJz1iE8rnJF74bbYQ7RrcFM5O85-96YzrmfeMPsBg>
    <xmx:0cjNZVppB3c9IEdcIGGyixY2tNCgZafVkxRPMRL-3GbB6GaPOLkg-w>
    <xmx:0cjNZap7Cr7HWUYchY1gQBGq7Bamp5hrrltYjxZkvcN5MNtbzKJtuA>
    <xmx:0sjNZaIgKj11PS-xose-909MYx-2SKodFSPRK6cLQkXBEsMkT3Caf031sI0>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8DEBCB6008D; Thu, 15 Feb 2024 03:18:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <aa657f01-7cb1-43f4-947e-173fc8a53f1f@app.fastmail.com>
In-Reply-To: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
References: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
Date: Thu, 15 Feb 2024 09:16:29 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Peter Bergner" <bergner@linux.ibm.com>, linux-api@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux vector, entries
Content-Type: text/plain
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Nick Piggin <npiggin@au1.ibm.com>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024, at 23:34, Peter Bergner wrote:
> The powerpc toolchain keeps a copy of the HWCAP bit masks in our TCB for fast
> access by the __builtin_cpu_supports built-in function.  The TCB space for
> the HWCAP entries - which are created in pairs - is an ABI extension, so
> waiting to create the space for HWCAP3 and HWCAP4 until we need them is
> problematical.  Define AT_HWCAP3 and AT_HWCAP4 in the generic uapi header
> so they can be used in glibc to reserve space in the powerpc TCB for their
> future use.
>
> I scanned through the Linux and GLIBC source codes looking for unused AT_*
> values and 29 and 30 did not seem to be used, so they are what I went
> with.  This has received Acked-by's from both GLIBC and Linux kernel
> developers and no reservations or Nacks from anyone.
>
> Arnd, we seem to have consensus on the patch below.  Is this something
> you could take and apply to your tree? 
>

I don't mind taking it, but it may be better to use the
powerpc tree if that is where it's actually being used.

If Michael takes it, please add

Acked-by: Arnd Bergmann <arnd@arndb.de>

      Arnd
