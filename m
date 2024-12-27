Return-Path: <linuxppc-dev+bounces-4484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE599FD065
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 06:20:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKDNc44dwz2yFP;
	Fri, 27 Dec 2024 16:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735276848;
	cv=none; b=NRBu3gtPkwbKxhjuMAGLgZusss/UkuF7dP86rFwKKigbF8TbrSYnToULwrzs5aeWH2CEDs1fX/k6tAqUUAiJTTGCAo53DCpw9Ra1GTuu0owq6Xab0U0ZeebqUQu9bm4Se2JXJ1IkgDgGMD6H1qLjEt2d2LObREwy+88QhZ7g59UYJRq4ISMAIXG7kfR/V9FsCKJ0sdHuxKUGvdNJ9Z/5OriJGYuVsX6fZwsVNyVK5iIZP2BFnpVzFfCjTWmYOKKLB5AZsqnq6YEf/kcpDw2pvBGLjLZe0IfDBhN6MuCwdzX4IE+c6t/olGLeMXd6N/4PICG4RE8C67WA7/t6haZxww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735276848; c=relaxed/relaxed;
	bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld+JDU/1GkRFE4oWm+2zciOdo5EBOBMGAfP/CL8CdIGDovmEd7cyN38AXCubWCwdcs7mCWtfJgZrGu9psHOnC/uVfnd8F1o/LdFct5Oy5hGGTFxgYMQ9Ua/r3LLsq3gBE5ukfRaW2BZ7bisCv0meAGO6YF2GXud8VPhFAjibOjv70nHqGmuHzAGnvUf5mhabqY1LNytrrvaBX1CNksf8TzGi8rmzwouAeRdhf2L4le/BDni2pSGDkaSd3ttF/4Ot5IvgiReWR5iXgIOZx7PV9Vfy262oLmKW2xRqvZz1aPn2FiwBWnBh3XyAGT3kTfJhPFCWQ55zpXsPgqc8beDarQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+zStNhk; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sttw+EK+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+zStNhk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sttw+EK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKDNb1Ymlz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 16:20:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735276841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
	b=A+zStNhkRAMdIJDvrEvglmpjjB7BwxO/mPB4qdiubttytd1MHPcNkZq+Wus8+HPZuy5fqm
	NlMH2PzjdPT9diFbF3daowUN6JUPFw5qny1FWdm/VyDa7AhHi93/CDOGU5ehYfW7ptqsu0
	7P3DLV6ICtUxZN1IbzGNi08FLddqhTM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735276842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
	b=Sttw+EK+5nBSyExBjAVk3XggFokVgw8tprDeSkaFV5fyCquCxih5UYdre5Q/JkfDyIMgHy
	OKdsEmuTrNcUr1ufEoQpL4ee+X1gxrnrmXHLZRuSg8QsTIdYdlNl8GksEbPm6nOdiT5jfj
	2G45ZYfCqVPPqAHnl1fsyvb2JgXCVwg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-IbKQvZX1NjOqPGoagc8ieA-1; Fri, 27 Dec 2024 00:20:39 -0500
X-MC-Unique: IbKQvZX1NjOqPGoagc8ieA-1
X-Mimecast-MFC-AGG-ID: IbKQvZX1NjOqPGoagc8ieA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so37428045e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 21:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735276839; x=1735881639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
        b=bXlWJ8np18kuM46nvaz7RUK++urY4GS35MIpxRJqYzunLuujByV7TAX+H+OQkFTlsm
         PXO1E5HGRvcPU0D5w5sxz53ymTxulDgbfve3WyRR+9g1fXuA64B65q/qvN7/ebYYbfMV
         Vrf/ccvdj7MdCOulgqyUj5OK3H3Xg7eKTUVbXmfw8e0+burr04JnSAoYdLAdLlBTd7Ai
         vAT019EZPk2SbvHr+n/1IomxfSrcYVuB27GcntAz+hy1hsrYhPoSVbsLnqlmBOyMTEvt
         Ctq/eXDDTpF25ixz3ILNn0M0yxZQ9ZZ+hruIkGhPBz1PXieklXAQEsUWsDbyL/PwmKTU
         SRTg==
X-Gm-Message-State: AOJu0YxoYFtbc8JfDS84d77reQFLyScjWDZKrcgqJTHsYjh3QO5wRSid
	cylbNUHeQJCmcQstw0NR7IDa7k9JjYb4oYQXqrv51XXjfYpBTj5OVlZCq6WfABvBGTdjLfAwEKN
	iVOgM/HoQtUHmK58tpq6jzVWqZ7jGsNSmdtGNeRWslZ+SY+uKtTCNbL1Pzs6/BZ5u1EByrq6nYW
	Hy7EPvij3zK+B1y+vIGbISLQFOjuF6141kne3RlQ==
X-Gm-Gg: ASbGncunStWWbaCNHDUgnt2ngKFcVlZlXChCf1iy+BH7qEbEAsWyiIR9AInz1BfPfSM
	P4ETHmb7RspXCRRdR+H0NHtpB4dgieRWVhBGQlQ==
X-Received: by 2002:a05:600c:524c:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-43668b7a1eamr168614295e9.28.1735276838794;
        Thu, 26 Dec 2024 21:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrwTZZFAZNlT8g9rXFUCimpsFWn0ojtZb0lkx+DS7F2ZrEhv2PZda7B6dlKlBOjXLkWGoPJkAjlaQskHk7E/A=
X-Received: by 2002:a05:600c:524c:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-43668b7a1eamr168614195e9.28.1735276838498; Thu, 26 Dec 2024
 21:20:38 -0800 (PST)
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
MIME-Version: 1.0
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de> <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de> <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de> <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com> <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de> <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de> <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de> <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
In-Reply-To: <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Dec 2024 06:20:26 +0100
Message-ID: <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Darren Stevens <darren@stevens-zone.net>, 
	Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>, 
	madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au, 
	regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7SdPul1AR1JtNucBiyDkqySx3DxXnOmwW1xJwkobjoQ_1735276839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 26, 2024 at 3:26=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> This has solved the issue:
>
> cp linux-6.12.6/arch/powerpc/kvm/e500_mmu_host.c
> a/arch/powerpc/kvm/e500_mmu_host.c
> cp linux-6.12.6/include/linux/kvm_host.h a/include/linux/kvm_host.h
> cp linux-6.12.6/virt/kvm/kvm_main.c a/virt/kvm/kvm_main.c
> cp linux-6.12.6/virt/kvm/kvm_mm.h a/virt/kvm/kvm_mm.h

Yes, those are exactly the file touched in the bisection result and in
my patch. However, reverting blindly like this would break the build
for all other architectures, and reintroduce the bugs which were fixed
by the change.

The patch in https://github.com/user-attachments/files/18238781/kvm_main.pa=
tch
is incorrect (the "*writable =3D false" line was not removed, thus
leaving in the NULL pointer dereference).  Please test the
kvm-e500-bisection-rebase branch of
https://git.kernel.org/pub/scm/virt/kvm/kvm.git, which has the patch
applied already:

- first test commit 0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2, and
report if it fails

- then the entire branch, bisecting between
0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2 and the top if it fails.

Paolo


