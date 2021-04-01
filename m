Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60835108B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 10:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9wh85yqzz3brT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 19:04:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9wgr15J4z2xZP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 19:04:22 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A15479673B56;
 Thu,  1 Apr 2021 10:04:17 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 10:04:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038ccee2e8-4305-49a0-aee7-6e781a5c8f3d,
 A2907451AC51A4EFF4C4D6DD6E02A54F207D12BE) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 1 Apr 2021 10:04:15 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
Message-ID: <20210401100415.28eb9967@bahia.lan>
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d958df5b-ee9c-4de1-96c7-8bc79641beec
X-Ovh-Tracer-Id: 9115567124170775005
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffetvdegudeugfehledttdeigeehjefhkeeluddutdffjeffueelfffgvedtkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 16:45:05 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

>=20
> Hello,
>=20
> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
>=20
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
>=20
> As a workaround, the impact can be reduced by deactivating the IRQ
> lockup detector ("noirqdebug") which does a lot of accounting in the
> Linux IRQ descriptor structure and is responsible for most of the
> performance penalty.
>=20
> As a fix, this proposal allocates an IPI interrupt per node, to be
> shared by all CPUs of that node. It solves the scaling issue, the IRQ
> lockup detector still has an impact but the XIVE interrupt rate scales
> linearly. It also improves the "noirqdebug" case as showed in the
> tables below.=20
>=20

As explained by David and others, NUMA nodes happen to match sockets
with current POWER CPUs but these are really different concepts. NUMA
is about CPU memory accesses latency, while in the case of XIVE you
really need to identify a XIVE chip localized in a given socket.

PAPR doesn't know about sockets, only cores. In other words, a PAPR
compliant guest sees all vCPUs like they all sit in a single socket.
Same for the XIVE. Trying to introduce a concept of socket, either
by hijacking OPAL's ibm,chip-id or NUMA node ids, is a kind of
spec violation in this context. If the user cares for locality of
the vCPUs and XIVE on the same socket, then it should bind vCPU
threads to host CPUs from the same socket in the first place.
Isn't this enough to solve the performance issues this series
want to fix, without the need for virtual socket ids ?

>  * P9 DD2.2 - 2s * 64 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s  =20
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys    =20
>  --------------------------------------------------------------
>  1      0-15     4.984023   4.875405       4.996536   5.048892
>         0-31    10.879164  10.544040      10.757632  11.037859
>         0-47    15.345301  14.688764      14.926520  15.310053
>         0-63    17.064907  17.066812      17.613416  17.874511
>  2      0-79    11.768764  21.650749      22.689120  22.566508
>         0-95    10.616812  26.878789      28.434703  28.320324
>         0-111   10.151693  31.397803      31.771773  32.388122
>         0-127    9.948502  33.139336      34.875716  35.224548
>=20
>=20
>  * P10 DD1 - 4s (not homogeneous) 352 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s  =20
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys    =20
>  --------------------------------------------------------------
>  1      0-15     2.409402   2.364108       2.383303   2.395091
>         0-31     6.028325   6.046075       6.089999   6.073750
>         0-47     8.655178   8.644531       8.712830   8.724702
>         0-63    11.629652  11.735953      12.088203  12.055979
>         0-79    14.392321  14.729959      14.986701  14.973073
>         0-95    12.604158  13.004034      17.528748  17.568095
>  2      0-111    9.767753  13.719831      19.968606  20.024218
>         0-127    6.744566  16.418854      22.898066  22.995110
>         0-143    6.005699  19.174421      25.425622  25.417541
>         0-159    5.649719  21.938836      27.952662  28.059603
>         0-175    5.441410  24.109484      31.133915  31.127996
>  3      0-191    5.318341  24.405322      33.999221  33.775354
>         0-207    5.191382  26.449769      36.050161  35.867307
>         0-223    5.102790  29.356943      39.544135  39.508169
>         0-239    5.035295  31.933051      42.135075  42.071975
>         0-255    4.969209  34.477367      44.655395  44.757074
>  4      0-271    4.907652  35.887016      47.080545  47.318537
>         0-287    4.839581  38.076137      50.464307  50.636219
>         0-303    4.786031  40.881319      53.478684  53.310759
>         0-319    4.743750  43.448424      56.388102  55.973969
>         0-335    4.709936  45.623532      59.400930  58.926857
>         0-351    4.681413  45.646151      62.035804  61.830057
>=20
> [*] https://github.com/antonblanchard/ipistorm
>=20
> Thanks,
>=20
> C.
>=20
> Changes in v3:
>=20
>   - improved commit log for the misuse of "ibm,chip-id"
>   - better error handling of xive_request_ipi()
>   - use of a fwnode_handle to name the new domain=20
>   - increased IPI name length
>   - use of early_cpu_to_node() for hotplugged CPUs
>   - filter CPU-less nodes
>=20
> Changes in v2:
>=20
>   - extra simplification on xmon
>   - fixes on issues reported by the kernel test robot
>=20
> C=C3=A9dric Le Goater (9):
>   powerpc/xive: Use cpu_to_node() instead of "ibm,chip-id" property
>   powerpc/xive: Introduce an IPI interrupt domain
>   powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
>   powerpc/xive: Simplify xive_core_debug_show()
>   powerpc/xive: Drop check on irq_data in xive_core_debug_show()
>   powerpc/xive: Simplify the dump of XIVE interrupts under xmon
>   powerpc/xive: Fix xmon command "dxi"
>   powerpc/xive: Map one IPI interrupt per node
>   powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
>=20
>  arch/powerpc/include/asm/xive.h          |   1 +
>  arch/powerpc/sysdev/xive/xive-internal.h |   2 -
>  arch/powerpc/sysdev/xive/common.c        | 211 +++++++++++++++--------
>  arch/powerpc/xmon/xmon.c                 |  28 +--
>  4 files changed, 139 insertions(+), 103 deletions(-)
>=20

