Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B398FAA90
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 08:13:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1BzWOqj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1BzWOqj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtgJM6w81z3cWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 16:13:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1BzWOqj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1BzWOqj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtgHf6qdWz3cNt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 16:12:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717481564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kouAuKW5xy3pVULjE18K8TFXVjcNP5iYKQ3l8/U0TTE=;
	b=f1BzWOqja6abnDU2/IK8tt3vDCfYrWKaPTLDRG/5PUHN2LQN8vdnMxo491EAtN52CnTVG+
	q9nEYaidW6E4e1+LO9aevQP1JdRK6EFZVGn1btnBUf0RHfQA43kmrV3QA73w9vwWWS7AVf
	z3cFOIaLVQFp9t5fDarpAmXVIDBFLIY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717481564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kouAuKW5xy3pVULjE18K8TFXVjcNP5iYKQ3l8/U0TTE=;
	b=f1BzWOqja6abnDU2/IK8tt3vDCfYrWKaPTLDRG/5PUHN2LQN8vdnMxo491EAtN52CnTVG+
	q9nEYaidW6E4e1+LO9aevQP1JdRK6EFZVGn1btnBUf0RHfQA43kmrV3QA73w9vwWWS7AVf
	z3cFOIaLVQFp9t5fDarpAmXVIDBFLIY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-0bQXCK6sOUCR1Qi0ubrpgQ-1; Tue, 04 Jun 2024 02:12:40 -0400
X-MC-Unique: 0bQXCK6sOUCR1Qi0ubrpgQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2eaa2db4968so19783421fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 23:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717481559; x=1718086359;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kouAuKW5xy3pVULjE18K8TFXVjcNP5iYKQ3l8/U0TTE=;
        b=S7U5yCPQ2Y4HAYWckRFFTrszxkgypVUbbj94FthtGdPgCDTKpL2LEyDU0imepqYTFt
         UQTda/qlcguDZHgyAKJYkWiG9ZPL0L3q7nI4OMC0IK1ctFyz141/6Wv7RfOt2t9BriAG
         vdP5kDxbRpVwuFvAgfQPVBurpj4sF7x0kWhuADk5puFRTVYoS2p/p/RLEmSzLe50mHM5
         EVZmN25I7s1slQbyvheZzPhDLV2jWQ5WzUjKsQepIc57jtJXByw7H0UzsK04WN2R8hup
         Rb2G3DsnzTqRGLwckcBCvGd43oOLtJfBOtP+/Q3SOYj88SlpkWaAtWxSNlYbLPzQteG0
         HqCg==
X-Forwarded-Encrypted: i=1; AJvYcCWrc/OpfGEJG4c+GDM0btEk1bFGW00/WaX+JUQVWzv6MD9ERS4nyU28KEJ7Fx5gXX9FgL6UBD8TJiT15d3RT9rKPc1KHRxrhu7Ttv6f0w==
X-Gm-Message-State: AOJu0Yy4ZaCka5EniR7kgENOTHAqD6nF/Eq2/bsCOZKCT1LvVOA2HEEC
	bU1sXcdzYPW9kzxRYyO6Xo9B2+J6evNYY1nqyEJuBb+sR7JqMAauBa7t1AKy4Yae5aeYuQyD/F/
	5F7cRkIvKi5fjN+ac5QhQEWuxYTmOvD1+QosMUt3gRjYakWIjttA+JSVX3vODtOQ=
X-Received: by 2002:a2e:9796:0:b0:2ea:7a0b:7935 with SMTP id 38308e7fff4ca-2ea9515f4bcmr71370231fa.24.1717481559438;
        Mon, 03 Jun 2024 23:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDUj5p9Nd1S78kdtNmrzEwvoPot4HNUSev3rqZ6AHZ6a9Im/hY9CiQpfb+U2aDjGq3aUi/4Q==
X-Received: by 2002:a2e:9796:0:b0:2ea:7a0b:7935 with SMTP id 38308e7fff4ca-2ea9515f4bcmr71370081fa.24.1717481558979;
        Mon, 03 Jun 2024 23:12:38 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-97.web.vodafone.de. [109.43.178.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4214beb5c9asm8052605e9.7.2024.06.03.23.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 23:12:38 -0700 (PDT)
Message-ID: <014763b7-93d9-4725-acc0-b5436a5ea91a@redhat.com>
Date: Tue, 4 Jun 2024 08:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 21/31] powerpc: Add timebase tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-22-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-22-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> This has a known failure on QEMU TCG machines where the decrementer
> interrupt is not lowered when the DEC wraps from -ve to +ve.

Would it then make sense to mark the test with accel = kvm to avoid the test 
failure when running with TCG?

> diff --git a/powerpc/timebase.c b/powerpc/timebase.c
> new file mode 100644
> index 000000000..02a4e33c0
> --- /dev/null
> +++ b/powerpc/timebase.c
> @@ -0,0 +1,331 @@
> +/* SPDX-License-Identifier: LGPL-2.0-only */
> +/*
> + * Test Timebase
> + *
> + * Copyright 2024 Nicholas Piggin, IBM Corp.
> + *
> + * This contains tests of timebase facility, TB, DEC, etc.
> + */
> +#include <libcflat.h>
> +#include <util.h>
> +#include <migrate.h>
> +#include <alloc.h>
> +#include <asm/handlers.h>
> +#include <devicetree.h>
> +#include <asm/hcall.h>
> +#include <asm/processor.h>
> +#include <asm/time.h>
> +#include <asm/barrier.h>
> +
> +static int dec_bits = 0;
> +
> +static void cpu_dec_bits(int fdtnode, u64 regval __unused, void *arg __unused)
> +{
> +	const struct fdt_property *prop;
> +	int plen;
> +
> +	prop = fdt_get_property(dt_fdt(), fdtnode, "ibm,dec-bits", &plen);
> +	if (!prop) {
> +		dec_bits = 32;
> +		return;
> +	}
> +
> +	/* Sanity check for the property layout (first two bytes are header) */
> +	assert(plen == 4);
> +
> +	dec_bits = fdt32_to_cpu(*(uint32_t *)prop->data);
> +}
> +
> +/* Check amount of CPUs nodes that have the TM flag */
> +static int find_dec_bits(void)
> +{
> +	int ret;
> +
> +	ret = dt_for_each_cpu_node(cpu_dec_bits, NULL);

What sense does it make to run this for each CPU node if the cpu_dec_bits 
function always overwrites the global dec_bits variable?
Wouldn't it be sufficient to run this for the first node only? Or should the 
cpu_dec_bits function maybe check that all nodes have the same value?

> +	if (ret < 0)
> +		return ret;
> +
> +	return dec_bits;
> +}
> +
> +
> +static bool do_migrate = false;
> +static volatile bool got_interrupt;
> +static volatile struct pt_regs recorded_regs;
> +
> +static uint64_t dec_max;
> +static uint64_t dec_min;
> +
> +static void test_tb(int argc, char **argv)
> +{
> +	uint64_t tb;
> +
> +	tb = get_tb();
> +	if (do_migrate)
> +		migrate();
> +	report(get_tb() >= tb, "timebase is incrementing");

If you use >= for testing, it could also mean that the TB stays at the same 
value, so "timebase is incrementing" sounds misleading. Maybe rather 
"timebase is not decreasing" ? Or wait a little bit, then check with ">" only ?

> +}
> +
> +static void dec_stop_handler(struct pt_regs *regs, void *data)
> +{
> +	mtspr(SPR_DEC, dec_max);
> +}
> +
> +static void dec_handler(struct pt_regs *regs, void *data)
> +{
> +	got_interrupt = true;
> +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> +	regs->msr &= ~MSR_EE;
> +}
> +
> +static void test_dec(int argc, char **argv)
> +{
> +	uint64_t tb1, tb2, dec;
> +	int i;
> +
> +	handle_exception(0x900, &dec_handler, NULL);
> +
> +	for (i = 0; i < 100; i++) {
> +		tb1 = get_tb();
> +		mtspr(SPR_DEC, dec_max);
> +		dec = mfspr(SPR_DEC);
> +		tb2 = get_tb();
> +		if (tb2 - tb1 < dec_max - dec)
> +			break;
> +	}
> +	/* POWER CPUs can have a slight (few ticks) variation here */
> +	report_kfail(true, tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after mtDEC");
> +
> +	tb1 = get_tb();
> +	mtspr(SPR_DEC, dec_max);
> +	mdelay(1000);
> +	dec = mfspr(SPR_DEC);
> +	tb2 = get_tb();
> +	report(tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after 1s");
> +
> +	mtspr(SPR_DEC, dec_max);
> +	local_irq_enable();
> +	local_irq_disable();
> +	if (mfspr(SPR_DEC) <= dec_max) {
> +		report(!got_interrupt, "no interrupt on decrementer positive");
> +	}
> +	got_interrupt = false;
> +
> +	mtspr(SPR_DEC, 1);
> +	mdelay(100); /* Give the timer a chance to run */
> +	if (do_migrate)
> +		migrate();
> +	local_irq_enable();
> +	local_irq_disable();
> +	report(got_interrupt, "interrupt on decrementer underflow");
> +	got_interrupt = false;
> +
> +	if (do_migrate)
> +		migrate();
> +	local_irq_enable();
> +	local_irq_disable();
> +	report(got_interrupt, "interrupt on decrementer still underflown");
> +	got_interrupt = false;
> +
> +	mtspr(SPR_DEC, 0);
> +	mdelay(100); /* Give the timer a chance to run */
> +	if (do_migrate)
> +		migrate();
> +	local_irq_enable();
> +	local_irq_disable();
> +	report(got_interrupt, "DEC deal with set to 0");
> +	got_interrupt = false;
> +
> +	/* Test for level-triggered decrementer */
> +	mtspr(SPR_DEC, -1ULL);
> +	if (do_migrate)
> +		migrate();
> +	local_irq_enable();
> +	local_irq_disable();
> +	report(got_interrupt, "interrupt on decrementer write MSB");
> +	got_interrupt = false;
> +
> +	mtspr(SPR_DEC, dec_max);
> +	local_irq_enable();
> +	if (do_migrate)
> +		migrate();
> +	mtspr(SPR_DEC, -1);
> +	local_irq_disable();
> +	report(got_interrupt, "interrupt on decrementer write MSB with irqs on");
> +	got_interrupt = false;
> +
> +	mtspr(SPR_DEC, dec_min + 1);
> +	mdelay(100);
> +	local_irq_enable();
> +	local_irq_disable();
> +	/* TCG does not model this correctly */
> +	report_kfail(true, !got_interrupt, "no interrupt after wrap to positive");
> +	got_interrupt = false;
> +
> +	handle_exception(0x900, NULL, NULL);
> +}
> +
> +static void test_hdec(int argc, char **argv)
> +{
> +	uint64_t tb1, tb2, hdec;
> +
> +	if (!machine_is_powernv()) {
> +		report_skip("skipping on !powernv machine");

I'd rather say "not running on powernv machine"

> +		return;
> +	}

  Thomas


