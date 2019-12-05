Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72F114827
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 21:37:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TSF52HXNzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 07:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=pauld@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGRkYK/Y"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TNY02LrvzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 04:50:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575568221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCq3xsw+wql8e0KabFjTkE7OSUpqz8BEOKGY9cQ3d30=;
 b=iGRkYK/Y9qr+yjHpkWchhC6koKjFQS7sIWpG3cQUWL0UZMulDU6GZl6an/qFciTLRQCkf2
 2S8ySTTR3D6MqWxgFnUXmdIf/geiCUCGaEOckUfWJ+VEICaly8iJVVNlufTKNRSFwiqutX
 vVVpW3rX7cDw7gIV+zMAAukvtHGq8Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-_4dtNLu3PRyqZbZ0f5FI6A-1; Thu, 05 Dec 2019 08:48:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E979801E74;
 Thu,  5 Dec 2019 13:48:11 +0000 (UTC)
Received: from lorien.usersys.redhat.com (ovpn-116-240.phx2.redhat.com
 [10.3.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17A795D6A5;
 Thu,  5 Dec 2019 13:48:05 +0000 (UTC)
Date: Thu, 5 Dec 2019 08:48:03 -0500
From: Phil Auld <pauld@redhat.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
Message-ID: <20191205134803.GA18693@lorien.usersys.redhat.com>
References: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: _4dtNLu3PRyqZbZ0f5FI6A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Dec 2019 07:33:31 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 05, 2019 at 02:02:17PM +0530 Srikar Dronamraju wrote:
> With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empt=
ed
> vCPUs"), scheduler avoids preempted vCPUs to schedule tasks on wakeup.
> This leads to wrong choice of CPU, which in-turn leads to larger wakeup
> latencies. Eventually, it leads to performance regression in latency
> sensitive benchmarks like soltp, schbench etc.
>=20
> On Powerpc, vcpu_is_preempted only looks at yield_count. If the
> yield_count is odd, the vCPU is assumed to be preempted. However
> yield_count is increased whenever LPAR enters CEDE state. So any CPU
> that has entered CEDE state is assumed to be preempted.
>=20
> Even if vCPU of dedicated LPAR is preempted/donated, it should have
> right of first-use since they are suppose to own the vCPU.
>=20
> On a Power9 System with 32 cores
>  # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1
> Socket(s):           16
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>=20
>   # perf stat -a -r 5 ./schbench
> v5.4                                     v5.4 + patch
> Latency percentiles (usec)               Latency percentiles (usec)
> =0950.0000th: 45                    =0950.0000th: 39
> =0975.0000th: 62                    =0975.0000th: 53
> =0990.0000th: 71                    =0990.0000th: 67
> =0995.0000th: 77                    =0995.0000th: 76
> =09*99.0000th: 91                   =09*99.0000th: 89
> =0999.5000th: 707                   =0999.5000th: 93
> =0999.9000th: 6920                  =0999.9000th: 118
> =09min=3D0, max=3D10048                 =09min=3D0, max=3D211
> Latency percentiles (usec)               Latency percentiles (usec)
> =0950.0000th: 45                    =0950.0000th: 34
> =0975.0000th: 61                    =0975.0000th: 45
> =0990.0000th: 72                    =0990.0000th: 53
> =0995.0000th: 79                    =0995.0000th: 56
> =09*99.0000th: 691                  =09*99.0000th: 61
> =0999.5000th: 3972                  =0999.5000th: 63
> =0999.9000th: 8368                  =0999.9000th: 78
> =09min=3D0, max=3D16606                 =09min=3D0, max=3D228
> Latency percentiles (usec)               Latency percentiles (usec)
> =0950.0000th: 45                    =0950.0000th: 34
> =0975.0000th: 61                    =0975.0000th: 45
> =0990.0000th: 71                    =0990.0000th: 53
> =0995.0000th: 77                    =0995.0000th: 57
> =09*99.0000th: 106                  =09*99.0000th: 63
> =0999.5000th: 2364                  =0999.5000th: 68
> =0999.9000th: 7480                  =0999.9000th: 100
> =09min=3D0, max=3D10001                 =09min=3D0, max=3D134
> Latency percentiles (usec)               Latency percentiles (usec)
> =0950.0000th: 45                    =0950.0000th: 34
> =0975.0000th: 62                    =0975.0000th: 46
> =0990.0000th: 72                    =0990.0000th: 53
> =0995.0000th: 78                    =0995.0000th: 56
> =09*99.0000th: 93                   =09*99.0000th: 61
> =0999.5000th: 108                   =0999.5000th: 64
> =0999.9000th: 6792                  =0999.9000th: 85
> =09min=3D0, max=3D17681                 =09min=3D0, max=3D121
> Latency percentiles (usec)               Latency percentiles (usec)
> =0950.0000th: 46                    =0950.0000th: 33
> =0975.0000th: 62                    =0975.0000th: 44
> =0990.0000th: 73                    =0990.0000th: 51
> =0995.0000th: 79                    =0995.0000th: 54
> =09*99.0000th: 113                  =09*99.0000th: 61
> =0999.5000th: 2724                  =0999.5000th: 64
> =0999.9000th: 6184                  =0999.9000th: 82
> =09min=3D0, max=3D9887                  =09min=3D0, max=3D121
>=20
>  Performance counter stats for 'system wide' (5 runs):
>=20
> context-switches    43,373  ( +-  0.40% )   44,597 ( +-  0.55% )
> cpu-migrations       1,211  ( +-  5.04% )      220 ( +-  6.23% )
> page-faults         15,983  ( +-  5.21% )   15,360 ( +-  3.38% )
>=20
> Waiman Long suggested using static_keys.
>=20
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Tested-by: Juri Lelli <juri.lelli@redhat.com>
> Ack-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 (https://patchwork.ozlabs.org/patch/1204190/) ->v3:
> Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
> This was suggested by Waiman Long.
>=20
>  arch/powerpc/include/asm/spinlock.h | 5 +++--
>  arch/powerpc/mm/numa.c              | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/a=
sm/spinlock.h
> index e9a960e28f3c..de817c25deff 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -35,11 +35,12 @@
>  #define LOCK_TOKEN=091
>  #endif
> =20
> -#ifdef CONFIG_PPC_PSERIES
> +#ifdef CONFIG_PPC_SPLPAR
> +DECLARE_STATIC_KEY_FALSE(shared_processor);
>  #define vcpu_is_preempted vcpu_is_preempted
>  static inline bool vcpu_is_preempted(int cpu)
>  {
> -=09if (!firmware_has_feature(FW_FEATURE_SPLPAR))
> +=09if (!static_branch_unlikely(&shared_processor))
>  =09=09return false;
>  =09return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
>  }
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 50d68d21ddcc..ffb971f3a63c 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1568,9 +1568,13 @@ int prrn_is_enabled(void)
>  =09return prrn_enabled;
>  }
> =20
> +DEFINE_STATIC_KEY_FALSE(shared_processor);
> +EXPORT_SYMBOL_GPL(shared_processor);
> +
>  void __init shared_proc_topology_init(void)
>  {
>  =09if (lppaca_shared_proc(get_lppaca())) {
> +=09=09static_branch_enable(&shared_processor);
>  =09=09bitmap_fill(cpumask_bits(&cpu_associativity_changes_mask),
>  =09=09=09    nr_cpumask_bits);
>  =09=09numa_update_cpu_topology(false);
> --=20
> 2.18.1
>

This looks good to me, thanks Srikar.

Acked-by: Phil Auld <pauld@redhat.com>
--=20

