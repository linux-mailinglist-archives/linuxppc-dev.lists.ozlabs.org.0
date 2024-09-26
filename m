Return-Path: <linuxppc-dev+bounces-1625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE598734B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 14:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDsqz2Rhwz2y3Z;
	Thu, 26 Sep 2024 22:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727352639;
	cv=none; b=hKj6avsnTMoJC76Ld+JowcMCHxg5LvKAYrSqOZF2gYP8tPBXkF0O4rAfR+ZHj2e0z55VxME/R6AA9JI0jnWCvm3Fi+V7bDbHOfm9o421p4Cj05g1IQ6wyEnWvpV62kZF5weoqbUADc2+sGTK8UOHjssmYbvIeL6GXTyr8+G6amKcX+DlsqTVuTPF037/ajKOtyEg91cUUOA0JBtkBi/aV67Oy4HHsay6ZsNtqLq7mJHmZ7X2ezgA3OWKlvLFb2YqNdl0RK5U+Wwg0Z7xAWwIAfhXf6VsIerLYDD7HoYFvEz6iYsj8Q9bLcf1q1Q+1t4Md2Tiz38FvWSaA9hMUQ+LVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727352639; c=relaxed/relaxed;
	bh=mO+mBgqQ/T6X+tSWYJekgurpKW0Dnm8xbzizv8ba9T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGGaurF7DQIMcCBD/kG1hrkmIY2sr6JxgpDamzMNxizRHvk+nqzwQ5cyfBCK325HesAB72yRgBxJdmd7rclxvHqDPY/rGTuEvsCqiAhxE7DBoqR7/JxfZ60BGW66oNWquRBJD+1JQAO9BrI7zAoskQDWsFRDmeB1TnMBgNrH7b7Pi1k+W1v0YedhMH3+n5NBm2FmbzP8+LDkN5U48QIyShTwYXQ5BaEdproEKFIzmKblkPrMQVRYCXr8YEZlN8kbkUTchaVfb0N5ppQOerR1RcnGZlO2dpOK5t+w8P78eZO3scobwxA6HQVRzJQ15dSLkTFm58kFduE+8xBfoBbTGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xypqOioA; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ3HjyUZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xypqOioA; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ3HjyUZ; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xypqOioA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ3HjyUZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xypqOioA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tQ3HjyUZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDsqy5Z9mz2xxm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 22:10:38 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BB011F853;
	Thu, 26 Sep 2024 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727352634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mO+mBgqQ/T6X+tSWYJekgurpKW0Dnm8xbzizv8ba9T8=;
	b=xypqOioAmz3znrCC0ei4IJzk5VUn5OhOzGsdS/R0MwtXqBZMP3BsT1mp5mKXFJuGn0bh1e
	sAUrAoxgHeS4vLbI1w8Zf4a4rFzR2hl8NsTEWwF0sAqezLt+M4gLLOszNmvyaYJoe0hH3N
	FWE96gOnF0RdB7Xw6mlYwzLKl+4n96k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727352634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mO+mBgqQ/T6X+tSWYJekgurpKW0Dnm8xbzizv8ba9T8=;
	b=tQ3HjyUZ+i6qEqCkzhCWjFTO7FEy2dx6rGn5HaE37/gpFbhVNIlTNWsj3vTeBfPbZrWJr6
	ddCuNn3fdMiLEtBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727352634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mO+mBgqQ/T6X+tSWYJekgurpKW0Dnm8xbzizv8ba9T8=;
	b=xypqOioAmz3znrCC0ei4IJzk5VUn5OhOzGsdS/R0MwtXqBZMP3BsT1mp5mKXFJuGn0bh1e
	sAUrAoxgHeS4vLbI1w8Zf4a4rFzR2hl8NsTEWwF0sAqezLt+M4gLLOszNmvyaYJoe0hH3N
	FWE96gOnF0RdB7Xw6mlYwzLKl+4n96k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727352634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mO+mBgqQ/T6X+tSWYJekgurpKW0Dnm8xbzizv8ba9T8=;
	b=tQ3HjyUZ+i6qEqCkzhCWjFTO7FEy2dx6rGn5HaE37/gpFbhVNIlTNWsj3vTeBfPbZrWJr6
	ddCuNn3fdMiLEtBg==
Date: Thu, 26 Sep 2024 14:10:33 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org,
	amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com,
	npiggin@gmail.com, David.Laight@aculab.com, kvm-ppc@vger.kernel.org,
	sachinp@linux.ibm.com, kconsul@linux.vnet.ibm.com
Subject: Re: [PATCH v5 00/11] KVM: PPC: Nested APIv2 guest support
Message-ID: <ZvVPOW-GmK3G7wnH@kitsune.suse.cz>
References: <20230914030600.16993-1-jniethe5@gmail.com>
 <ZvRIG1LHwqa5_kgP@kitsune.suse.cz>
 <874j636l9a.fsf@vajain21.in.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874j636l9a.fsf@vajain21.in.ibm.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.ozlabs.org,neuling.org,linux.ibm.com,vger.kernel.org,linux.vnet.ibm.com,aculab.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Thu, Sep 26, 2024 at 10:53:45AM +0530, Vaibhav Jain wrote:
> Hi Michal,
> 
> Michal Suchánek <msuchanek@suse.de> writes:
> 
> <snip>
> 
> > Hello,
> >
> > are there any machines on which this is supposed to work?
> >
> > On a 9105-22A with ML1050_fw1050.20 (78) and
> 
> On 9105-22A you need atleast:
> Firmware level: FW1060.10

Indeed, upgrading to FW1060 makes the KVM functionality available.

Thanks

Michal

