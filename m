Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4B62418A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KZH454tz3dxG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R9YU88Kl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R9YU88Kl;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KXl5nDDz3dtQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:36:07 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so1335917pji.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkGGzOMikKUGKVTwfeE+OZEsBfoKMhINDROQJAFn9+Y=;
        b=R9YU88KlN56sCBVKX91PZ8zykxZetasCtTMZuKXnfmell6lhEMkh8HAsgtQ5v17yi/
         HvnazNUpOamxZPIbLz8OIP6lgpcAwThuqds91AXocIKQzxKPmURtZ3jZW4vchCDD/ezZ
         k1mQX3lfSi16gVRs4q25W+DnDZ1MgQyyYU9GgnXz0on/Zc9HQ/Krfrq/+6Et4XxxtnZ2
         RqU4lGAiIB0WzfxAgOtAuMWAEMXhhs5SizDQ/kK5BC73lvjHiaV/5d2hczeXfQL2q5kU
         RxFRcM40Wx4TwD8uqc1kQh5BdDrx0lQOzJ4fLzrIIhS+uSkj90kEQ9iPXF4tTudelSdU
         Gztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkGGzOMikKUGKVTwfeE+OZEsBfoKMhINDROQJAFn9+Y=;
        b=1Qx4DHo38LEb8Pe48pV+VfIrMB69AT458ysixCZ7c8TF7xRPE+h5at2goeVHxOuIcS
         03W+sCt54LcYZYsi9AWWl1gNEmLQVRu+UuGdxzlLyYSbj0vXrXHkHw+JzMIabTjDc8GL
         J9HtSpp9Vlcotkbpiph58vMcDSKsU+F4l/1/Zr99hENi4U2lpuljey3asYKa/6eVJOtq
         McWdQazDdTMn9GREzAX5JZG/TPdinqnIEIaC4Gbs0DUXXClGuPj3bF8HjaFW0FR0KiTz
         lD7ZNWKZjJ/nrUv2zH5fIUn21wUNRi6ttLGVKHQGNIvF3/mQPopJRRzZ8Nt2OShPXQQb
         uFAw==
X-Gm-Message-State: ACrzQf2JertX0FACG0otH0obo2n7s0Qe+0eLXxqOx1RN5FbbkF1BCikk
	JA4C+BC4poRKAVtIGbdOXWg=
X-Google-Smtp-Source: AMsMyM7FX3e6Z8Ys5S8tfgGF4al4/HYIrY0PlGgo7J1JGWSbmyf3cVAMnwVP84R0oSTx6clxKbEKYw==
X-Received: by 2002:a17:902:e9c2:b0:186:79dc:7d87 with SMTP id 2-20020a170902e9c200b0018679dc7d87mr63970094plk.59.1668080165671;
        Thu, 10 Nov 2022 03:36:05 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id ij25-20020a170902ab5900b00188a1ae94bbsm422392plb.23.2022.11.10.03.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:36:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:36:00 +1000
Message-Id: <CO8L2EZR2P0D.1G72IZFI1KNAQ@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 14/17] powerpc/qspinlock: use spin_begin/end API
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-16-npiggin@gmail.com>
 <b0a117995bb311dff161c475f7ba76709252c995.camel@gmail.com>
In-Reply-To: <b0a117995bb311dff161c475f7ba76709252c995.camel@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 10, 2022 at 10:43 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which hel=
ps
> > to prevent threads issuing a lot of expensive priority nops which may n=
ot
> > have much effect due to immediately executing low then medium priority.
>
> Just a general comment regarding the spin_{begin,end} API, more complicat=
ed
> than something like
>
> 	spin_begin()
> 	for(;;)
> 		spin_cpu_relax()
> 	spin_end()
>
> it becomes difficult to keep track of. Unfortunately, I don't have any go=
od
> suggestions how to improve it. Hopefully with P10s wait instruction we ca=
n
> maybe try and move away from this.
>
> It might be useful to comment the functions pre and post conditions regar=
ding
> expectations about spin_begin() and spin_end().

Yep, added some small comments.

Thanks,
Nick
