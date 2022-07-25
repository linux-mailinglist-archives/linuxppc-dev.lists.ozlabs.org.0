Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3257FC3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrvdN0s1cz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 19:19:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MRG0sLK8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m+A1w/lC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=bp@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MRG0sLK8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m+A1w/lC;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrvcg6wGhz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 19:19:15 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97BD0350E8;
	Mon, 25 Jul 2022 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658740746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8+OPz04Mm3bqiVDA6mAcu8D6mVOL+XugMvcUTMr5wA=;
	b=MRG0sLK8VVefxC1ixuMHbOSAJj1mdrVx3NtwXrBkAn+ENDSVo2B8cwX0kgEAT0UtSwDx8c
	X2hI07bPbyxhcwaAsR1lLIEr4nKskRITLsgPUtZqN0B9fbuOYVOPCEyhu7a2/RoFe5CerK
	CayaZFQExQIq7UbL2bf6HmONxfqRR9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658740746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8+OPz04Mm3bqiVDA6mAcu8D6mVOL+XugMvcUTMr5wA=;
	b=m+A1w/lC6xockiwf/C5RpRUq38XogmmzGrWkYdsGEXLNctMtGxpXHzUVE7fuMuNvatsEP/
	p3gwdOavldQGtzDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DBB613A8D;
	Mon, 25 Jul 2022 09:19:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sHdUHgpg3mIrDQAAMHmgww
	(envelope-from <bp@suse.de>); Mon, 25 Jul 2022 09:19:06 +0000
Date: Mon, 25 Jul 2022 11:19:01 +0200
From: Borislav Petkov <bp@suse.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3] random: handle archrandom with multiple longs
Message-ID: <Yt5gBZe9F1BE0MVF@zn.tnic>
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719130207.147536-1-Jason@zx2c4.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 19, 2022 at 03:02:07PM +0200, Jason A. Donenfeld wrote:
> Since callers need to check this return value and loop anyway, each arch
> implementation does not bother implementing its own loop to try again to
> fill the maximum number of longs. Additionally, all existing callers
> pass in a constant max_longs parameter.

Hmm, maybe this has come up already but it reads weird.

If I have a function arch_get_random_longs(), I'd expect it to give me
the number of longs I requested or say, error.

Why do the callers need to loop?

If I have to loop, I'd call the "get me one long" function and loop N
times.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
