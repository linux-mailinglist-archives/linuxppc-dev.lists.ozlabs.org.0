Return-Path: <linuxppc-dev+bounces-14103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE8C4EC8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 16:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Vpw5bVVz2yvP;
	Wed, 12 Nov 2025 02:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762875032;
	cv=none; b=O3ZRDzVCTAfMBJmZMKT/hThaGOXoOfX+FQOkF2P98ENH9GwoD8brFTeS2W3C5Cu3pg1yD330lAod4P3YCm7LcfP88TIjJUxOm7JAtTaCHeoomWgR07uWrJ+G3K5BvXAPJ/vi3hQGVNKPEnTyAMJU80Nv+g90MarqUnEoLyja4c61fceY4t2ux63PKOnoxqL0LwuXdI2B6RJ6qPHJcO6N/v/prKKXZECv3crJ/kae1rKJv1MvpmNwhh3mXPzRtE1GT4Ym9LAWjQI9BTLuiPljb6jSQxPEqiMAgWjHJAA1I1EeE2afSBoZQdGE62e093Bk1sIiGqXRC9THyFdT2Yg7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762875032; c=relaxed/relaxed;
	bh=8Pw/Yf1EyXLxumJHa6e0BLxzdUgB/dz1CtlovqWJ51Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM7MaWh7wSg8NP6Z7nl99t/CY75Hz/7i98mUleSXJIDO2xptB/05CJReYR/gK/cFvDw1nmp66rIXUAR6LVJSNTw0pPkxCj9quBvx9GdePmNGwHGWoQg173y++BKoqCf9iy8zY9rHneXMasltXMICDrbZvpKRPCJRdKb81Wxmdd8F0sDkW9nSpqPAp5Y1CwmWsFzweJI7j47MH1yPrazEpjaRG2ZWurJrdQdvxbO67bmKVe39b971tjhdCtHTBdPa2mEMnSCiQfVWNNuh1EOBMTERbpGvRC5X0DLYqpm2qHrObhMbm8Tgzel17X1QwVkubZwzydfhUUi30/kl45P4Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dShHYiQt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dShHYiQt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Vpv6bcPz2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 02:30:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50D34446FE;
	Tue, 11 Nov 2025 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E53DC113D0;
	Tue, 11 Nov 2025 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762875028;
	bh=JkOquQXq7D/0AkSwonMEbLe8hcwxVugxIK3xFxSoQps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dShHYiQtHGA+ufP4vo5h3F0Xob3mIuE7icZs/Ve89M09D9MuCRNNb+OTZUCX/U92f
	 PGaoyoj4XQ41J8b0VR7zB87qGnrC3UzrRCRX9ft2tsaFiFw6bmVrWguIkk5+XAwcBA
	 +5w0GWz8ntMQS07o7BzHQDmJOWAymQDu27hmN1IxUSkZBgH0p2lFvtyk4mpxuoCheM
	 t7D/F7g5oCcQb+HzyvfxFwglHAqy048nGtxRGiHTuzVX1HR3OnB8aOwJCABUqFJl2O
	 I0fC7CdXp+RAp4WuqUfZHET9vsXmZDtPfRvm1DO7bk4xkHJT+gZs+W81eV5Tm7gcyd
	 X0DCfZmYXXHVw==
Date: Tue, 11 Nov 2025 10:30:25 -0500
From: Keith Busch <kbusch@kernel.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com,
	ojaswin@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	hch@lst.de, martin.petersen@oracle.com,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [linux-next20251111]KASAN null-ptr-deref in bio_get_last_bvec()
 after "block: accumulate memory segment gaps per bio"
Message-ID: <aRNWkWSgsHhlPQXZ@kbusch-mbp>
References: <3349ddbd-ec27-431b-a5f3-de0137d26a4b@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3349ddbd-ec27-431b-a5f3-de0137d26a4b@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 08:54:39PM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> IBM CI has reported a null pointer dereference, while running xfstests.

Thanks, this bug was also reported late yesterday and a proposed fix was
posted just earlier today:

  https://lore.kernel.org/linux-block/20251111140620.2606536-1-kbusch@meta.com/

