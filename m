Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E61BE1BDAC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:33:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxGp00c4zDr45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BxDX0JWMzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZTuGFBTe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BxDV0QRfz9sRY;
 Wed, 29 Apr 2020 21:31:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588159898;
 bh=JUxQ1DDlvwJDXTYSg0PlVcfy+qm/d19EKj5KPqykW4A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZTuGFBTe5ZDCRYmRf8ONj9kw4OOzYV0cVIHj998pCw1d1JqRzoZJWA0/c/y5gCTPk
 r+rzuwz8o6St+ED8g3XKqbQA4xaZRRDi4QqNt4PRDUJKACWR6chSzombKXzCoXMXG9
 cNNlLtk3BoJYaKhgz5D8NG6Iwn2PgptzNZgNPNvIezf8TIbTfRsa2v7K8D/hRLMv1b
 jRlhdEsR529HAa8t01dU2Tj8b0ZVgvH9VEzW831JCo8HMi0I7p72w767xTZ15+735C
 Q/pND6PdteTKnPxv4mNt2lnQ7bSE71jwBvZ9ZQbD4lEZdtH+zFnUoVGLWSBCdP0cl5
 H+Fr6RImwBrrw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH v7 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver
 to get processor details
In-Reply-To: <20200327063642.26175-3-kjain@linux.ibm.com>
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-3-kjain@linux.ibm.com>
Date: Wed, 29 Apr 2020 21:31:54 +1000
Message-ID: <87ftcmfryt.fsf@mpe.ellerman.id.au>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kajol,

Some comments inline ...

Kajol Jain <kjain@linux.ibm.com> writes:
> For hv_24x7 socket/chip level events, specific chip-id to which
> the data requested should be added as part of pmu events.
> But number of chips/socket in the system details are not exposed.
>
> Patch implements read_sys_info_pseries() to get system
> parameter values like number of sockets and chips per socket.
> Rtas_call with token "PROCESSOR_MODULE_INFO"
> is used to get these values.
>
> Sub-sequent patch exports these values via sysfs.
>
> Patch also make these parameters default to 1.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-24x7.c              | 72 ++++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/pseries.h |  3 +
>  2 files changed, 75 insertions(+)
>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 48e8f4b17b91..9ae00f29bd21 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -20,6 +20,11 @@
>  #include <asm/io.h>
>  #include <linux/byteorder/generic.h>
>  
> +#ifdef CONFIG_PPC_RTAS

This driver can only be build on pseries, and pseries always selects
RTAS. So the ifdef is unncessary.

> +#include <asm/rtas.h>
> +#include <../../platforms/pseries/pseries.h>
> +#endif

That's not really what the platform header is intended for.

You should put the extern in arch/powerpc/include/asm somewhere.

Maybe rtas.h

> @@ -57,6 +62,69 @@ static bool is_physical_domain(unsigned domain)
>  	}
>  }
>  
> +#ifdef CONFIG_PPC_RTAS

Not needed.

> +#define PROCESSOR_MODULE_INFO   43

Please document where these come from, presumably LoPAPR somewhere?

> +#define PROCESSOR_MAX_LENGTH	(8 * 1024)
> +
> +static int strbe16toh(const char *buf, int offset)
> +{
> +	return (buf[offset] << 8) + buf[offset + 1];
> +}

I'm confused by this. "str" implies string, a string is an array of
bytes and has no endian. But then be16 implies it's an array of __be16,
in which case buf should be a __be16 *.

> +
> +static u32		physsockets;	/* Physical sockets */
> +static u32		physchips;	/* Physical chips */

No tabs there please.

> +
> +/*
> + * Function read_sys_info_pseries() make a rtas_call which require
> + * data buffer of size 8K. As standard 'rtas_data_buf' is of size
> + * 4K, we are adding new local buffer 'rtas_local_data_buf'.
> + */
> +char rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;

static?

> +/*
> + * read_sys_info_pseries()
> + * Retrieve the number of sockets and chips per socket details
> + * through the get-system-parameter rtas call.
> + */
> +void read_sys_info_pseries(void)
> +{
> +	int call_status, len, ntypes;
> +
> +	/*
> +	 * Making system parameter: chips and sockets default to 1.
> +	 */
> +	physsockets = 1;
> +	physchips = 1;
> +	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH);
> +	spin_lock(&rtas_data_buf_lock);

You're not using the rtas_data_buf, so why are you taking the
rtas_data_buf_lock?

> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +				NULL,
> +				PROCESSOR_MODULE_INFO,
> +				__pa(rtas_local_data_buf),
> +				PROCESSOR_MAX_LENGTH);
> +
> +	spin_unlock(&rtas_data_buf_lock);
> +
> +	if (call_status != 0) {
> +		pr_info("%s %s Error calling get-system-parameter (0x%x)\n",
> +			__FILE__, __func__, call_status);

pr_err(), don't use __FILE__, this file already uses pr_fmt(). Not sure
__func__ is really necessary either.

		return;

Then you can deindent the next block.

> +	} else {
> +		rtas_local_data_buf[PROCESSOR_MAX_LENGTH - 1] = '\0';
> +		len = strbe16toh(rtas_local_data_buf, 0);

Why isn't the buffer a __be16 array, and then you just use be16_to_cpu() ?

> +		if (len < 6)
> +			return;
> +
> +		ntypes = strbe16toh(rtas_local_data_buf, 2);
> +
> +		if (!ntypes)
> +			return;

What is ntypes?

> +		physsockets = strbe16toh(rtas_local_data_buf, 4);
> +		physchips = strbe16toh(rtas_local_data_buf, 6);
> +	}
> +}
> +#endif /* CONFIG_PPC_RTAS */
> +
>  /* Domains for which more than one result element are returned for each event. */
>  static bool domain_needs_aggregation(unsigned int domain)
>  {
> @@ -1605,6 +1673,10 @@ static int hv_24x7_init(void)
>  	if (r)
>  		return r;
>  
> +#ifdef CONFIG_PPC_RTAS
> +	read_sys_info_pseries();
> +#endif

> +
>  	return 0;
>  }
>  
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
> index 13fa370a87e4..1727559ce304 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -19,6 +19,9 @@ extern void request_event_sources_irqs(struct device_node *np,
>  struct pt_regs;
>  
>  extern int pSeries_system_reset_exception(struct pt_regs *regs);
> +#ifdef CONFIG_PPC_RTAS
> +extern void read_sys_info_pseries(void);
> +#endif
>  extern int pSeries_machine_check_exception(struct pt_regs *regs);
>  extern long pseries_machine_check_realmode(struct pt_regs *regs);


cheers
