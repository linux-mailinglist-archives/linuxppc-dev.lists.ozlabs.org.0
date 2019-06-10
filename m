Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272FF3BC66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 21:04:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2c16JfpzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 05:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=arnaldo.melo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwNBtvBQ"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MxYy1s02zDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 01:16:50 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id m29so10993315qtu.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A58gSkvzAqlytIO6jApUdBIFoWfe/E0ueVnquFhH+y4=;
 b=iwNBtvBQLT1v7fZZu6X114jxEpsi9K0wPJlIKIgBxsjuqVAZvJ8lZYmM2LmF1wPwYo
 LDrm0Nyr7wtsnLEJOmfUEYoXCqTG1PP7H4Qsv63S3yVB046B/nVZbGDcF6C/rMj1Whdp
 JaGWK3dxh2DldR83Cdz4vWFM8pHGrkcPhMeHXuTkffSzDFPrpDoFC2/Nm6/yeakAvCCr
 DlvRo0dhBZNOFDkJjuqk6nKT7522Y5fKaqN+TC59oME0y2SdLtMQyqWARfwvS6gRnkK/
 ed7FF646pHlo8ojJ46V6Pc8oFN21PQHYcsTm1sIqmXaCxc1pwSeIKfgsi7DXh0ygkpY9
 1YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A58gSkvzAqlytIO6jApUdBIFoWfe/E0ueVnquFhH+y4=;
 b=l1k2Elyvd2e9fXiZYfRQBlLqb++ZF4vEcfsUp5qK7Ewb6SM9v3YRc6tXOm/G1N9ijz
 o9EMU9blYWik7H8k1dYzXgLLxA/10VkC576PC39CQdhDxqlSz4XXkW8hjm1vcrsi/Y+2
 BUWfr3NDjYrMjllre/o1DEJ6S5BWmXmQy0Woi2Yl8S+Kfj1yCAVcYdDw0unNCoL6WXvE
 kC7Ygysx7bVzWTvh1RP1I016es+b9zcfkvUI4uGxwM/gBBRVbMZHxtnj8S51t8bvnKkq
 4QwYGffRCoMoUryAiIdE4FsVa3NIA8lxhsDVwpJ+z+F9QJcndvFCzaLOZs6IHCesBsv2
 ZT5Q==
X-Gm-Message-State: APjAAAXPEXZkODYpC+yCN8OPifE27RQM8YgZG8NH9zCytfY/a3Crp6eu
 bJKfs9VS0RnzCbOeFsK7kUk=
X-Google-Smtp-Source: APXvYqy070yA+0OSHU30l7xZRSxuWQmt12wbM65RPs74Gvqhp5/KjUrkROv81xNFYhhKTUVG40Z8RQ==
X-Received: by 2002:a0c:981b:: with SMTP id c27mr57804221qvd.48.1560179807224; 
 Mon, 10 Jun 2019 08:16:47 -0700 (PDT)
Received: from quaco.ghostprotocols.net (179-240-164-83.3g.claro.net.br.
 [179.240.164.83])
 by smtp.gmail.com with ESMTPSA id u7sm2748039qta.82.2019.06.10.08.16.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 08:16:46 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id BD0C141149; Mon, 10 Jun 2019 12:16:42 -0300 (-03)
Date: Mon, 10 Jun 2019 12:16:42 -0300
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Subject: Re: [PATCH RESEND 1/2] tools/perf: Add arch neutral function to
 choose event for perf kvm record
Message-ID: <20190610151642.GT21245@kernel.org>
References: <20190610064518.949-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610064518.949-1-anju@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Tue, 11 Jun 2019 05:02:30 +1000
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com, namhyung@kernel.org, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Jun 10, 2019 at 12:15:17PM +0530, Anju T Sudhakar escreveu:
> 'perf kvm record' uses 'cycles'(if the user did not specify any event) as
> the default event to profile the guest.
> This will not provide any proper samples from the guest incase of
> powerpc architecture, since in powerpc the PMUs are controlled by
> the guest rather than the host.
> 
> Patch adds a function to pick an arch specific event for 'perf kvm record',
> instead of selecting 'cycles' as a default event for all architectures.
> 
> For powerpc this function checks for any user specified event, and if there
> isn't any it returns invalid instead of proceeding with 'cycles' event.

Michael, Ravi, Maddy, could you please provide an Acked-by, Reviewed-by
or Tested-by?

- Arnaldo
 
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> ---
>  tools/perf/arch/powerpc/util/kvm-stat.c | 37 +++++++++++++++++++++++++
>  tools/perf/builtin-kvm.c                | 12 +++++++-
>  tools/perf/util/kvm-stat.h              |  2 +-
>  3 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/arch/powerpc/util/kvm-stat.c b/tools/perf/arch/powerpc/util/kvm-stat.c
> index f9db341c47b6..66f8fe500945 100644
> --- a/tools/perf/arch/powerpc/util/kvm-stat.c
> +++ b/tools/perf/arch/powerpc/util/kvm-stat.c
> @@ -8,6 +8,7 @@
>  
>  #include "book3s_hv_exits.h"
>  #include "book3s_hcalls.h"
> +#include <subcmd/parse-options.h>
>  
>  #define NR_TPS 4
>  
> @@ -172,3 +173,39 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
>  
>  	return ret;
>  }
> +
> +/*
> + * Incase of powerpc architecture, pmu registers are programmable
> + * by guest kernel. So monitoring guest via host may not provide
> + * valid samples. It is better to fail the "perf kvm record"
> + * with default "cycles" event to monitor guest in powerpc.
> + *
> + * Function to parse the arguments and return appropriate values.
> + */
> +int kvm_add_default_arch_event(int *argc, const char **argv)
> +{
> +	const char **tmp;
> +	bool event = false;
> +	int i, j = *argc;
> +
> +	const struct option event_options[] = {
> +		OPT_BOOLEAN('e', "event", &event, NULL),
> +		OPT_END()
> +	};
> +
> +	tmp = calloc(j + 1, sizeof(char *));
> +	if (!tmp)
> +		return -EINVAL;
> +
> +	for (i = 0; i < j; i++)
> +		tmp[i] = argv[i];
> +
> +	parse_options(j, tmp, event_options, NULL, 0);
> +	if (!event) {
> +		free(tmp);
> +		return -EINVAL;
> +	}
> +
> +	free(tmp);
> +	return 0;
> +}
> diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
> index dbb6f737a3e2..fe33b3ec55c9 100644
> --- a/tools/perf/builtin-kvm.c
> +++ b/tools/perf/builtin-kvm.c
> @@ -1510,11 +1510,21 @@ static int kvm_cmd_stat(const char *file_name, int argc, const char **argv)
>  }
>  #endif /* HAVE_KVM_STAT_SUPPORT */
>  
> +int __weak kvm_add_default_arch_event(int *argc __maybe_unused,
> +					const char **argv __maybe_unused)
> +{
> +	return 0;
> +}
> +
>  static int __cmd_record(const char *file_name, int argc, const char **argv)
>  {
> -	int rec_argc, i = 0, j;
> +	int rec_argc, i = 0, j, ret;
>  	const char **rec_argv;
>  
> +	ret = kvm_add_default_arch_event(&argc, argv);
> +	if (ret)
> +		return -EINVAL;
> +
>  	rec_argc = argc + 2;
>  	rec_argv = calloc(rec_argc + 1, sizeof(char *));
>  	rec_argv[i++] = strdup("record");
> diff --git a/tools/perf/util/kvm-stat.h b/tools/perf/util/kvm-stat.h
> index 1403dec189b4..da38b56c46cb 100644
> --- a/tools/perf/util/kvm-stat.h
> +++ b/tools/perf/util/kvm-stat.h
> @@ -144,5 +144,5 @@ extern const int decode_str_len;
>  extern const char *kvm_exit_reason;
>  extern const char *kvm_entry_trace;
>  extern const char *kvm_exit_trace;
> -
> +extern int kvm_add_default_arch_event(int *argc, const char **argv);
>  #endif /* __PERF_KVM_STAT_H */
> -- 
> 2.17.2

-- 

- Arnaldo
