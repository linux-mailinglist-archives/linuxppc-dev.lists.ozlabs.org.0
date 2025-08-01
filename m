Return-Path: <linuxppc-dev+bounces-10499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC69B17DB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 09:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btd9k1VJqz3bkg;
	Fri,  1 Aug 2025 17:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754033930;
	cv=none; b=PV+WcowRVcPboh3424ZWtrieZgqRTz93r6cu8Rchb71Wrpy3VtrV0KRITY/M5fyL7IC8u/SpaD1iyc3yUY/dn7yyx2APnxAoqb/w+c/uVrVis8Fm2yCM5S6+nYUJQTC5sh051yc9qPDxv28BHYd8UcchH6sdJ82VwcEX/lTMfZQQR/K2G79gdRU01wSqMwWuQETrknO9Ce8trfjMoFmGGy61QxqbiWkoU3A3ywynkxa9wc7Iv/J8SChY7wl1LKn/byVoJHLWg/MIyu4kgTgXDvvnf1qn8hJTDmXKC0ohuWAX/kvJrqSFhH9FHtQeMVh4f613BWLgvBMvfR31vRKCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754033930; c=relaxed/relaxed;
	bh=Wo/uZ2PTbUHdY3MpvIVrXjJvL6oXX6CpdMETBBnYEGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj3FSkjY4rnXUHOFa7KjGigCX4TwEBg9oD+GyyvjRc2nm0AdQ43oJkZstWfrzGg/njMILJDuuIEK7SgfrTdXfnMy815IrAiueKwWWpdkmGYIJaOPGVUkYmQsNLhlGbzfMh51LVvFlni3LZnGg6rSJzjc4BA/Fb28T6D0lN6w3/2Ri5r9YjIAfcRm8cjMUpzQTXwJFFKe8OaZi26y/eXUUZ6eFhN0GFyj61c/WtnH06Jiwo6+MS0bfHemj2gfq7f4YY2q9dBeYIAj0SRk8OJ+Xnxjq9x9AmJG0+sqA0hOHmUwablbsOFk8cYHPvaX3HdWtdxAW1txu+/W94hrbWtMLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kADqky8g; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kADqky8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btd9j09cFz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 17:38:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8672600BB;
	Fri,  1 Aug 2025 07:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE49C4CEEB;
	Fri,  1 Aug 2025 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754033925;
	bh=PGUIRkQTVwA/le+QGrm+xXgoYbD5Hwb7ARZOJhCTUJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kADqky8gvcxY6epOpgG69Fh5ZSLGWCnPR8IP7Nu0nJ79F8bWPF9g8IUg5+NLRYSnS
	 Cz1mhBc/XQOnxI1VRfZSWsIbnevqc786bZUZoUXKFQFGgp7alvnL61D/w9RgJDIwKf
	 3qK664gbomcBtx/mddK3nx5NiIO9LO6iDlTjVJyI=
Date: Fri, 1 Aug 2025 09:38:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
Message-ID: <2025080127-scarf-tableful-dc90@gregkh>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-8-jirislaby@kernel.org>
 <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu>
 <3ac7427b-4f17-480e-99ae-f00e5c00e678@csgroup.eu>
 <9811012p-4q9q-284q-n2qr-7597s16p8sq5@syhkavp.arg>
 <9fffb5be-eced-4207-86fc-8939de1ab16e@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fffb5be-eced-4207-86fc-8939de1ab16e@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 01, 2025 at 06:47:46AM +0200, Jiri Slaby wrote:
> On 31. 07. 25, 22:58, Nicolas Pitre wrote:
> > On Thu, 31 Jul 2025, Christophe Leroy wrote:
> > 
> > > 
> > > 
> > > Le 31/07/2025 à 16:35, Christophe Leroy a écrit :
> > > > Hi Jiri,
> > > > 
> > > > Le 11/06/2025 à 12:02, Jiri Slaby (SUSE) a écrit :
> > > > > _IO*() is the proper way of defining ioctl numbers. All these vt numbers
> > > > > were synthetically built up the same way the _IO() macro does.
> > > > > 
> > > > > So instead of implicit hex numbers, use _IO() properly.
> > > > > 
> > > > > To not change the pre-existing numbers, use only _IO() (and not _IOR()
> > > > > or _IOW()). The latter would change the numbers indeed.
> > > > 
> > > > On powerpc your assumption is wrong, because _IOC_NONE is not 0:
> > > > 
> > > > $ git grep _IOC_NONE arch/powerpc/
> > > > arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE 1U
> > > > 
> > > > Therefore the value changes even with _IO(), leading to failure of Xorg as
> > > > reported by Christian.
> > > > 
> > > 
> > > And is likely an issue on the 4 following architectures:
> > > 
> > > $ git grep _IOC_NONE arch/ | grep 1U
> > > arch/alpha/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> > > arch/mips/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> > > arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
> > > arch/sparc/include/uapi/asm/ioctl.h:#define _IOC_NONE        1U
> > 
> > IMHO this one patch could simply be reverted and the "old" code let be.
> 
> Oh, right -- it's easy to revert (no conflicts).
> 
> We could use _IOC(0, 'V', number, 0) directly, but I am not sure, that's
> worth it.

Great, can someone send me a revert?

thanks,

greg k-h

