Return-Path: <linuxppc-dev+bounces-3817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 945319E5120
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 10:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3pm537qRz2yN3;
	Thu,  5 Dec 2024 20:21:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733390469;
	cv=none; b=hT7mK6Z9FKrM4CYBM1gxIa0yIEHUrXuIIQKaLnzEd+eYxTNjMx9/JF9SMVTFYHZcE7s8yZgyarC+yhJ+O0y71f7103/5XvuZ9eXNg8iYEYyDuJY9qYdp54I1bp1FOWRMxiFDXiGKhh+hO+/okkY0d/iiUZ+8SKbtrT78b6BmcNjzBKyCsa4GmL4WjZoqNVWXoN+RTPE2MisPuFlOoagICj6vpSn3GZQtx924Ls1ib8KAzJll66wSv2HXr8nyxjZGVgY00sLwRZbSZosAuglIafPLQziO5NRFgtgXgi8Ff7cenNTm+chQhu8A+qIhqndpNsIlrM9AaT6UNiF7g+HluA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733390469; c=relaxed/relaxed;
	bh=1hYsn3bVYfCdFiaXJuWqS6VAXMhaADSnAeDc/1GJ6E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALXxzhHKHZkTIC7H687NgGp60GKANG3bV4/f8xDzGxbSFad5WOY0dARzwy81/orgNhL1LxZm2/lpClk17y6MaFUXxyn5yRwX8auLjAGFla3CltHzf+256uJsWF2pZeeQA2pClRukWUJ10e0I9KuTrqetza1QKetuHAzK28dspiCYXgIVQPxnbFfHtduCUZN/el5cliN46lba7qAs9nl0t33sbmfeQplVgVtoViaV2k0C+0eTh7Uv3UYoAKy6mk4b7iUMFYO4LzQwm0VVjs0YFa4/14nSkqKG7v2bgOxmBRk1ZZrmpmK3quvcMb1REsdpvZ/Ujca8u8i+cWB8t1S0Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KfvweuEt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KfvweuEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3pm44K7Cz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 20:21:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A45CA42ACD;
	Thu,  5 Dec 2024 09:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A9BC4CED1;
	Thu,  5 Dec 2024 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390464;
	bh=ToTCGlDhZeWb307fMIu1lkFbt/mZmVrs0IkZOqW0GhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfvweuEtbQQYSiPUbmCtKLV+F6lG2isa7yDEEWXoGfN9QcvH2SJ6TAtNu8pBHDojN
	 bZBjlHQG/YZGEyv2Z3P0iD4Z3Flp7P8WOrk8eDWRS3WpsclKGvOtVv3PdLYg0ZbDfI
	 BnYAj3NtWcDR9q7tYripwoy0Q4OHT4awo6LAYFUVP+FaXl3AHsPUAP+Cgp+ad1dGqn
	 I1A5SLnFLN3TnFgzXmS08FJYW0cNhH1vQf5++lAJqKTqHjLlXwO/C3Ud9j7pFKZPKl
	 Pe5YOYiyALK7EYs7FoKODkw788Oms6mlDSLFDRURnFXKBZYahUHdrZ7XEte7dGAJzV
	 adBZUFBjQWhtw==
Date: Thu, 5 Dec 2024 09:20:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/5] powerpc/powernv/flash: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
Message-ID: <Z1Fwe3HhUjaeUS9i@google.com>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
 <20241202-sysfs-const-bin_attr-admin_wo-v1-3-f489116210bf@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-3-f489116210bf@weissschuh.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:00:38PM +0100, Thomas Weiﬂschuh wrote:
> Using the macro saves some lines of code and prepares the attribute for
> the general constifications of struct bin_attributes.
> 
> While at it also constify the callback parameter.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

