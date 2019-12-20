Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0912729A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 01:55:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f9KL5SWVzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 11:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zx2c4.com (client-ip=192.95.5.64; helo=frisell.zx2c4.com;
 envelope-from=jason@zx2c4.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="xzDBBlVf"; 
 dkim-atps=neutral
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f9HF1FTmzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 11:54:00 +1100 (AEDT)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5666531
 for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 19 Dec 2019 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=z/gbyNXr4vvkgNuFdl7EkRzbs28=; b=xzDBBl
 VfQWwE7qxhqlvU8tflqwSDkyUI6TJ8S3QPn3ehr0t1b12ACFtlu/3kTgRGuMG4Wg
 j98dPU5gXNelQpDD544zCicsOuJuCZ83ZQ0GQ335Y7GdlHSAhgU4LwuWsKfKfuz8
 yUV5e1mdFm5gQUF1X3m+Jwf/GFGvAYDgp2npRoqbfbSylMILXhdnXejctU/Q6B4q
 bIRFGMAXqSo1VEqhUMtSK5vT4N9Mjqoj7Q0W1oyf/gQkLHAKl6JcLd5ABoecjf4U
 p36uOdTjjhToY8QfVjqhyJnD7UExR6DL0Lr0y8CcWmMhV24g0epzbzGFS4OxuMxA
 /dQHl7hRTNLQPJaw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3a47970
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 19 Dec 2019 23:57:07 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id k14so9560036otn.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 16:53:52 -0800 (PST)
X-Gm-Message-State: APjAAAVl74Vo1GXwA9NELoDZhjnz5Yv5H1n1j1nwZg8hvAThHp2+vk7n
 vdTJf9NMtQwa4K18OUOd8p625x3YtjG/T6pRFjM=
X-Google-Smtp-Source: APXvYqyqZZ8Z3D0LH1bT1baoL/xjmDYmJpZnio6QN++OGiQMxbDtsYMxxuLg32TGAOEyLJQqYObtIqF1/1ZgOWtd0nU=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr12097849ota.52.1576803231643; 
 Thu, 19 Dec 2019 16:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20190327123615.rwhk6h3ayfurvapf@linutronix.de>
 <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com> <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir>
 <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
 <871rt0mql5.fsf@mpe.ellerman.id.au>
In-Reply-To: <871rt0mql5.fsf@mpe.ellerman.id.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Dec 2019 01:53:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9rpYzd7NfTy+6RBODHkz40D_oYPdX7pq_yG_pACqr+=bw@mail.gmail.com>
Message-ID: <CAHmME9rpYzd7NfTy+6RBODHkz40D_oYPdX7pq_yG_pACqr+=bw@mail.gmail.com>
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Frederic Weisbecker <frederic@kernel.org>,
 David? Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 1:52 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
> index f17ff1200eaa..e45cb9bba193 100644
> --- a/arch/powerpc/kernel/dbell.c
> +++ b/arch/powerpc/kernel/dbell.c
> @@ -63,7 +63,7 @@ int doorbell_try_core_ipi(int cpu)
>         int this_cpu = get_cpu();
>         int ret = 0;
>
> -       if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
> +       if (cpu != this_cpu && cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
>                 doorbell_core_ipi(cpu);
>                 ret = 1;
>         }

I realize the best solution is that nice powernv branch that will
eventually be merged for qemu/tcg. But, maybe the above would be a
decent idea to upstream? It seems like that's a case of a superfluous
doorbell?

Jason
