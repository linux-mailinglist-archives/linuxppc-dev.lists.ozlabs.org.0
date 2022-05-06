Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E351E150
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 23:41:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw3tP3ZZjz3cFG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 07:41:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0gf5bTX4;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EPFGmOCZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=0gf5bTX4; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=EPFGmOCZ; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw3sn1nk3z3byG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 07:41:17 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651873274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WEBD3i+RCMCV6ItWgJTNpoS5Qp50+5gg+1MUzDbcFWU=;
 b=0gf5bTX4NIQykq3iPPRZunSuSvrZWoWSo2b1NIiTagpKSMaW3qdtrw7UmeRdrKArDQE/+S
 Zy8ijWhMlujrmAIZPJRjxCHh90monbTV12KDhye6vQM/3CAQqw8JRQAdzQBwiG/t4sAVLj
 VGlEJ6vxHVjRXIiYcdNdyHl9i3CHV9mgzff5fRJV7Md00WfSlsUarMqfVzZqx0g0/sFCEG
 xHPKgvCjYezzLHm0ZxrVkOJkWlQ9+ITm9Ner24gSmKr1U37+vm+cp040VQJzXjfoPeTXFE
 2Z1+E0/StooqcZKBaNaiZO9gcjhFy0aSijMrtLORg57UfwyNDwEREhdL85JJhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651873274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WEBD3i+RCMCV6ItWgJTNpoS5Qp50+5gg+1MUzDbcFWU=;
 b=EPFGmOCZQqvpMfXX+kTEn3pMBEYvOWTDsHxx4zzYwsn3Efr3jSRiPe+y2939MMnRZZC56U
 K4PVioMmImoIJ3Dw==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
In-Reply-To: <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 06 May 2022 23:41:13 +0200
Message-ID: <87mtfufifa.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> Programming an HPET channel as periodic requires setting the
> HPET_TN_SETVAL bit in the channel configuration. Plus, the comparator
> register must be written twice (once for the comparator value and once for
> the periodic value). Since this programming might be needed in several
> places (e.g., the HPET clocksource and the HPET-based hardlockup detector),
> add a helper function for this purpose.
>
> A helper function hpet_set_comparator_oneshot() could also be implemented.
> However, such function would only program the comparator register and the
> function would be quite small. Hence, it is better to not bloat the code
> with such an obvious function.

This word salad above does not provide a single reason why the periodic
programming function is required and better suited for the NMI watchdog
case and then goes on and blurbs about why a function which is not
required is not implemented. The argument about not bloating the code
with an "obvious???" function which is quite small is slightly beyond my
comprehension level.

Thanks,

        tglx
