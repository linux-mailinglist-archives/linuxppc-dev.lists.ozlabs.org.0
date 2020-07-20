Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DFB22580C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:59:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9CJG6R84zDqcT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:59:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vHa2efVB; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9CGc550VzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:57:43 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id d4so11372482otk.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G6NUst1rchY94JUB0W3huiU2MUEkso7czGQSShPQ2Fc=;
 b=vHa2efVBkyuXuZfdhY6Q646Xjxnct5NdFDCqm7rb+1P95VXyZ2oDuw0IjG5o6AjwYj
 8Gsivv0nqtvbhxosSXeUeMJefbCLcJfLcQDv/UZRQWhKMWCnDkyDnZDAti7TBt5jv4Nq
 KyHDci6j19oo6KmiujOAcwfFJUIji12YaVz3PpQ7a8yzxmA3mdYTkvsYjs7ZCNWVqFx9
 VEYwaTRsaKGwEq9tB6a+nVbj+7wWgiaV9xVGZMaRyD/dBE3eVltNnn52+jL1s2EmpU2w
 1+zwgTyt13s0LbDmecUqrBg1tKaMcAF+WJJu0ydNIqUrSHmtDt4Ql2jgOp1KKwR67tO+
 1sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G6NUst1rchY94JUB0W3huiU2MUEkso7czGQSShPQ2Fc=;
 b=QgrU/Am1jA4nynBIBvE8XK5PpqHBeRc3HbJxB8BKPIAXDMPnW7loOCdK0jlDt+Zl11
 m5V5/ojJm4QlCUrFnFTqZZmuNWOaW0R8NvtmFr1wpiUAjdMSTrLPuYCTssoCl9EBz5+V
 zLWIj+NFPCzKOrsCmHHMD6n1nYzhWfk7/rUnlzgYQodvBq7qV39Y4in+tI3u300cSzPF
 Xh7q5Wz+YcYdOAcNGyAhml4L45CoP0Aj8duC+aUg/8Q1sz9XQT9VbkdtPG2uRK55zmgu
 y/kd1HEHdzU9c5znf4/d3f1pKchIW7D+hlpkWlXRo6qkG1OOIRdgymTW0CbVsPSWBxV0
 Z3hw==
X-Gm-Message-State: AOAM532JuZjvTkywslb8QxGP6bDfd8oO+EFKiA3fS992e9KlculXd0OP
 paqE9aFKF2e1s2RduZd8rvIiiOOc/ktao4V3UaQ=
X-Google-Smtp-Source: ABdhPJzRBDfnGqC9iqhGneoqaTRzOpJA0ds7Kv/cYimAuhO4LdnmbLFJQSFTRoMYAS6SES3eYc9ZQ6QwhhN9FbDhfCM=
X-Received: by 2002:a9d:6a12:: with SMTP id g18mr20006080otn.155.1595228260861; 
 Sun, 19 Jul 2020 23:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-11-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200717040958.70561-11-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 20 Jul 2020 16:54:16 +1000
Message-ID: <CACzsE9og50tH9jRZjWYDgbFxdTkDXJq3gMuP8uxPWfrrREo=4w@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] powerpc/watchpoint: Remove 512 byte boundary
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> Power10 has removed 512 bytes boundary from match criteria. i.e. The watch
> range can cross 512 bytes boundary.
It looks like this change is not mentioned in ISA v3.1 Book III 9.4
Data Address Watchpoint. It could be useful to mention that in the
commit message.
Also I wonder if could add a test for this to the ptrace-hwbreak selftest?

>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/kernel/hw_breakpoint.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index c55e67bab271..1f4a1efa0074 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -418,8 +418,9 @@ static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
>
>         if (dawr_enabled()) {
>                 max_len = DAWR_MAX_LEN;
> -               /* DAWR region can't cross 512 bytes boundary */
> -               if (ALIGN_DOWN(start_addr, SZ_512) != ALIGN_DOWN(end_addr - 1, SZ_512))
> +               /* DAWR region can't cross 512 bytes boundary on p10 predecessors */
> +               if (!cpu_has_feature(CPU_FTR_ARCH_31) &&
> +                   (ALIGN_DOWN(start_addr, SZ_512) != ALIGN_DOWN(end_addr - 1, SZ_512)))
>                         return -EINVAL;
>         } else if (IS_ENABLED(CONFIG_PPC_8xx)) {
>                 /* 8xx can setup a range without limitation */
> --
> 2.26.2
>
