Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DD7126C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 14:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSPZq1VmTz3fH9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 22:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WY+EmfEa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WY+EmfEa;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSPYz3qgxz3f8b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 22:36:54 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C845F1FD66;
	Fri, 26 May 2023 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685104611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+/ryCc/jVqNC/x4M8331SF9oIVJd7A5Ujt5a8BQi9E=;
	b=WY+EmfEaF350yIwkRzxDP07Zk1RN8/tkWscLlzLc2PycMGLXJj8n5hELkbGzRMj/D9KtF3
	/3KpgjaMthlb/0GiErFArvBIX8U1yQN4eZgsPgX0weH9CeM2WMH88SeowIWT0yBXf9E4tJ
	0wJdkKI48GEwTErxBH8J6Dm+ghVFuyk=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E5CBE2D3BD;
	Fri, 26 May 2023 12:36:50 +0000 (UTC)
Date: Fri, 26 May 2023 14:36:50 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 15/18] watchdog/perf: Add a weak function for an arch
 to detect if perf can use NMIs
Message-ID: <ZHCn4hNxFpY5-9Ki@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-19 10:18:39, Douglas Anderson wrote:
> On arm64, NMI support needs to be detected at runtime. Add a weak
> function to the perf hardlockup detector so that an architecture can
> implement it to detect whether NMIs are available.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> While I won't object to this patch landing, I consider it part of the
> arm64 perf hardlockup effort. I would be OK with the earlier patches
> in the series landing and then not landing ${SUBJECT} patch nor
> anything else later.
> 
> I'll also note that, as an alternative to this, it would be nice if we
> could figure out how to make perf_event_create_kernel_counter() fail
> on arm64 if NMIs aren't available. Maybe we could add a "must_use_nmi"
> element to "struct perf_event_attr"?
> 
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -234,12 +234,22 @@ void __init hardlockup_detector_perf_restart(void)
>  	}
>  }
>  
> +bool __weak __init arch_perf_nmi_is_available(void)
> +{
> +	return true;
> +}
> +
>  /**
>   * watchdog_hardlockup_probe - Probe whether NMI event is available at all
>   */
>  int __init watchdog_hardlockup_probe(void)
>  {
> -	int ret = hardlockup_detector_event_create();
> +	int ret;
> +
> +	if (!arch_perf_nmi_is_available())
> +		return -ENODEV;

My understanding is that this would block the perf hardlockup detector
at runtime. Does it work with the "nmi_watchdog" sysctl. I see
that it is made read-only when it is not enabled at build time,
see NMI_WATCHDOG_SYSCTL_PERM.

> +
> +	ret = hardlockup_detector_event_create();
>  
>  	if (ret) {
>  		pr_info("Perf NMI watchdog permanently disabled\n");

Best Regards,
Petr
