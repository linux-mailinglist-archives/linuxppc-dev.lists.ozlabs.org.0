Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EB73708B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R2Bhcgah;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlrJN0bqpz3bXx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 01:33:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R2Bhcgah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlrHS4K3vz300v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 01:32:50 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so6726560a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=R2BhcgahF4eA1vnlN0qyJmASSGyaKyq8k8oOrUAtCf6A4nOmgevBEhPzEV8rIbjTgF
         yXzVElUQYcMdeYQTQkO+X2Y+9ZuwgkppnVdZSXyRsEkPbs6x/ssnctoQke0QTIMErPf3
         qLgAPk3+Vpo3W0G2QiGZq35LggwDfRrpFYUUYGCVB1g7szVQ79eBlKEygcj7p7OVjxQf
         pa51oJokqPD+3D2MoPj8cm17qxZzYmsGb5TOKjwNPuJs0U4g/8S2QCH5/u+vSkwhFWvm
         3m8n5V/yFyRQTrN52yzRlNSqLm1w2gZ7QUzER3KDhhogdRbdvNc25JV4yGkEnTVq2UW0
         ShAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=gR6ljq2lViveQIpEiYCRnT3VXEHUerJQQUmJ6my+oZzL1sYhbeZ+z9468OH7L6GI5K
         fGQcgxWYeqAk4RoDOgiLRr4H2RBG6dzFLOFnuu5jgrYnvR6IlQ50PFA4c81+PK22yl/J
         VtLsF3619l/9z0Pnw5NgzoURZ7xKpiag3w/g4Ns4BZ4zpUWQjzS4cfNpXcScG5fZYB2H
         MtnRZsjrqwf7js5XF4yUROW3v876M4GKiKYIkQABqV910RofjBgs5WVVI3FYKa8osVv3
         VWUTReSoZA2es9HZRriqQ8ukZ/EVmicdrUpD556/hcBf/NPtyon9SPGdgL2ANc1137fW
         rMbQ==
X-Gm-Message-State: AC+VfDwoXi8PEy1Qo6O6E99BrkO6WZsaWrjBtDg+Jk6LC8kAlNDG8wJE
	tq+suZcqGqPX8U0R8RexlXcCUFQW3DU8BjkQjyg=
X-Google-Smtp-Source: ACHHUZ5ux98lA0dfOqVXfQP0ndlYyBoHuqHpCIjpPqNu3qgP8TLa7JJDdMIHBmrGJ6oD7j3SfcbrFl7+8TyeQPspzGA=
X-Received: by 2002:aa7:cf16:0:b0:51a:40ca:d081 with SMTP id
 a22-20020aa7cf16000000b0051a40cad081mr7305340edy.27.1687275164525; Tue, 20
 Jun 2023 08:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx> <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
 <87h6r4qo1d.ffs@tglx> <20230620105104.60cb64d8@gandalf.local.home>
In-Reply-To: <20230620105104.60cb64d8@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Jun 2023 08:32:33 -0700
Message-ID: <CAADnVQK_dWhPxdjs4HuAXWBTeVAf01er15dZU8tC+d=g6QCPXw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, X86 ML <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, linux-s390 <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf <bpf@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 7:51=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 19 Jun 2023 02:43:58 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
> > Now you might argue that it _is_ a "hotpath" due to the BPF usage, but
> > then even more so as any intermediate wrapper which converts from one
> > data representation to another data representation is not going to
> > increase performance, right?
>
> Just as a side note. BPF can not attach its return calling code to
> functions that have more than 6 parameters (3 on 32 bit x86), because of
> the way BPF return path trampoline works. It is a requirement that all
> parameters live in registers, and none on the stack.

It's actually 7 and that restriction is being lifted.
The patch set to attach to <=3D 12 is being discussed.
