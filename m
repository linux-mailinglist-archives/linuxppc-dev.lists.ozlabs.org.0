Return-Path: <linuxppc-dev+bounces-4049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4E9EE7A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 14:28:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Cvq0zVJz30Vr;
	Fri, 13 Dec 2024 00:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734010087;
	cv=none; b=bbKM+WbapcuUvuusU+Mslhc/gnhhm3R9HSNtrcxupsQB57jvfclSdZpDCTEpAY1FZfh6RJLv/FvShu08RNw6Le0hbvGDj7eYQZi9jM4VGWxuMmSN4HnPjNlvZ4EZMd8A5jlkrwrmwgxuhzOK0OzkWXEVeZsa1nOXKjEqCJaFjpJJtOLAhkv/jyaSzQkP3xN88aRy3ck4ygTCrkqJnNN9y3YJaz2a9nIv31GQ+a0KvS0xwKZ4rFWmqu/Vpa3fj4TGZ3sK82wgFUuyq1ZF8P8LLXhihoWUJU5BBElQhhKGmJoLTzNkIGa/9DdWUiWC53kEYk+GOEQ5a3j9Qlbp8rLM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734010087; c=relaxed/relaxed;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A94opCSfYiQz3smqVpqN55/iFkFeKxSRS/7sKY/f1rPk2QCL3mwcjdNNFh70ifaGbemui4Vojvbc5w40LiA7KWViJEFYI+Gl7wTwmdGp5H4ycmepNpeeAnYgwCBgjnZgMbXggM1Ydtr5/GsGQSgX2RWUipBjR9Zd4w1ofKMnhz+RdEz6e05zU6ZxW2/M/cCf+4Xrf0NbtEAquMOt+eKvxRzmv1Zc7oKRmPqFCbZA6ownByhWKuubTecHI35fsK6oMFuMimNvDzwPgLXQHYGEnJ0NPCBroIv5lSiKX0dh+mf0ZwpFhm9jEY3UojN2cx1qLkD60/+xTEnEc6+ukwFSuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G0+gJTno; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cuEiBk2+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G0+gJTno; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cuEiBk2+; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=schwab@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G0+gJTno;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cuEiBk2+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G0+gJTno;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cuEiBk2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=schwab@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 460 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 00:28:04 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Cvm3MVHz30VL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 00:28:04 +1100 (AEDT)
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id BB45D21101;
	Thu, 12 Dec 2024 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734009616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=G0+gJTnoNUBFKzXQ4WQdL/D4JqMKS8EvUtjFsiWsyUm2pLxNLogguxPwUo2ZeXJFBmlzkz
	fbThzBNsG1+RTFxx51a5DGee6Ph9hN35lTzzAQwhKqV2+YClrk/wODGK96uN2SeHTmDF+p
	tNAvs4XCtfSI0A7s+4ViFDLou/bg0mA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734009616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=cuEiBk2+3CQcFyPi+Uu6D+a4mOnk4kxWb1z60nRnw4qTO0YlaBwz++/xEghS/mwF1Ji+rw
	nwAbqgS963ggK/CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G0+gJTno;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cuEiBk2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734009616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=G0+gJTnoNUBFKzXQ4WQdL/D4JqMKS8EvUtjFsiWsyUm2pLxNLogguxPwUo2ZeXJFBmlzkz
	fbThzBNsG1+RTFxx51a5DGee6Ph9hN35lTzzAQwhKqV2+YClrk/wODGK96uN2SeHTmDF+p
	tNAvs4XCtfSI0A7s+4ViFDLou/bg0mA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734009616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/BWGvQPrZx2VHJH6gXJ70AF/i/mUx48F5PDLOR50PU=;
	b=cuEiBk2+3CQcFyPi+Uu6D+a4mOnk4kxWb1z60nRnw4qTO0YlaBwz++/xEghS/mwF1Ji+rw
	nwAbqgS963ggK/CQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 4187A4A05D9; Thu, 12 Dec 2024 14:20:16 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: kvm@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Huacai Chen
 <chenhuacai@kernel.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Madhavan Srinivasan <maddy@linux.ibm.com>,
  Alexander Graf <graf@amazon.com>,  Crystal Wood <crwood@redhat.com>,
  Anup Patel <anup@brainfault.org>,  Atish Patra <atishp@atishpatra.org>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Sean
 Christopherson <seanjc@google.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Vitaly Kuznetsov <vkuznets@redhat.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Paul Durrant <paul@xen.org>,  Marc Zyngier
 <maz@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org
Subject: Re: [RFC 1/5] mips: kvm: drop support for 32-bit hosts
In-Reply-To: <20241212125516.467123-2-arnd@kernel.org> (Arnd Bergmann's
	message of "Thu, 12 Dec 2024 13:55:12 +0100")
References: <20241212125516.467123-1-arnd@kernel.org>
	<20241212125516.467123-2-arnd@kernel.org>
Date: Thu, 12 Dec 2024 14:20:16 +0100
Message-ID: <mvm4j39ghrj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,alpha.franken.de,kernel.org,flygoat.com,ellerman.id.au,gmail.com,csgroup.eu,linux.ibm.com,amazon.com,redhat.com,brainfault.org,atishpatra.org,sifive.com,dabbelt.com,eecs.berkeley.edu,google.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,infradead.org,xen.org,lists.ozlabs.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLrhtxphh58n7g1ptxk8ecsouj),from(RLajr16mudzow8bnf6sy)];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: 2.59
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: BB45D21101
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Dez 12 2024, Arnd Bergmann wrote:

> KVM support on MIPS was added in 2012 with both 32-bit and 32-bit mode

s/32-bit/64-bit/ (once)

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

