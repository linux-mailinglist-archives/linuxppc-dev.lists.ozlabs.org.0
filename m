Return-Path: <linuxppc-dev+bounces-8381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B3AAE235
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 16:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zsy1j2CF5z2xk5;
	Thu,  8 May 2025 00:14:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746627257;
	cv=none; b=TOsF7HS+JDQ/2MI6MdFz6vkjTiN3iquR7Q5tLWyqc/5qYc1SS6LjO9lT3gpCnkqFAf052pjwICUcvX01ubLQrh/pfNblVbeHuHUknKq8m3slKGsUKYjJ3UMcImIbfNeilLcuCdUQ/+wrku4CbfZo0my5r2L+HaWKrOz6Ne3/u8yZnBnfc9CoGWuI/xwRN7t51m8uiksGnftJdkBKgSZPBl0ODuFiMYjwGOrHzcelQWrftHukRiSgoScU5KC5t7qSMQhAeNiTaUrYvFegBQPFaOjDCgjcswxNG6xWpbTNFlFGlzAcaVWE7TLQqRCzTh8xK0r6kQdPGWdSjs4rbbtQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746627257; c=relaxed/relaxed;
	bh=4F+lmQfDzO1utDvoQ1V5GTpLQaeGDhuvUOdxa8KD7cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6r6YlXPFir1Y5hON81NqN7bUiQwdTgyCIo/GPe0tqB6GB81ikuOPtOHBw6aHYG8GhVU10iFLb0mKmU+c4/pBcDpZ7iSOkEWvNnXdAI9uRntVYlIQIZetkFOIJup+LpkwohqqMy8Qc2IADZOjWkwm2wu1Dl1KJ10gh1v3kJwt6U83WuooGJlJx8CD7Fd6+qovRgqHYBS0PV52+CoKNKOtBNJS0XoupaBmW/UdNgzlBUiaBEkY7EQu3FFi4c8CImDxfA+fYM8ck1xxI6Yk2VwiAmWwNDyhAvAwcWZaru5QndnntsH/p3AvyVDmTV93JjUqBLxT4qMkrVrP5wIgPoFQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=qYIOaCWp; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xHUXyZA3; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=qYIOaCWp; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xHUXyZA3; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=dsterba@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=qYIOaCWp;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xHUXyZA3;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=qYIOaCWp;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xHUXyZA3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=dsterba@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zsy1g4C9Hz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 00:14:15 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 327D32123B;
	Wed,  7 May 2025 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746627251;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F+lmQfDzO1utDvoQ1V5GTpLQaeGDhuvUOdxa8KD7cw=;
	b=qYIOaCWpZhsLWlZo/yD0frKhX34LnLUxbyzDb1Sgc7aNDXDJlftxrAC11MxDHz2zYSXYFj
	QJZV07n8aU9/zKlKW0ZV1OVHpaYsRPwKIoJ4RFseACkI5t0HP6DWRZ0Lsb4Qt8NNGPS6uM
	9xfUcRIzsagfglNWCPh4g0AbseKCH/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746627251;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F+lmQfDzO1utDvoQ1V5GTpLQaeGDhuvUOdxa8KD7cw=;
	b=xHUXyZA3cF4kNzY9ScKBML+wdF77e+nolc3cO0OXB6b9J0gHp8Mn6XOoDFRip/3ipjG5NT
	9p63X72vH6ywr2Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=qYIOaCWp;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=xHUXyZA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746627251;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F+lmQfDzO1utDvoQ1V5GTpLQaeGDhuvUOdxa8KD7cw=;
	b=qYIOaCWpZhsLWlZo/yD0frKhX34LnLUxbyzDb1Sgc7aNDXDJlftxrAC11MxDHz2zYSXYFj
	QJZV07n8aU9/zKlKW0ZV1OVHpaYsRPwKIoJ4RFseACkI5t0HP6DWRZ0Lsb4Qt8NNGPS6uM
	9xfUcRIzsagfglNWCPh4g0AbseKCH/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746627251;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F+lmQfDzO1utDvoQ1V5GTpLQaeGDhuvUOdxa8KD7cw=;
	b=xHUXyZA3cF4kNzY9ScKBML+wdF77e+nolc3cO0OXB6b9J0gHp8Mn6XOoDFRip/3ipjG5NT
	9p63X72vH6ywr2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EACD139D9;
	Wed,  7 May 2025 14:14:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0P8RA7NqG2jJUgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 07 May 2025 14:14:11 +0000
Date: Wed, 7 May 2025 16:14:09 +0200
From: David Sterba <dsterba@suse.cz>
To: Filipe Manana <fdmanana@kernel.org>
Cc: Venkat <venkat88@linux.ibm.com>, quwenruo.btrfs@gmx.com,
	linux-btrfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	ritesh.list@gmail.com, disgoel@linux.ibm.com,
	David Sterba <dsterba@suse.com>
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
Message-ID: <20250507141409.GG9140@suse.cz>
Reply-To: dsterba@suse.cz
References: <0B1A34F5-2EEB-491E-9DD0-FC128B0D9E07@linux.ibm.com>
 <CAL3q7H7PqVRnDuooSr6OhvUQ3G5V2gq6VEDpqTqNX9jHmq97aw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL3q7H7PqVRnDuooSr6OhvUQ3G5V2gq6VEDpqTqNX9jHmq97aw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Rspamd-Queue-Id: 327D32123B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.71 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmx.com,vger.kernel.org,lists.ozlabs.org,gmail.com,suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -1.71
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 02:04:47PM +0100, Filipe Manana wrote:
> On Wed, May 7, 2025 at 10:02 AM Venkat <venkat88@linux.ibm.com> wrote:
> >
> > +Disha,
> >
> > Hello Qu,
> >
> > I still see this failure on next-20250505.
> >
> > May I know, when will this be fixed.
> 
> The two patches pointed out before by Qu are still being added to linux-next.
> Qu reported this on the thread for the patches:
> 
> https://lore.kernel.org/linux-btrfs/0146825e-a1b1-4789-b4f5-a0894347babe@gmx.com/
> 
> There was no reply from the author and David added them again to
> for-next/linux-next.
> 
> David, can you drop them out from for-next? Why are they being added
> again when there were no changes since last time?

The patches have been there for like 4 -rc kernels without reported
problems. I will remove them again.

