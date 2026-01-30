Return-Path: <linuxppc-dev+bounces-16464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNrHAgvqfGmYPQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 18:27:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D0BD15D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 18:27:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2jd32g4Dz2y7b;
	Sat, 31 Jan 2026 04:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769794055;
	cv=none; b=TrAzEo2d3oikTdyncbwO1icLcGnJ+3DVgT2lB0X1zD+cpeXva3ibXW+kXizHXEknp1Oc/hUyq+uVq1g4LgByycJKhUEIHDm/07gm7xnPHtymKJH9Blr1dOQr/c+rCqqNj3ZvcJDA8d6UEgiXlaR+SRJwok/29mmqonab5bcg7k6xzfRqLuJurjQLeSXqH3kN2OSmae3S1BbIdNPCQq3awyH+QQzhzZa2cwuI3U2vbVGSj7vKN5tTOcIFU7nCIFrg5r/rgfYfqrkuh0boBCm2wxU4Vtab1VnLtMc8OzeznhqYqpJRfqoPEHuagSVNv0kI04N+vRD5C8xSlcH0IPvvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769794055; c=relaxed/relaxed;
	bh=o3M3i7fOsBJJ8QZ7iZoiOC82WHRYdzsj5QwfB37tvhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hcGD1gGjJcb5vROreECEkX+/N9UXkknB4uDNgUQkPtd+EY3LA7Wmq//YjTqIfKmoxvamH5+hvJ68EGdcbtD7/WLa1g+taw2Lx0mzOHHnDDwck3+wuhaDe0QMkiT4mi59DAWOqTcoR+LFRooyIPBJtB0wC/ia/yQS1Z7stBy8mKQRR3LmOhI7HKxwAyjx42YnHHtchcOXtrNaFzjqoxltAQ33WvXFlq0H7LfS5jgrT+XA7fqmkCa5Q59QbsnH2yZq8t98mCIfKGRKuEYtgNTSsn5+aaeV1G0Jt+a0JZu9LnfXibl/S+Iehgozdyk07hUgn0bA5UNSdhJeg4YR+R3P9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4vjFnCId; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=520kqiAp; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4vjFnCId;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=520kqiAp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2jd23nYgz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 04:27:34 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769794048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3M3i7fOsBJJ8QZ7iZoiOC82WHRYdzsj5QwfB37tvhM=;
	b=4vjFnCIdprQ4bapgrR0W30E28e5XqGnWTzlLJRIchP5KT0mQiU7C2HocIuX1Kdz8pUDo0Y
	qc+5Orpl1l1vZoFNRQKL24RKcgRr4rbqO02DrPCVc+5aUzHom7b8+oniEw+b53sZSdrxJg
	+9kDxpq15AQ1xIFUPYwfQgdiBumRwsh+faRgD4dNJMyLkXr/A+P3jXB+CHRA0Hld9eIR+Y
	7xvqnLxeTCF6EQZwTVn1wPEr2oy9Q/+88+eiC8F7PD8kB/n3dpKOZdgpjEsqUgdQZXqqI6
	yQRXOGphajl9ppYkFrEud4nWZdOCa3/Ob9kGErESIR3cRVjE/LChlCPSJd3YTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769794048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3M3i7fOsBJJ8QZ7iZoiOC82WHRYdzsj5QwfB37tvhM=;
	b=520kqiApVkDPFPboRTL5PTkP4fVPei7/H7ecnPwf1SVFxrBJQEXzDTADXeZGZGuaQ0gr4c
	ZZ61wAzhpOPpFsDw==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Jiri
 Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: Re: [PATCH 05/19] printk: Add more context to suspend/resume functions
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
Date: Fri, 30 Jan 2026 18:33:27 +0106
Message-ID: <87343n3ta8.fsf@jogness.linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16464-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,nod.at,cambridgegreys.com,sipsolutions.net,linuxfoundation.org,windriver.com,kernel.org,chromium.org,goodmis.org,debian.org,lunn.ch,davemloft.net,google.com,redhat.com,linux-m68k.org,intel.com,igalia.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,gaisler.com,linux.intel.com,foss.st.com,nuvoton.com,nxp.com];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_RECIPIENTS(0.00)[m:mpdesouza@suse.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:gregkh@linuxfoundation.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:leitao@debian.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:geert@linux-m68k.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:andreas@gaisler.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:laurentiu.tudor@nxp.com,m:linux-um@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kgdb-bugreport@lists.sourceforge.net,m:linux-serial@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-m68k@lists.linux-m68k.
 org,m:linux-hardening@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 1A6D0BD15D
X-Rspamd-Action: no action

On 2025-12-27, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/printk/printk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 173c14e08afe..85a8b6521d9e 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2734,7 +2734,8 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
>  /**
>   * console_suspend_all - suspend the console subsystem
>   *
> - * This disables printk() while we go into suspend states
> + * This disables printk() while we go into suspend states. Called by the power
> + * management subsystem.

Since you are touching this comment, I would prefer to make it
technically accurate. It is not printk() that is disabled, it is console
printing that is disabled. Perhaps something like:

 * Block all console printing while the system goes into suspend state.
 * Called by the power management subsystem.
   
>   */
>  void console_suspend_all(void)
>  {
> @@ -2766,6 +2767,12 @@ void console_suspend_all(void)
>  	synchronize_srcu(&console_srcu);
>  }
>  
> +/**
> + * console_resume_all - resume the console subsystem
> + *
> + * This resumes printk() when the system is being restored. Called by the power
> + * management subsystem.

And something similar here:

 * Allow all console printing when the system resumes from suspend. Called by
 * the power management system.
 
> + */
>  void console_resume_all(void)
>  {
>  	struct console_flush_type ft;

John Ogness

