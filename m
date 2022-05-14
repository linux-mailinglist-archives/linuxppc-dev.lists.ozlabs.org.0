Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C4D526FFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 10:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0dgV2sk7z3c8T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 18:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cHjQpeFh;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4QyQkuDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=cHjQpeFh; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=4QyQkuDj; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0dfs71rXz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 18:17:41 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652516259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptxkYIfclqy5O/gMkPytM7FecBAPXApyhBHx/s6t5+k=;
 b=cHjQpeFhBi4mMqPWUFdjjdKbCNxSUbeCTq7e9TuG54QoSwZllWwAyWn/VA2bxfbp8FS79W
 lpKpONGN1xhSlu8/eUzJRYbZ8z2/7An4yFUXSfE69IHtfw3wF6lHivRNX1/x1EP43Mxg+m
 2YzOH1KhXwKXiNv80jZNKNSgxmxnjKjeDjsWmZo7PZev0MONnAMymFNV4PW0L08JGwT5Dg
 XeCV5Hvab1ALlurGE9Sq5nyeVvDP0baDIxSjf5ud747JWKgjVTe0VrA/BAmffaTatkL5Fl
 PsToyX+G9Z4WITvp+Bj9egqL+hjA9Kgbm3/OPtSDBuAAsUQm8y4Dgg3PUukvnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652516259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptxkYIfclqy5O/gMkPytM7FecBAPXApyhBHx/s6t5+k=;
 b=4QyQkuDjHvg4QNWDVHeMxsVLfTUC/+wKMBTajewFUyM/io2iH9gFUIPw+ugISd8SAFk2b1
 J7VmY4C7MwqIN+Bg==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v6 15/29] x86/hpet: Add helper function
 hpet_set_comparator_periodic()
In-Reply-To: <20220513211944.GE22683@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-16-ricardo.neri-calderon@linux.intel.com>
 <87mtfufifa.ffs@tglx> <20220513211944.GE22683@ranerica-svr.sc.intel.com>
Date: Sat, 14 May 2022 10:17:38 +0200
Message-ID: <87pmkgsf31.ffs@tglx>
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
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 13 2022 at 14:19, Ricardo Neri wrote:
> On Fri, May 06, 2022 at 11:41:13PM +0200, Thomas Gleixner wrote:
>> The argument about not bloating the code
>> with an "obvious???" function which is quite small is slightly beyond my
>> comprehension level.
>
> That obvious function would look like this:
>
> void hpet_set_comparator_one_shot(int channel, u32 delta)
> {
> 	u32 count;
>
> 	count = hpet_readl(HPET_COUNTER);
> 	count += delta;
> 	hpet_writel(count, HPET_Tn_CMP(channel));
> }

This function only works reliably when the delta is large. See
hpet_clkevt_set_next_event().

Thanks,

        tglx
