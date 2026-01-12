Return-Path: <linuxppc-dev+bounces-15548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B8D146E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 18:40:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqfmk5Mw1z2xKh;
	Tue, 13 Jan 2026 04:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.202
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768239654;
	cv=none; b=UpvpL7y/OvZAmBhxBjUrASn8AOlho6S2jN3E3b68F9bgS6aTx6PuBNUUkpoIHmjSzy/G2hCu8Ie0haGJYEAU1rsH0qOZQAOyvFtKWdGRSvnaSYTwEypOCGgr6y4ZXKwRSA9NuXV+WvfZu+/FUBcGxA9DvhlN2ZfgGJvFcO8yJysjbxWA28C2kdJ9nFEBaCjSf4b0CnIjkW4iaIMHKqI1nxHUuxDN0a02mM3KNquGxX7faudOeWxd8t4RN3BCm3dld/3EDHIGpyoVoNePHi6X6joyE2dluztJABXmXHiI18Uivcfn4Ps+b8aVIqESG/K4dOQzhGBz935aUUFcUXuYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768239654; c=relaxed/relaxed;
	bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PWSZClmjX14kWJQsi6fgMIDTDbSSFaIVWGPsEExTK2D7gW2lNtk28DHCaMuQrtNotJOaJw6B628d3G6I7Cu0Bl6ccAkXL6c2Wctd2GHBng0WQ4zk85lbhqQ+7qSnEPWQgEBGE5v9ToyxQHhWPjuDwQUeLxjnJbz/nFSdfo83Q3CIVSJomL8WQTz8VUHYpSQPyZfs6cVX5bQhqZX2H/H8wv4taLGQI98uIZT6XpF97WT0244LxwJJhyg0pdFVSoj6T6Emj9oIriwDNQqjiEAoSLKhHk6RNxwkLkTBcZp6+uDYsi6Wof/i6rv11gaXUkIxiLvalitk3on/ivUOMmf4sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fOBYNP0/; dkim-atps=neutral; spf=pass (client-ip=209.85.215.202; helo=mail-pg1-f202.google.com; envelope-from=35dflaqykdc8dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fOBYNP0/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=209.85.215.202; helo=mail-pg1-f202.google.com; envelope-from=35dflaqykdc8dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqfmj2Q3gz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 04:40:52 +1100 (AEDT)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c52ebdd2d43so2370293a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 09:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239589; x=1768844389; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=fOBYNP0/FdbvnhM5c4g3WawB6csXXOcZAEU8JIEmcjpxK9I3leSK1bv5XUfl3VlU7X
         3SDDQGRqtz0RX+V5IA1meFDJuK9gjBXgWBeOpPE+v/l5D0dQz+MAFrROjoeGRFkAhz+P
         x08LuOjzeavonEJGNpqYJPNx6sII78qToGodw4G1wy7uBLnabLE9FmFs98TTozUawIyW
         Y/xPaBTfgcc3oaI4V6JiCOmACs6U0xORhvC35WPVKQegUXt+/y6b6+4iHZiwXwyrySpu
         fiVIckWLZoQC8RXUtppUCamRXlpm6pCAZQRt1Zm1ncNArn52e3cd5bxNbPT0w7cxGzZR
         DFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239589; x=1768844389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PjBpIA3ZO3sQJJLy61/+UM/sv023xJCPIJTeEkES88=;
        b=vFGpymgXR5gAe1WN0bVSQ3JpkXfAwJIfu8BXOOkjGdpE/P9YdkA+L1S/own7SpI1g0
         eivwHSrsGRnV5nUpB4qG+2zDq2kqgP9j8GnWEvwErseY3NI3Mq1c5PBb2q69655H70TA
         tPHvrI3Q6IIkiwnaCy1LASwGD3zIhlPF9PWTYfXNNjLqqjoNs7XP4vkyWvTjSo71cXu1
         pY7zEiZOQqafIH/WU/aqcn/uJwT7mr/k2oZbLlaLWNqBDI0SPur7jhNLmWn6mglbsLDP
         SZCE5wBTRW5wM6KbMCSmzZMO+gsSO6CubppkF07ryPcXqWLlA9FF9256OVbGPpm6rqVc
         ZEjw==
X-Forwarded-Encrypted: i=1; AJvYcCVve/WShzC8RhwuRiMnwwy3SE6nwExW/c8dwZU42NxuR0NQJ03c60ENB3r8azJie1XaRGBTeRvYLn18gis=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy98FAL5CqL3qmC5M45jfg0cN9tVNrC6bx5T7ab7NuEeBHYNKXx
	QkrVO2eelcDa4jOdFnFGwVJsOp5EJ92RqzM30+jO/sqEvtzrN0GXpayrocWp7z6Vyyoly6aY8Ze
	BeBtpjA==
X-Google-Smtp-Source: AGHT+IF668cUxxhKhGHv90tNvsIeTkhAR6ns6JG1hxt5u/yIlrpHwYKq8uhAaCwc/umnpMOixfg8y4oIB3A=
X-Received: from pjbgk17.prod.google.com ([2002:a17:90b:1191:b0:34c:489a:f4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2251:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34f68b65ff0mr15047069a91.13.1768239588965; Mon, 12
 Jan 2026 09:39:48 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:38 -0800
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927133.1374677.16641795988105461817.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 05 Dec 2025 15:26:55 -0800, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
      https://github.com/kvm-x86/linux/commit/da142f3d373a

--
https://github.com/kvm-x86/linux/tree/next

