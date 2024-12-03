Return-Path: <linuxppc-dev+bounces-3740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78F9E27A8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 17:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2mX30tbZz2yVT;
	Wed,  4 Dec 2024 03:37:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733243827;
	cv=none; b=jKRS5POkVTHRkY+tjg6KYR6dn6+3B1z+V1hsm+KRi4ZKxM+zV5vpuKrWIBovvIPbTlWNiJcPF2/WATPeQcH1V2AT0b57AeHqxCP+Hvm3v0okGqOCQm4MO5j+DpkIyhKKrRpb1iVPNSHMTflwkbl/Elur1J8uXyonPuwoja8KrEBDssakVFeMGU4khcWV/JvVCcSrAfptIVeGS6KrSiIKu3+aC/AtwONceLmdDUbCiumUwjZr0KJm392DzOStv/WzMvyVKyn91pY93NR28qy2TbHKzraqonm4uJohxYj7cf07i7v4SupAhyZGHv8HfacpgLts8th1RyP3wVhPwIOd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733243827; c=relaxed/relaxed;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Udx4Iw6C3+FN8eKOrlavllnqk39xEdxj24rnP9A3qiFRj85lHsG5Dwkz/5+ica1fBVSTD+ghwqWpbvJJEeuUSYiZC1N/IptlF8w9TtiNKkbyEl+bB1LR5JNB39rZI+LA5GWgZuivd8pBU78xCsSMbyWDyka1NXrs9gdvTHcvrOmySnkRUYgZwPeiEIsOdLF05/TY9ZQLVHJt3uooDDWenqRpQNw9yZLKvx0VzuSrgKtDRf/KL3dl/rjIA2lyp0I7sHbF3I1/xhOHqYLHnMIk4EVKsFHnR6LB6BdHrFmm1u8/s1vSfPYpa6v9JYYi4ZBCvqbiGeCHZY+2VmZNYSuGXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZFy87LnX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=51K1fTOk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZFy87LnX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=51K1fTOk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2mX13nrLz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 03:37:05 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733243819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=;
	b=ZFy87LnXgxMe5bIwTwB4SVdDCSlcxqDM5Dwg3iZ8DiJODrOVGAZoQBBdLtoXDjt7JG0wKP
	mTN7fvMltxJ83iJSbYgKO8MderplffT0fOTfQB2/Wtntej162k8sEI5zkBAjxQi2zIHnl8
	BxFPwripxKWqXWIELnCObC6BQbbFI8mURLp0hdAxRn8umpG/RD/LZ0fbGMRkbRKIvp6ddC
	57glirNfQobi0tK8mH+8iNULQWU1v1HVw88nIrYfvKEwkDgKvrtvlvZOlafyDfnHl4x77X
	Quw8iMqSljd30mOQ7x1HQpzooupKG8wmDhqSOvDvriiZLNSWQdTg8cuMFNk8ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733243819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=;
	b=51K1fTOkCTCXZgTFGRDR/uHKZh8KeFOlAsYai8RG5Iq9JQAuG5x/cvB3XaojGxxMqrjr49
	ScBrmG+vuWWtr/Cg==
To: "Farber, Eliav" <farbere@amazon.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "naveen@kernel.org" <naveen@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
 <bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
 "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
 "adityag@linux.ibm.com" <adityag@linux.ibm.com>,
 "songshuaishuai@tinylab.org" <songshuaishuai@tinylab.org>,
 "takakura@valinux.co.jp" <takakura@valinux.co.jp>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
References: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
Date: Tue, 03 Dec 2024 17:36:59 +0100
Message-ID: <87ed2ou3is.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03 2024 at 12:55, Eliav Farber wrote:
> On 12/3/2024 1:04 PM, Thomas Gleixner wrote:
>>> +
>>> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>>> +     bool "Clear forwarded VM interrupts during kexec"
>>
>> This should not be user selectable. Just keep it as:
>>
>> config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>>         bool
>>
>> which defaults to 'n'. Just add a comment what this is about like it's
>> done with the other options in that file which are only selectable.
> Question: Should this new configuration option be placed inside or
> outside the following section:
> ```
> menu "IRQ subsystem"
>
>
> endmenu
> ```
> In my patch, I have added the new configuration option at the end of
> the file, outside the "IRQ subsystem" section.

It does not really matter when the option is silent, but keeping it in
the menu section as the others is the most intuitive IMO.

Thanks,

        tglx




