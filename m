Return-Path: <linuxppc-dev+bounces-8478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC5AB1C5B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 20:32:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvHfk4GbQz3bkb;
	Sat, 10 May 2025 04:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746815548;
	cv=none; b=X2PgIYLWtqVK4rQKse1Z7hRLVJ60NyynTeh/EZtnILWutOoobcGuglD55OpQJxo/cPSBJkpneeWI5CkevVj6FlaCiir/vhoAi9ojM6F+gAeG4IuvxNnBCM5oAZrB6YzP/v+n12xm4aegf9eBO2Zp2WHdPX5XoLJoXom4/HnMjOmiBGjzt+FW3b2HhP/08bU0jqHTGJzNUb6CLMyx+sfWyWViuhb8ud9gcjYwqXAsZngvQkckpFx6+QF8QjQcylnFK78O/fS1GzedRUfSdDsbBQr/jIBWR70ZP+9se0jgYpvpU499EgyeOJ4qyeZ//QI+yiMGsBKHWTXBdZDJyY5vDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746815548; c=relaxed/relaxed;
	bh=cAhf/7S23qLqap+73owhMXyl0sIHInixgeRy6KQrkgI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Noy6OLI5DZ+Znsgn5SXjFrNjOytockp9eOPGZKYrk1tvcEBJaRGQ9yS6CS7Y2W1hSDM0klzTGZIAa04kNUCCY4KNMCBHptircOgRIwhTT4/XrtPaX5n/EIyyeFzECZ5oFmKuczcpqLB+mDzM2oLCV0nBmlk11Zg0bnVgvopLZNgqPfwodOPaRCGJNu7QeDTSnm1pRg5nNyeoAFhvNl7aYGC1kHJ5PMpT55GMAbaCp978yED1ODaqs/gIjMvZhMS9DvGJWNK9cBFKmwKc82nEqJWPjTFKpNpsHyTf0SVAbxkh8O9mlYKiYJ4cytPbmCEJUSxKWdx1izZeDkAtJfSWXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lx2rR6gw; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zxEpJv6a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lx2rR6gw; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zxEpJv6a; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lx2rR6gw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zxEpJv6a;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lx2rR6gw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zxEpJv6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvHfd1M9Dz2yNG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 04:32:25 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 025651F38E;
	Fri,  9 May 2025 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746815535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAhf/7S23qLqap+73owhMXyl0sIHInixgeRy6KQrkgI=;
	b=Lx2rR6gwKprJGAFFt5SVNNHR72CDWHOWkOmo1NIF4TzbnrNWucw9rlcfdNvM7234qwtq3V
	QQB395ClQenjm0Hsw5zf2f7jWTifnS4B5he50zjpqL7Ynbjtj47ztWdcTkoi9QN31ohWIV
	VT4NSA3/ScSJ17Z7iMFd2mVrpCgvfk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746815535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAhf/7S23qLqap+73owhMXyl0sIHInixgeRy6KQrkgI=;
	b=zxEpJv6aN9wlDRAdwIQwZ+/D7a2huCLY6ksNmcaDpmUGnDTlgDzSzo8wor3vLlcJsMtV/+
	LKNuDICIqaw4C3Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746815535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAhf/7S23qLqap+73owhMXyl0sIHInixgeRy6KQrkgI=;
	b=Lx2rR6gwKprJGAFFt5SVNNHR72CDWHOWkOmo1NIF4TzbnrNWucw9rlcfdNvM7234qwtq3V
	QQB395ClQenjm0Hsw5zf2f7jWTifnS4B5he50zjpqL7Ynbjtj47ztWdcTkoi9QN31ohWIV
	VT4NSA3/ScSJ17Z7iMFd2mVrpCgvfk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746815535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAhf/7S23qLqap+73owhMXyl0sIHInixgeRy6KQrkgI=;
	b=zxEpJv6aN9wlDRAdwIQwZ+/D7a2huCLY6ksNmcaDpmUGnDTlgDzSzo8wor3vLlcJsMtV/+
	LKNuDICIqaw4C3Cw==
Date: Fri, 9 May 2025 20:32:13 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	donettom@linux.ibm.com, Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
Message-ID: <aB5KLVGoX4sj5_RR@kitsune.suse.cz>
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
 <Z9r--U_INHB4RjXI@kitsune.suse.cz>
 <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
 <Z-QU2vtWYrZgo0iT@kitsune.suse.cz>
 <20250507142219.b3c31d78-21-amachhiw@linux.ibm.com>
 <aBtQpm8H6DhSnYIl@kitsune.suse.cz>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBtQpm8H6DhSnYIl@kitsune.suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 02:23:02PM +0200, Michal Suchánek wrote:
> Hello,
> 
> On Wed, May 07, 2025 at 02:36:57PM +0530, Amit Machhiwal wrote:
> > Hi Michal,
> > 
> > I can recreate this issue on sles16 distro kernel but I don't observe this issue
> > with upstream Linux 6.15-rc5 on the **same** sles16 guest.
> > 
> > Note: the commit 6aa989ab2bd0 ("powerpc/pseries/iommu: memory notifier
> > incorrectly adds TCEs for pmemory") was included since Linux 6.15-rc1.
> 
> Indeed, it's not reproducible with 6.15-rc5.
> 
> It's not clear what changed in TCE handling between 6.12 and 6.15 that
> avoids this problem.

Seems backporting commit 67dfc11982f7 ("powerpc/pseries/iommu: create
DDW for devices with DMA mask less than 64-bits") avoids the problem but
it's not clear why.

Thanks

Michal

