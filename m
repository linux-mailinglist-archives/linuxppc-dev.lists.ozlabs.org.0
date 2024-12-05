Return-Path: <linuxppc-dev+bounces-3818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0D9E5124
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 10:21:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3pmN2f34z2yK9;
	Thu,  5 Dec 2024 20:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733390484;
	cv=none; b=B5puQ5Q23CUpSuPORZeeG8o5xMe6/NFk9rTy3QBTijU3cbCyT5IULXH3SwGbqYpzIJhg9JYVyZ9B16s0q3vJ9HZAkmCvU+7SH7/3WDgYI6/Uis9Vs0haGznsKmMswYoa41+2WjEGzdcgfJy/VC/+PGHhFw0m4Lm0gqpiMorLOwoMfMwo7p57C9W8+qMvwleE4opY1plIrthedOtFe0y2QoYZnK0orlUVY/iqOtGUjMfRkfL9rXOpoIXo+uUctiwC3Qgm7bdn6/j2W/KmfcIyrJwkTDJI5hXMRomWfWggMAnc2sFa1TFDUMKOZlfHOPS0KRZscQ815y+uk7ceAS2FeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733390484; c=relaxed/relaxed;
	bh=Np/1mZ17mjCZZtK7BVpoMSKvqJi/u2AVMtcYiX3ChHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMkgk69kxSMFkiwlU3sANltfMIkUvfWWXVsaIpt2ZhOnuPVOqlmP+8AF0UUAz9T4b+3QGAp54a6YhV/TIwQjd5x5HXdsPCk7DnGEHiwE0tLMqAzy74xxCBM/S6FGpaLZUblOxC2jxffarc4AsgR34yJ2igWXpXssIyO/g5l8+1i31qmPqTvAdXo69wjbqOF2I/RYUt8NI+4Xuug+YlCuSAcu8wu+9wZWdYlFVJaGQb9J7sYrP/Z6KavNfJEX/Qc37naU5JGktOdpCgH9S1I+KuRTgSyFHzO9tXp+uRPk8AC4LeSTgk6vuYkzfzXNup4Uzf7d6lo8S1CMbqFEsGA1Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbH12lnG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbH12lnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3pmM3c2Jz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 20:21:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DBA3A42ACD;
	Thu,  5 Dec 2024 09:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261E3C4CED6;
	Thu,  5 Dec 2024 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390481;
	bh=McHjG8OwZGNDnbXe/yojBntjPI6YEZb2UANyYbLxMlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbH12lnGLu9H2X+Ru0wugobk/9MZivqUr4dXb2LHFMt8RQ66l69u7FLE6GiP75CBZ
	 NdwgKDL6TeV5t7oARPMgPfTCoKMwv9W8rb/dftYdYOvJc7BfQKJK6vUex3D2ENIVcP
	 IRBJ2SUchudMMrxep1Q45YalEsliZLXIIuguGybOdB30HhHaFHvz9VJ1Nh1zcNdoNr
	 cvgB7TUS2D8uRI1Oa1l2L3eXVhGdYrE5uebRFkbxydJckjH4kBI1Vv54YTRtr51QIw
	 W9/Co4Uw3DLYlYjOD/1uHqm0hFeKQFNGkDUaRPgdOyWn16oJ94jWA/pU4TZGizyM4B
	 vATnI1xcX0t/g==
Date: Thu, 5 Dec 2024 09:21:16 +0000
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
Subject: Re: [PATCH 4/5] firmware: google: gsmi: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
Message-ID: <Z1FwjMaeNQINYPRB@google.com>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
 <20241202-sysfs-const-bin_attr-admin_wo-v1-4-f489116210bf@weissschuh.net>
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
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-4-f489116210bf@weissschuh.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:00:39PM +0100, Thomas Weiﬂschuh wrote:
> Using the macro saves some lines of code and prepares the attribute for
> the general constifications of struct bin_attributes.
> 
> While at it also constify the callback parameter.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

