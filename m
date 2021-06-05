Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C139C482
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxght0Fzyz300J
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:38:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BfEw9wb1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BfEw9wb1; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxghM4wgMz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:37:37 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so8024029pjr.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+tCpUpvJx+YhzNETSAThvG0v4SJv6K+aNCayHzMVMGc=;
 b=BfEw9wb1wT7ugDv22pN81/nFD5wpb7YUTmIN2okTlvDMhp8HkV/svSQ3DR+hroJcgD
 V7OLkyYzIWPxrhr1i+Cvkj79kxh7zpQ2pq1qHXFuDYdQNNWvPJALzLSX6td8BtmCEtrK
 6FCg0a4vRUIMyuK1zWk56QQG3OTKYm+wZdpTIwBcBPhV58QBlYmyLb03eKFcttf0YUlP
 XYKol8l138JRJkE6jrfEXRBB41sIpBVShegkrKJQ6AbeIlu0Au5O3R5hujs8Jiq7Q3q7
 V2TO0Q0k0J1II+u+8b9ZhEDB6criyFO9wY/2wuiiu+RIjc3NkEEv+dxbDjdndncR057l
 EGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+tCpUpvJx+YhzNETSAThvG0v4SJv6K+aNCayHzMVMGc=;
 b=NbP4MvmIaUTJvPxVJNHTbwXtrhXCKPgEWeqeSSd94zCS5iWrlkz4K1n1g6S07Q11rC
 5ItQ2EinZrGEJJGRlNq1EjyHdjenzLCIvWNT+kAgROCaHk+Q5DavztKaSwFoGK139kN4
 C8ung96i3a70OaFIxwoPn8cfSjiqGKOCsZJV0iCtv04KfvqJztzwXbou46+h5Im7h+V0
 no06ndTkRogMfLV3S384HqSvN3xpGUmUZ2rlMSwZJcI5Kt+IAleK6/TAoKEbgwgksAAC
 RrF96E0qlDspIWIpvieKM7MF83xKaApmjrT3/WURikU+G/ge/FaLKwTlT3kbM6x0+7te
 g2VA==
X-Gm-Message-State: AOAM532ZFHTiNiLbbrpYoYRoZffcJqJ+FHLCigcdedihmvnJpvNWR/iB
 EKNeyOnJftVhQytY0MYtFwI=
X-Google-Smtp-Source: ABdhPJwdtumy5QGrSW/JDUTvtayCgsc99VTKfVkdv0rCvBjkMvMFTKRqY7xh/FvszXtxDzGrUpMxdQ==
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr8278927pjb.58.1622853454027; 
 Fri, 04 Jun 2021 17:37:34 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 3sm2456589pfm.41.2021.06.04.17.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 17:37:33 -0700 (PDT)
Date: Sat, 05 Jun 2021 10:37:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 07/16] powerpc/pseries/vas: Define VAS/NXGZIP HCALLs
 and structs
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <4d1a19311883c2ac6620633721ecc81d753f26c8.camel@linux.ibm.com>
 <1622695206.q32wg4puuh.astroid@bobo.none>
 <ed2621061f694099c2fd3edf39d239686a84f517.camel@linux.ibm.com>
In-Reply-To: <ed2621061f694099c2fd3edf39d239686a84f517.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622853205.7t4o4jwi7n.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of June 4, 2021 11:30 am:
> On Thu, 2021-06-03 at 14:47 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of May 21, 2021 7:34 pm:
>> > This patch adds HCALLs and other definitions. Also define structs
>> > that are used in VAS implementation on powerVM.
>> >=20
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/include/asm/hvcall.h    |   7 ++
>> >  arch/powerpc/include/asm/vas.h       |  32 ++++++++
>> >  arch/powerpc/platforms/pseries/vas.h | 110
>> > +++++++++++++++++++++++++++
>> >  3 files changed, 149 insertions(+)
>> >  create mode 100644 arch/powerpc/platforms/pseries/vas.h
>> >=20
>> > diff --git a/arch/powerpc/include/asm/hvcall.h
>> > b/arch/powerpc/include/asm/hvcall.h
>> > index e3b29eda8074..7c3418d1b5e9 100644
>> > --- a/arch/powerpc/include/asm/hvcall.h
>> > +++ b/arch/powerpc/include/asm/hvcall.h
>> > @@ -294,6 +294,13 @@
>> >  #define H_RESIZE_HPT_COMMIT	0x370
>> >  #define H_REGISTER_PROC_TBL	0x37C
>> >  #define H_SIGNAL_SYS_RESET	0x380
>> > +#define H_ALLOCATE_VAS_WINDOW	0x388
>> > +#define H_MODIFY_VAS_WINDOW	0x38C
>> > +#define H_DEALLOCATE_VAS_WINDOW	0x390
>> > +#define H_QUERY_VAS_WINDOW	0x394
>> > +#define H_QUERY_VAS_CAPABILITIES	0x398
>> > +#define H_QUERY_NX_CAPABILITIES	0x39C
>> > +#define H_GET_NX_FAULT		0x3A0
>> >  #define H_INT_GET_SOURCE_INFO   0x3A8
>> >  #define H_INT_SET_SOURCE_CONFIG 0x3AC
>> >  #define H_INT_GET_SOURCE_CONFIG 0x3B0
>> > diff --git a/arch/powerpc/include/asm/vas.h
>> > b/arch/powerpc/include/asm/vas.h
>> > index 49bfb5be896d..371f62d99174 100644
>> > --- a/arch/powerpc/include/asm/vas.h
>> > +++ b/arch/powerpc/include/asm/vas.h
>> > @@ -181,6 +181,7 @@ struct vas_tx_win_attr {
>> >  	bool rx_win_ord_mode;
>> >  };
>> > =20
>> > +#ifdef CONFIG_PPC_POWERNV
>> >  /*
>> >   * Helper to map a chip id to VAS id.
>> >   * For POWER9, this is a 1:1 mapping. In the future this maybe a
>> > 1:N
>> > @@ -248,6 +249,37 @@ void vas_win_paste_addr(struct vas_window
>> > *window, u64 *addr,
>> >  int vas_register_api_powernv(struct module *mod, enum vas_cop_type
>> > cop_type,
>> >  			     const char *name);
>> >  void vas_unregister_api_powernv(void);
>> > +#endif
>> > +
>> > +#ifdef CONFIG_PPC_PSERIES
>> > +
>> > +/* VAS Capabilities */
>> > +#define VAS_GZIP_QOS_FEAT	0x1
>> > +#define VAS_GZIP_DEF_FEAT	0x2
>> > +#define VAS_GZIP_QOS_FEAT_BIT	PPC_BIT(VAS_GZIP_QOS_FEAT) /*
>> > Bit 1 */
>> > +#define VAS_GZIP_DEF_FEAT_BIT	PPC_BIT(VAS_GZIP_DEF_FEAT) /*
>> > Bit 2 */
>> > +
>> > +/* NX Capabilities */
>> > +#define VAS_NX_GZIP_FEAT	0x1
>> > +#define VAS_NX_GZIP_FEAT_BIT	PPC_BIT(VAS_NX_GZIP_FEAT) /*
>> > Bit 1 */
>> > +#define VAS_DESCR_LEN		8
>> > +
>> > +/*
>> > + * These structs are used to retrieve overall VAS capabilities
>> > that
>> > + * the hypervisor provides.
>> > + */
>> > +struct hv_vas_all_caps {
>>=20
>> ...
>>=20
>> > +
>> > +/*
>> > + * Use to get feature specific capabilities from the
>> > + * hypervisor.
>> > + */
>> > +struct hv_vas_ct_caps {
>>=20
>> ...
>>=20
>> > +/*
>> > + * To get window information from the hypervisor.
>> > + */
>> > +struct hv_vas_win_lpar {
>>=20
>> Are any of these names coming from PAPR? If not, then typically we
>> don't=20
>> use hv_ kind of prefixes for something we got from the hypervisor,
>> but
>> rather something that's hypervisor privileged or specific information
>> about the hypervisor perhaps (which is not the same as what the=20
>> hypervisor may or may not advertise to the guest).
>>=20
>> So if these are all capabilities and features the hypervisor
>> advertises=20
>> to the LPAR, I think the hv_ should be dropped.
>=20
> The hypervisor advertises the available capabalities and the LPAR
> passes buffer to HCALLs to retrieve these capabilties / features (in
> BE).=20
>=20
> I was using *_be in the previous version. So can I use like 'struct
> vas_ct_caps_be' =20
>=20
>>=20
>> Otherwise seems okay. I would be careful of the "lpar" name. I think=20
>> it's okay in this situation where the hypervisor advertises features
>> to=20
>> the partition, but in other parts of the vas code you call it
>> pseries_
>> but you also have some lpar_ bits. So aside from interacting with
>> PAPR
>> APIs, it would be safe to consistently use pseries for your driver
>> and
>> type names.
>=20
> I can use 'struct hv_vas_win_pseries' or 'struct vas_win_pseries_be'

I'm actually wrong about hv_ prefix now I look a bit further, there are
other structures that do use it for similar hcalls, sorry about that.

I'm not sure I like it too much but it is what it is. I would say don't
worry about churning your hv_ names for now. It's probably better / more=20
used than _be postfix. Changing conventions could be a later=20
powerpc-wide series if it's that important.

Thanks,
Nick
