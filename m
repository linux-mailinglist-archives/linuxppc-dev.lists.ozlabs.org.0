Return-Path: <linuxppc-dev+bounces-853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8A967D50
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 03:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxrfS4kTfz2yFQ;
	Mon,  2 Sep 2024 11:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725240320;
	cv=none; b=MMISCiWYzgIczkgl9uV5p+i9rOlBWp1uVE04FPmUnBgFaAxDMeekqpnlr+FhYd6H8eKAC/cjSebxf6E8kD/dRKdREdLyFsdk1tZutCeD2Ii8Vk8q+tEivjUSGbveZgwNWOeEW1ehRADtP9N9js/03iaIPtFZ2PHB4Ntly/iM3oww7xtxzmYjnzvwHxTbsfyjeT24xe5xD8gu3ye4fxvZFWlXCf1ofyDdO8MvUsj59sy6H4HciYFtBGVfmPDlBsMnZNhXvjQGWPn46CkeUT+jylR7lJlfew6YQ31lTLfcaDbAJc3AiS1z+3o435clkbGUDQLGg/E7NrRIopZkbEysaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725240320; c=relaxed/relaxed;
	bh=2K7OHgvBC0Jl0NQ7ZSPU3UBUGrLsQruG/gL/a9e9DwU=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G4BOq0qlYVutZZp9GdXnDtQVcSz1v02gPKZNNQVDO/sfK29QAmt7ERI+2Ru3otuTnzxs7MXMemjEXFkP8Q69Rsmty5cJrj5KD4xzkI/HLQDw+oePyLs6AclDIWCpRat3I5zA6dX8OERI8ZSw0CMTQNAJAnRlC8xwLvF4WPoF9UC/C9udETJczNZULiME65NagYq2qUyeouUBOVuLZ1AoU77LrVRN3q+O1BVcHrwmnel2TrIJjuAAidt8ZcvoqNwdHzWT0LV94Bu38Sa4z54xASDnsQq8oRHDdxzYffITjPIFGVQQUjx37ZKvshSRm9ZjPU+85kGDtcys1ve3kJQdew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=UkpW38Oj; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=UkpW38Oj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxrfQ682rz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 11:25:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAC825C5492;
	Mon,  2 Sep 2024 01:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078B3C4CEC3;
	Mon,  2 Sep 2024 01:25:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UkpW38Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725240313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2K7OHgvBC0Jl0NQ7ZSPU3UBUGrLsQruG/gL/a9e9DwU=;
	b=UkpW38OjKk2A4/02WiGW7XVS2vw3SmZK8YoiNJT+UpI11nCwPq+vprgkRlh+gYiOCqGs2k
	XqoUdACWl3D7P+JTYUgkJEZ2agwouBTGWlz3uEF52/Oa46/xSMTMvrbxAJEUCR9rUU7dps
	i3YuNCm+RMBRSIQ0bFx96eqpQ3D5z78=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9764ebd9 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 01:25:13 +0000 (UTC)
Date: Mon, 2 Sep 2024 03:25:10 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: vDSO: Also test counter in vdso_test_chacha
Message-ID: <ZtUT9t_wr96S2mJe@zx2c4.com>
References: <f9f64c5ded3925ae408f01c1c61e2fdf6f645a71.1725212364.git.christophe.leroy@csgroup.eu>
 <ZtStjU_3K9yIJsmp@zx2c4.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZtStjU_3K9yIJsmp@zx2c4.com>

On Sun, Sep 01, 2024 at 08:08:13PM +0200, Jason A. Donenfeld wrote:
> > +	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
> > +	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
> > +	if (memcmp(output1, output2, sizeof(output1)) ||
> > +	    memcmp(counter2, counter2, sizeof(counter1)))
> > +		return KSFT_FAIL;
> > +
> > +	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
> > +	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
> > +	if (memcmp(output1, output2, sizeof(output1)) ||
> > +	    memcmp(counter2, counter2, sizeof(counter1)))
> > +		return KSFT_FAIL;
> > +
> 
> Why repeat these two stanzas? 

Ah, from your commit message:

"The first test verifies that the function properly writes back the
upper word, the second test verifies that the function properly reads
back the upper word."


