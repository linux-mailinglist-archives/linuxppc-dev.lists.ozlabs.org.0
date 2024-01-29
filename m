Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF82841409
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 21:10:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaSmdo7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNzv53Pp7z3c2b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 07:10:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaSmdo7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNztH5Cp1z2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 07:09:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CjXxVViu2m/Opq46i9BO5RAH1W1zGxIwhMJxClwKauE=; b=xaSmdo7sn5dI7eoYOssTyzogFC
	7pSfzcF0ewY6UsxvkTDmRGlB8Wa4EKlIt2tHWkAmVX5iqyMxRq9LcngsFMzs6UW3c78SeF9JA6pfA
	ehP3VRDE900eY25bMV15hnBIk4zsnfB4mBLOXErjXw8VZR/BwqLnGE3X2l2KJ8CnHjFV9POxNKl96
	AKa86I3MkrKav9nOU4eRwtJr4ESDM9Cg/qQ7xAOAvTTMJ4p2VJcq6P9IyiXrJaiFZyzjC8DSkVSJr
	80EdeREb6GSoWO4JZpWcu3cb+g5JkF6se4h+MN48sQoOTn0yu/u+oMLKk7D4yA5VGtXxuRwhfBioo
	cNzpNxYw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUXx0-0000000ED41-1o6Y;
	Mon, 29 Jan 2024 20:09:50 +0000
Date: Mon, 29 Jan 2024 12:09:50 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Message-ID: <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
> Declaring rodata_enabled and mark_rodata_ro() at all time
> helps removing related #ifdefery in C files.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Very nice cleanup, thanks!, applied and pushed

  Luis
