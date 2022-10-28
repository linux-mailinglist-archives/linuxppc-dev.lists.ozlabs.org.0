Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79F610B76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 09:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzDy81F7xz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=AoCvpD2g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=AoCvpD2g;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzDxF6MCKz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 18:40:47 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id t4so2491223wmj.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i2N6u0rpi5MSxrtESZE6Q60hmeXl2yrT4Q/yzn9seGQ=;
        b=AoCvpD2g8hOJXZ2R+h0TvZDHfaokVkjBrIgJhsnS+RetduEnMeG2bCCW5x/1wmwm7y
         tpBT95DdI7WubCuwdur/JGKGBJMJTmP2C+cDmuRV2EIc6vAsZ3DUgxOdepf3Ri0V5o/g
         s61UXLKKrJMPwJgSYbyvTnZ2kLiEieceMzgGWlWdWLree/oXrw+5/Cgog666CiUnyi5H
         iiuCQyE6pPGPEBhy4h9c2slAcvDIj2QVcAFikE7NBHa9TvAFyRkoKz9Xmr0z/0PG8Ue7
         mIV0FWee9ddQzPpFwF4bakArR7lyrUpkkh9KC8i6sE/VKS8eJ/p/NH5MjHPo/bG55EaI
         zcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2N6u0rpi5MSxrtESZE6Q60hmeXl2yrT4Q/yzn9seGQ=;
        b=JKB6GwRS2plA2EpYkGm5nxKinlS4+1pAgRPL1BvpjA8gbskTXg7YmPXvie3fCKs2Ix
         yvvUKSwKrXQkSPJYb/xOl+bAKELvBnej8kqOJXjeP783e4xGdfghpUoY0mE0CYJDvaL8
         ksnXtAUGPGgLZpKJv96gWXJdDRteqKbdfUDhc58C3h5VwwsZiI9zpewtCbBvwqELvWUy
         60iYy29Nz2/8u1eUoAPeaNcSxtVJjt6ygNZnwgxfqZMvAr7EonHiqlgCzgvaNd4sJtGn
         LoThkGkxQI/0XXqZhBU4s0CXsxxWVl6oDsf8pWt/OlWx/lzVURO5S3jfwAybefyLcOX9
         Gevw==
X-Gm-Message-State: ACrzQf2bCYrHrWz9rUgU/57icZ0GAETd3EwdhSmJoCYPjv39k15mOV2N
	ArOQEQDV8uYxCRQg45Zq4LWysw==
X-Google-Smtp-Source: AMsMyM6b9ooO2YT2Bk853NHb7QqLyKbP8a68ufEkfEtecmJkMMeYnDPuL+24oxMQM0KqoQzia6z3ug==
X-Received: by 2002:a05:600c:3b88:b0:3c6:cef8:8465 with SMTP id n8-20020a05600c3b8800b003c6cef88465mr8354486wms.64.1666942839337;
        Fri, 28 Oct 2022 00:40:39 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b003b4ff30e566sm12687932wms.3.2022.10.28.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:40:38 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:40:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Message-ID: <20221028074037.ksvtvzajyulm3oy2@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
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
Cc: jonas@southpole.se, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, dave.hansen@linux.intel.com, gor@linux.ibm.com, yury.norov@gmail.com, hca@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, mingo@redhat.com, bp@alien8.de, Paul Walmsley <paul.walmsley@sifive.com>, shorne@gmail.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de, aou@eecs.berkeley.edu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 27, 2022 at 04:07:18PM -0700, Palmer Dabbelt wrote:
> On Fri, 14 Oct 2022 08:58:43 PDT (-0700), ajones@ventanamicro.com wrote:
> > Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> > started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> > are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> > start and next seq operations implement a pattern like
> > 
> >   n = cpumask_next(n - 1, mask);
> >   show(n);
> >   while (1) {
> >       ++n;
> >       n = cpumask_next(n - 1, mask);
> >       if (n >= nr_cpu_ids)
> >           break;
> >       show(n);
> >   }
> > 
> > which will issue the warning when reading /proc/cpuinfo.
> > 
> > [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> > 
> > This series address the issue for x86 and riscv, but from a quick
> > grep of cpuinfo seq operations, I think at least openrisc, powerpc,
> > and s390 also need an equivalent patch. While the test is simple (see
> > next paragraph) I'm not equipped to test on each architecture.
> > 
> > To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
> > a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.
> > 
> > While the patches are being posted together in a series since they're
> > for two different architectures they don't necessarily need to go
> > through the same tree.
> > 
> > v3:
> >   - Change condition from >= to == in order to still get a warning
> >     for > as that's unexpected. [Yury]
> >   - Picked up tags on the riscv patch
> > 
> > v2:
> >   - Added all the information I should have in the first place
> >     to the commit message [Boris]
> >   - Changed style of fix [Boris]
> > 
> > Andrew Jones (2):
> >   RISC-V: Fix /proc/cpuinfo cpumask warning
> 
> I just took the RISC-V fix, might be worth re-sending the x86 one alone as
> nobody's replied over there so it may be lost.

Thanks Palmer. I still believe this fix is a good idea, or at least
not wrong, but as the cpumask change which started the warnings was
reverted (commit 80493877d7d0 ("Revert "cpumask: fix checking valid
cpu range".")) it seems the urgency for fixes like this one was
reduced. I'll ping the x86 patch to see if it's still of interest
or not.

Thanks,
drew
