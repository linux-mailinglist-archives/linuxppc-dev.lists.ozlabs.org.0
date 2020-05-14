Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEF1D41B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 01:30:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NSSm2ThLzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 09:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pAsoCW4t; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NSR01FV6zDqw0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 09:28:42 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id f83so691341qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 16:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=I/FTFu3Esb5NA/l5xL7ux/92tkQ2JvycVABxeQURrbo=;
 b=pAsoCW4twMPuMB+CSRxUc0zI1h1/vtfog4+l7wXkwYtyLwBFT2gAmZGs6GulY5TvDJ
 ovjrxjtG+IlKRkoTqxxV2x0VQLbNK52e+UIYRx9VfbNY9YIdKLb/mqXe1caBEo+oSDu2
 oJKVVDQHPf5T9keTXAJEacNAMJoZLnGjxzGfX1+TfgDGict68GRGXksj71lkVfne+NdQ
 FCaynLyTYju2qp23k25nDo6XyshMaxOBptuyaZb0i3yBQj4X6Aqjn7s1eJM5v5+p8AHC
 hh9cDQ4A3PI9jPF9rp3aAbUoQnjXO99lNrm11rK3WwvlqMRBEfc7ey//pYGSd+Dayw0R
 3SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=I/FTFu3Esb5NA/l5xL7ux/92tkQ2JvycVABxeQURrbo=;
 b=IuaBuvFvBN6QDAKDJbzdMNl7MqZxLj4m090iA64qtt3uyOq1JBeg79rhxVSlQR6KSt
 E0JabAMLRuazYhPM+5lJApQqXMSo5+DRGDZpAdDAQe80ZHcuIro+9zxR+2fIdtLlHk+n
 LXXkOtdF/Z42H0V1AOFVzXUgQF8eByibgSj/dTOnpvRepaRItrIeXrTwnLIMANonxSdC
 3DkTXC3fNZTdNwU+Jy4HjgRGpLPJR1pgvESrrdExvH4jTSuw+jpmnHbIA0ZZdf3UtVBT
 5euRLjq80g5u/KnfAWfojNRN4AzFDfDanOEQ82UBbtVNW1uDYzP3F5rjQVqPHqehxwpm
 09ug==
X-Gm-Message-State: AOAM532EEoZNxxF4yge9b0LQMhLmPEmNhbQ47gSpwDY9UP0zCiDReAiz
 pcVN8e9xAqML1G+8tahIGaY=
X-Google-Smtp-Source: ABdhPJz4jcoS7U+Fo0E8WD2tpzZFNH7JRT/QQnnFFJl6Mcw1x1jIY+ShCqeS4tZnEf3kXzfE8BXfPQ==
X-Received: by 2002:a37:8187:: with SMTP id c129mr806073qkd.211.1589498918382; 
 Thu, 14 May 2020 16:28:38 -0700 (PDT)
Received: from LeoBras (179-125-143-209.dynamic.desktop.com.br.
 [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id n20sm290110qkk.53.2020.05.14.16.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 16:28:37 -0700 (PDT)
Message-ID: <fc13b26ff3d2ea2e84049eabda0c60a60d851b40.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] powerpc/rtas: Implement reentrant rtas call
From: Leonardo Bras <leobras.c@gmail.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Thu, 14 May 2020 20:28:15 -0300
In-Reply-To: <878shu2vjp.fsf@linux.ibm.com>
References: <20200514011245.127174-1-leobras.c@gmail.com>
 <20200514011245.127174-3-leobras.c@gmail.com>
 <878shu2vjp.fsf@linux.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nathan,

On Thu, 2020-05-14 at 13:58 -0500, Nathan Lynch wrote:
> Hi,
> 
> Leonardo Bras <leobras.c@gmail.com> writes:
> > +/**
> > + * rtas_call_reentrant() - Used for reentrant rtas calls
> > + * @token:	Token for desired reentrant RTAS call
> > + * @nargs:	Number of Input Parameters
> > + * @nret:	Number of Output Parameters
> > + * @outputs:	Array of outputs
> > + * @...:	Inputs for desired RTAS call
> > + *
> > + * According to LoPAR documentation, only "ibm,int-on", "ibm,int-off",
> > + * "ibm,get-xive" and "ibm,set-xive" are currently reentrant.
> > + * Reentrant calls need their own rtas_args buffer, so not using rtas.args, but
> > + * PACA one instead.
> > + *
> > + * Return:	-1 on error,
> > + *		First output value of RTAS call if (nret > 0),
> > + *		0 otherwise,
> > + */
> > +
> > +int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
> > +{
> > +	va_list list;
> > +	struct rtas_args *args;
> > +	int i;
> > +
> > +	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> > +		return -1;
> > +
> > +	/* We use the per-cpu (PACA) rtas args buffer */
> > +	args = &local_paca->reentrant_args;
> > +
> > +	va_start(list, outputs);
> > +	va_rtas_call_unlocked(args, token, nargs, nret, list);
> > +	va_end(list);
> > +
> > +	if (nret > 1 && outputs)
> > +		for (i = 0; i < nret - 1; ++i)
> > +			outputs[i] = be32_to_cpu(args->rets[i + 1]);
> 
> Doesn't this need to be more careful about preemption and exceptions?
> I.e. the args structure in the paca needs to be protected from
> concurrent use somehow, like any per-cpu data structure.
> 
> local_irq_save/restore while accessing local_paca->reentrant_args here
> would be sufficient I think?

Yes, you are right.
I will also add preempt_{dis,en}able, which in most kernels will
compile out, but it will be kind of 'ready' if we ever decide to
support PREEMPT.

Thanks for the feedback!

