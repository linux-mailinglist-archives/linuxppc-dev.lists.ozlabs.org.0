Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7233C4D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:54:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzkZP1yrrz30G4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.45.220; helo=5.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 15000 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 04:54:04 AEDT
Received: from 5.mo52.mail-out.ovh.net (5.mo52.mail-out.ovh.net
 [188.165.45.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzkZ46QMbz2xgF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 04:54:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 81E0624F9A2;
 Mon, 15 Mar 2021 14:08:20 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 14:08:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a0d758be-ca46-480a-9a7d-3671d8e9073a,
 C2FE56B6373390384040EEB24197F6B99D02A218) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 15 Mar 2021 14:08:18 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
Message-ID: <20210315140818.7f5f3120@bahia.lan>
In-Reply-To: <20210312143154.3181109-1-clg@kaod.org>
References: <20210312143154.3181109-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0ba4b6dd-7c1d-4045-9f03-50754df4c9a1
X-Ovh-Tracer-Id: 6648438952380832108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Srikar
 Dronamraju <srikar@linux.vnet.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 15:31:54 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
> available to userspace") introduce a cpu_to_chip_id() routine for the
> PowerNV platform using the "ibm,chip-id" property to query the chip id
> of a CPU. But PAPR does not specify such a property and the node id
> query is broken.
>=20
> Use cpu_to_node() instead which guarantees to have a correct value on
> all platforms, PowerNV an pSeries.
>=20
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Makes sense.

FWIW

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/a=
sm/topology.h
> index 3beeb030cd78..887c42a4e43d 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #ifdef CONFIG_PPC64
>  #include <asm/smp.h>
> =20
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
> =20
>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>  #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))

