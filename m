Return-Path: <linuxppc-dev+bounces-6488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F82A459D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 10:18:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2pn70wKkz2xfR;
	Wed, 26 Feb 2025 20:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740561531;
	cv=none; b=kRmV8fpOpikJCt0EJRPcSvAlSPv33KfR1HDGAlC6b1JpFrPui1Fzawt5LL75KatNo+vL1Z9YbMtUBuFyE0zxLUEKKzi5ANr72MOnIh7w2uVcFxTnL7i7YLv9n55bNgJNyRy3JzJcykB5KoRZoexwk/0Sot0pO3KmuUCnArGPwrJBfFfvBuq3SrFBGT1TGL7AXSOCn3nrpFn6sRc8Rdj2MCjPRrMX0jZ0c0yLIq42TVAf6UluRRMKWml7Ykoi2kJX0QVuvBgkrL95isnJX1uuXvKkH89uiEvldKkihOpjF3EL5iu9Hd33cseSbIlRk12UyGJzrJJI8U6gbo3yVuke4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740561531; c=relaxed/relaxed;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZp0FMY2eh+KqoSgMtOM1CM/UW3AOFUu8H0xhK/Z7waEnFKf1TOGkPIHwgCSXUj+lDR5nAK+aR0hzc4svppFhCltjTuJSK+VwDmFEJZDmZd7J8J4NDri838GqVB0m7PNfQbUuNnvd4tv8uI0BwsPkyzeQV8g86LsMMeAk2IdyTEuSopGb+WcgIboFBEZYtddB9vxC8aW2s+5twe9s0aZ9+uJ8ORtzYJ1e+8/8Mnc352FyRG4Uv2Yvmbr/EypPsLTJXtViFI+Q2aAKv2JIRSavKdN0VecmbzB5x2FjDEjAh2Cn0YZKFhHZBFXU3RWt6z0v26OgJb3PMu/v51XRKrcKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfFHzAIX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdWAKyUk; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NfFHzAIX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdWAKyUk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2pn55h0Wz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 20:18:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=NfFHzAIXISkgCm3u6qfcMrCAga246qeMtuEY3V4zFReCSv9Y9mLZuN1YYATNLjvFxXD9h9
	ddHBnlx45mCgqZKt1BUmmmgfMkSbHDLeAF2cu4OgrtRQhbqQsqNpTDjBJtHBa5htorvCtC
	AGCFED36x9lp8nLUoLL8dCVNU1KADtE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=CdWAKyUkEIjq/IPqSUZRmLVwDfatvzwKCr7gf6kmeTe7fF1yQCimXPAKZ8hUWC0Wgr0qsN
	I1clgmnGYg/ritE675SJF6ixih2RETCZVqIqMiXth4sM4UhJLDiWGkNOjUVQQEdqoGT9JZ
	lZUe9bJx/yF2R2oUIlXQ3cu7lbiT5Xw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-nfCgSxL-OYK9aYT0uFyb3Q-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: nfCgSxL-OYK9aYT0uFyb3Q-1
X-Mimecast-MFC-AGG-ID: nfCgSxL-OYK9aYT0uFyb3Q_1740561518
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f27bddeeeso6823153f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=V0YzCNgGgQtrmRRYNYy2mIoo4b+LcQVW6wJfd6YOc2crXiVg+LnVb9TNZQ02rHzkFy
         Za1TgGhDg6BdvF3WehXsfW73TfQ1eVm+bMDSb+2WvS3fVq+WLnUHiSWS+31J5lkHTUwq
         tLxFLL3yaKmNaROEajzjezroSD/7U5D/1l1bjQ/aX5JldjnBiEeeC+ROIzNuYZRLeS/+
         f8uDObi3IGBTAwp8wyadhXhkJN25oS8Tfan+VspoJWaG4livTAaJ7czGK1nqeXM09aSV
         ERg+751LuawBwgiTNPlW9A3u7pjZOW6qWzJLIPr1z8L/WcLYwVGAKUDrWX9AtBJRyHFo
         i4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW3s7LkBHWlZFtzpKPI5tb+4xz7w/21fMOOAwvP7xJCGB9qs+TzjPbGXgD3gB3SD9zcX0XfHeXy61nCd7M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/ZVPk+xik4nyALgHCAS/wcZUTHOOj9/H74iJvifBLXvvFWk1e
	EMTsMKMQnyPH28MrBuF/rWCDul6R1Vl92hGVywYKhe/O6BJB4DBY/TVa/7hgHvf6u7DYjHgHGdQ
	uXc2tEaFHtx2SKPnF0ueNxJXq6gOSLWiwIinugGG2dP1HJp/lYyZwosilotbHovkiK0DcUoqG1y
	Jfh/jZCznIgOEbxHxMlDMS894WAUTKglZTIY7fBg==
X-Gm-Gg: ASbGncvLdUifBkSF3KAZWT08J+7raEQ5od68uLXTH6E4cebWREs07m+1NXMNV7K+Kf8
	WVZMiHsGJjNtntwRrBsj+RZo9xldJnQMLryjRMTcSuEWll9lCq1RE+KYhpp9mtj4rHJ/cI75fog
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296773f8f.46.1740561517835;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
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
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mMJtfbRyZUxMI7yFwmRoJCi4vPd0n2kWynwv1yO9UGk_1740561518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 26, 2025 at 1:27=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> > On 2/25/25 00:55, Sean Christopherson wrote:
> > > Free vCPUs before freeing any VM state, as both SVM and VMX may acces=
s
> > > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that n=
eeds
> > > to be kicked out of nested guest mode.
> > >
> > > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destro=
y was
> > > called") partially fixed the issue, but for unknown reasons only move=
d the
> > > MMU unloading before VM destruction.  Complete the change, and free a=
ll
> > > vCPU state prior to destroying VM state, as nVMX accesses even more s=
tate
> > > than nSVM.
> >
> > I applied this to kvm-coco-queue, I will place it in kvm/master too unl=
ess
> > you shout.
>
> Depends on what "this" is :-)
>
> My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master

I meant only 1, but if you want to have 2 as well then that's fine too.

As to kvm-coco-queue, based on Yan's reply I have 1 (of course), 4 and
an extra patch to move kvm_x86_call(vm_destroy) at the very end of
kvm_arch_destroy_vm; I'll post everything as soon as I finish building
and testing.

Paolo

> rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on a=
dding a
> few more cleanups (though I think they're fully additive, i.e. can go on =
top).
>


