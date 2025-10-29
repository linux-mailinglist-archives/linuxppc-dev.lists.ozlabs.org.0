Return-Path: <linuxppc-dev+bounces-13512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D2C1B0D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 15:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxTVG32tFz302b;
	Thu, 30 Oct 2025 01:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761746598;
	cv=none; b=lkPjerrLsNK7BupLNRGn3utze2anjkxqqGTyHNVOQ+0j1z9H4ybhjRBSM8EsJ2+x7mubKBdu+wRbvea1kvSMtTsb671VZc/OqjALBWFjwk4glNot1x7GC8NW3000X/F3vmByZCAk7fW/w3THnF4cG4J7cyZ9eJE0xyhkBPKe9BhCq15aNGqcWdwjGERUIkRjbMZOvhZo/CgujL9oDYwHRFyDLsJn4ZI6rYgCVax+5/p11LoPiPJgXSnzxTfDJsNTIG3zcoFIgmNu7iv6iHOYDswdSwVsBwGq7lBMAn7SRxuL/yEvqErZrm358ni+Cm8vxSiF4tELgcDtVi+Pp/WGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761746598; c=relaxed/relaxed;
	bh=F7i5p5q88pkS1K9SjE/fY6HfNwlP+2xFWAERV0IbW8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cn+wJhDGNl05OMzGLFm9QrZD175WwHdiAo3Jv0gJN89gk/d6BRCGuoeIdnuolULuOMUJ/BRoDXji4y791xhH/JScJfqsm2E+fEUeiVsWyYHjPJba69pO+Ow8atItUL2sFV0RPJSxYOG2bNiCcbVTm8nnQLqmlDNlfFkhGy4LYjt56JUyUK+Fxt2zu7fmVSbv3dLkOqet+2/mXAlfYGl4StE3UkVwtnr6ERaJyK+EH3BeDEPVaZHpwGk5/0cCtRYs6EXOYjIOSycXm8cEsntu+UpNn9Q1G90CUKaPEh8tcqTba8ktEhWyKF2N4TzmfyfXL3Ioj6FtrYSTeViV/n5Kbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yu0K0hlK; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7fqOGAuw; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yu0K0hlK; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7fqOGAuw; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jbohac@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yu0K0hlK;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7fqOGAuw;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=yu0K0hlK;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7fqOGAuw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jbohac@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxTVD11CPz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 01:03:16 +1100 (AEDT)
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6C67D33B89;
	Wed, 29 Oct 2025 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761746586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7i5p5q88pkS1K9SjE/fY6HfNwlP+2xFWAERV0IbW8Q=;
	b=yu0K0hlKSaDpYzaa+zFQXWxH1wl66H6r6nHILYMAnnkLbVMQ45vFkZZnuN4nDqX7aVQUUi
	X6Qys/0MxKbv3BuLMMBSqfwAxY8I9gvEy4gCPUwgfvSYxrBnnpl8MM3UWZ1WcBGVfSdu9o
	uOA99N3AMdQYlP4oUESfvr6H2mKPeXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761746586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7i5p5q88pkS1K9SjE/fY6HfNwlP+2xFWAERV0IbW8Q=;
	b=7fqOGAuwVPhFAFDlYg+IK9qTtaocuUZGF2IcVafMYkB8a3jYtywX6htK/5E6e67SrmcJXR
	kNCCEd1+zt2LgbBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761746586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7i5p5q88pkS1K9SjE/fY6HfNwlP+2xFWAERV0IbW8Q=;
	b=yu0K0hlKSaDpYzaa+zFQXWxH1wl66H6r6nHILYMAnnkLbVMQ45vFkZZnuN4nDqX7aVQUUi
	X6Qys/0MxKbv3BuLMMBSqfwAxY8I9gvEy4gCPUwgfvSYxrBnnpl8MM3UWZ1WcBGVfSdu9o
	uOA99N3AMdQYlP4oUESfvr6H2mKPeXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761746586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7i5p5q88pkS1K9SjE/fY6HfNwlP+2xFWAERV0IbW8Q=;
	b=7fqOGAuwVPhFAFDlYg+IK9qTtaocuUZGF2IcVafMYkB8a3jYtywX6htK/5E6e67SrmcJXR
	kNCCEd1+zt2LgbBA==
Date: Wed, 29 Oct 2025 15:03:06 +0100
From: Jiri Bohac <jbohac@suse.cz>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <aQIemtjbgSaMGYnE@dwarf.suse.cz>
References: <20251024170118.297472-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20251024170118.297472-1-sourabhjain@linux.ibm.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 10:31:18PM +0530, Sourabh Jain wrote:
> +static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> +					   unsigned long long mstart,
> +					   unsigned long long mend)
> +{
> +	struct crash_mem *tmem = *mem_ranges;
> +
> +	/* Reallocate memory ranges if there is no space to split ranges */
> +	tmem = *mem_ranges;

repeated initialization

> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> +		tmem = realloc_mem_ranges(mem_ranges);
> +		if (!tmem)
> +			return -ENOMEM;
> +	}
> +
> +	return crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);

mstart and mend, not crashk_res.start and crashk_res.end

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


