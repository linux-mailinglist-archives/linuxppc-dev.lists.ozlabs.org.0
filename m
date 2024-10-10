Return-Path: <linuxppc-dev+bounces-2080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41109998DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpY55s3fz3bqs;
	Fri, 11 Oct 2024 12:13:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728551827;
	cv=none; b=Q/BluD1s1iM6WHHoroaxsaqYSRP/ztUMSiYBZkSjl95fuUp4e56kGSnZKGNv705iUNZlSSLPo8QAgJV49uFxDfoDN2sODRp3vd/FuDP9tLf3Ty/iMrEgYtIQM+sgQ6vD0voHkpQqqlDzxDmFX1v+nixt/pkDAopyr2ilgOlgybkHVUahjGRyNkjELPrMoIMaHFuF2yYSnS0EZ1Ir8Id9i7QqwlAjiqjKvGsRJk1O7eONh/DICiXPUiYNzT7suumM2/rPtkyzuER0uruCLI1stcEset+HfYvyxnfE1EtQzZJZxSMThWUgGObNAII43CpGCAhci7QQVy1afQSmpkFYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728551827; c=relaxed/relaxed;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZuOANiqG1/22yICuWAguHFM+UNP19eZa4VmZByKUkQDIDtqNw3c5Vwx8Ag+eMxEaUGh63RY5lFFBMNZpcMMXrAUAj9tK1kCgmZ4+Yg9w/39hI5P7mHf7YC8VKlAXH/geJgytZ47wFmK7luk5g8+XSdzSLcFugG01F1/xPANCZjq+xsVzYRkBl+BZeWm0c7NenBA1SP5iAt/Oc9dXunj96gZEqoVMPqVGLCtgG7d6C/F2X/YC0VY3ECV8iKku7q17s1VDVyL/hlMTa1f3mepRH3ZEm9h1XGnKinyvbRoI1gOlmjalhb50wVljBfmHLbL3bujG/Ze44uWh+WQ9WPRL6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ONJaXOp9; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PuD8pwBk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ONJaXOp9; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PuD8pwBk; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=dkirjanov@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ONJaXOp9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PuD8pwBk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ONJaXOp9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PuD8pwBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=dkirjanov@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPPKF4vH7z3bl1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:17:05 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CE561FE5F;
	Thu, 10 Oct 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728551822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=ONJaXOp9oO1GkrLu5oZfqtn+yl+Mp8Q8ryaKbAV3ikZhlV7EiqrSfcmBy3MHpxlDi5x6xf
	uFDalbfaglVJXWXJNDqSVjUzMtk+JfUNqpuVa6gfMuB5SnJk/nNpAmbAm549bKhnFDwcKX
	lSQ+Tva4n7Wv08gCZdPSJkYJTctQROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728551822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=PuD8pwBkGoocNWRRBDPZ8LagPRc0Rf8M1JuP7TzS+fNAoYQMsoOZGoNKgJYh+fag+qFuXC
	GggY1sQYMCrPeLDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728551822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=ONJaXOp9oO1GkrLu5oZfqtn+yl+Mp8Q8ryaKbAV3ikZhlV7EiqrSfcmBy3MHpxlDi5x6xf
	uFDalbfaglVJXWXJNDqSVjUzMtk+JfUNqpuVa6gfMuB5SnJk/nNpAmbAm549bKhnFDwcKX
	lSQ+Tva4n7Wv08gCZdPSJkYJTctQROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728551822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=PuD8pwBkGoocNWRRBDPZ8LagPRc0Rf8M1JuP7TzS+fNAoYQMsoOZGoNKgJYh+fag+qFuXC
	GggY1sQYMCrPeLDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0067213A6E;
	Thu, 10 Oct 2024 09:17:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NhiWO42bB2e3fwAAD6G6ig
	(envelope-from <dkirjanov@suse.de>); Thu, 10 Oct 2024 09:17:01 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 09:17:01 +0000
From: Denis Kirjanov <dkirjanov@suse.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 pctammela@mojatatu.com, victor@mojatatu.com, coelacanthushex@gmail.com,
 jhs@mojatatu.com, horms@kernel.org, shannon.nelson@amd.com,
 sd@queasysnail.net, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>
References: <20241008154824.1448370-1-kuba@kernel.org>
User-Agent: Roundcube Webmail
Message-ID: <6a5ad6ad6b432e56817883e890a0550d@suse.de>
X-Sender: dkirjanov@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,linux-powerpc.org,arndb.de,alpha.franken.de,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,mojatatu.com,amd.com,queasysnail.net,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-08 15:48, Jakub Kicinski wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: 
> https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
Acked-by: Denis Kirjanov <dkirjanov@suse.de>

