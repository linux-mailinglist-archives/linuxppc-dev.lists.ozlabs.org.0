Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4473F757E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 15:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvmND6p9Jz2ywX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 23:02:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R7JmSuS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R7JmSuS5; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvmMh6NDbz2yK4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 23:01:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvmMZ5Ctlz9sT6;
 Wed, 25 Aug 2021 23:01:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629896507;
 bh=xEKYhQmoeZ40Z/IFIiSPaR07LgLYP9hueUuQZNMFQiU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R7JmSuS59v1F8P8//rjUs011XnLPCjyL6A3d7bP1/JZVzHB1YfmKpJBONDWK8lgeL
 KrcAowLYnHBbO10h9nHaopxUsx8dZcfoYCmns7oXBLqEFq9vomc/ScHBVcOzIgqAoG
 jwza8REBtMStaybiTCzmz1xO2awowXjVF1rgwirSSqr62KWpjxtKoRFjrzke+8o4lk
 fnDZiciZBkzYXB5xQnIJl7Um9FXEYA9tvbkRzPLjmmHXc0b1gr8f4i/BzXNgAvxQEA
 Ekq3lm2Bupx0lHVA850IPBe6mow7QhYu/z0t3fdS/dpPuzxlsLmKsIWLAYBcRB/z8Q
 nmyhuj6NQ5x6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Laurent Dufour
 <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/numa: Print debug statements only when
 required
In-Reply-To: <20210823093801.GK21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-2-srikar@linux.vnet.ibm.com>
 <b8bbc10b-5432-512f-5899-455302a59d01@linux.ibm.com>
 <20210823093801.GK21942@linux.vnet.ibm.com>
Date: Wed, 25 Aug 2021 23:01:42 +1000
Message-ID: <87r1ehbrux.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Laurent Dufour <ldufour@linux.ibm.com> [2021-08-23 11:21:33]:
>> Le 21/08/2021 =C3=A0 12:25, Srikar Dronamraju a =C3=A9crit=C2=A0:
>> > Currently, a debug message gets printed every time an attempt to
>> > add(remove) a CPU. However this is redundant if the CPU is already add=
ed
>> > (removed) from the node.
>> >=20
>> > Cc: linuxppc-dev@lists.ozlabs.org
>> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> > Cc: Michael Ellerman <mpe@ellerman.id.au>
>> > Cc: Ingo Molnar <mingo@kernel.org>
>> > Cc: Peter Zijlstra <peterz@infradead.org>
>> > Cc: Valentin Schneider <valentin.schneider@arm.com>
>> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
>> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
>> > Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
>> > Cc: Laurent Dufour <ldufour@linux.ibm.com>
>> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> > ---
>> >   arch/powerpc/mm/numa.c | 11 +++++------
>> >   1 file changed, 5 insertions(+), 6 deletions(-)
>> >=20
>> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> > index f2bf98bdcea2..fbe03f6840e0 100644
>> > --- a/arch/powerpc/mm/numa.c
>> > +++ b/arch/powerpc/mm/numa.c
>> > @@ -141,10 +141,11 @@ static void map_cpu_to_node(int cpu, int node)
>> >   {
>> >   	update_numa_cpu_lookup_table(cpu, node);
>> > -	dbg("adding cpu %d to node %d\n", cpu, node);
>> > -	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node])))
>> > +	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node]))) {
>> > +		dbg("adding cpu %d to node %d\n", cpu, node);
>> >   		cpumask_set_cpu(cpu, node_to_cpumask_map[node]);
>> > +	}
>> >   }
>> >   #if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_PPC_SPLPAR)
>> > @@ -152,13 +153,11 @@ static void unmap_cpu_from_node(unsigned long cp=
u)
>> >   {
>> >   	int node =3D numa_cpu_lookup_table[cpu];
>> > -	dbg("removing cpu %lu from node %d\n", cpu, node);
>> > -
>> >   	if (cpumask_test_cpu(cpu, node_to_cpumask_map[node])) {
>> >   		cpumask_clear_cpu(cpu, node_to_cpumask_map[node]);
>> > +		dbg("removing cpu %lu from node %d\n", cpu, node);
>> >   	} else {
>> > -		printk(KERN_ERR "WARNING: cpu %lu not found in node %d\n",
>> > -		       cpu, node);
>> > +		pr_err("WARNING: cpu %lu not found in node %d\n", cpu, node);
>>=20
>> Would pr_warn() be more appropriate here (or removing the "WARNING" stat=
ement)?
>
> Its a fair point.
>
> Michael,
>
> Do you want me to resend this patch with s/pr_err/pr_warn for the above
> line?

I think what I'd prefer is if we stopped using this custom dbg() stuff
in numa.c, and cleaned up all the messages to use pr_xxx().

Those debug statements only appear if you boot with numa=3Ddebug, which is
not documented anywhere and I had completely forgotten existed TBH.

These days there's CONFIG_DYNAMIC_DEBUG for turning on/off messages,
which is much more flexible.

So can we drop the numa=3Ddebug bits, and convert all the dbg()s to
pr_debug().

And then do a pass converting all the printk("NUMA: ") to pr_xxx() which
will get "numa:" from pr_fmt().

cheers
