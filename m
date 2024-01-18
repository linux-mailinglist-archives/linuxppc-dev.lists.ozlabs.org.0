Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC67F831E95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 18:41:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PeQAuuwS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG95z5SdNz30YS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 04:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PeQAuuwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3lwkpzqykddqiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG9575pFvz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 04:40:42 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5cdbbf7e591so6585249a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705599637; x=1706204437; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q3C3WGrieoJdAKFaeIZlXobOygHM9XDpw7BX2KbOhI=;
        b=PeQAuuwSTJsKP6oQE6MKarZYTAR2BFUKtisHB8Tk5Ork302CfHllIJhWUmM5ihmhII
         /m8kpliREFUqImXBu0yAUXblGWy7ThsRNZUHOvhVfTd0o1PS7711/KYydOz5Bnw5+ueR
         6fNUcVmJ28pl2MZrwKq9fboFGDPZjcBEPKuLDRV8Mkby+GFFHduT7QkxsA4fmErJ4ZkS
         kU4euHE9EhTeCyYvGhQFdS2xmT0TDvAD6flQmW4ZwfTcHylohoBiYopibiYOj3mlYKE+
         5nqLuIesJVSSnSbmRncMKL63i+dLCzPZTWUcVBhAXqvpF7kg3MJ6pGnF7QdYkj7T5cds
         YDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599637; x=1706204437;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Q3C3WGrieoJdAKFaeIZlXobOygHM9XDpw7BX2KbOhI=;
        b=V5S+6Tmk1K8A2oa4/eD7JhphZzNPbuuQKJ1wRbBPfEsV4DJXU/xpYXRX9Ki7xQlTNa
         Io0pCfxo9qFS8PwSUrib13fcA2Kd9vHOW2nhR+ksJNTcD5pnSBNAqAOB1yW99W70HFZL
         BCqH42+zCp/u+SAnHZmdhZ/CXfsD6O5sDEPcS8KHKNB0EvxWTC1SR9/QoDioC4q2Xhvy
         pOwbtYnqzrhq1EZQ2V+c3me9RB8hN1nxCgBJVNl7SdbpZ9nbICIs5j0cK4LJOVprco9/
         ei9DW4GPbaI/bQqq9lnGpK48vfz6EE2RHNNJmJ9GU63K2V9mX68QQ8a9wVNEQ7M94niU
         VkTg==
X-Gm-Message-State: AOJu0YxfQzP+7AJWBbg5AdX94nSvlKjuOEliMCxJXsDOwZD6g94h0g1V
	/dLsX1l2IAgHYY0PV9S077NBq22xQIZkZQd1zpdguVWDb77MVMoNyz+izu5/K6ohTfWbtx+QedB
	viA==
X-Google-Smtp-Source: AGHT+IHQno7PAwboCP87bGIkYG2fH+s8EoDNQ4sFTOlwoU3XmXeAa1RkI+vnnDxRDet8Cr9UHVnWumLJcOM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:63c3:0:b0:5ce:1891:dfac with SMTP id
 n3-20020a6563c3000000b005ce1891dfacmr6154pgv.4.1705599637554; Thu, 18 Jan
 2024 09:40:37 -0800 (PST)
Date: Thu, 18 Jan 2024 09:40:36 -0800
In-Reply-To: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Mime-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com> <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Message-ID: <ZalilFSHBa_XHolD@google.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="utf-8"
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, atishp@atishpatra.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org, palmer@dabbelt.com, rdunlap@infradead.org, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024, Anup Patel wrote:
> On Thu, Jan 4, 2024 at 6:07=E2=80=AFPM Andrew Jones <ajones@ventanamicro.=
com> wrote:
> >
> > KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> > supporting architectures select HAVE_KVM and then their KVM
> > Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> > consistent with that approach which fixes configs which have KVM
> > but not EVENTFD, as was discovered with a randconfig test.
> >
> > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d=
8@infradead.org/
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> Queued this patch for Linux-6.8

That should be unnecessary.  Commit caadf876bb74 ("KVM: introduce CONFIG_KV=
M_COMMON"),
which is in Paolo's pull request for 6.8, addresses the EVENTFD issue.  And=
 the
rest of Paolo's series[*], which presumably will get queued for 6.9, elimin=
ates
HAVE_KVM entirely.

[*] https://lore.kernel.org/all/20240108124740.114453-6-pbonzini@redhat.com
