Return-Path: <linuxppc-dev+bounces-8868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FCAC0707
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 10:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b31bz2D6Kz2ySl;
	Thu, 22 May 2025 18:26:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747902415;
	cv=none; b=H2fnsfStTPb6gXec8ZAldJ8QzTCCAADMgJKdQdVwklMgRdyuyF2EQJZ9TfuBNrQr9E7epe5yA9i3Irz+wKxtAV5w4NhJc4jvtN0t1ZQpmTU+Lk1MuZurZuluh6odCY/kO0lYHXckH94k3G4pn3V/Z5UbF+2jyTXbfeL+J4E8NegiCuCKiLRbgZJfTSrd0136v9oFEAjqEM6Btu57keVdk+ToeSqAz3lAqyGCoCy+h4PB+yW6zg29CI5KJ+ktTQzEwhrZwN2LZEo5FYIA8GBgS4lkMD7ptCbbeFWIX3uUZW2umaOAt1HtWFh5ngQ+/RfnbtuaeVz7nv6rbzH+gnAjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747902415; c=relaxed/relaxed;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/XXlBlrYGC/UkwdwdMI8e9BNlKgBsMlUJ21zsLzBZS/3pKYMqK7etXjwKOG9fgZqCcqPuA27hazyFC/mExpOaunb6PTYjhJVV2G/LPAWxn6o1+HFWsoJljSQUdm8E3VSHskJNRsjErqGAcWKqw74eyLLNhNST+eDXa+qSEDIJRuqu7FlxJJMEmB7GLSmou7aJ+qF0j4Ojg5UOmh+zHu2W+orqkz2jKGq1N1jSstk54xl6KJ0XO+ZZ8ot7Y1eh1S0hwk418XFLR3ScAdKacQmuydezL0b9GHD59I8sYoz6Xm9aDvmwHLaLqPypcHMEM+lVlzivSloRMToBuPnHIMPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1+8QZaf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XR1S0QnK; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1+8QZaf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XR1S0QnK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b31bx5S8Wz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 18:26:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747902407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	b=I1+8QZafWte4nOjPAfO/GFqVhDtRg52/fJ5vjft6mOzWtfpudhvSNmESHhIQWlkD6Bdwqf
	l0PgYJ2SIRNVyaXmtYdaLW9ew6EP5evZN38zqDXclH4r0cdmI8aUvl0+J7ePsN8rWa9+sq
	NwmrwENi3Ven9+sK9BL+tUSMUDBneaw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747902408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
	b=XR1S0QnKzJcKBXu7IM7mGIOqXTay76uaYTDvlcmNQ7PkjSCwCqr/qYMLXYtmtiKpknCMWp
	u/uirrerMwaekZk92AENuBU3bSA3ShAcRLGBJGwz7/7h6PJu/zUvn50mZF4E6ybkGKl1Po
	QmRy3ZjG6SIjY9SUhht4Qwi7eCg6dW0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-3I_kqDsiOu-r4xi9Oyn-KQ-1; Thu, 22 May 2025 04:26:46 -0400
X-MC-Unique: 3I_kqDsiOu-r4xi9Oyn-KQ-1
X-Mimecast-MFC-AGG-ID: 3I_kqDsiOu-r4xi9Oyn-KQ_1747902406
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70dda56af0cso51937957b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 01:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902406; x=1748507206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dlp2azLQltfH6emKWYdlW4k16t8gyfKRpWtf3w9Dv60=;
        b=ef/DpajHs33FnMaRVp+6uD4g1RRmnl0wOlf1tolYI+271w+LlnQTInXQXzzyA4e/Pm
         xh6/etF8Bu/XVvKugvDyHGt1ZX9cpkLw8/FeYtmb/xvcjArEdRUn/51NWNAhmuM3v3Jx
         tkBUcZPwOExzoJyEbag+w/vSVLhd0ipDIPvQr5sDFBpw9RhkSLssH1aWbUFUCa73E5LX
         B5bDmX0P/3gJkcZea0JndQF0L6qxjC+3rBDDMYJFZboLoWu09L14E+wa9HRPunRNSd4P
         JsEVBNfWwgBzjRYtPv92POZwpVCbRcB/vio2ifg3ERbSlFeSYJRBtfn04Xf6NVrwSUgV
         1qiw==
X-Gm-Message-State: AOJu0Yx3FD1/ExOW34nvG+rISVy/1nHJS5VEOW/LRCnbk3etpwqzWmjg
	Zgk12u3n8//34HMlvymXuBFD4Dlz6PX+JuFO6rxWRGhub2H+pV5uLRKPnl/ViKbxNWYs4YVxRmz
	yGRAgxVadxlWVDsEgDy8s8eg+WmUEOkV/5hvvhwcQKWngN8NmxQXGThBGEfLIIkALY4JszQBUw9
	ARihDxL7k5G/vLF/1UNztAa5x5O68UDKF5uJefctgDFA==
X-Gm-Gg: ASbGncsZQ6Xh9rF2BaCSxqbOtFI8zEvCKh55DjtHzJNu5X6Jut0THjfeSGe6ZOxh2HR
	ndPCXOyhEO1wO8z3hPZm9DEuAvVyK8WiWdGgMeCcxT6sxsDlCO5HCca6YE7IWmN7QYVw=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id 00721157ae682-70df3bba868mr78205697b3.9.1747902405950;
        Thu, 22 May 2025 01:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhVj8JhGJCK+zc7RP834KN5Eve5FMdd9QufZUZBEqDbkQHG8Gr0Mr3Ft0fdQAFQnebVlVVoTvKHtpXaHPSYY=
X-Received: by 2002:a05:690c:3393:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-70df3bba868mr78205367b3.9.1747902405539; Thu, 22 May 2025
 01:26:45 -0700 (PDT)
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
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
In-Reply-To: <aC4CVUXpThAyKQdf@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 22 May 2025 10:26:34 +0200
X-Gm-Features: AX0GCFvwBrY1Wuz2vdIMhJw7TkALKpOFZS5DJd8t4bfvvVGz5MJKErKjPBRbZJg
Message-ID: <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vrwJjpXUYOJAPaNXbcvP1gB28CPHhKYNotR__Ff0C20_1747902406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > I tried, but the last patch (this one) is based on the series merged
> > > on the tip tree, where I introduced tpm_svsm.
> > > I can see that series in linux-next merged with commit
> > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > but I can't see it in your next tree [1].
> > >
> > > How do we proceed in such cases?
> > >
> > > Just to be sure, did I use the right tree?
> >
> > Thanks for the remark. Lemme check tonight. Hold on doing
> > anything ;-) We'll get there...
>
> I just rebased my branches on top of latest from Linus. That is what I
> need base PR also on, and:
>
> $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
>
> I'd use git cherry-pick on a range to take them from linux-next to a
> mainline tip...

I see, let me know if I can help in some way.

We can also wait the next cycle if it simplifies your work, definitely
no rush on my side.

Thanks,
Stefano


