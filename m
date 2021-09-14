Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBED40A306
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 04:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7mqz5qsFz2yXf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 12:04:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=COw8J9SZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=COw8J9SZ; 
 dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7mqG067Yz2yHN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 12:03:53 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id r3so20788169ljc.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tobHcPJqhSNN4ZgtQaxMXpHgpTB6zZsMk6e9QdMIJao=;
 b=COw8J9SZUs4LkLiixQE+bnMy4NhxzCRXjrXYewVuOym1vN7v5KNNtqhQIlVcrbvboC
 UjjjEk1x1NdooPYMhBvKaSWvMvmm+9qbRiHG23qPOwLueInAFV1LTxwOeLxyCpMeQrus
 dKVrFrAyLVCKJ4IB9zqk3uoXaWuxBLuq4iGm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tobHcPJqhSNN4ZgtQaxMXpHgpTB6zZsMk6e9QdMIJao=;
 b=AK9Mq9BpEyTmi6ARc4F+MwXpy3Mo+O8gRewAm+oYyC4dFjxSE+XzB9ROW+iQF1pJDa
 De0ZowNgCAj7ZHLSdO6AXYxaMw1h1hUCmcG+CHRPnEAz+pY7PNIQ5eV2XSkJDofVKy90
 Kwn5MipcRsNGRliiMtinpsTtkGWBR0+mpVX3WRIJsqegULsNhMfepFSa2HYgsnoyEnOt
 BgWxvnzZ4o8dfoQ4n6cchTtMqxIQbWzvFZ1URyNdSAWSb1BtLkx7DYzI1okfZ7VS+/mn
 699rHDa0qn2evhIpGxUbbW2G5VuXeLM7ES/KAWhXA/SMCyO7Es+BU6WnY09JAdEbF0VG
 5pHQ==
X-Gm-Message-State: AOAM533Hf3Ip6JKKg+RkB+7pYbQAZllQjyzbYmJYQ9zaCb2dnjQ3H7pN
 /Kiiydrf3W/pZLPuTGaIWyN2POqJMvpDDXWyVgE=
X-Google-Smtp-Source: ABdhPJy+PHpVIqXrh0ZURQ870WAAR/jeN74bby83P6DVmfFpxerKrQwNWhsS36PB3q4wElM/TRgB/A==
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr13501072ljc.42.1631585028507; 
 Mon, 13 Sep 2021 19:03:48 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id g14sm32285lfe.46.2021.09.13.19.03.47
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id o11so13255467ljp.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
X-Received: by 2002:a2e:1542:: with SMTP id 2mr13338597ljv.249.1631585027415; 
 Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
In-Reply-To: <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 19:03:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6ADF7EkeZVT=R0=-hRxZeT0Ffcc5HSB0hSbK9AMX10w@mail.gmail.com>
Message-ID: <CAHk-=wg6ADF7EkeZVT=R0=-hRxZeT0Ffcc5HSB0hSbK9AMX10w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 6:37 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, that just makes me think that something like that patch in my
> previous email is the way to go, but I would like to stress (again)
> how little testing it had: exactly none.
>
> So please consider that nothing more than a hand-wavy "something like this".

The alternative would be to just add a

  #ifndef __ASSEMBLY__
  ...
  #endif

around the whole thing. I could do that without asking for help from
the powerpc people.

But it really does seem kind of wrong to include a "compiler
attributes" header file to compile a *.S file. It's not like any of
those attributes are valid in asm anyway.

I did just verify that the patch I sent out seems to cross-compile ok.
At least for the power64 defconfig.

So that's _some_ testing, and implies that the patch isn't complete garbage.

          Linus
