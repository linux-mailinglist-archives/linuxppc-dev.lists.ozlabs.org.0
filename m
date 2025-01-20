Return-Path: <linuxppc-dev+bounces-5393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93043A16C92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 13:54:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc9K51JqTz2y92;
	Mon, 20 Jan 2025 23:54:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737377673;
	cv=none; b=cnW/AqyEHCxlw15DoU4SK/LzLSedgg9lcWTj/E4Pk7pEB+CiDOml9hLElUHWz8wsjGiJsSfKcCgGdb0zc1P37ItLyaOrOHXlSPzyDQrC37IGi0oFVDue8YbHWSSITbT/Eniz8+xzBJWvCLp10pb6FBOb87JKPujCWxxqExtzTHSoAVfIgBcnvS2siN0hSxLuc9AAhQM/LTcbIPG3VF3qnLUjB0+9J6n/MmcFDN4apQRQ/02ny0bo21J5ovVrvJnE5EFwLZ/UI3u28Z8FsuRhn8cwCYlmWRGRtroozGXYL0BTA/uboqopGoagASncujbFzwI52fm8ic4AX1L2fssWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737377673; c=relaxed/relaxed;
	bh=dENmDQuJs1xXFdoO9XY/CuTPv0FcoxD3ePEE0cuT3Sc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZVXlB29hf0MxbBmrHJxtNiGkX2FHHhWO70TbYUGqq1zYJ2O+zOlHoqvxnjDjej4ULjfOnE+fG4eBbsf28bB6CtsNbfnAZsf0SoxVrOtvM4DL+cMMiOWx04Mn6vyCCPcwtxKl6lOWWWru9D13RemMIcSluTTQPc4JCEaLUlEma1hN8/znFiQ0zYEnfzba9ZkiMq2nH/aKVwnc6bFTAuv1Q7jbDZCa88nHiaUqk1zgetHfPHXN/iaLP1VcZlKcSfxr92gOAyADVX0BVTDFimQQpNA4QHwUQYagJBYxryZxekJm4Dl2uxvV0UH/ODteOeb8O1aWrBdMn2Jjk3nDpKsw+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=UJA3fAtR; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QvFBqHqQ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yoGroTVf; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tGzZg2l+; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=UJA3fAtR;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QvFBqHqQ;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yoGroTVf;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tGzZg2l+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc9K338Ntz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 23:54:31 +1100 (AEDT)
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7CBF21120;
	Mon, 20 Jan 2025 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737377663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dENmDQuJs1xXFdoO9XY/CuTPv0FcoxD3ePEE0cuT3Sc=;
	b=UJA3fAtRHyBiyNsNFtuZ6b1LvgrrGS8JvoZY6kg61DdCknQrzF81nWncWt684NuK/sQ74q
	BkfoJzWYooX9nadWj39H+v4OMLNLTyhgKqI17X2d6jO1VlF6Dhyze3v4KnLax/PhW+lMcU
	KAQtHZiE5YIFHzyxYmn3isj9Fl+zIzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737377663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dENmDQuJs1xXFdoO9XY/CuTPv0FcoxD3ePEE0cuT3Sc=;
	b=QvFBqHqQKUV6FaWuReKnInGYqqerx3MNqbkdsiLvcaxs57aAog5rQxcgCErlYbmLI6gMrP
	GxIZj+tXnW6JRzBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737377662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dENmDQuJs1xXFdoO9XY/CuTPv0FcoxD3ePEE0cuT3Sc=;
	b=yoGroTVfoeof3PR/+HOq4a5PuQzt+cEglOhzznMQdb22FtUbh/cdlc/82uMB7upPzMTCq9
	6LJtYXAKxVZF678sKO+uhMuqzU7vpCnGn8E3nwHq8MOUCMY8N1AJUH7kt5zx0oCSeRNuam
	/BzuZeQMU7srxy/WR9mhMzJhHRtsoMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737377662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dENmDQuJs1xXFdoO9XY/CuTPv0FcoxD3ePEE0cuT3Sc=;
	b=tGzZg2l+gsqIeqmEuN+JWQcQYrtVKrfMEVqi0wP58YcV9+vP/IUfFB9+oJZH2XI0IPGvRS
	PYgVANJqfqf1FTBw==
Date: Mon, 20 Jan 2025 13:54:22 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
cc: jikos@kernel.org, pmladek@suse.com, joe.lawrence@redhat.com, 
    shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, naveen@kernel.org, 
    live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
In-Reply-To: <20250119163238.749847-1-maddy@linux.ibm.com>
Message-ID: <alpine.LSU.2.21.2501201354120.12227@pobox.suse.cz>
References: <20250119163238.749847-1-maddy@linux.ibm.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,redhat.com,ellerman.id.au,gmail.com,csgroup.eu,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 19 Jan 2025, Madhavan Srinivasan wrote:

> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER,
> which adds the caller id as part of the dmesg. With recent
> util-linux's update 467a5b3192f16 ('dmesg: add caller_id support')
> the standard "dmesg" has been enhanced to print PRINTK_CALLER fields.
> 
> Due to this, even though the expected vs observed are same,
> end testcase results are failed.
> 
>  -% insmod test_modules/test_klp_livepatch.ko
>  -livepatch: enabling patch 'test_klp_livepatch'
>  -livepatch: 'test_klp_livepatch': initializing patching transition
>  -livepatch: 'test_klp_livepatch': starting patching transition
>  -livepatch: 'test_klp_livepatch': completing patching transition
>  -livepatch: 'test_klp_livepatch': patching complete
>  -% echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  -livepatch: 'test_klp_livepatch': initializing unpatching transition
>  -livepatch: 'test_klp_livepatch': starting unpatching transition
>  -livepatch: 'test_klp_livepatch': completing unpatching transition
>  -livepatch: 'test_klp_livepatch': unpatching complete
>  -% rmmod test_klp_livepatch
>  +[   T3659] % insmod test_modules/test_klp_livepatch.ko
>  +[   T3682] livepatch: enabling patch 'test_klp_livepatch'
>  +[   T3682] livepatch: 'test_klp_livepatch': initializing patching transition
>  +[   T3682] livepatch: 'test_klp_livepatch': starting patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': completing patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': patching complete
>  +[   T3659] % echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  +[   T3659] livepatch: 'test_klp_livepatch': initializing unpatching transition
>  +[   T3659] livepatch: 'test_klp_livepatch': starting unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': completing unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': unpatching complete
>  +[   T3659] % rmmod test_klp_livepatch
> 
>   ERROR: livepatch kselftest(s) failed
>  not ok 1 selftests: livepatch: test-livepatch.sh # exit=1
> 
> Currently the check_result() handles the "[time]" removal from
> the dmesg. Enhance the check to also handle removal of "[Thread Id]"
> or "[CPU Id]".
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Acked-by: Miroslav Benes <mbenes@suse.cz>

M

