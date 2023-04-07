Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592436DB010
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 18:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtNRg0pk6z3fWZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 02:02:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b1x6wuN8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3wz4wzaykdmaykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b1x6wuN8;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtNQm2X9Cz3fDv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 02:01:34 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id h4-20020a170902f54400b001a1f5f00f3fso24186205plf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680883291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArkFzgGmWr5GIWIb5S26dnAG6/MRvelBkLMc+Gk1DCI=;
        b=b1x6wuN8SB2jxdh5jqkPjFSPwNKAuuWDG6iq4r0w3QQ/c5uBQxAUffbz7fBkpbziRs
         lMJRpn1M2y6+OlEjiNm3RbYpHz87fmdsm1jcQrsUaK7jsdHCMBrQjEVfhZbS2K8FL1xC
         BjOOsJBZ/EzEfpR405ay040NT0E7n++jFFtxki7qpx43vYV/QX7b+IUkqPqVe7tcsl+y
         celfLgTwE59cPCrG6hNTC32U/dCV/eE9guxjTQaSprpdU+4l2Qni1vJVQi9P8OgA5p5x
         zskClbiyAR4JdPnZE4oZ6VhsZg2eDSH7aRqCaxCbL86DuP6LI+TvES+S+ZRH9wBMef7s
         QYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680883291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArkFzgGmWr5GIWIb5S26dnAG6/MRvelBkLMc+Gk1DCI=;
        b=7G0YSMx+kIUnaBZxnXkQDSFVBgq/cGk4TvIrumgqge6FszioEjnJMLB+DlwL1Y+Q9G
         ky9Hwac4U8j3Kg7R4SpXWc7HtZ11SlB2FgQx77Z0CRvd5ObfSp/WDylK2pUO2Ap9thAI
         wzn6ZTjkUVuhbuEQX7FfojI5gP3RN7djnMme8FWlu5KUVMDz5kayjscHywr2pAaoSV0h
         UHGgEtoO5jwvJGArMVxBOqCs8Rn8MtuSRkuCLLIctAqdmJtPiwDfAz9j5jMVZPuBSfbP
         ZBXJc/03gXVztaEK+5m9DLsKj91wOHEL642VKu0FSmKRmEG7sG+4GKvee0lI6d81H8hQ
         DJfw==
X-Gm-Message-State: AAQBX9eq8+ifNPLAFaH5VqsSu7oX0bVLiLZ0odEVjRnPAEIC3KqzjlA+
	hmVdXP2qmJsESKeeSCVIsH1c/UCgpXA=
X-Google-Smtp-Source: AKy350a1DofUs4VOJFEpf/Bjl29q9TIoQByxl0Ghis+7csRXJ+eNPnFAcI7+ZZ3vVziDU2S9rTWGWVfcWWc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:cf90:b0:244:a6e7:bb6c with SMTP id
 i16-20020a17090acf9000b00244a6e7bb6cmr760824pju.8.1680883291507; Fri, 07 Apr
 2023 09:01:31 -0700 (PDT)
Date: Fri, 7 Apr 2023 09:01:29 -0700
In-Reply-To: <ZDAeuL2fz1aEW6rz@debian.me>
Mime-Version: 1.0
References: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com> <ZDAeuL2fz1aEW6rz@debian.me>
Message-ID: <ZDA+WdiqB2931xHB@google.com>
Subject: Re: [PATCH] KVM: PPC: BOOK3S: book3s_hv_nested.c: improve branch
 prediction for k.alloc
From: Sean Christopherson <seanjc@google.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>, Chao Peng <chao.p.peng@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 07, 2023, Bagas Sanjaya wrote:
> On Fri, Apr 07, 2023 at 05:31:47AM -0400, Kautuk Consul wrote:
> > I used the unlikely() macro on the return values of the k.alloc
> > calls and found that it changes the code generation a bit.
> > Optimize all return paths of k.alloc calls by improving
> > branch prediction on return value of k.alloc.

Nit, this is improving code generation, not branch prediction.

> What about below?
> 
> "Improve branch prediction on kmalloc() and kzalloc() call by using
> unlikely() macro to optimize their return paths."

Another nit, using unlikely() doesn't necessarily provide a measurable optimization.
As above, it does often improve code generation for the happy path, but that doesn't
always equate to improved performance, e.g. if the CPU can easily predict the branch
and/or there is no impact on the cache footprint.
