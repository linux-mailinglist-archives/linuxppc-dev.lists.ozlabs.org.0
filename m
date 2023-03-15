Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E36A6BA7F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:43:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pc17L049Vz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 17:43:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=lEhqhxsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=lEhqhxsr;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pc16Q5Jz7z2yHZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 17:42:37 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A393D3F11F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678862553;
	bh=QQPXWCJGAVqPCrDQDEiksVm9saVIlCxHx75WTxvRwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=lEhqhxsrafnfDpcICJi2w5eogkuoQcG7guMTPpfjfpeSj4h5O4h6xirO54X1HPvy0
	 KeJtodia/jmnqgkIa5JSKVZaRi2UpiQ1KwGuMTAyokmC/mz5wEDD2M1ffJVAfopzZC
	 6xixagdrzXdlPj5TLBKqWHNpCaV4yuDlqSTtob7pk6jAE0abb5q3v7aqhTrCBs7H4W
	 piK3b8TIOKZtILY2z5enaBFC9Xi4n2UGhv/Yxz9RkjbIWIgvauPZBC4oh9rqDElmBM
	 BMS6uQM2iI3DM3cJvtv8g+z+buc9q3Vp7Jripq0NOhWO5egmUj0gwvGkioxyK6imL4
	 7CJqx8/2R4/Lg==
Received: by mail-ed1-f69.google.com with SMTP id h15-20020a056402280f00b004bf9e193c23so25579011ede.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 23:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQPXWCJGAVqPCrDQDEiksVm9saVIlCxHx75WTxvRwxc=;
        b=rBCzzEZMo5SUX0vGA5ogrveJHx++e6cXQLxvPzNSld5zrv1ihYuxrq+KppNX05xhcc
         4sreKyGI+lESwagWiy4xwp+lTiCn1EgHGdObsehn70YyKzAfR3WnPYQRMxYIMW38o2eJ
         2Zlu6o61Zik1lLLs0ct1xLDOvxoc2TCSrh41CwShZRDG+cAgQBkE0/Q+xL2EFuunzhKS
         zF8DroPUa5HfqR9sWfuUW6cF1MP8WD1iNarY7Na4WVVQ/4WXuObuP+2vCc7GUruYghyz
         kAhtvneeHDds40My5I9ZIWT0VbmlSUaFzfPSY7ivLO/5CvGZDVOD1P07U+HJt1DQkiqY
         dgwA==
X-Gm-Message-State: AO0yUKWcUfoLkuWeSXZiOtKTlRVmpjUuyT6ljEx9e/iMHYGXzSo4MK0d
	tYg8WiwTiSZfkRMyJqPaXoCeH5tb/UK7i2rG1SLEvbz4OoYHFMmC/zwQFGlASBNICUxuaUkGkkO
	VP7As+sM/UZcjtou9HjDtESM2jz9+/FPkV3NN4rd90GE=
X-Received: by 2002:a17:906:a90:b0:877:5938:6f6d with SMTP id y16-20020a1709060a9000b0087759386f6dmr6042290ejf.56.1678862553246;
        Tue, 14 Mar 2023 23:42:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sXcC3b5v3NhXMiaV4FPaQsAZNt5dpTsGP5MtjsAqIfCkshWOBfqoxo2XpOeQysXCGjQnV9g==
X-Received: by 2002:a17:906:a90:b0:877:5938:6f6d with SMTP id y16-20020a1709060a9000b0087759386f6dmr6042270ejf.56.1678862552956;
        Tue, 14 Mar 2023 23:42:32 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id go37-20020a1709070da500b00927b85e48b0sm2016585ejc.111.2023.03.14.23.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:42:32 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:42:31 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: boot regression on ppc64 with linux 6.2
Message-ID: <ZBFo18eqFIWvdwpo@righiandr-XPS-13-7390>
References: <ZA7oJr1/Z4vzWy4N@righiandr-XPS-13-7390>
 <878rfyofma.fsf@mpe.ellerman.id.au>
 <ZBFhUAlL+1ZVKcwQ@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFhUAlL+1ZVKcwQ@righiandr-XPS-13-7390>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 15, 2023 at 07:10:25AM +0100, Andrea Righi wrote:
> On Wed, Mar 15, 2023 at 02:30:53PM +1100, Michael Ellerman wrote:
> > Andrea Righi <andrea.righi@canonical.com> writes:
> > > I'm triggering the following bug when booting my qemu powerpc VM:
> > 
> > I'm not seeing that here :/
> > 
> > Can you give a bit more detail?
> >  - qemu version
> >  - qemu command line
> >  - what userspace are you using?
> >  - full dmesg of the failing case
> 
> Yeah, ignore this for now, it could be related to another custom patch
> that I had applied (and forgot about it sorry), this one:
> https://lore.kernel.org/lkml/20230119155709.20d87e35.gary@garyguo.net/T/
> 
> That is causing other issues on ppc64, so I think it might be related to
> that, I'll do more tests making sure I use a vanilla kernel.
> 
> Sorry for the noise.

In fact, I confirm that everything works fine with v6.2.6.

Thanks,
-Andrea
