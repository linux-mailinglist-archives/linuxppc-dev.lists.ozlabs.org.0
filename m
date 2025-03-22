Return-Path: <linuxppc-dev+bounces-7292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96130A6CCF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Mar 2025 22:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKtX14Thjz2y34;
	Sun, 23 Mar 2025 08:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=62.142.5.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742652568;
	cv=none; b=m7ZrQ1U7nEW12yGT+b3oM2qfdfWZETAw/yhuPquftXvYRZ6Bjhn5WUcqqnL1sWYOEYlf+8DgVaWn57pfFOXIOUCIYD1qKjQhpzWRbHQC3M+LRcRzccPGvXU19L0UwIdh+JvP9ptAYoPBtRiFx09NPsAq4SXBBetAf9xij2eTgJbvHSY/qvpbys7dgZo1/cH5XNJfLo1jE6m4keEcD/QTQLrEi4XfIfu4N/oNISKm/df5Htsrye1YjyL9uy6rddA0UjVkE6Af2PI6rpq/La64IzdAN5THsfh3jZqz/9didDRJmZIR6cbSOwBvu9egjgG3lDjlx5E8X7Mok7bBpFQpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742652568; c=relaxed/relaxed;
	bh=WdyMVZL/XoIjJIfSF6odz91zKn6v5csFVreIdNGqfRc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuX2OABUiQ9a/AOpa74xdk+co60B4EEsSyKMF4ur3G+aTXimPZTunBah5lqtPYVo1XLOYjC8OlKSl+vMgrgmOt7PySWJxtvHeInK7lU+GTtZ7sVth9tpFGuIWOzOt88nx8uXwMJih4Q6YMWOqNwUmb9Zr5MYDprijtMmN0zdZoDkDMby8kR1LF+kvPI+x4Ep8rUPWe8FZAvhte8KnjO3SafoQiMMCZUDyjkZkhNnZXmq4x/D5qbHjYmK/W/uzPQvftRkbwFwGs0AklJ3eaBPUlv7yQRZX3hzhTjj1n+xAOm0XXnj4I5+ZmMkwkQ1LoelfdDkOdQcUbc5V8pplQmy4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=softfail (client-ip=62.142.5.81; helo=fgw20-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=62.142.5.81; helo=fgw20-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2708 seconds by postgrey-1.37 at boromir; Sun, 23 Mar 2025 01:09:26 AEDT
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKh5L3f5vz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 01:09:25 +1100 (AEDT)
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id c7ad57d1-0720-11f0-95fc-005056bdd08f;
	Sat, 22 Mar 2025 15:23:04 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 Mar 2025 15:23:01 +0200
To: Andi Shyti <andi.shyti@kernel.org>
Cc: sven@svenpeter.dev, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  0.0 DKIM_ADSP_CUSTOM_MED No valid author signature, adsp_override is
	*      CUSTOM_MED
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	*  1.0 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [andy.shevchenko(at)gmail.com]
	*  1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
	*  1.2 NML_ADSP_CUSTOM_MED ADSP custom_med hit, and not from a mailing list
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [62.142.5.81 listed in list.dnswl.org]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
> Hi Sven,
> 
> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> > From: Sven Peter <sven@svenpeter.dev>
> > 
> > Add the missing register bits to the defines and also switch
> > those to use the BIT macro which is much more readable than
> > using hardcoded masks
> > 
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> 
> Just this patch merged to i2c/i2c-host.

This needs an update as well. The proper header for BIT() et al. is bits.h.
bitfield.h is for FIELD_*() et al.

-- 
With Best Regards,
Andy Shevchenko



