Return-Path: <linuxppc-dev+bounces-4850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FDA05F05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 15:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSrGJ5QvFz30TP;
	Thu,  9 Jan 2025 01:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736347304;
	cv=none; b=n4QcgCjgOtW7mdiURLwbKSB+alzCutbfigYoN9hN2j5LNxNyNJZex+/jGLWwZwHUqDlIpnLXg/coyGxzl3qXcJCgKU0IX/OcyqVBcUkSykvoBBzNGUs1u3XB1LmsI0Vl4S6QWGWK7iui6VkZ3C5nBo1ndixiynYhAtiUcFi+hCkVL4lL/3iNSYiYORI7xiXIcjlDTFcb1lvr3ZdvKpGfEUO/8CIy7WB5RYCaaJOx08oqFJhGEt4Tnndb5XUR5o0IXDTnMzPCKR5ygZZvx3Z03u856XWk3sAs0VpR/dqwRMh9X4+zoFuWZ1QZgJniZZJ2tZTz3DVMbJow5ZZP/eJNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736347304; c=relaxed/relaxed;
	bh=SQLM+LoHGnaCGsXSe5lLcsoCAmL6bhSjsazuawUJ1sE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I1bHDTf8UVAbeBWAUbApz2h1UdRsfIuCMhE1cJP4eP74bRdXTnB10Xu2DmJ7oSmHy7lzdLjCkq9+DNPGJNHvuo13d29YVr8JKDdU/hbvKoAzgi/grrzce5Llax0Lvey5Z5LVLp2LnuhKhEr4id+oT7pMd1neOterKOMSKDfuuxWes5UUzNRZeDb9OTfw3I07uCfah8Yuj3zBGl2jPSzQy+DgSXtgPuzpf8qRGR/1N+nm+cb0jh1ic8ixF8qvuA57baV3pX8i7I/omc1TIsWEsqQ9b0W7nMxQ7j/VkZf3JBqXF1T3Cfuc+OTYSXegrcta3r7QJmVLpxVvUdogWY5mLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ksl6hlCw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3n45-zwykdpgxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ksl6hlCw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3n45-zwykdpgxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSrGH26sMz30TH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 01:41:41 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so24257696a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736347296; x=1736952096; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQLM+LoHGnaCGsXSe5lLcsoCAmL6bhSjsazuawUJ1sE=;
        b=ksl6hlCwOAqrysAOTI0o5LrDgOSmPyhaWwBDExfqfH+zcOEgCLm6g8Vfw7bLUrwo2F
         Us/0UhFCIOowiCby2sZhuvGdFPUfGi9KuafE9uXwLKB8++DvKZHrSDWMcMJxfAOv2QBs
         m9af3MY7AbH4M10Wy/jg8VNtvCSia4wqeLmRSRAkbdmWZFBlSToRDIsTdOHO2CzwUDR0
         Ao+4pWnCERXoo5RVz58m+Dp++1WxmB1PHMYGVRuJhKh/NtpLU/xiJelDLTjZ9sO85+w7
         O7nBiPgaiAp5WGBtuWRlginPlmyfTbrPkdmipTn4124Pj+tTX+zkBOXfGm6lTtgfiDAo
         Ssbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347296; x=1736952096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQLM+LoHGnaCGsXSe5lLcsoCAmL6bhSjsazuawUJ1sE=;
        b=EpYRrNCzBqn2qscxwy2So3Cu+kBhdWvlkIj312wYGO/ArVvx+PZfIUUqrbOG2M/iok
         VPPAgDaMBC5kimfsIZkkqDwQZS3WWGbOeiYibLLd/RMOA4EbT8k2fK7o7epwQHaQQaCl
         q95PUseVWEkmBCQOCPqYnW4cePU3Z6tw7vzYJ8M+3VJV+7Q3tJDZRLjNzLeQwHdyu3JS
         F6fSxxCfZViAN8QsqTFXLEHR0pCVg7nnXegJyzD11dhTu8nfeAJWM5hF6Yhzjwj9ilrj
         +qWstzYK3ibrPmIpzANCG4JkNxOojVbFW8JOUy3RkYQrPgWsse0pcS08QJmGhdDXrp0b
         ZntA==
X-Forwarded-Encrypted: i=1; AJvYcCVoI/haa9Kdb8RW2+zu8JeNqgauRMWq4dPrmD9k0RYXWvUoJx8nuovO3Zf/sI52R+bX/e1IJfctikftC9o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCY5hTMoadUEH4s3sN9oUP5jnp8J7eDjRGTzf5p0lystcPe940
	gN7gnYiDEGMbi3XXNO/W+sWZT/dnfdI/g5yhkCSuFWATGgjZmquWtYXeuQVMgqMX33WoQP1cPgA
	zuw==
X-Google-Smtp-Source: AGHT+IGmkPaMq6fyPiGwNEznCVmXKv73lSbOSvpsyNn1ze2H+LKp+qpzjKZzXeZPKeZkIqzTmMcSaKGlbq8=
X-Received: from pfbbt23.prod.google.com ([2002:a05:6a00:4397:b0:727:3c81:f42a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e01:b0:725:e37d:cd35
 with SMTP id d2e1a72fcca58-72d21ff4af7mr4989790b3a.18.1736347295712; Wed, 08
 Jan 2025 06:41:35 -0800 (PST)
Date: Wed, 8 Jan 2025 06:41:34 -0800
In-Reply-To: <Z3wnsQQ67GBf1Vsb@google.com>
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
Mime-Version: 1.0
References: <20250101064928.389504-1-pbonzini@redhat.com> <Z3wnsQQ67GBf1Vsb@google.com>
Message-ID: <Z36OnrAGOL9c7cku@google.com>
Subject: Re: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025, Sean Christopherson wrote:
> On Wed, Jan 01, 2025, Paolo Bonzini wrote:
> > kvm_follow_pfn() is able to work with NULL in the .map_writable field
> > of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
> > despite KVM for e500 trying to use it.  Indeed .map_writable is not
> > particularly useful if the flags include FOLL_WRITE and readonly
> > guest memory is not supported, so add support to __kvm_faultin_pfn()
> > for this case.
> 
> I would prefer to keep the sanity check to minimize the risk of a page fault
> handler not supporting opportunistic write mappings.  e500 is definitely the
> odd one out here.

Per a quick chat at PUCK, Paolo is going to try and fix the e500 code to actually
use the @writable param as it's intended.

