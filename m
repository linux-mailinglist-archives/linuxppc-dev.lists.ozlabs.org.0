Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8B4E4507
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 18:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNJK75YQJz30BL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 04:25:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DyoOoVdY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=DyoOoVdY; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNJJT30sGz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 04:24:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qYXsicOZSjgl5ohKK5E1ZuJbpsruLDa/pvOZWrwipTE=; b=DyoOoVdYB6oYCjvrmtRIcgoUpQ
 T0Yvuslgm/EFQM/MuVZIuvEkWDKsaM+yRLbFKOZk8LJHYbSvGyN+zIW6SZGGtlDD+hDQMYnMp/6Zl
 sGSB+zc5HOzQplv+CTNGd6c8cdpHQBZuf0LsnW80ej1BPbVDaOXGJH+jwULH0JeubiUt+nnUszlqc
 9MJlM/YypEag2SAgnF/9LLh83QovEebxI5d4NhK5Zgcl+GfQhA5QTWZpgFco3II6sqPt2Jyc1JwG0
 tT1F8rK5k/UVQPCosWt56otYcw+Y+/11PJTtrfdIX0beKIrO7r0lgRKrD8+e0WqgB/w9UMCits73u
 BqRShRWQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nWiFF-00BinQ-3R; Tue, 22 Mar 2022 17:24:33 +0000
Date: Tue, 22 Mar 2022 10:24:33 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 0/6] Allocate module text and data separately
Message-ID: <YjoGUfHa1WgYWiR1@bombadil.infradead.org>
References: <cover.1645607143.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645607143.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Aaron Tomlin <atomlin@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 01:02:10PM +0100, Christophe Leroy wrote:
> This series applies on top of my series "miscellanuous cleanups" v4.

Queued onto modules-testing! BTW I just had to rebase the change
with the kdb changes, it was a trivial change.

  Luis
