Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942B92BABC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:11:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zhdjt+CP;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6PyvjXLG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zhdjt+CP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6PyvjXLG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJLwt1xkTz3dK7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:11:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zhdjt+CP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6PyvjXLG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zhdjt+CP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6PyvjXLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJLw54YYcz3cGS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 23:11:00 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 07CBD1F7BB;
	Tue,  9 Jul 2024 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720530657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvj+CYjfPLQdg2gDrjN70o2HTsk5KrY6yRIRFXK7aRY=;
	b=zhdjt+CP9j6IsQpKFUmHQ17XhvBZ1D1/msT/WoixqygoHVxrAXeIZHKCIPYAAhXSvoRSsk
	4++ec+dNBPhmGxPEmwXOW7JHmm4t8b+O0Yfl7ewZPe12Ls+9Jvc2O/JfiUTehjm4k9T6xN
	QX+OZKX+V06Zcry0sA9pupy8GvUJzas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720530657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvj+CYjfPLQdg2gDrjN70o2HTsk5KrY6yRIRFXK7aRY=;
	b=6PyvjXLGBFNiv0ipDIrwgc4QrXZ3Sgr/6nTJwlhiD8W+eltiaIYRl+yBTIm6QbBqayRFt/
	ANTVdB1gib9pMJAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720530657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvj+CYjfPLQdg2gDrjN70o2HTsk5KrY6yRIRFXK7aRY=;
	b=zhdjt+CP9j6IsQpKFUmHQ17XhvBZ1D1/msT/WoixqygoHVxrAXeIZHKCIPYAAhXSvoRSsk
	4++ec+dNBPhmGxPEmwXOW7JHmm4t8b+O0Yfl7ewZPe12Ls+9Jvc2O/JfiUTehjm4k9T6xN
	QX+OZKX+V06Zcry0sA9pupy8GvUJzas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720530657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvj+CYjfPLQdg2gDrjN70o2HTsk5KrY6yRIRFXK7aRY=;
	b=6PyvjXLGBFNiv0ipDIrwgc4QrXZ3Sgr/6nTJwlhiD8W+eltiaIYRl+yBTIm6QbBqayRFt/
	ANTVdB1gib9pMJAw==
Date: Tue, 9 Jul 2024 15:10:55 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
Message-ID: <20240709131055.GB26833@kitsune.suse.cz>
References: <20240625134047.298759-1-npiggin@gmail.com>
 <20240709105314.GA26833@kitsune.suse.cz>
 <87h6cy67ld.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6cy67ld.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.ozlabs.org,linux.ibm.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2024 at 11:03:10PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > Hello,
> >
> > On Tue, Jun 25, 2024 at 11:40:47PM +1000, Nicholas Piggin wrote:
> >> kexec on pseries disables AIL (reloc_on_exc), required for scv
> >> instruction support, before other CPUs have been shut down. This means
> >> they can execute scv instructions after AIL is disabled, which causes an
> >> interrupt at an unexpected entry location that crashes the kernel.
> >> 
> >> Change the kexec sequence to disable AIL after other CPUs have been
> >> brought down.
> >> 
> >> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
> >> fixed-location head code probably couldn't easily deal with implementing
> >> such high addresses so it was just decided not to support that interrupt
> >> at all.
> >> 
> >> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> >> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
> >
> > looks like this is only broken by
> > commit 2ab2d5794f14 ("powerpc/kasan: Disable address sanitization in kexec paths")
> >
> > This change reverts the kexec parts done in that commit.
> >
> > That is the fix is 5.19+, not 5.9+
> 
> Commit 2ab2d5794f14 moved the kexec code from one file to another, but
> didn't change when the key function (pseries_disable_reloc_on_exc()) was
> called.
> 
> The old code was:
> 
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index a3dab15b0a2f..c9fcc30a0365 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -421,16 +421,6 @@ void pseries_disable_reloc_on_exc(void)
>  }
>  EXPORT_SYMBOL(pseries_disable_reloc_on_exc);
> 
> -#ifdef CONFIG_KEXEC_CORE
> -static void pSeries_machine_kexec(struct kimage *image)
> -{
> -       if (firmware_has_feature(FW_FEATURE_SET_MODE))
> -               pseries_disable_reloc_on_exc();
> -
> -       default_machine_kexec(image);
> -}
> -#endif
> -
> 
> ie. pseries_disable_reloc_on_exc() (which disables AIL) is called before
> default_machine_kexec() where secondary CPUs are collected.
> 
> So AFAICS the bug would still have been there prior to 2ab2d5794f14. But
> it's late here so I could be reading it wrong.

Indeed, missed that the code was only moved.

Thanks for the clarification

Michal
