Return-Path: <linuxppc-dev+bounces-1262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEED975CD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 00:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3vfy4P0Pz2xGt;
	Thu, 12 Sep 2024 08:01:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726092106;
	cv=none; b=Yd0kc93xVye48sDe1f/6AD4OhbPUPUpBbeh/mzJ+qHGOo6X4v3LIfydArYA/HAycMdLN2IoAqqhjBnl6y1cwgHWJBPkiG2gRFd1o6Hw10Qx5pcr7wIf7xeT3Pnz88+ZMT4XR7fgCHdmHkOGos6w8xb6vqBP9StAb/fYGmXi/521SFu/YDJbiu2asRL3SXwD/ZAEmMk3TMvL9bxtBcx3rheEoq4JqGtJQpvaAvg+SEpV5cEHuE4UGVLSC9PhLnqzXVjfRephfS8JfykQ4Yzlgj7QWGNjweIWWzo3ALlMuXhceKFw53udrNrX2NXVVSR6wxfRrmosyCvTeGzgx++cNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726092106; c=relaxed/relaxed;
	bh=q13JQ4aJstpTY70GjrenWYuGyd1pnSkxKkLl8Jd4LLI=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=gDhc9psVajxj/Lx3E8KkyCA4E6o0waWQ7YwvTMzEc8mhaNLbJNy5F7Hl0UbAFnfbndB1cnWThrBYNZpV4U9B6KEFPSeSVuuogzp75xnY2TNNbgYuJp/4nMgXg/k0/AS/2YyZ1qDs4MqrVGLuQHitbivKvi+aUtwIO8UnUHnKuiXMKccb2YQO4HvMWs1pL9cNNJBD/PVy8xwbOY6gadVsbrrNYKqDgGhbSfIOJ479k//pukuqLKjcsx+S6eNvWN5mnMk6jXMTZL+uajbmPXzcLFJm7m4fQYjV6bueziQWYiVbmJnFGy9jOTG7QXtRKsVbXo1Z295wWpNXQAZvsO/JDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=D4Q1B0tj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qxpizgskddaoaxfazxqiuesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=D4Q1B0tj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qxpizgskddaoaxfazxqiuesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3vfx4Rp8z2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:01:44 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6d54ab222fcso13804787b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726092100; x=1726696900; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q13JQ4aJstpTY70GjrenWYuGyd1pnSkxKkLl8Jd4LLI=;
        b=D4Q1B0tj8C1V7YKdsRciJzpGIt6DTmYcqUZez3AU+gaxzfoAXbIZpkFwIFRTsm2kDp
         oLJcZJaFeI8b7+K7skV2N4nZ3/8a/kNw96o3+1S1BsEvHC5fZNVSVVyyZp3rniYly0PA
         D1cbons/6Cmhy3KAzlfNbbZ8p10odSGK1Kkn3/Z9tZpKX+9tFv2bWeu2J+WQEPmy4DhR
         28sUF0Oek+9XGnUza3S6rkCTAZK+lUF3kfjvC79gl4hUw1Q023PzotZUHQP5UDgki9D9
         jrTlOKbAjpHPImT42SCU7PcHnBKe3JMPbv7fdMi++sWnTcr8oHXbAoM6QphHYLjD715J
         aDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726092100; x=1726696900;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q13JQ4aJstpTY70GjrenWYuGyd1pnSkxKkLl8Jd4LLI=;
        b=thOs+PzXnrPQjmxz91I/NFRxKtBTifn6UkDTnnCnwQ+gnBYFquADxpR6IGhKfoBwg1
         /Sl3C1pgt+ywW5JosV+wZnxxyYpCboRFXfOwh0aOfakVOGJ2XOs5g40aDuD/x6Btjtj4
         ALPC4ir8IRVAZYv2ai5Fm5EEnQDWBPqRaku3RHZX00ywqTs4daOJ0oxhsxyWhqnBr8nr
         oWaebNhY6KIQLC1sySAUXRlpIwOrYdH3pH//HM5Tk388AzDKjblhi7PwGL4KnpZkNEUz
         4KrIrSt4an4drhpObo/1Mi+X7t4fFf0L4e8A8Wrx6MtNmSbwuzvK5U6gZ14q6XdWdvpt
         YfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXaiJgSFhtFB84bUhHaQlXY9WIOutO3BHoSjHPrrSWzZ6h+IHs+af1PozcYegH1676X283oHaALSd7A0OI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzd/gh0NTngUiqhQ4I8HxRKeLw819TO8pS16Zheej5Pl10upWsS
	BoE2uLgd3hWioONYTOrlijrhq5BonmheE6/UYIWyFICvgU6WmdCJSc2qY6qY6HQy2PRR6/XXagk
	rtt4JhVymkXsX4BgY1aMh7Q==
X-Google-Smtp-Source: AGHT+IEh6F4b46/1LwAS/WUGX/NAwM3UP2BxZSsRe7RROOaYU54OCz40zI1kT+hftf0HBDiAU78eGBwhCC/X5Gc0CA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:1743:b0:e03:3cfa:1aa7 with
 SMTP id 3f1490d57ef6-e1d9db9e1b8mr1014276.1.1726092099527; Wed, 11 Sep 2024
 15:01:39 -0700 (PDT)
Date: Wed, 11 Sep 2024 22:01:38 +0000
In-Reply-To: <Ztl-AjEEbIbX4lnm@gmail.com> (message from Ingo Molnar on Thu, 5
 Sep 2024 11:46:42 +0200)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsntr09pdf3x.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 2/5] perf: Hoist perf_instruction_pointer() and perf_misc_flags()
From: Colton Lewis <coltonlewis@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	will@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	naveen@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Ingo Molnar <mingo@kernel.org> writes:

> * Colton Lewis <coltonlewis@google.com> wrote:

>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -6915,6 +6915,16 @@ void perf_unregister_guest_info_callbacks(struct  
>> perf_guest_info_callbacks *cbs)
>>   EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>>   #endif

>> +unsigned long perf_misc_flags(unsigned long pt_regs *regs)
>> +{
>> +	return perf_arch_misc_flags(regs);
>> +}
>> +
>> +unsigned long perf_instruction_pointer(unsigned long pt_regs *regs)
>> +{
>> +	return perf_arch_instruction_pointer(regs);
>> +}

> What's an 'unsigned long pt_regs' ??

That is fixed in a later commit. I will correct this one also.

> Thanks,

> 	Ingo

