Return-Path: <linuxppc-dev+bounces-14409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B143C77C6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 09:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCSLb23mHz2yFq;
	Fri, 21 Nov 2025 19:00:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763712007;
	cv=none; b=O1CW5Z33Iu6PosdHOCYdf0Ka9sJvUFTTi08wPSO5iH1iApdPf21vwgDWAYHIyCrjRt6ViDzNQ94ygpPeBSnnb8uL2WbOlzJqE02FLSRbv+ODz3pI/+8WM2HluFgrSLaEX0IJagPogd8qmypHHN+/imEaaB0OtmZQOU9Ti7iN7jfL87BeO15k3+iczheaGssc1yXneV10zIYaZp4SfKFJ4Gcpse0kCq1mGjOdATLz6I1o7dEm2T1rp+FhdMisv7L1+EG5uA2FBYQgvn3PkraybUhDtrI542+PJnEgBMvvr5ONVt7XjKAUHM4hawccFY91udQG9FKe5KO2YL/UEqPGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763712007; c=relaxed/relaxed;
	bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYbmW8FZ3l8l8UHT7CsiD3I0ByOe+B0FfK1eOhmAb6j+Nym9feuivuXabkQeAyyXEJyT0nuda/VSIbLj3LxwjXMnB8HoKPbt/YJEvKEq4v7OF5mZCvGcADXr+U0ovOOHJ3+SDof2QyaDpGi+rk8IgWobliMom1w/Gpexis98jzuxU2zLjKQYwvH0OTzyUl7IO7lQrVljODrgUVldHDTQLuc4n0bJPSnoODrC/Ry2k0E1HAD5WCgVoj9Tggnq6Lu0LHMVdzBbdz+58b8moUiFKBbg9kPEeCJbCMu2pJ4f8gxTcaCXtqT+q5RuHzCln5bjdYO8cFyaqFGxXASNpmbIyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=exu1v4zq; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4awr4iVr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bbokZlJl; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NNeopXin; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=exu1v4zq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4awr4iVr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bbokZlJl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NNeopXin;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCSLY4PRMz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 19:00:05 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C61B720EC5;
	Fri, 21 Nov 2025 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763712002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
	b=exu1v4zqGs4p1c2fgYiMLiAmvgm55WFuW0btK81NI7ZEuPBDOneHwW0wnAU/d69k6ciHRq
	8EIjKueHyOEVTXjQ06GhvXgp1aZJXMN9jH1hJM4fAGHXdgfXhyNXuU0AUOCSPJtuBBR70a
	xCSDIvDVSBMg5VLsiqrrnjEDH/ySqIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763712002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
	b=4awr4iVrUfhEsEntHBH5tu2CEcCCesTlJU/8CcTtU7+K6KQ83blKu6yqwBTNDQlWtCADLx
	iNhxr3eIQbrlFgDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763712001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
	b=bbokZlJlvH5VtvnOOHz4i/FSSJouMPM8vkrOmZv67Mx3pvKJFzR5mhozM6gsHtwV3EjS/K
	X4b1ZJ7cdlk5Cg60mEzhLmlHcXFMLJcxZYbfPR6Rxxq5OGnHBkoa/CCJkP6ph8Q5GDqcGm
	RojmEd1UZsUuLExVdJmzY9fokJiSoh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763712001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
	b=NNeopXinmwaDLSsUh9mdfoyLtOqe5mDdwZYksJoslhspN5w7H6b+FAmhjktAb5rGDyTDUL
	lB4n/s/2W+nuUgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A02533EA61;
	Fri, 21 Nov 2025 08:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fgvQJQEcIGnuHgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 08:00:01 +0000
Message-ID: <23ef60cd-d17e-4070-bbf5-41dce6439fb1@suse.de>
Date: Fri, 21 Nov 2025 09:00:01 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
 <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:url,gitlab.freedesktop.org:url,imap1.dmz-prg2.suse.org:helo,raptorengineering.com:email]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

sorry for the delay in reviewing. I've wondered for some time what to 
make of this series.

Am 17.10.25 um 20:17 schrieb Timothy Pearson:
> Certain hardware devices, such as the IBM POWER9 CPU, transparently swap PCI
> bus MMIO data endianness when running in big endian mode.  This transparent
> data swapping presents issues for certain types of BARs, for example little
> endian framebuffers, where the device driver needs to be aware the PCI BAR
> is now appearing as big endian from the host's perspective.
>
> Introduce CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP and enable on ppc64 systems.

I would not want a config option. In the latest version of the driver, 
we have a struct to describe device quirks. [1] I think we should detect 
this scenario in the driver and set the quirk if necessary. The 
detection can be at compile time though.

If this problem affects many graphics drivers, we can re-evaluate.

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-11-14/drivers/gpu/drm/ast/ast_drv.h?ref_type=tags#L167

Best regards
Thomas

>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>   arch/powerpc/Kconfig | 1 +
>   drivers/pci/Kconfig  | 4 ++++
>   2 files changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885a..0e75fe570389 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -314,6 +314,7 @@ config PPC
>   	select OF_EARLY_FLATTREE
>   	select OLD_SIGACTION			if PPC32
>   	select OLD_SIGSUSPEND
> +	select PCI_ARCH_ENDIAN_AUTOSWAP		if PCI && PPC64
>   	select PCI_DOMAINS			if PCI
>   	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
>   	select PCI_SYSCALL			if PCI
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 7065a8e5f9b1..fccc01110763 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -40,6 +40,10 @@ config PCI_DOMAINS_GENERIC
>   config PCI_SYSCALL
>   	bool
>   
> +config PCI_ARCH_ENDIAN_AUTOSWAP
> +	bool
> +	depends on PCI
> +
>   source "drivers/pci/pcie/Kconfig"
>   
>   config PCI_MSI

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



