Return-Path: <linuxppc-dev+bounces-8802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2194ABECD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 09:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2N2B1BGzz2ym0;
	Wed, 21 May 2025 17:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747811634;
	cv=none; b=HetfnK2UD+GrYMcN9fHPYr6zClS/9+WrhPE/ZVuH0TEQubFxK9C1DHee8gseAxK+NuutoQiZTyT2yq9daXQRGmcuBSAdpMpa3rPxHTTeB88/g1yC1dRLpX2yBlS55PmDWxM+HM6brIYAvut84rYnUYW+eDbYrRVhuqxlhwYgrd4Ar6+Vas/wqQmps3hesh4YKsZPM0r1iivor2t/wZXP5EQ559KuwVDwjzB2GYwBmD+VeXDbUzSKTYYy03/FXqO+SnXNOVMlOmi+u3HXEXjWy3G1nyirZU7YRaN4q9zcGOUirjuAqwgfE/INjbeF4ZvuQYfchuEgQ+6vbkYRaccSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747811634; c=relaxed/relaxed;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOScUUxZ3Ol2685If5wNp+PHwD9ZKGcPKiVjBkEJKWrfxwN0r4/Z+tO5HxoprMb3mi5c/y1nYZ6/2oN/eGZs8KfuuUaUoKui8FMrHWPQHLR0ChcFqiMFuEdcspD7KxfZGZaEHUgVxgRJl/FFDMSEnaaiUMJuB8AzYtmRn0AOOIBgXhJMLYBi4RN5FNr2X6mBIgQDybKJvn6VgKsySorYf9RAZlwaRPi7kVgPPtJ37uhg2l08qo8fBPkMTwgd6+yv9PU/d/SVu7wmoN5ksV0F84p6jrl/WkxY0vX9GiOtK5NS4ZFQ499J0R4/JlNcHw9fwKH/xD78DbjbKvya4dnu1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHt/ldBQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHt/ldBQ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHt/ldBQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHt/ldBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2N2872Lgz2ygh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 17:13:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
	b=aHt/ldBQOdHXusg4hsKOgwi1mNLs6JgHbRLPlZstlbyLAiePDgOAWSVYyHmadrSeF0n7sG
	w25FApDp7KtXZz/Gm46etP/Zc+pYgi3vOA+rikMWZX2nHKOJF526ekRlGYZWQq2G3mZE5H
	VceojLaCMdISsBz7gF5MryJkXhpT2ok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
	b=aHt/ldBQOdHXusg4hsKOgwi1mNLs6JgHbRLPlZstlbyLAiePDgOAWSVYyHmadrSeF0n7sG
	w25FApDp7KtXZz/Gm46etP/Zc+pYgi3vOA+rikMWZX2nHKOJF526ekRlGYZWQq2G3mZE5H
	VceojLaCMdISsBz7gF5MryJkXhpT2ok=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-5ZPwmiA1M5Cayq7W82-a7w-1; Wed, 21 May 2025 03:13:46 -0400
X-MC-Unique: 5ZPwmiA1M5Cayq7W82-a7w-1
X-Mimecast-MFC-AGG-ID: 5ZPwmiA1M5Cayq7W82-a7w_1747811626
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-707d49f9c3bso88057147b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811626; x=1748416426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4uXFki3RXaBZTP7u7kZxHdvFx0pW0nGcDYfjm3cMQc=;
        b=O3cxQasr4LPpLC7cC/HYuR784zGbI16+h1t0CH5JQQIYmaSUv3VR/jeg0oX+VmNyxU
         UwPXwaC5QbYftLtnLBQRUPElqaQ1ifRftnMSdqO/k/NE1ewqwxrMtuf+eroYvzR/gqgL
         JEgQ6wblQy0wSD8GPT9ic0jpSscSc4XFRWVpTMynhbzd09gus4puOnxJUO5LmhdXXCv9
         tmORFVgSVOnzkcaoERWl0HDfxwqoRRcyBzZwT+0JVlVAg7+FTsd7i+gwTsYOL6aVpWi3
         uCxVVcTyM9ZfBStZo+v5vx3TqytPMwwIHBfGBK9ohxaQkyxOsqy+RmsLteN3WT0rbEhp
         AJew==
X-Gm-Message-State: AOJu0YwUSKNB+cEeKWuKO5jcS8Vqmxpukm1S4+6bukKwIn8iskSrCgZO
	1vZnzMJbSafjWp1zyseaB1R8JFFaNgP/3Ki5t+MorAp7/VSRUYti0acxU3QUZlWaZTowOHQ3bjF
	iC3/fxCJP2acsk2U4lGXwlxg+k9Vl71adrPHAPVD6iO4UwXPVfaOUrBBU7wN5lPB3Src8ctZ5b3
	hAG4/2xWcSC7BqstY515kuqqNzmLIQQx0oXTqCirXDzw==
X-Gm-Gg: ASbGncsKSQGdbkWO7HOxvymItH5Owd1jaVAKlThh9Nh7dA9vDN3fpzccijLGKAGVBod
	Fl9hf73MLA26+tXjeUlRfunMBxa6ALNwVTHSc44JiHZ8HsgFjEDIF2H5fNQauQlbk5MQ=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id 3f1490d57ef6-e7b6a08f421mr26886353276.21.1747811626136;
        Wed, 21 May 2025 00:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKNo15Oi/QZ/k66bSnuQxE6bf08k4qaU0blNDQ7dnxZLVMy+YcQ+rT1+Lvnu8ha0WE5sLFghYmv/ZaOBdZByk=
X-Received: by 2002:a05:6902:1287:b0:e6d:ec5e:b5ed with SMTP id
 3f1490d57ef6-e7b6a08f421mr26886312276.21.1747811625773; Wed, 21 May 2025
 00:13:45 -0700 (PDT)
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
 <aCzf6aoJAC-IdS_n@kernel.org>
In-Reply-To: <aCzf6aoJAC-IdS_n@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 21 May 2025 09:13:34 +0200
X-Gm-Features: AX0GCFtXE4dDeCn9cUTuVG4Gx57oa8NEQ7aSl0jUrOWZcTyJncPcrt8z6mYPIQQ
Message-ID: <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: qCqwnpqhYiwSHKLetLCAL7lIV7vapdOXIN0jWygczDg_1747811626
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 at 22:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> On Tue, May 20, 2025 at 06:06:50PM +0200, Stefano Garzarella wrote:
> > On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > This driver does not support interrupts, and receiving the response is
> > > > synchronous with sending the command.
> > > >
> > > > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > > > ->send() already fills the provided buffer with a response, and ->recv()
> > > > is not implemented.
> > > >
> > > > Keep using the same pre-allocated buffer to avoid having to allocate
> > > > it for each command. We need the buffer to have the header required by
> > > > the SVSM protocol and the command contiguous in memory.
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > > v5:
> > > > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > > > v4:
> > > > - reworked commit description [Jarkko]
> > > > ---
> > > >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> > > >  1 file changed, 11 insertions(+), 16 deletions(-)
> > > >

[...]

> > >
> > > I can pick this for 6.16.
> >
> > Great, thanks!
>
> Can you rebase this on top of my next branch and send one more version
> of the series (fake ancestor crap)?

I tried, but the last patch (this one) is based on the series merged
on the tip tree, where I introduced tpm_svsm.
I can see that series in linux-next merged with commit
16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
but I can't see it in your next tree [1].

How do we proceed in such cases?

Just to be sure, did I use the right tree?

Thanks,
Stefano

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/log/?h=next


