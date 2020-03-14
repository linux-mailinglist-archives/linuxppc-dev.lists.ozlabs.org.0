Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F401854A5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 05:07:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48fTXm14B9zDqyf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Mar 2020 15:07:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iTg1EJ9D; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48fT806SSYzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Mar 2020 14:49:04 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 37so6147786pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 20:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Qg1NxSr0anoPmtQwAqY+CvjHxpzc+uzlByJZPKmSyZA=;
 b=iTg1EJ9DIGyUA9NjDLXlKBAvH5TIBB3QVtM3p81an3RyQXSTSYT2IyRC3nzfc5oOfT
 lqEAfj63IVrnx2sFEc69ce4+bIcU627L3qsZjEV4XnDPvfwrUHGlCH4GV2VMdYsacb0r
 E+42OfU6J4Fj4YcNQTLwRRDJ0muF2BLHJaFh2vnurbkjtY3fUbAdrwBbCqBxDZUMJv/9
 R93pVh9cByUVDFudpTMdvpdCHZtwCkqOM2Ao8Ya1un3HkSIs0uIIzJIve+xnREbu82kY
 qwhbuOxzYUmVYHi/CiCDFQA6SNIttxxdvQT3G60ZbMvuDvYDf8hF7Ho/qR5n4OlN3pwx
 kKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Qg1NxSr0anoPmtQwAqY+CvjHxpzc+uzlByJZPKmSyZA=;
 b=axXkh3Ku0nDiJW7cyJc8mrqHobAqihr5st/iMXYGiCp+OSgfseKS4TqSs+Zq3EIgfx
 LjLRZ53j44qfCfiRuqBMHiEkXsdk2Xx0ClhyxdoNl3Y04uBfmeD/zp+WR3KBKjlxSLBa
 lpC4H5ZPDl1ZyElWfssp740Wcc+Q2tJdfMNevZVJNB2BaQdsvjWhMAUgODDMfpdvQ+aI
 bfKCwRMreJDkjpAN5NyRTVfxROBlpLakv4IjJnGKr3dI23K+p+19z5lFLY/4EUq7kezs
 BswQqKk+TV4A+vHGu8Xjp44f3TlQVSQKOkZ7ybW+Lz7nhq/XuY8ONuYNJRLz+NSnODqm
 WWJg==
X-Gm-Message-State: ANhLgQ1oT+NfDkNvmsYRsLYwu0DSeEMHe2qhl6Wtq+2IxrlNXdBe0VYT
 RqcUJQz5pmugk4RkqltdYq0=
X-Google-Smtp-Source: ADFU+vsiEBMMaUv/a4BHVVOjino4qLLULTzCe8UgDUomOILr4QnA+IV15HJTiS/kJTIl+T887up7EA==
X-Received: by 2002:aa7:9a08:: with SMTP id w8mr14160543pfj.317.1584157741238; 
 Fri, 13 Mar 2020 20:49:01 -0700 (PDT)
Received: from localhost ([193.114.108.19])
 by smtp.gmail.com with ESMTPSA id 13sm56972717pgo.13.2020.03.13.20.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 20:49:00 -0700 (PDT)
Date: Sat, 14 Mar 2020 13:48:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix MCE handling on pseries
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20200313140418.7940-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584157063.g5s75uhbdu.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar's on March 14, 2020 12:04 am:
> MCE handling on pSeries platform fails as recent rework to use common
> code for pSeries and PowerNV in machine check error handling tries to
> access per-cpu variables in realmode. The per-cpu variables may be
> outside the RMO region on pSeries platform and needs translation to be
> enabled for access. Just moving these per-cpu variable into RMO region
> did'nt help because we queue some work to workqueues in real mode, which
> again tries to touch per-cpu variables.

Which queues are these? We should not be using Linux workqueues, but the
powerpc mce code which uses irq_work.

> Also fwnmi_release_errinfo()
> cannot be called when translation is not enabled.

Why not?

> This patch fixes this by enabling translation in the exception handler
> when all required real mode handling is done. This change only affects
> the pSeries platform.

Not supposed to do this, because we might not be in a state
where the MMU is ready to be turned on at this point.

I'd like to understand better which accesses are a problem, and whether
we can fix them all to be in the RMO.

Thanks,
Nick
=
