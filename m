Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B294C171
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:32:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=v2ytSvw/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfrdS0F0zz2ytp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=v2ytSvw/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=35os0zgykdl0vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfrcm4WZNz2y8h
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 01:31:50 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc58790766so11407605ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723131108; x=1723735908; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=v2ytSvw/47FwbWP5cv4iArbvdB26nd6l++DWq56AAY0xnaeJSD3FUceXVKnRLH3Gbi
         QgOcBe3R8AUtjQLlblEg6dDwJI9CiQaWul3aSy7YJMKUg+aoa6SUhlCqeLqwK8phlVzP
         S/ZHFCoeir7ENYjCZ2MLycBhjC6hgbukiTQNBX0uWOLR5zM+08N5YAxR8Or2pqaZdVST
         mqMN7a0JkMq8Xn57x1mPwx1De6uP/8GvigNj6YWZ+5393fkTHrqtpPiyNGVjm6blOTaa
         83ZtDPYfTan5AWkJqgHMsats6Jr1EoCHv17wxoE98x5j9KyJ7kMNpDV/K21s0EIcShdv
         fZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131108; x=1723735908;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jc21vP9HtcAG8Jx0fCnF54KV0nEotJ+OQOgwzr/gmUk=;
        b=dbm0/WXHHeApxeOW9XqTTNcnhSY3hpSS9cU+T3hve6v4FwCfp382vZiasw3m21Go6H
         hDjf14F0Dr8g8s/icDiHd9rBmfyZyKEVKPxlwA2jtnIoT1QgT5w4Jxo8z79B3+Wa2O8M
         l0PYVgA7x+iKYiVa8EtB2tJtQoBlAtuRz6AaqHvIL5iskoKGzab0CREU7Qk2ljSoLKeW
         wODtxGpk+WwsS9ACYks8WYlW2+Uua4o3eeorSjMT2I79ziuLm3xi9ICTqk6+fjuT066p
         w+Q3J4jedaR3MVSe1O9aOvW71Y48yMWYZI2GSMt4J1/j5O90UHS+JK9Edww0RCTR1Ivq
         nljQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ivZ2Lw9dyb7Ugg59w0Hyp1YJYV2/M8BebyOmitlsy0/u+LB3jc3TujmohIWw9uD4DUrCPrXcjumgxToM+/pHVpI9ZYAQ30sQpJsjNA==
X-Gm-Message-State: AOJu0YxMsgx0cZbLhp/4EBQ2gKfGz4WGucfyUPp2P5rHR8B7nP0a0mb0
	N9K3mIajBcpSdeEedx0QITjJOecl3VGz4EDo9XyyX7+tLDAycLjwQ6JHUXQgBgf5uUS/l2ZBgWe
	M3g==
X-Google-Smtp-Source: AGHT+IGhpuWFvPPS56LNIyARU7ozQJQwYhKu/y/lvyly0zz2F1cJP6/aGqiYnrRnxhwS3wYjMw23Fn2sh0c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2445:b0:1fb:7978:6cc with SMTP id
 d9443c01a7336-20095249cc8mr361865ad.5.1723131108261; Thu, 08 Aug 2024
 08:31:48 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:31:46 -0700
In-Reply-To: <877ccrqc06.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com> <877ccrqc06.fsf@draig.linaro.org>
Message-ID: <ZrTk4sQS8k1-GBb3@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >>=20
> >> > Now that hva_to_pfn() no longer supports being called in atomic cont=
ext,
> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
> >> > hva_to_pfn().
> >>=20
> >> The commentary for hva_to_pfn_fast disagrees.
> >>=20
> >>   /*
> >>    * The fast path to get the writable pfn which will be stored in @pf=
n,
> >>    * true indicates success, otherwise false is returned.  It's also t=
he
> >>    * only part that runs if we can in atomic context.
> >>    */
> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *p=
fn)
> >>=20
> >> At which point did it loose the ability to run in the atomic context? =
I
> >> couldn't work it out from the commits.
> >
> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic =
context
> > would still be functionally ok), rather the previous patch
> >
> >   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
> >
> > removed support for doing so in order to simplify hva_to_pfn() as a who=
le.
>=20
> It still sticks out given the only caller no longer enforces this.=20

Oh, sorry, I should have been more explicit.  I'll fix the comment, I simpl=
y
missed it.
