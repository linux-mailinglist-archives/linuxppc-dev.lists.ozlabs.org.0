Return-Path: <linuxppc-dev+bounces-8380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C3AADEF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 14:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsvYZ4T71z2yRn;
	Wed,  7 May 2025 22:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746620594;
	cv=none; b=c4b0Oa69WeQqrTzcsr2D/WCncyhcZpbm6C+Aic9wBxNi4/0Jg77Uc2Sd/38iZw+jCgSceaYhEq2vl2/3Wy3pSIplu9GuZJcS/AqX/KTNBN3qwx1/F4cqSUm/fYjncUN2xUfj2ZtbylVyKToLrG87vS6wKiKAqkAX4wL6gIx5Go7R9PRysa49fD86bEVkLpNpvqHsqiOFQfmbiiMHDJVpxO2fyX6cdiZjCCarid0DxWL2FRQ9mAKFzq8w0/WISf5xQct0VmWfYuVZ2MhmNOEfNLd4c4ZNIdlavQkBuh35wTn1FogpAtYWTRDPWFncq8TlBKbBgg0yGIQSu7Lh0MLeng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746620594; c=relaxed/relaxed;
	bh=CkJaxZEvxFE1GuNQvjO+SBEhT7k2VLGSDP6xe4XgRPw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX6nJ6WWaQebEaUbF/e5LsABiAVKd4ov0iiDwcEUf4yGkTESFMroyVVbkjz/4NhI/yxkEbzpxvkY5+HoMXJPZo9/IzTKgFMWABfjlIVAsYAY2i4oHYsg0LjYyoO616ewI2v0dRk31ujxGAuFDXNQ69QgEbUIdyr9L6b9RSM7tQ/0hSV6L/BTbS5YKEtN3gr4fhJtieHdEjiYzgwqERGqfsIbf2iyhEn1EkXbRZHSBYuKsM2lN6vx21OIkMyFN5Jwi79kdoP7DiuYefo1USs2o3YRPohmzU2sk0oSMvB+0R49i+DszsslC2XExPVzffCs1qUrG0eNgZMZbQTNlF+W9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YW7NyuKv; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EV8iP1x9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cC1PZi8k; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E2IG9P1n; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YW7NyuKv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EV8iP1x9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cC1PZi8k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E2IG9P1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsvYX54tJz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 22:23:12 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B71A1F393;
	Wed,  7 May 2025 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746620584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkJaxZEvxFE1GuNQvjO+SBEhT7k2VLGSDP6xe4XgRPw=;
	b=YW7NyuKvWQTMVZmVQYkuGiJE6cL8IPzYxT8X9vlQefmiTQnwG4cvB0JbfJMVDQyeSCF1ns
	qHdrV326MoIgyT3uafFiAcGMQ+WiPQ4r2YAIktscTJQVqY+OM8eFXRp4vIzryw8ItvZAKb
	CGWfdl7Tu8iPsSi4qF0NB2N9AwF4FSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746620584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkJaxZEvxFE1GuNQvjO+SBEhT7k2VLGSDP6xe4XgRPw=;
	b=EV8iP1x9jAM+6lXx+mPura6k8X2LxLTCNFm03OO0iewinp+Hu8gorx0Sd/LOaC/eACpDZp
	tiQwBoNoBOQqyGDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746620583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkJaxZEvxFE1GuNQvjO+SBEhT7k2VLGSDP6xe4XgRPw=;
	b=cC1PZi8kC6GOPb0suAQPFfEKlckuhBRYeAlmNEbQmKT0uLoogVpOzrHkB/uVBQuwSKOJjp
	kXgww+J4N8TRc6PdyjhycAZTPZ8BBNt3VlcX2G/sUgYilp5ljojmKJX9IO6IluQHAIp3+0
	yrIgYg8JLBrVyIcqip8lCHH0jceffwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746620583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkJaxZEvxFE1GuNQvjO+SBEhT7k2VLGSDP6xe4XgRPw=;
	b=E2IG9P1naDZohTznfaIu1TkY8dH3Kws6u476I+HivG3FntRAmyMADNK5FaKzIsGxhwlwl6
	PzHN74izDtvqQoAA==
Date: Wed, 7 May 2025 14:23:02 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	donettom@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
Message-ID: <aBtQpm8H6DhSnYIl@kitsune.suse.cz>
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
 <Z9r--U_INHB4RjXI@kitsune.suse.cz>
 <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
 <Z-QU2vtWYrZgo0iT@kitsune.suse.cz>
 <20250507142219.b3c31d78-21-amachhiw@linux.ibm.com>
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
In-Reply-To: <20250507142219.b3c31d78-21-amachhiw@linux.ibm.com>
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Wed, May 07, 2025 at 02:36:57PM +0530, Amit Machhiwal wrote:
> Hi Michal,
> 
> I can recreate this issue on sles16 distro kernel but I don't observe this issue
> with upstream Linux 6.15-rc5 on the **same** sles16 guest.
> 
> Note: the commit 6aa989ab2bd0 ("powerpc/pseries/iommu: memory notifier
> incorrectly adds TCEs for pmemory") was included since Linux 6.15-rc1.

Indeed, it's not reproducible with 6.15-rc5.

It's not clear what changed in TCE handling between 6.12 and 6.15 that
avoids this problem.

Thanks

Michal

