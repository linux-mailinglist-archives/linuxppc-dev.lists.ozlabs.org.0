Return-Path: <linuxppc-dev+bounces-14230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3982C6708F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 03:35:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9THf2MzSz2yjm;
	Tue, 18 Nov 2025 13:35:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763433342;
	cv=none; b=URpmjEkVA+tKbFS2PUm+rH/Fnt0asaEnAqff0H3jJKTLK/DvEAh5qXFJJb6uRZ9fx0gLCEuy6V3zm2umOexSbihuje/1rfywJpyhed0+c83h1iqCdWC9jk3LwdYFaVjI95foyAvZ0UErSRTMIp/dMzpKf5ibG2ncUwn2d9Uwgkf9GEXEOs2GpeD/bXe1xO36puK/JhooSYMYALtanM9vocYezW/Dj2/EJHlQ2roWz4i9hVfoT97efwdIEKEJ/GndgHj6pIW7rVS0ccSS9emyY+lEG3ielcZkux3Jhjhrm2nqgjAODKTD6lPononvWS62xaWyCj3zUeEhA1gUULhobw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763433342; c=relaxed/relaxed;
	bh=mksiD0j4efL/l3qMIIvv+bNsIVNXPI3dkLiI+5z/Yfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrTCkBclJhGd6Wrf98eFfcPv47p/Q02vWWqi3k1ZTMQFY0kx6kiK/qqb0XhIb7T/LgBkTpgeeC0uf+zypPLImtzPE+9tIfHkvKXmJqaHG1Sqp1+wVDGmykJpcd+cOvn+BImOERPAxeijEAfDjdIQTbutJ9Hejz8W95L/hqGAs9ywd34jGlLn/h5kNbN+CW6jKLldHyUrT5e9R+1gVokM2FuhYbUUSGqnqPnokbZhYOkLa2qNDPYKogcoenIJk9raKpWyg2/TV198+jkCHLMCpTLn++8aqJx/tN4WrsOpQawjewMqyPVm/3aAcbw81US1HfMaIKOwfNNP8MbnRsIxfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vgY5WW8B; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vgY5WW8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9THd0BvJz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 13:35:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1BAB601BC;
	Tue, 18 Nov 2025 02:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0235C2BC87;
	Tue, 18 Nov 2025 02:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763433337;
	bh=CRCD2rguqh+WPne9dd5lj9Micj6TMBS9/fhz6RbrIgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vgY5WW8BnNwTFkr1CqGzVVAn8dfzoBhj2Ep9OZzZPeg1xHu6mF1vh8NeQ5gnPaCUI
	 hehogcf50XcUOoYsd7JVzTDcRwav8kb7J9bp0D7+WA2rBQFS9kfIV8oVTYMHRK1dX3
	 oaScTMoGOaQPuIDGSoELlIlMUyEt/lZG+FvX81p4=
Date: Mon, 17 Nov 2025 21:35:35 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <2025111717-showgirl-suspend-2f8d@gregkh>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <20251114074614.GY2441659@ZenIV>
 <2025111555-spoon-backslid-8d1f@gregkh>
 <20251117220415.GB2441659@ZenIV>
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
In-Reply-To: <20251117220415.GB2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 17, 2025 at 10:04:15PM +0000, Al Viro wrote:
> On Sat, Nov 15, 2025 at 08:21:34AM -0500, Greg Kroah-Hartman wrote:
> 
> > Ugh, messy.  But yes, this does look better, thanks for that.  Want me
> > to take it through the USB tree, or will you take it through one of
> > yours? (I don't remember what started this thread...)
> 
> See #work.functionfs in my tree - that patch carved up + fix for UAF
> on uncancelled scheduled work.  Individual patches in followups.
> If you have problems with that series, please say so.  Otherwise
> I'm merging it with #work.persistence (with #36 in there updated as
> posted)...

All looks good to me, thanks!

If it matters:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

