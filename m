Return-Path: <linuxppc-dev+bounces-13816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551EBC37ABE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 21:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1xTB1mdtz2yrT;
	Thu,  6 Nov 2025 07:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762373870;
	cv=none; b=cF6klHIsAHZFvTu0lAB62Dhu6tVNMw/L1k4OTDvwMeX+jL/jlVaETy9l1Fi1QQaOZuNiyCS47s2xJ5+sfqHmoNDigbt1oqDWpZ6HvZ987iW6wAR56aY0M6LsWrQPpTjzHEqLiiRtqO8jMSbiDj+fVOiiaczMOuxq2tsTQdF7mKiWsTKyVfdfamAxNUnY4pFfeA01KwmZQ3Q34Sz4gVOD7wxrjvAhUfb6Wtc5UpEQg1iL8u2qeH+/4K83/McwutGn6ZEpZAhZMBFj1OWbUpM1Np/Y/RmtqMf6/egPP/ZdGmD/l7cC3o69CcwAvEckG0d0rzQsomjzN7DWp8L4SNo4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762373870; c=relaxed/relaxed;
	bh=4/2w4fXipzpwKW5lXSWfJEZJyl2vdlyQD4qcaScjJx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKunwe99ulk3nIYOetG4IoOUZjq3jQpXf5KSaIo8VtK2jQkiINzjuxgdnVeFFKag4mPzgixojVxXL5uYr1nVkxWI/8f6GjvSjyA3Xo4vXOi3JutAJ3B39Eipi9iPsPwMo+3t+BQHHXuAMCe3EeFOep0ga0Oeqnjj++xFvsHFuH2/nGGYoiYrKDgvmWX3zIjRoHwXE9zv7fzH09obnKB+Mun0zjkA9+MelUmOYP294xrAe0GzFQOPLPOyvO63QmMPSp+9O3SYOzkOOxjsIIRLfZBqkg9r/9sLbQTZnwlP4ebAH8WsIia61eDM78Vo7LUGQKhC1Ayx01AWvkQ9IwFqxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tj/hHP3f; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tj/hHP3f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1xT943H9z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 07:17:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45044601F1;
	Wed,  5 Nov 2025 20:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637D1C116B1;
	Wed,  5 Nov 2025 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373867;
	bh=WK2n+MqYbpkY3Ap2OmbbUP70qaHyeaITrjrbKMCnnDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/hHP3f9hSkcD1LIbu0U8532tJWTe2zQpS4ZuqdRQW+NLXRsPAm2QMTnshp+2MEG
	 faalOFfnAaYM95P6TDBNwYAeib+xcBszn0WsiEV0hnk69H2TZgJORw9VOP9ZRJUXie
	 kN0d1T6RasQDXCdCNd8BDFmRIqByt5Q+ECNX4YXA0YdmuVaG6vYxso2q8+3XJ67nMd
	 Y5dxsQFPMVWn7t5y91pACrr9E+cHrmCz4CYlZcaH7FteccWZfJgEySou1eYUNiTGhb
	 3wPRf+sSBJRyh47J/JxN1ELxUzpnFhG2eML71/A4dgigLYlnq6I9CML82K3DL0QePR
	 E0M8R9UsB98+Q==
Date: Wed, 5 Nov 2025 13:17:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	Omar Sandoval <osandov@osandov.com>, linux-kbuild@vger.kernel.org,
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <20251105201741.GC3787308@ax162>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
 <aQtISpMElVm7jQ4y@example.org>
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
In-Reply-To: <aQtISpMElVm7jQ4y@example.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 01:51:22PM +0100, Alexey Gladkov wrote:
> Nathan, if you see that my changes are creating more problems than they
> are solving, feel free to revert them.

Thanks for that permission! I will keep it in mind as we get closer to
the end of the release cycle if these problems are too much to overcome.

> My changes were based on Masahiro Yamada's patches. I didn't expect his
> changes to cause many problems. Before his changes, I tried to use a
> different approach. If you think it's worth it, we can return to
> discussing it.
> 
> https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/

Right, I had noticed that in the development history and wondered if we
would want to revisit it. I will have to take a closer look at that
depending on how things go here.

Cheers,
Nathan

