Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D951455B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 11:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqRqq5Spgz3br1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 19:23:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CcHlI3Au;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CcHlI3Au; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqRq75JB8z3bYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 19:22:57 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id y32so12958655lfa.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bhPxd6svpKOboxST/6guS4MOSMze/71rIJIgOQA8rZo=;
 b=CcHlI3Au6GCo1UVzpXVov/h1wYElTNB9KLySGMMq2ve/a+TtvK5YlNIE1buiqFG4Nl
 u/yJNPitTZt8sIeOJjB65Ui/1u355v1A2H7rivfKbBLHtHs+twE1aeJijeY6w74gk/C9
 beognAtlmiiMUVoRPY2P2xBjOD5kn8WzXajIeBHjp2IbcVFILkaLGvvcgQymLNFVLX7W
 O2NCAewH21dEqhwgYIy8zCJ1hXEDN8sGRLk/bc4Oj4c5AC8PD4Xjq19cf3SOi69El8Xe
 CE7Bw/RGpPKDZ+W4HqGQMjQxaF5kblB25nziyJo7yUSAzUuWVoHRSngnqULHAZHmFVOo
 K43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bhPxd6svpKOboxST/6guS4MOSMze/71rIJIgOQA8rZo=;
 b=D6fVc7+BuqVDzjZ/EmFHGxbGKlvqTGz+gQJuv0ORuwmo0U1Df4OgV+GdrALi3ixJ7E
 DnFuTqd679f0yDzvXBiYdQwBCdM7iZYqdB+vdOO9h1HA8SOHqIXAEWHfWTMvC7h1S9yJ
 PKloROb09yRZ+GiOTIEyQsG4ll8cSaQtqsOJvHgQkUBD+P9q20CskYgudTaKZSnKcOEu
 LzdZzBsvlqjXjN8E2C2qhXj9xHTtqfc7trU5rwRUJR5/1zhJPyosjFtKu7lbYU38H8wN
 cg7ILW806bf2CEaWwPgk2XfQRFzNEtT9eUgjPGCRZqvQcRAlwD7oa+RG76dOXnyfcPzE
 f3tA==
X-Gm-Message-State: AOAM530dsTDfiqrLfpPgrb+/j0Mk1qSn9gE+vK4AWJLwJdFFy1H6Sr7K
 jP3sk+akCN7qJuRZnZgaL38=
X-Google-Smtp-Source: ABdhPJzFja3bmADODH1fdpoqaNJXuuCGiOo+I2PKC036x77KFxdRqfAwbMVEMu8UhB/GID87ZxayFg==
X-Received: by 2002:a05:6512:3ba0:b0:472:49f2:a752 with SMTP id
 g32-20020a0565123ba000b0047249f2a752mr1049387lfv.374.1651224168844; 
 Fri, 29 Apr 2022 02:22:48 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.73.25])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a196741000000b0046bc4be1d60sm192072lfj.123.2022.04.29.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 02:22:48 -0700 (PDT)
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
Date: Fri, 29 Apr 2022 12:22:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220427224924.592546-18-gpiccoli@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

On 4/28/22 1:49 AM, Guilherme G. Piccoli wrote:

> Currently the tracing dump_on_oops feature is implemented
> through separate notifiers, one for die/oops and the other
> for panic. With the addition of panic notifier "id", this
> patch makes use of such "id" to unify both functions.
> 
> It also comments the function and changes the priority of the
> notifier blocks, in order they run early compared to other
> notifiers, to prevent useless trace data (like the callback
> names for the other notifiers). Finally, we also removed an
> unnecessary header inclusion.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  kernel/trace/trace.c | 57 +++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index f4de111fa18f..c1d8a3622ccc 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
[...]
> @@ -9767,38 +9766,46 @@ static __init int tracer_init_tracefs(void)
>  
>  fs_initcall(tracer_init_tracefs);
>  
> -static int trace_panic_handler(struct notifier_block *this,
> -			       unsigned long event, void *unused)
> +/*
> + * The idea is to execute the following die/panic callback early, in order
> + * to avoid showing irrelevant information in the trace (like other panic
> + * notifier functions); we are the 2nd to run, after hung_task/rcu_stall
> + * warnings get disabled (to prevent potential log flooding).
> + */
> +static int trace_die_panic_handler(struct notifier_block *self,
> +				unsigned long ev, void *unused)
>  {
> -	if (ftrace_dump_on_oops)
> +	int do_dump;

   bool?

> +
> +	if (!ftrace_dump_on_oops)
> +		return NOTIFY_DONE;
> +
> +	switch (ev) {
> +	case DIE_OOPS:
> +		do_dump = 1;
> +		break;
> +	case PANIC_NOTIFIER:
> +		do_dump = 1;
> +		break;

   Why not:

	case DIE_OOPS:
	case PANIC_NOTIFIER:
		do_dump = 1;
		break;

> +	default:
> +		do_dump = 0;
> +		break;
> +	}
> +
> +	if (do_dump)
>  		ftrace_dump(ftrace_dump_on_oops);
> -	return NOTIFY_OK;
> +
> +	return NOTIFY_DONE;
>  }
[...]

MBR, Sergey
