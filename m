Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68B832394
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 04:14:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=k1ymdH+j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGPpc4dWdz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 14:14:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=k1ymdH+j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGPnk5wyvz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 14:13:12 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso346548e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 19:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705633986; x=1706238786; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=k1ymdH+jtdQNFqFvrEeFeZASbvGUu9rSLjkEjkTUKAeEHeqo4j0AvqugGnP3y67prK
         iSAzipv31a4TXCDBHadjPpdZfU6qf+Ggf28X68R0Ek9rFgDzPbDPydruMtJtJhEMCk8S
         6lpziVDnQCgU7lj/rQ8CZAeylkVUgpvqzd7L7I995xOE/NttDnzARb39zaDwpDg2FjnS
         L1p8bInvYjHk3aHwffE1cb7ktT52bbUAgGvm5mniAWeMGXxi3z2FwNWjo8Sh1KwT1jjf
         rYqngUc6qr6M7wJ0k9js7o/vIao8Z2P1PkPkWlMUZYXdNm3pe0bG0QvLZ3uvm63Hwx2X
         Df0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705633986; x=1706238786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=T24oEWJSQLJGFw+GQBl9tColD1g7JLAstayTVbIO66Lj9D9sPPpZRZuKPA5y5vG6TP
         QBYZeyvoeEeLv7hmpw8HRcvJX0sTwlGfH3BUpkcj/TxEUA7upnaf0SlGhwR3CqgBIfws
         Rd9sWyZeUG9jni8xsdfNaQknp3n3nvkOQDcHwaUEITKYGm9jxnf1VdQnqrmVoxFIdU22
         kIlU8eNW8a0/TDTUAY7C1a/1vtm7tXWQmf+GPUTMCxxBoAstN+I8OdsuwPzZzYX5atVE
         3nxgPvvYm1cEgVqBXQNmQh2jximagASX84QQKjMLnB9OOuH/1qv/qWXsW1xgTpzPwiJi
         Uojg==
X-Gm-Message-State: AOJu0YxumVbXQrDZuFqPaCsx4fqV21LoXalPzJEHWVfFzRvFlJd/jdGY
	mNfDexPKiel9E+Eo+PTAYDzlUiH59EuRf82hC+S6ZYBUs7dvy51C1BfgSyjiYrWWx+ELWNnVIB+
	VQK7xoCIA1t8YTZbtSu0HbfT7C5F9TnL8hr/cuA==
X-Google-Smtp-Source: AGHT+IE+iUkkY6fxTl1+JfpkYAQ0slyXdEkKVq40J5n5SU1ZLhag+ZXwroh2Z1WoXt0AjKQUbiW1WyNyUstIlFIKEPY=
X-Received: by 2002:ac2:41c9:0:b0:50e:314c:76da with SMTP id
 d9-20020ac241c9000000b0050e314c76damr265337lfi.82.1705633986292; Thu, 18 Jan
 2024 19:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com>
 <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com> <ZalilFSHBa_XHolD@google.com>
In-Reply-To: <ZalilFSHBa_XHolD@google.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 08:42:53 +0530
Message-ID: <CAK9=C2X4R+3F5Lh-f33dPVMkyGt+koXorfwMOmB-JnqSs79eQw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, atishp@atishpatra.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org, palmer@dabbelt.com, rdunlap@infradead.org, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 11:10=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Jan 18, 2024, Anup Patel wrote:
> > On Thu, Jan 4, 2024 at 6:07=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > >
> > > KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> > > supporting architectures select HAVE_KVM and then their KVM
> > > Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> > > consistent with that approach which fixes configs which have KVM
> > > but not EVENTFD, as was discovered with a randconfig test.
> > >
> > > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d382553=
9d8@infradead.org/
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > Queued this patch for Linux-6.8
>
> That should be unnecessary.  Commit caadf876bb74 ("KVM: introduce CONFIG_=
KVM_COMMON"),
> which is in Paolo's pull request for 6.8, addresses the EVENTFD issue.  A=
nd the
> rest of Paolo's series[*], which presumably will get queued for 6.9, elim=
inates
> HAVE_KVM entirely.
>
> [*] https://lore.kernel.org/all/20240108124740.114453-6-pbonzini@redhat.c=
om

I was not sure about the timeline of when Paolo's series would be merged
hence thought of taking this patch as a fix.

For now, I will drop this patch from my queue. If required we can have it
as a 6.8-rc fix.

Regards,
Anup
