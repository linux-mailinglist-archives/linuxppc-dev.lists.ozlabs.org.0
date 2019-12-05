Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FC1140E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 13:37:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TFbf0lXvzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 23:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=juri.lelli@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="I86o6zBI"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TCg32y3zzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 22:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575544202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P72zXTa1/xRhqsbm4J/yQUVr1deAjuJy2Idx6ERVE9I=;
 b=I86o6zBIRtHo67xcANU4qWz0mOuEzKtSX+9RS6Zg/qJWFUir02SLLOIB8GXLpoXXkO71qs
 6ho9Rs+SfN2h86iFpjIpRRttcDXflsZpd8R5Ih3ilp+cF5F8F06e2S/cL8+EJ5AQP55ji/
 AEXxeqluFYJyXa8wLqAbLMHndHDBZLE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377--4wRBfePOW-yi7p99wCOaQ-1; Thu, 05 Dec 2019 02:08:12 -0500
Received: by mail-wr1-f71.google.com with SMTP id l20so1109942wrc.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 23:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J5N6bryTRhPEN+Q0g8XSCuUJuNWPBcJGmVuZQQ19RzE=;
 b=hLWqMzASft+hAGowNtDXblLg5g8s71Z5Et/9RwAfZr4FLScbEBOE+uNWIDVj7l7RHw
 3Oxz4n0jVKaqtRF8K7Ja8oPBMUv0JRuLtsYG07JjOqa+RFobEfoxfOOqwU5ObGnN1Zqz
 wbcvsLz5bVJXNaOIjTfxhe2POHlcZzx/o4nVHz5yxWI6GX7op37YBPVxGV49SZmULb0Q
 b2BTcj/HU2m/syBe4uehgYj3U0m/viUN2zGtxtp8ldgiiWQgZmaB1vPHw3frOjMEeVOT
 WYRZygpnBEP9tcrcNScSaodRGQvyY2zMMgUUegYYpBXH0y7dniLT/cx3Pa0s9mQXmJht
 ahYw==
X-Gm-Message-State: APjAAAVG8sq6rYk7LVzR73twBZZjm7VK2iJbN2h3P/1UZQ+TYM4F20cB
 ZJ9fEqy486XTG93aR3YfrxOO0Ml8F+jqjL9wYtYRuw5RxD9ykrsVv7+t8yY2CiMJ2dHOfpA4Ahh
 Mjog33+CwqkU3zM0mMbKcC78Lqw==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr8063539wrt.169.1575529690874; 
 Wed, 04 Dec 2019 23:08:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzDX/Ql65QOliYO2Zfc6u3VRIsTeiG4SRNwtK0tsjVrVgQ2Zry9ymz2CXrG9NmGNXo+uGSpQ==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr8063503wrt.169.1575529690496; 
 Wed, 04 Dec 2019 23:08:10 -0800 (PST)
Received: from localhost.localdomain ([151.29.19.49])
 by smtp.gmail.com with ESMTPSA id e16sm11217597wrj.80.2019.12.04.23.08.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Dec 2019 23:08:09 -0800 (PST)
Date: Thu, 5 Dec 2019 08:08:07 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
Message-ID: <20191205070807.GY23227@localhost.localdomain>
References: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-MC-Unique: -4wRBfePOW-yi7p99wCOaQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 05 Dec 2019 23:34:20 +1100
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
Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Waiman Long <longman@redhat.com>,
 Parth Shah <parth@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 04/12/19 19:14, Srikar Dronamraju wrote:
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
> =20
>=20
>   # perf stat -a -r 5 ./schbench
> v5.4=09=09=09=09                v5.4 + patch
> Latency percentiles (usec)                      Latency percentiles (usec=
)
> =0949.0000th: 47                           =0950.0000th: 33
> =0974.0000th: 64                           =0975.0000th: 44
> =0989.0000th: 76                           =0990.0000th: 50
> =0994.0000th: 83                           =0995.0000th: 53
> =09*98.0000th: 103                         =09*99.0000th: 57
> =0998.5000th: 2124                         =0999.5000th: 59
> =0998.9000th: 7976                         =0999.9000th: 83
> =09min=3D-1, max=3D10519                       =09min=3D0, max=3D117
> Latency percentiles (usec)                      Latency percentiles (usec=
)
> =0949.0000th: 45                           =0950.0000th: 34
> =0974.0000th: 61                           =0975.0000th: 45
> =0989.0000th: 70                           =0990.0000th: 52
> =0994.0000th: 77                           =0995.0000th: 56
> =09*98.0000th: 504                         =09*99.0000th: 62
> =0998.5000th: 4012                         =0999.5000th: 64
> =0998.9000th: 8168                         =0999.9000th: 79
> =09min=3D-1, max=3D14500                       =09min=3D0, max=3D123
> Latency percentiles (usec)                      Latency percentiles (usec=
)
> =0949.0000th: 48                           =0950.0000th: 35
> =0974.0000th: 65                           =0975.0000th: 47
> =0989.0000th: 76                           =0990.0000th: 55
> =0994.0000th: 82                           =0995.0000th: 59
> =09*98.0000th: 1098                        =09*99.0000th: 67
> =0998.5000th: 3988                         =0999.5000th: 71
> =0998.9000th: 9360                         =0999.9000th: 98
> =09min=3D-1, max=3D19283                       =09min=3D0, max=3D137
> Latency percentiles (usec)                      Latency percentiles (usec=
)
> =0949.0000th: 46                           =0950.0000th: 35
> =0974.0000th: 63                           =0975.0000th: 46
> =0989.0000th: 73                           =0990.0000th: 53
> =0994.0000th: 78                           =0995.0000th: 57
> =09*98.0000th: 113                         =09*99.0000th: 63
> =0998.5000th: 2316                         =0999.5000th: 65
> =0998.9000th: 7704                         =0999.9000th: 83
> =09min=3D-1, max=3D17976                       =09min=3D0, max=3D139
> Latency percentiles (usec)                      Latency percentiles (usec=
)
> =0949.0000th: 46                           =0950.0000th: 34
> =0974.0000th: 62                           =0975.0000th: 46
> =0989.0000th: 73                           =0990.0000th: 53
> =0994.0000th: 79                           =0995.0000th: 57
> =09*98.0000th: 97                          =09*99.0000th: 64
> =0998.5000th: 1398                         =0999.5000th: 70
> =0998.9000th: 8136                         =0999.9000th: 100
> =09min=3D-1, max=3D10008                       =09min=3D0, max=3D142
>=20
> Performance counter stats for 'system wide' (4 runs):
>=20
> context-switches       42,604 ( +-  0.87% )       45,397 ( +-  0.25% )
> cpu-migrations          0,195 ( +-  2.70% )          230 ( +-  7.23% )
> page-faults            16,783 ( +- 14.87% )       16,781 ( +-  9.77% )
>=20
> Waiman Long suggested using static_keys.
>=20
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---

I could reproduce the performace regression and can confirm that this
patch fixes it.

Tested-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,

Juri

