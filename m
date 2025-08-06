Return-Path: <linuxppc-dev+bounces-10689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BCB1C263
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 10:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxkR368YWz30Vb;
	Wed,  6 Aug 2025 18:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754469967;
	cv=none; b=I//uzfelWrxv+Iq/JIjJyNUmAtD143CKP+sTQzp7foG4042lGfnCQzaEjsqV3oC2aHmQL2UMbIayWejfO/9/0VEighqhDLzCK0cHf+K0nF14MrwDsxN67zEh8KAqtJdQScNaR27gAiAQ5vvJFYWRAUmwiJEgHi593AxN/dkbwRJ6nmGgqQWllsrTFuvhmFMM3d12F1t9NrPcgvuS1pQm1OTwc5EQcbXODB8g/dCRjkvz/AW4XP/kYA7ZOz1nePNSovNwj7ccabrOVG3AA8sMve4AiE8W1/g0Am4DFozlOquW/43nb1i/n3dz70ls0f6S08aCWCAImSHY55Oybf4oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754469967; c=relaxed/relaxed;
	bh=bGdLgPBfdNd2lcOHu+m8zalmwEjID7ryVJYk/Ek3kTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPZKKY2JUgnB6DhYEJ5D46L8i5atdkvc1IfqSlKHxj++va7koCUH43aYaEnq41U/q5X1AW36wYh8Az6W4SZyAl7OIOfuyEE8S47Oy7VWrc3vaRJ+b1aA6QfYmcfkG4vW+WHgxJ50y3MRbNKaID0FKozsaKhOfwTptZi1dHauLLnMIyZ6mwHF8Z+Ui5CWqCm+NpDwAZOOQkHujRCqjAE3/wsY4qgDCG86ln+DnWIWob0UrwcBf5eH6qo3NU2ZQjdFXHPag7ZJgDk+tTDB6WFoVqk5i7s6nuBFTjPDfkzk4KG5FzMwN5763B7rvoS1ECUBxcLDvDgliWBuENKpHEdEYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.50; helo=mail-ed1-f50.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.50; helo=mail-ed1-f50.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxkR0496pz2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 18:46:03 +1000 (AEST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso10056310a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 01:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754469960; x=1755074760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGdLgPBfdNd2lcOHu+m8zalmwEjID7ryVJYk/Ek3kTw=;
        b=mxfHCQt1VzyXUf8dsxAg9mcaBnFrZPOB6FZecs3s8XKyt1poLu+2DBouIItYrtMeoW
         USD/DE7ftpzqlEEwxGsJ14krPpxcDcfi+a+Mz84wjly7pUR5UYN17C+DOfzciV4zUtCs
         VyHaRShLfgGLxvXUSHs2jM5oZLC+DB8SNb7kv7FR5/fLT81a7gvZvUzCqlVaPmlnIYS8
         SlUcrxLlDf6qLiZwqiBtcN20xnZKjUttMOqh6FY2InG+IQBuv5048pOsnyu11+5+1tZ1
         MwFV+fbGGuvuflK6qmXo42KhBOo4lYIlGZ985F5r1Ev4bLw+Yg9pnS83ksThWe45/FJO
         04pg==
X-Forwarded-Encrypted: i=1; AJvYcCUBJRBY5ExWlPtMtstNv7ek0hsKbmc6Tw8/gUbj2NMYMCkBK5ofhB4JSdyEpDddnVo2ImwX0v6k5wqAfUI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPjCPFphFcANyQeCsXflZCqsNs24Nf/1J2p6YA79gF1vLjqvtD
	4CpxXlAY0X1MejPP7ncCXR57st8PDufNf+fv5huobX6U4sh0YNjJHbB6
X-Gm-Gg: ASbGncvd+ctm7ouqHOuW4rX4WE2+fgh6ZkGw4xVgb8fvoVRsq9f5Vs6EPyfgYaP7xif
	6LUuGKxjorst45p8kHaz3AAtQpz74gra/Byxu0W1w5BVYlxhCFImpLx1ntkZZQkYggKpxuejcCB
	SvLcpH8DbHDoqI/P96X9cbMXUjCHsCAY11XV2fE6FCx7JE+BBRAYrjOL2zITgX/dumdXbi/QpEW
	IR9sRDZMqzYLC9BqfuZHEkcdLUKJj626S9WEEaDoWFjqyE2Z1sevlfcPu/o2BxFffMGpUFJ1fvp
	+X2dWVrSoqzhFHMu0idNG7nVh7y+Ex+f8/VD9u1T1622T+UL+bGLdZ1pgMS/YGxCrDgSiqYCYIc
	u13O7Ys0jlA6KB7bmdvgcrw/Y
X-Google-Smtp-Source: AGHT+IEgxGF83pTNvuz25yjpVEb2gIljmSEM8tHNjy6l5+Gv3v5isQ/xzUBDq6Js7w2Ab+lMighSsQ==
X-Received: by 2002:a50:f692:0:b0:612:b150:75f3 with SMTP id 4fb4d7f45d1cf-617960d0d02mr1098790a12.8.1754469959884;
        Wed, 06 Aug 2025 01:45:59 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6175ee53a1esm4253825a12.10.2025.08.06.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:45:59 -0700 (PDT)
Date: Wed, 6 Aug 2025 01:45:57 -0700
From: Breno Leitao <leitao@debian.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
Message-ID: <umpfhbh2eufgryjzngc7kyvjlqf3d6fgzftgeb44yf4bbtizb6@x7iqbksbbcot>
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <50f6c23f-1f46-4be1-813a-c11f2db3ec4f@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f6c23f-1f46-4be1-813a-c11f2db3ec4f@gmail.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Ethan,

On Wed, Aug 06, 2025 at 09:55:05AM +0800, Ethan Zhao wrote:
> On 8/4/2025 5:17 PM, Breno Leitao wrote:
> > Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> > when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> > calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> > does not rate limit, given this is fatal.
> > 
> > This prevents a kernel crash triggered by dereferencing a NULL pointer
> > in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> > AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> > which already performs this NULL check.
> > 
> The enqueue side has lock to protect the ring, but the dequeue side no lock
> held.
> 
> The kfifo_get in
> static void aer_recover_work_func(struct work_struct *work)
> {
> ...
> while (kfifo_get(&aer_recover_ring, &entry)) {
> ...
> }
> should be replaced by
> kfifo_out_spinlocked()

The design seems not to need the lock on the reader side. There is just
one reader, which is the aer_recover_work. aer_recover_work runs
aer_recover_work_func(). So, if we just have one reader, we do not need
to protect the kfifo by spinlock, right?

In fact, the code documents it in the aer_recover_ring_lock.

	/*
	* Mutual exclusion for writers of aer_recover_ring, reader side don't
	* need lock, because there is only one reader and lock is not needed
	* between reader and writer.
	*/
	static DEFINE_SPINLOCK(aer_recover_ring_lock);

