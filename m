Return-Path: <linuxppc-dev+bounces-9975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A7AEF4CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 12:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWf8H3dtWz30Ff;
	Tue,  1 Jul 2025 20:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751365007;
	cv=none; b=OP1IZ888uWfLy1WqBAEKrkzEatuFoywnceyDfsKXf5vu7jrV0LdRiNwowQtZVvP4Ka4ry/gw0DMVziRz+bfSqBnh8fy79pt/S8ICNazKhrHjT+sYrmYLJzs2XLhir88zDwOmmtOIvcvi6QeHTHmjglADbLVsAZ3+NVdVwq9k8SRqVt7FUU/p0twP+fb88dMcHQD4Lw7K+2QoXW69VtbO3KW49J1dlIVhgJowxUbyBWkAd3Y2Q4lYT3x+v0jiiBVXvja9D7LWhb+a3qXFMKrKvR0svtK9kom9WilR2caqtC7ETXKHDRWx0I8DIwxUdcGjs2Q1ImeS5tPycCyiu2EQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751365007; c=relaxed/relaxed;
	bh=bI5gCubobaT76ILZ7nxLCeAprDNwZM108vGmis92vfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhHZI0tjPAWvHoUbr/EL8b7yUmgNpd+Z/WML+Dz5Xa/FsIxko8vX6Jgl3pZO3NHCOe/0C/7o4m3IssLATPC2DWocuWQkMNql538km6U4Vt3ztWlIz+IoTDsD8KcvQoc+PN6v8P8+t27joUR69GkYC3Hs/L6OHXM1aGDLEE7Y77h6gea7GHG35TU9hwGZ24uZIGjs/xaHAsXK5aqnECedpQRFuGXU3Su4bDBtUExK2Gd/T3osPCN0hQNMNZ7VOyXgDGb60GpuUQ4WlUqJ4uWEryqWD21/MLgsRlvVnob9Bj/cxYcUy5+Y3dMExqM1p1EZAJbcM/IunDReYNVu6q2O2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PjDoYwjt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PjDoYwjt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWf8G3ddWz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 20:16:46 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616feQ9015295;
	Tue, 1 Jul 2025 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bI5gCu
	bobaT76ILZ7nxLCeAprDNwZM108vGmis92vfw=; b=PjDoYwjtYkSnDRugC3E/Hv
	o51v3h2eqLbh9PbKCz24WznV4ZvLaYp6Jd8agA71iKB5BcxaWfNXDxx/GBRMKaW3
	3zwQRfDGD1wbtMpiFA30+yJ0p2Dz70v8RKSPdvUI6qypZ6CrGufrf+7IIFEUHjpn
	VmkbQl7a8Y3LA2aHvCqH/jproxX7Zk8z+3ExVJMJr0374lAG/InCZaGor60RhO/n
	pZkHKDq5PA9Rrp9xR6ocRlUp4mDAsxk77EVa6HUg/PlWw41EfjilnF4bkr92n46Q
	F8/88KcMiADFeGk8H7HpkIgzcddU+eeOqjJiJQCQdUedp0LGnNlGkuTdVNCZIoJA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j830pmab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:48 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 561A93Md010712;
	Tue, 1 Jul 2025 10:15:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j830pma6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56173CoY032320;
	Tue, 1 Jul 2025 10:15:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40j8xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 561AFfZk21365030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jul 2025 10:15:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4405320040;
	Tue,  1 Jul 2025 10:15:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32B5D20075;
	Tue,  1 Jul 2025 10:15:39 +0000 (GMT)
Received: from osiris (unknown [9.111.81.242])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Jul 2025 10:15:39 +0000 (GMT)
Date: Tue, 1 Jul 2025 12:15:37 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
        akpm@linux-foundation.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with
 kasan_enabled
Message-ID: <20250701101537.10162Aa0-hca@linux.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
 <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qu16htFmviN0JHs_Lk2UXggpRHKamSL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1OCBTYWx0ZWRfX1+8afvt373Lc kWdnunbPz6C9f/GOHjl4ZrQKHABgOATpMhlNHzlwXmovxD7qpB0NHRzjO1rBP3TCrzWp9aDgeMZ BRGyDtucaQptfKRiB1Ir1UEiA/DnvvId+/noIpRKGxbqodALAZAM/OouyWSCdZn9Br55SUFY1mF
 /QElD3fMWDED/2Up/bE3bdkQFp0y4l0tbOgz/r1X+BYJtzifCAp1d8Rjiv1rqAaxBvj1uWPWfAv gRsEeOrKai0th89ONMoXzLZtwQ+ZFabmyQx6rICdTSFHm+Cjr3wa4WzluId4DM526gzf4NqEHxp T9u38OW/UmDyf8gxdR/KVtrZKshh0EQP4/y/BFKLU+IB3+JEAkKDZdFyiBgBhMsxkkHSKm2H012
 aLNkwLyaNoCYreQzuUSpD2tKUqxrMT5HjvgLBKo4Yoqu8W0zpbow/WbwFXvshhrHRfN8RYzo
X-Authority-Analysis: v=2.4 cv=MOlgmNZl c=1 sm=1 tr=0 ts=6863b554 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jBQngTtrd59FM_Ge02gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HLwv3VLvA_zkneOazGXOaA6Q1nuISU0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=906 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010058
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > > Another thing that needs careful consideration is whether it's
> > > possible to combine kasan_arch_is_ready() and kasan_enabled() into the
> > > same check logically at all. There's one issue mentioned in [1]:
> >
> > Hello,
> > I've removed kasan_arch_is_ready() at all in this series:
> > [PATCH v2 11/11] kasan: replace kasan_arch_is_ready with kasan_enabled
> >
> > Is it not what's expected by unification?
> 
> I guess the issue description diverged a bit from what needs to be
> done, sorry about that.
> 
> The core 2 things I wanted to address with the unification are:
> 
> 1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
> implementation and move these checks into include/linux/kasan.h (and
> add __wrappers when required).
> 
> 2. Avoid architectures redefining the same kasan_enabled global
> variable/static key.
> 
> Initially, I thought that s/kasan_arch_is_ready/kasan_enabled + simply
> moving the calls into affected include/linux/kasan.h functions would
> be enough. But then, based on [1], turns out it's not that simple.
> 
> So now, I think we likely still need two separate checks/flags:
> kasan_enabled() that controls whether KASAN is enabled at all and
> kasan_arch_is_ready() that gets turned on by kasan_init() when shadow
> is initialized (should we rename it to kasan_shadow_initialized()?).
> But then we can still move kasan_arch_is_ready() into
> include/linux/kasan.h and use the proper combination of checks for
> each affected function before calling __wrappers. And we can still
> remove the duplicated flags/keys code from the arch code.

FWIW, as Alexander Gordeev already mentioned: this series breaks s390,
since the static_branch_enable() call in kasan_init_generic() is now
called way too early, and it isn't necessary at all. Which, as far as
I understand, may be the case for other architectures as well. s390
sets up the required KASAN mappings in the decompressor and can start
with KASAN enabled nearly from the beginning.

So something like below on top of this series would address
that. Given that this series is about to be reworked this is just for
illustration :)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0c16dc443e2f..c2f51ac39a91 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -172,6 +172,7 @@ config S390
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
+	select HAVE_ARCH_KASAN_EARLY
 	select HAVE_ARCH_KASAN_VMALLOC
 	select HAVE_ARCH_KCSAN
 	select HAVE_ARCH_KMSAN
diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 2436eb45cfee..049270a2269f 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -10,7 +10,11 @@
  * Global runtime flag. Starts ‘false’; switched to ‘true’ by
  * the appropriate kasan_init_*() once KASAN is fully initialized.
  */
+#ifdef CONFIG_HAVE_ARCH_KASAN_EARLY
+DECLARE_STATIC_KEY_TRUE(kasan_flag_enabled);
+#else
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
+#endif
 
 static __always_inline bool kasan_enabled(void)
 {
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830fa..1407374e83b9 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -4,6 +4,13 @@
 config HAVE_ARCH_KASAN
 	bool
 
+config HAVE_ARCH_KASAN_EARLY
+	bool
+	help
+	  Architectures should select this if KASAN mappings are setup in
+	  the decompressor and when the kernel can run very early with
+	  KASAN enabled.
+
 config HAVE_ARCH_KASAN_SW_TAGS
 	bool
 
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 0f3648335a6b..2aae0ce659b4 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -36,7 +36,11 @@
  * Definition of the unified static key declared in kasan-enabled.h.
  * This provides consistent runtime enable/disable across all KASAN modes.
  */
+#ifdef CONFIG_HAVE_ARCH_KASAN_EARLY
+DEFINE_STATIC_KEY_TRUE(kasan_flag_enabled);
+#else
 DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+#endif
 EXPORT_SYMBOL(kasan_flag_enabled);
 
 struct slab *kasan_addr_to_slab(const void *addr)
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index a3b112868be7..455376d5f1c3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -42,7 +42,8 @@
  */
 void __init kasan_init_generic(void)
 {
-	static_branch_enable(&kasan_flag_enabled);
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_KASAN_EARLY))
+		static_branch_enable(&kasan_flag_enabled);
 
 	pr_info("KernelAddressSanitizer initialized (generic)\n");
 }

