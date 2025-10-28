Return-Path: <linuxppc-dev+bounces-13466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13854C16E95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 22:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx3BM1yktz2yGM;
	Wed, 29 Oct 2025 08:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761654607;
	cv=none; b=bmqEuodEv65xgdJmVEBnGxMYNcazHNiQBEhMIjL/AVmOaiFBK3wMszp3XOa7q+AcJi/E5cM18nQ068T1isu47um5YD9UFYXYJIQXhZpWrc5bEflwpBZncQ6SOiQwb3F4mGyVB+Ms8SIz6iicycqyUWE4gsRB47GLIWa0Psitiqt7kseRUueh0xQr2FhPCXtQ7eKT6hyTLJUYnk72XujBQPoaFR10H43ygUxIXOykbuVnm5Pvv21EXtbu7shvRubhrRTf8cjMZO3iUaRrJRbEfyAW+wKljn7JrghiwRc9yNRBciioljgTfmfYcnYYq6v/RV8Hnm7o14EWxNK8FiiyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761654607; c=relaxed/relaxed;
	bh=c64/ih+YNMeV8DMjSToEqXbm+DGIUulF9gBJUxmeHnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhDSq2mOZupG5dVJVUYt1rbnfEBBv0cQtz8Nzzt9VAAgcCepSyvJVYnHqPj0nBFYbf+Rwx3ZaBEotvgVre8QL89kFcWLpeJdQmK8Qt3VzD0CSS4LTkVvTEufDdFWp//Lm8PaMxDJ8V3S4U8F5Tlbt/dbqPP+3qd7tF0uhlqmNBS6+LHkKiviHFTnal6JN9CJj6Oz8USgzY2OEj0PN/LFhIK/i9nG1r/h61MNXX4pTym+1EbXf9cq8/jQlYXwhkQvu6Qt/PXo7kVB5kNJUwxypv5jIIVoH7AT3NlIh381yVPos+yAMJbphCXZivtRDNJg8MFm4rkIz14tpKPj3qmn5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWW+zGjx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=danielt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWW+zGjx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=danielt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwqTB2p1Cz3dW8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 23:30:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CE5661F79;
	Tue, 28 Oct 2025 12:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089D6C4CEE7;
	Tue, 28 Oct 2025 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761654602;
	bh=wCicmv7BX39dNksXr1oTPJr0GBVwAai5qBVQk0rdTEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWW+zGjxLHgwIjrj5giH0k2xl1dJJvu9U4pDgcsD66QUJwYw15K+JUVFYwpoduZZh
	 4huufU9S6GAjSOeV545APhSaz9kdM0nO7ARQfqEb+hKaou/Y2i/cVE08timIH1Kr9n
	 vcGkKDup1BF57Ytv811tSGsonQs+Y1OWNyx1UO1gDxqKA8Oxu7RyDZUe9RjyomsY0L
	 vP53kaAW9VVWau74qx421Yh0d0JzqPCDp3Zo5wmqIhfquf28ZFKmaz8LgDHoR4zS/V
	 Fp4P0Ku33C1m56MeB0hGiC9svx3binWMfkV7ifAoObHzvPRaJwrTyxw1H+Ny6nXIFW
	 pWJ7YBhCC3fCg==
Date: Tue, 28 Oct 2025 12:30:51 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: naresh.kamboju@linaro.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, lee@kernel.org,
	jingoohan1@gmail.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] powerpc: Fix backlight include fallout
Message-ID: <aQC3e5sbGwIpanf6@aspen.lan>
References: <20251027140646.227025-1-tzimmermann@suse.de>
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
In-Reply-To: <20251027140646.227025-1-tzimmermann@suse.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 03:05:39PM +0100, Thomas Zimmermann wrote:
> Fix the fallout from a recent cleanup of the backlight header.
>
> Thomas Zimmermann (2):
>   powermac: backlight: Include <linux/of.h>
>   macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>
>
>  arch/powerpc/platforms/powermac/backlight.c | 1 +
>  drivers/macintosh/via-pmu-backlight.c       | 2 ++
>  2 files changed, 3 insertions(+)

I noticed that both these directory trees are orphaned.

Anyone have any thoughts about what tree these should be delivered via?

Either way, FWIW:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

