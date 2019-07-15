Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B062B68220
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 04:00:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6DP1JvyzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 12:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nE0METqh"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6Bc6VBZzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 11:58:31 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id u17so6925055pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 18:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g0zyhxh4ks1ak56xEA2lEhz+tyGZV7cQskN34O5j4OQ=;
 b=nE0METqhxjmhBEfyXwCVsWIUJOj6dIweZWcGREMFX59UaGPo3X9fR6Emdyb7AlPd2U
 sXg3TtOYP14V48gYKEvYE4BkmvCoKPcAYEvKcbeZT+pGzWwrnzAmFEuYKv1QvC+wCj9m
 UwI1lAxz8DyAhoNXfj+HU2jvfELg/sTEheZSuePhBRNXbTAvBEhuUTkTGVEITaQ1fXSV
 yzktriO0SK9nR825fNZgbzgTwn53ofLDrs7DV9UGAAe+q2DSAvJncTP7hkNKJ62BUUwu
 mmrkaYUGcN5lIsEBqkUHxbJi1AQW/xd1R/8H0PzHvwkSteXAUXxuxKl7/kE8fEW/5ibK
 PiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g0zyhxh4ks1ak56xEA2lEhz+tyGZV7cQskN34O5j4OQ=;
 b=FGK+ftleSYC594o7RUn5OQI0/82ZykBrrZdAknCMaJEv/vbJWjncn0d72nWCWnZWMw
 /afwhZjNmjkRZZr6jcAJLCZzMdzJb1vwcXcp67i+F3TiAGXPY+FSc0mLXMJzDlG0k360
 GpkMVpeR7ggqhZzcQqPUsvm0L+AZmBjWGLxDd+EJEL9cXwlO/pBtadPhMuJEyFcQYQMp
 87oerf3FjJtaa8DRfJJgrO0xnl0EBdS3VbWDvHpje/FnMLyy3jyQCAH7pL0QSaKNnwuS
 kQrHBwzkWDGdLf80tbLah4kNpkacr/1tTwahTTHfHrKXutONku9qCyb65qcOavFvI1j+
 Ealg==
X-Gm-Message-State: APjAAAWfJeWbMar3ipUl4tWA6xbWWG3eh/PwyUTccgGlov8vwPMak8RL
 REfV+vamcgTzPoZkvxi8CQQ=
X-Google-Smtp-Source: APXvYqwypHVqJSzNP6RDRYofw+mVtX+lsRxHONry5ynalPnbbOOX5tuRRJ4VOk9SUIaLaUhUkkW4WA==
X-Received: by 2002:a63:9249:: with SMTP id s9mr23468299pgn.356.1563155909708; 
 Sun, 14 Jul 2019 18:58:29 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id r1sm17597451pfq.100.2019.07.14.18.58.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 14 Jul 2019 18:58:28 -0700 (PDT)
Message-ID: <1563155904.2145.1.camel@gmail.com>
Subject: Re: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without
 HV mode
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 15 Jul 2019 11:58:24 +1000
In-Reply-To: <87o91ze6wx.fsf@concordia.ellerman.id.au>
References: <20190710052018.14628-1-sjitindarsingh@gmail.com>
 <87o91ze6wx.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: kvm-ppc@vger.kernel.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-07-12 at 23:09 +1000, Michael Ellerman wrote:
> Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> > The virtual real mode addressing (VRMA) mechanism is used when a
> > partition is using HPT (Hash Page Table) translation and performs
> > real mode accesses (MSR[IR|DR] = 0) in non-hypervisor mode. In this
> > mode effective address bits 0:23 are treated as zero (i.e. the
> > access
> > is aliased to 0) and the access is performed using an implicit 1TB
> > SLB
> > entry.
> > 
> > The size of the RMA (Real Memory Area) is communicated to the guest
> > as
> > the size of the first memory region in the device tree. And because
> > of
> > the mechanism described above can be expected to not exceed 1TB. In
> > the
> > event that the host erroneously represents the RMA as being larger
> > than
> > 1TB, guest accesses in real mode to memory addresses above 1TB will
> > be
> > aliased down to below 1TB. This means that a memory access
> > performed in
> > real mode may differ to one performed in virtual mode for the same
> > memory
> > address, which would likely have unintended consequences.
> > 
> > To avoid this outcome have the guest explicitly limit the size of
> > the
> > RMA to the current maximum, which is 1TB. This means that even if
> > the
> > first memory block is larger than 1TB, only the first 1TB should be
> > accessed in real mode.
> > 
> > Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> 
> I added:
> 
> Fixes: c3ab300ea555 ("powerpc: Add POWER9 cputable entry")
> Cc: stable@vger.kernel.org # v4.6+
> 
> 
> Which is not exactly correct, but probably good enough?

I think we actually want:
Fixes: c610d65c0ad0 ("powerpc/pseries: lift RTAS limit for hash")

Which is what actually caused it to break and for the issue to present
itself.

> 
> cheers
> 
> > diff --git a/arch/powerpc/mm/book3s64/hash_utils.c
> > b/arch/powerpc/mm/book3s64/hash_utils.c
> > index 28ced26f2a00..4d0e2cce9cd5 100644
> > --- a/arch/powerpc/mm/book3s64/hash_utils.c
> > +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> > @@ -1901,11 +1901,19 @@ void
> > hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
> >  	 *
> >  	 * For guests on platforms before POWER9, we clamp the it
> > limit to 1G
> >  	 * to avoid some funky things such as RTAS bugs etc...
> > +	 * On POWER9 we limit to 1TB in case the host erroneously
> > told us that
> > +	 * the RMA was >1TB. Effective address bits 0:23 are
> > treated as zero
> > +	 * (meaning the access is aliased to zero i.e. addr = addr
> > % 1TB)
> > +	 * for virtual real mode addressing and so it doesn't make
> > sense to
> > +	 * have an area larger than 1TB as it can't be addressed.
> >  	 */
> >  	if (!early_cpu_has_feature(CPU_FTR_HVMODE)) {
> >  		ppc64_rma_size = first_memblock_size;
> >  		if (!early_cpu_has_feature(CPU_FTR_ARCH_300))
> >  			ppc64_rma_size = min_t(u64,
> > ppc64_rma_size, 0x40000000);
> > +		else
> > +			ppc64_rma_size = min_t(u64,
> > ppc64_rma_size,
> > +					       1UL <<
> > SID_SHIFT_1T);
> >  
> >  		/* Finally limit subsequent allocations */
> >  		memblock_set_current_limit(ppc64_rma_size);
> > -- 
> > 2.13.6
