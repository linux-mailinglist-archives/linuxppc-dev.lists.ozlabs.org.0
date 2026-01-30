Return-Path: <linuxppc-dev+bounces-16459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJDRF+XOfGlbOwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 16:31:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73011BC0AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 16:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2g3N4yWFz2xWJ;
	Sat, 31 Jan 2026 02:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769787104;
	cv=none; b=aEI5IK2QEtjE9yE5WjTNmEG4RxxpIMSv0SAR8KVGj2oyMXpTVrdK4DpCJOpp3x1Xe8/uMRdWwzp/skDLKpjmY5xM9po+U083ReVDt2L4P/CHdUvzSC7zUebtVHWW5udzUx7vBW4yBWXkfqt/YG2KjFgLgI3JKt4rFrrqoQP3NMphhXPluFkI8XoNZj8PzxbhBojN9EP86ONJC7UA9nlkXD5QPO4wkqpY22OHd/pnV9MjqaGmbm8H/YtDK749u2ITufIv8wsgJzFXNQCkl+/CRpP2+3wqT1Or+2pBwKjL3UzNKKVFLHkFYNr/nd8HuvYFI3wHlW+oCrYkptJeRPsUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769787104; c=relaxed/relaxed;
	bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KMf5L5jO8LI7jiPY73bwbc+gxKOVj9QmGTtO1mDpUMPAXDJKCLS+PIZssHkfYLDalgDlPVzBCNpOvJJkZG497AcDhpbt7QMZxgWGn1Hbk85YyfJbb/LKxTDVNcFgscrt4hlhdpzp6QwRjFdfl80MIWc6107iVPquGf0JdNvar/F/Omi4/0iShxZPJ4KqmpIGIeHfrD8Jiycl0+0kfBOGB0jIDaGX6GxMZ07pGPansvsYeiNB2POHfetN2Bb80Z0HzsG5C7j1L6JwsMVlsckQQFyPrWt59gkExul0A10M9Cqg2zMEHUHAoQM+YJwNZiFDI+uyHlpHHNlzPA7bycFC1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0KQp0ypV; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tRQx2Qeq; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0KQp0ypV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tRQx2Qeq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2g3L6y0Mz2xS7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 02:31:42 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769787091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
	b=0KQp0ypVQ4kZaeO3mPHMfxJV+hK/54vG6DKBi+oQw7b2zUOdcXSHVjzGTkDhg+DII5BPUq
	aN49RxuHT0Y324cEPE9hahaKdLHrEB12udzdH1NvAbslSIBaR+apFss0VpjAJQGlvJvNWz
	Qkt0FDwz1uMiX4gq49nlr83YKlkc4clstGJ1Gn1qJZPTuOUjrQYGQ2og6q2aakCd23E2bK
	j7QeXx4RcIyDXczvYB5hGiBrowZd2spJR3vfcC58o7tRoab9LXrUZs+RPcCpb6cx/pdJtb
	HBe2qGa1jRaFKPPNxGpTtUqYNPr0BFkp5fHngur0T+mOUqFJcq3Nhz3k8u/Dpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769787091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
	b=tRQx2QeqDh72ig5xLjiaegMLqnl9AhaSG7GZod8dlzScFDOmHttRC8Fl88vJKoOCPg8W40
	GHTlrnG5vPdq05BA==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 01/19] printk/nbcon: Use an enum to specify the required
 callback in console_is_usable()
In-Reply-To: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
 <aWZyEHsOJFLRLRKT@pathway.suse.cz>
Date: Fri, 30 Jan 2026 16:37:30 +0106
Message-ID: <878qdf3ynh.fsf@jogness.linutronix.de>
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
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,INVALID_DATE_TZ_ABSURD,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nod.at,cambridgegreys.com,sipsolutions.net,linuxfoundation.org,windriver.com,kernel.org,chromium.org,goodmis.org,debian.org,lunn.ch,davemloft.net,google.com,redhat.com,linux-m68k.org,intel.com,igalia.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,gaisler.com,linux.intel.com,foss.st.com,nuvoton.com,nxp.com,lists.infradead.org,vger.kernel.org,lists.sourceforge.net,lists.linux-m68k.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-16459-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:mpdesouza@suse.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:gregkh@linuxfoundation.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:leitao@debian.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:geert@linux-m68k.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:andreas@gaisler.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:laurentiu.tudor@nxp.com,m:linux-um@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kgdb-bugreport@lists.sourceforge.net,m:linux-serial@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-m68k@lists.linux-m68k.
 org,m:linux-hardening@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jogness.linutronix.de:mid,suse.com:email,linutronix.de:email,linutronix.de:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 73011BC0AB
X-Rspamd-Action: no action

On 2026-01-13, Petr Mladek <pmladek@suse.com> wrote:
> On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
>> The current usage of console_is_usable() is clumsy. The parameter
>> @use_atomic is boolean and thus not self-explanatory. The function is
>> called twice in situations when there are no-strict requirements.
>> 
>> Replace it with enum nbcon_write_cb which provides a more descriptive
>> values for all 3 situations: atomic, thread or any.
>> 
>> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
>> .write_thread() callback is mandatory. But the other two values still
>> make sense because they describe the intention of the caller.
>> 
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -202,6 +202,19 @@ enum cons_flags {
>>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>>  };
>>  
>> +/**
>> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
>> + *                       on the caller context.
>> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
>> + * @NBCON_USE_THREAD: Use con->write_thread().
>> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
>> + */
>> +enum nbcon_write_cb {
>> +	NBCON_USE_ATOMIC,
>> +	NBCON_USE_THREAD,
>> +	NBCON_USE_ANY,
>
> AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

Yes, although the start value is not guaranteed. And anyway if is to be
used as bits, it should be explicitly set so (such as with enum
cons_flags).

But in reality, we only care about NBCON_USE_ATOMIC and
!NBCON_USE_ATOMIC, so I agree with your comments below about keeping it
a simple enum and not caring about the numerical value.

>> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>>  		return false;
>>  
>>  	if (flags & CON_NBCON) {
>> -		if (use_atomic) {
>> +		if (nwc & NBCON_USE_ATOMIC) {
>
> Let's keep it defined by as zero and use here:
>
> 		if (nwc == NBCON_USE_ATOMIC) {
>
> Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
> when con->write_atomic does not exist.

I agree.

If changed to "nwc == NBCON_USE_ATOMIC":

Reviewed-by: John Ogness <john.ogness@linutronix.de>

