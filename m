Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD68639FE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 04:00:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9F20F3Xz3fFt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 14:00:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a0isHA31;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a0isHA31;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL96X5GPCz3fGg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:54:27 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id jn7so8869741plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24wwl/7SU9aryseNSkp4EQPo+uQ6oBmmTLi1Ivoayik=;
        b=a0isHA31bIhVfwpoBJSUwYohC1cXsr3X9bPzzdGLv32to4/W0uQdllPEs2Mawe3fo5
         hAkj2TVSRYvQYqOYcQWALjFSEI41T6MrbVMqE2WYaoBArcW48KMp4xn13uC0fmFI7AJ8
         RAnUxsJ5nS7DcrQ0SdVeRWqjCelrt7ZK8zeS4W+TqE/xUoKc5QitInfTyEuOewmMTUws
         8zXkDRyh8HKDpqJU3wlj8aXz6PPvdhofTu4Uz9BEE/MxDbvDNL7pO60NKrOcUcX1Nb35
         VxWHWxhQ1xJUHsbRyP24s+GCbGDa6eJbLxKIPIwTZoQKr9OiXkRCLzew+scYGTN9bR0j
         gHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=24wwl/7SU9aryseNSkp4EQPo+uQ6oBmmTLi1Ivoayik=;
        b=Zsi3Zdq0UAGj+KqxMlTPa6CYWZOaeuoiUD/etizY5UhnMt4SnPGRDwt9AU9B+d+oUz
         LqmWRndvKAsThC7c2mV1wLMsJZ4WwDfQgav6e4MZd0iYLNXEL2MmhrPQrIkoTTrmUsVd
         gAEyCpWRVjse4gQ2jlZx1rn4TEUbb1lemFxIK4IISqYuWH2ELf8E6iIcj6mhdwvyKwFk
         llmdvSpf0YQShOQMpmXDSugEnxcMmlsqnGtM6LXwzm2trCl4wflgfoAUgGBEF2i5Jdrv
         /agITYQsPCcNPRHb6M3sOem+/zptvzDefQsOxEvmKX5BoSnX5wrNnNCVlieOsh07NIjM
         TEvA==
X-Gm-Message-State: ANoB5pn3fJzHhHA85hlU9jS9opNJYe0KilIwFJxdIkBIXSbc62mzWIal
	RjfNR1YvWeKYPOZWEj/UN+NVtVOpMvo=
X-Google-Smtp-Source: AA0mqf7wP25tzILlpIlzo0hnLZwS7GmAoyn+YpVKVAB4/PF8Y6mfjGvo3B37T5uqYAtG3TKprOK89g==
X-Received: by 2002:a17:902:ab12:b0:189:7d4d:b99b with SMTP id ik18-20020a170902ab1200b001897d4db99bmr7167373plb.147.1669604065012;
        Sun, 27 Nov 2022 18:54:25 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b00176ea6ce0efsm7522393plx.109.2022.11.27.18.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:54:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:54:19 +1000
Message-Id: <CONL8SDELWSP.3V7G3F64356FI@bobo>
Subject: Re: [PATCH 12/13] powerpc/tracing: tracepoints for RTAS entry and
 exit
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-13-nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-13-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> Add two sets of tracepoints to be used around RTAS entry:
>
> * rtas_input/rtas_output, which emit the function name, its inputs,
>   the returned status, and any other outputs. These produce an API-level
>   record of OS<->RTAS activity.
>
> * rtas_ll_entry/rtas_ll_exit, which are lower-level and emit the
>   entire contents of the parameter block (aka rtas_args) on entry and
>   exit. Likely useful only for debugging.
>
> With uses of these tracepoints in do_enter_rtas() to be added in the
> following patch, examples of get-time-of-day and event-scan functions
> as rendered by trace-cmd (with some multi-line formatting manually
> imposed on the rtas_ll_* entries to avoid extremely long lines in the
> commit message):
>
> cat-36800 [059]  4978.518303: rtas_input:           get-time-of-day argum=
ents:
> cat-36800 [059]  4978.518306: rtas_ll_entry:        token=3D3 nargs=3D0 n=
ret=3D8
>                                                     params: [0]=3D0x00000=
000 [1]=3D0x00000000 [2]=3D0x00000000 [3]=3D0x00000000
>                                                             [4]=3D0x00000=
000 [5]=3D0x00000000 [6]=3D0x00000000 [7]=3D0x00000000
> 							    [8]=3D0x00000000 [9]=3D0x00000000 [10]=3D0x00000000 [11]=3D0x0=
0000000
> 							    [12]=3D0x00000000 [13]=3D0x00000000 [14]=3D0x00000000 [15]=3D0=
x00000000
> cat-36800 [059]  4978.518366: rtas_ll_exit:         token=3D3 nargs=3D0 n=
ret=3D8
>                                                     params: [0]=3D0x00000=
000 [1]=3D0x000007e6 [2]=3D0x0000000b [3]=3D0x00000001
> 						            [4]=3D0x00000000 [5]=3D0x0000000e [6]=3D0x00000008 [7]=
=3D0x2e0dac40
> 							    [8]=3D0x00000000 [9]=3D0x00000000 [10]=3D0x00000000 [11]=3D0x0=
0000000
> 							    [12]=3D0x00000000 [13]=3D0x00000000 [14]=3D0x00000000 [15]=3D0=
x00000000
> cat-36800 [059]  4978.518366: rtas_output:          get-time-of-day statu=
s: 0, other outputs: 2022 11 1 0 14 8 772648000
>
> kworker/39:1-336   [039]  4982.731623: rtas_input:           event-scan a=
rguments: 4294967295 0 80484920 2048
> kworker/39:1-336   [039]  4982.731626: rtas_ll_entry:        token=3D6 na=
rgs=3D4 nret=3D1
>                                                              params: [0]=
=3D0xffffffff [1]=3D0x00000000 [2]=3D0x04cc1a38 [3]=3D0x00000800
> 							             [4]=3D0x00000000 [5]=3D0x0000000e [6]=3D0x00000008 [7=
]=3D0x2e0dac40
> 								     [8]=3D0x00000000 [9]=3D0x00000000 [10]=3D0x00000000 [11]=3D0=
x00000000
> 								     [12]=3D0x00000000 [13]=3D0x00000000 [14]=3D0x00000000 [15]=
=3D0x00000000
> kworker/39:1-336   [039]  4982.731676: rtas_ll_exit:         token=3D6 na=
rgs=3D4 nret=3D1
>                                                              params: [0]=
=3D0xffffffff [1]=3D0x00000000 [2]=3D0x04cc1a38 [3]=3D0x00000800
> 							             [4]=3D0x00000001 [5]=3D0x0000000e [6]=3D0x00000008 [7=
]=3D0x2e0dac40
> 								     [8]=3D0x00000000 [9]=3D0x00000000 [10]=3D0x00000000 [11]=3D0=
x00000000
> 								     [12]=3D0x00000000 [13]=3D0x00000000 [14]=3D0x00000000 [15]=
=3D0x00000000
> kworker/39:1-336   [039]  4982.731677: rtas_output:          event-scan s=
tatus: 1, other outputs:
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/trace.h | 116 +++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/trace.h b/arch/powerpc/include/asm/=
trace.h
> index 08cd60cd70b7..e7a301c9eb95 100644
> --- a/arch/powerpc/include/asm/trace.h
> +++ b/arch/powerpc/include/asm/trace.h
> @@ -119,6 +119,122 @@ TRACE_EVENT_FN_COND(hcall_exit,
>  );
>  #endif
> =20
> +#ifdef CONFIG_PPC_RTAS
> +
> +#include <asm/rtas-types.h>
> +
> +/*
> + * Since stop-self is how CPUs go offline on RTAS platforms,
> + * these tracepoints are conditional.
> + */
> +
> +TRACE_EVENT_CONDITION(rtas_input,
> +
> +	TP_PROTO(struct rtas_args *rtas_args, const char *name),
> +
> +	TP_ARGS(rtas_args, name),
> +
> +	TP_CONDITION(cpu_online(raw_smp_processor_id())),
> +
> +	TP_STRUCT__entry(
> +		__field(__u32, nargs)
> +		__string(name, name)
> +		__dynamic_array(__u32, inputs, be32_to_cpu(rtas_args->nargs))
> +	),
> +
> +	TP_fast_assign(
> +		__entry->nargs =3D be32_to_cpu(rtas_args->nargs);
> +		__assign_str(name, name);
> +		be32_to_cpu_array(__get_dynamic_array(inputs), rtas_args->args, __entr=
y->nargs);
> +	),
> +
> +	TP_printk("%s arguments: %s", __get_str(name),
> +		  __print_array(__get_dynamic_array(inputs), __entry->nargs, 4)
> +	)
> +);
> +
> +TRACE_EVENT_CONDITION(rtas_output,
> +
> +	TP_PROTO(struct rtas_args *rtas_args, const char *name),
> +
> +	TP_ARGS(rtas_args, name),
> +
> +	TP_CONDITION(cpu_online(raw_smp_processor_id())),
> +
> +	TP_STRUCT__entry(
> +		__field(__u32, nr_other)
> +		__field(__s32, status)
> +		__string(name, name)
> +		__dynamic_array(__u32, other_outputs, be32_to_cpu(rtas_args->nret) - 1=
)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->nr_other =3D be32_to_cpu(rtas_args->nret) - 1;
> +		__entry->status =3D be32_to_cpu(rtas_args->rets[0]);
> +		__assign_str(name, name);
> +		be32_to_cpu_array(__get_dynamic_array(other_outputs),
> +				  &rtas_args->rets[1], __entry->nr_other);
> +	),
> +
> +	TP_printk("%s status: %d, other outputs: %s", __get_str(name), __entry-=
>status,
> +		  __print_array(__get_dynamic_array(other_outputs),
> +				__entry->nr_other, 4)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(rtas_parameter_block,
> +
> +	TP_PROTO(struct rtas_args *rtas_args),
> +
> +	TP_ARGS(rtas_args),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, token)
> +		__field(u32, nargs)
> +		__field(u32, nret)
> +		__array(__u32, params, 16)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->token =3D be32_to_cpu(rtas_args->token);
> +		__entry->nargs =3D be32_to_cpu(rtas_args->nargs);
> +		__entry->nret =3D be32_to_cpu(rtas_args->nret);
> +		be32_to_cpu_array(__entry->params, rtas_args->args, ARRAY_SIZE(rtas_ar=
gs->args));
> +	),
> +
> +	TP_printk("token=3D%u nargs=3D%u nret=3D%u params:"
> +		  " [0]=3D0x%08x [1]=3D0x%08x [2]=3D0x%08x [3]=3D0x%08x"
> +		  " [4]=3D0x%08x [5]=3D0x%08x [6]=3D0x%08x [7]=3D0x%08x"
> +		  " [8]=3D0x%08x [9]=3D0x%08x [10]=3D0x%08x [11]=3D0x%08x"
> +		  " [12]=3D0x%08x [13]=3D0x%08x [14]=3D0x%08x [15]=3D0x%08x",

You could justify these since you went to the trouble to format them
nicely. Not a big deal though.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +		  __entry->token, __entry->nargs, __entry->nret,
> +		  __entry->params[0], __entry->params[1], __entry->params[2], __entry-=
>params[3],
> +		  __entry->params[4], __entry->params[5], __entry->params[6], __entry-=
>params[7],
> +		  __entry->params[8], __entry->params[9], __entry->params[10], __entry=
->params[11],
> +		  __entry->params[12], __entry->params[13], __entry->params[14], __ent=
ry->params[15]
> +	)
> +);
> +
> +DEFINE_EVENT_CONDITION(rtas_parameter_block, rtas_ll_entry,
> +
> +	TP_PROTO(struct rtas_args *rtas_args),
> +
> +	TP_ARGS(rtas_args),
> +
> +	TP_CONDITION(cpu_online(raw_smp_processor_id()))
> +);
> +
> +DEFINE_EVENT_CONDITION(rtas_parameter_block, rtas_ll_exit,
> +
> +	TP_PROTO(struct rtas_args *rtas_args),
> +
> +	TP_ARGS(rtas_args),
> +
> +	TP_CONDITION(cpu_online(raw_smp_processor_id()))
> +);
> +
> +#endif /* CONFIG_PPC_RTAS */
> +
>  #ifdef CONFIG_PPC_POWERNV
>  extern int opal_tracepoint_regfunc(void);
>  extern void opal_tracepoint_unregfunc(void);
> --=20
> 2.37.1

