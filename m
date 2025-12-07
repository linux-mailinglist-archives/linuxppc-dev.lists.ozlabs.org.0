Return-Path: <linuxppc-dev+bounces-14674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 048DCCAB415
	for <lists+linuxppc-dev@lfdr.de>; Sun, 07 Dec 2025 13:18:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPPJs0hm3z2xrk;
	Sun, 07 Dec 2025 23:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765109884;
	cv=none; b=F3uhQLs0GcbIJVr9j8Wx+YBKnAkbP8ZBYazweAvUdvnSPRSjcgCsUlPYJkvPmZw9f1Uc+/0j5XB1oxHdf5XAmDXiSSmCFA3PtktqpLgeb/hYBZoAiAzPn4rO2L///Fg6ZfMmK0Q9mgt1znG2eh0R/Gpc4LNLvABRBhjNcnUOdi3cf418i4Jncx5+uUVA98PQAx1wfsyLTpe5D7HYx5ys3jjChEzUSZ8LWcdIXq/AZoxjPfbKkjul3vXLQDHQ/qvCjl6offBJNx7YatCYWzRqM2sjsyrSu0rSoGf824piNySM0itTlD/SQvXUOEe5lfeNwFU2wQ+1lANDf6hNXRrCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765109884; c=relaxed/relaxed;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoNwBYmjjpEIuv8shR6SsgZExhOZaO8xnNtql30t0qkReBos5uuQum5W0z/RG/s8mWsnKbL9fSXQkOVI9A5/oFHuM8uisAq+mVyonCd4bDdcOwuFGIGVFhfw3+MfWdrdYMchrtW/80wxvVDmGDRRCBBNfZorN2PtDmtacD47xZT8c1QiUfYm/rtkhcmA3m9bapMY4MUVEteXJD5fWTLFj1S9ts0DQxDHWJt5+kCw+qxhHIOKUt6C8zGDtFjb3JQzFk7fK/mkQrL5cBhkBWBl5/2VQu5Psdu8BssQlNv+HqfdorDLexyx2s6A2Ylm0iY9OXzbVghm0PB2yLpP4hfE6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ptJ+j6YP; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VkgzOLXv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0YuJJ3XF; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yM/pJrbc; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ptJ+j6YP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VkgzOLXv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0YuJJ3XF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yM/pJrbc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPPJp6W9Mz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Dec 2025 23:18:02 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16A455BCFD;
	Sun,  7 Dec 2025 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=ptJ+j6YPX4g+bVfgoE8ZGTjROuh8vTpSPNCv/qp0Q1ZljH1k6a8NBRAl9PuRb/OAq+XIDy
	Ms3IQNYL1UGQXarbvyUzIeXgSBkeivNsvAZU9knIC1uAehc4VZSgwD6WyKttisOejkucd4
	wsZ8RlWhvRqiXF3CkmGsZ4ILGDkvVZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=VkgzOLXvVzmsNyshw1DtVQoAoqZnxBQbXa/ajCsN5DdEWhfMRf3OddfIE276hMSQ5nWGvz
	qgzw3pUkeCxWoFDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0YuJJ3XF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yM/pJrbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=0YuJJ3XFWR17M6QyJQov2+FyIAhSdoGYPfrmbxb1xuXppPswhnxE1s6EE+4EqIbTRZu8Bp
	8EX1Rjq6OSEDARqS9qICqkYEYcKjU0uA/07KnY5JMh6XQQnbIagxjjj5mgDtxZuknqyCQ7
	S6z6B7TTfVPYuJuL+MrjDPCS+IZkj04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=yM/pJrbcO/dEmDdgL7ZVTAFBtzM7UxjjJqeIgGuIINwlyBUV6fSD7Tb1eGcAL+4S1SR8dQ
	ln3+ze8SfTkZ/GCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67A4E3EA63;
	Sun,  7 Dec 2025 12:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gID+FnVwNWl9JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Dec 2025 12:17:57 +0000
Date: Sun, 07 Dec 2025 13:17:57 +0100
Message-ID: <87pl8qv62y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: david@ixit.cz,
	David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: Do not build obsolete API
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 16A455BCFD
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[armlinux.org.uk,mleia.com,timesys.com,iki.fi,gmail.com,atomide.com,nvidia.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,perex.cz,suse.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[david.ixit.cz];
	R_RATELIMIT(0.00)[to_ip_from(RLin1spj7ezzoz4e1zj94tyerm)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 03 Dec 2025 23:34:10 +0100,
David Heidelberg via B4 Relay wrote:
> 
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?

Thanks, applied now.

I believe it's safer to have this default only off for 6.19, then
disable for 6.20, eventually drop the dead code later.


Takashi

