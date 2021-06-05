Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946F539C49C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxgqZ17Ftz3bt7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:43:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lbe9wRJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lbe9wRJP; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxgq74NNlz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:43:29 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso6765876pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QHrZR1MpVXC88afIWi4RkzPg8+mZpQ4oEHnl6dd+aO4=;
 b=lbe9wRJPLWPnNabjMpYPCw99mVHpECLlLhx7U/OyHwBZ9MegEZpWOHaYkPdwbviwLg
 xfEdyCwMekbyW6CzqhpcxQk6HrqS7Ctw2+/Dc0N9Md4fi6e/0ShLlo8USBpiVrmfr4RT
 GD6iiZZALn+UyJVAj7NAA+Lf2sjylp8ico+wWwHkqh28uykYPq4NUUun3U9Ctr57SLJ0
 TWlyb4f15ysg2Jxy5YWFDZDk4efLCrTaPeQSz6IXemjDvezQqKVe+s7oULKNof2Mtlpb
 ZXuFp9mG3SbnpAWJFmFM343ojj2XciC0IN30cZT3SAgmSjvR4O8OgzQer9kVeVB3lib2
 tKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QHrZR1MpVXC88afIWi4RkzPg8+mZpQ4oEHnl6dd+aO4=;
 b=rEqW0ZiurTZfnIfflBhgtMcpHWC4oA83xcs37mcTpIP+3QwzGnFzuchWlZtL7M8HDe
 Z67uwHM6Qj3ADtHPRnts05QI7E5VzwbAfZi4gSkM/nuBm4Dkc6axPNZQwALSNIPIUQD7
 pvQkcmCxljKdxcnOyOQg9r5kJmO8oAAjWhgonzVgV6bnZ9CJWG5o6XYqV1KtatdIwOVd
 LyAnVs0KU0XAYynTiglQs7w6xjpr7GO+FmO+PXBuijwDIvPSeztKtT3+/f3DztUmC3lA
 rJWELgbx6jxPlzNWquKeMjssgoGyEC9xmmiZVr5Efnnhc4IVrSoTgRtH0l6N587Hpkzi
 6Lhw==
X-Gm-Message-State: AOAM530uBhrYs63XfXNcRDVdsG5ZLt+0ThQlHcdp0p7cBYczGTdfibHK
 Cuvnxm699iHFJjggUP3isp0=
X-Google-Smtp-Source: ABdhPJxoQauggiRpOgQ8vdVgBZ1ckniDTIw+fRatj5YgB6ghUcmmpQxoxhC4WZDxR2DTtTlX0SR12A==
X-Received: by 2002:a17:902:988d:b029:ef:68aa:d775 with SMTP id
 s13-20020a170902988db02900ef68aad775mr6749406plp.57.1622853805555; 
 Fri, 04 Jun 2021 17:43:25 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 3sm2461847pfm.41.2021.06.04.17.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 17:43:25 -0700 (PDT)
Date: Sat, 05 Jun 2021 10:43:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 12/16] powerpc/pseries/vas: Setup IRQ and fault handling
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <5ac32e4d07bd048e3d687354501d36c334f1c8e0.camel@linux.ibm.com>
 <1622697882.lu1gj10oe8.astroid@bobo.none>
 <ab831a47cae65c67e1fae41acd9dcb8f3c55ac76.camel@linux.ibm.com>
In-Reply-To: <ab831a47cae65c67e1fae41acd9dcb8f3c55ac76.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622853468.3f8ohl3pt0.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 4, 2021 11:19 am:
> On Thu, 2021-06-03 at 15:48 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of May 21, 2021 7:39 pm:
>> > NX generates an interrupt when sees a fault on the user space
>> > buffer and the hypervisor forwards that interrupt to OS. Then
>> > the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
>> > to retrieve the fault CRB information.
>> >=20
>> > This patch also adds changes to setup and free IRQ per each
>> > window and also handles the fault by updating the CSB.
>> >=20
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/platforms/pseries/vas.c | 111
>> > +++++++++++++++++++++++++++
>> >  1 file changed, 111 insertions(+)
>> >=20
>> > diff --git a/arch/powerpc/platforms/pseries/vas.c
>> > b/arch/powerpc/platforms/pseries/vas.c
>> > index ef0c455f6e93..31dc17573f50 100644
>> > --- a/arch/powerpc/platforms/pseries/vas.c
>> > +++ b/arch/powerpc/platforms/pseries/vas.c
>> > @@ -224,6 +224,62 @@ int plpar_vas_query_capabilities(const u64
>> > hcall, u8 query_type,
>> >  }
>> >  EXPORT_SYMBOL_GPL(plpar_vas_query_capabilities);
>> > =20
>> > +/*
>> > + * HCALL to get fault CRB from pHyp.
>> > + */
>> > +static int plpar_get_nx_fault(u32 winid, u64 buffer)
>> > +{
>> > +	int64_t rc;
>> > +
>> > +	rc =3D plpar_hcall_norets(H_GET_NX_FAULT, winid, buffer);
>> > +
>> > +	switch (rc) {
>> > +	case H_SUCCESS:
>> > +		return 0;
>> > +	case H_PARAMETER:
>> > +		pr_err("HCALL(%x): Invalid window ID %u\n",
>> > H_GET_NX_FAULT,
>> > +		       winid);
>> > +		return -EINVAL;
>> > +	case H_STATE:
>> > +		pr_err("HCALL(%x): No outstanding faults for window ID
>> > %u\n",
>> > +		       H_GET_NX_FAULT, winid);
>> > +		return -EINVAL;
>> > +	case H_PRIVILEGE:
>> > +		pr_err("HCALL(%x): Window(%u): Invalid fault buffer
>> > 0x%llx\n",
>> > +		       H_GET_NX_FAULT, winid, buffer);
>> > +		return -EACCES;
>> > +	default:
>> > +		pr_err("HCALL(%x): Unexpected error %lld for
>> > window(%u)\n",
>> > +		       H_GET_NX_FAULT, rc, winid);
>> > +		return -EIO;
>> > +	}
>> > +}
>>=20
>> Out of curiosity, you get one of these errors and it just drops the
>> interrupt on the floor. Then what happens, I assume everything
>> stops. Should it put some error in the csb, or signal the process or
>> something? Or is there nothing very sane that can be done?
>=20
> The user space polls on CSB with timout interval. If the kernel or NX
> does not return, the request will be timeout.

Okay, if there is no sane way it can respond to the different error=20
cases that's not necessarily unreasonable to just print something in the=20
kernel log. Hopefully the kernel log would be useful to the=20
administrator / developer / etc, but that's pretty rarely the case for=20
Linux errors as it is.

> The hypervisor returns the credit after H_GET_NX_FAULT HCALL is
> successful. Also one credit is assigned for each window. So in this
> case, the error is coming from the hypervisor and the application can
> not issue another request on the same window.=20
>=20
>>=20
>> > +
>> > +/*
>> > + * Handle the fault interrupt.
>> > + * When the fault interrupt is received for each window, query
>> > pHyp to get
>> > + * the fault CRB on the specific fault. Then process the CRB by
>> > updating
>> > + * CSB or send signal if the user space CSB is invalid.
>> > + * Note: pHyp forwards an interrupt for each fault request. So one
>> > fault
>> > + *	CRB to process for each H_GET_NX_FAULT HCALL.
>> > + */
>> > +irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
>> > +{
>> > +	struct vas_window *txwin =3D data;
>> > +	struct coprocessor_request_block crb;
>> > +	struct vas_user_win_ref *tsk_ref;
>> > +	int rc;
>> > +
>> > +	rc =3D plpar_get_nx_fault(txwin->winid, (u64)virt_to_phys(&crb));
>> > +	if (!rc) {
>> > +		tsk_ref =3D &txwin->task_ref;
>> > +		vas_dump_crb(&crb);
>>=20
>> This (and existing powernv vas code) is printk()ing a lot of lines
>> per=20
>> fault. This should be pretty normal operation I think? It should
>> avoid
>> filling the kernel logs, if so. Particularly if it can be triggered
>> by=20
>> userspace.
>>=20
>> I know it's existing code, so could be fixed separately from the
>> series.
>=20
> printk messages are only if HCALL returns failure or kernel issue (ex:
> not valid window and etc on powerNV). These errors should not be
> depending on the iser space requests. So generally we should not get
> these errors. =20

Ah I was looking at dump_crb but that's using pr_devel so that's=20
probably okay.

Thanks,
Nick
