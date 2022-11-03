Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA261732A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:02:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2kT25nrzz3gJW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 11:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATzSz2iz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ATzSz2iz;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2kS62hghz3gH1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 11:01:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1GDFUiaQOnUEwBEjrHMiwUQTpUwTIiBSFbBYYstcP4Y=; b=ATzSz2iz1miGTtiAXaFPJZhr1S
	85kvS2VTjM65koeayNKE48R7xTlB/9ooJ25y/M82JyqGPiGzBR1saFvaIKZeDP+txmwCxWNs11b/B
	oRA0ws0RN6X5yogkPs7nNQYrYXt0IuKdQxdxmR66rZ20ixDFGZztBo2OTegacllOju8DI27roSM+q
	3uI0EYnjQUtf6PeX5KPsD5YBaSkqOGs1j7r+O5Nf7GMxpzFNjloYA9/cIdk+zyAgiuaLzMuLftzxN
	0N3jvGVNQvQVNBY51WVUt/ftaL+Pqp+TltO9Ku3d/7I0aaKfnZjBFlFCc2EKWtZowVYzgCodRx/Dy
	BvjwEUJg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNfP-00FFwB-DD; Thu, 03 Nov 2022 00:01:07 +0000
Date: Wed, 2 Nov 2022 17:01:07 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 0/2] powerpc module arch checks
Message-ID: <Y2MEw6BruH3FnYL/@bombadil.infradead.org>
References: <20221031120733.3956781-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031120733.3956781-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 10:07:31PM +1000, Nicholas Piggin wrote:
> Luis if you would be okay for patch 1 to be merged via powerpc or
> prefer to take it in the module tree (or maybe you object to the
> code in the first place).

Looks good to me, and nothing on my radar which would cause a conflict
so happy for you to take it via powerpc or I can take it and apply it
right away to tricke / get tested on linux-next by tomorrow.

Let me know.

  Luis
