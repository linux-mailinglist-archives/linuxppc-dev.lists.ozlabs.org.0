Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E2E759733
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 15:40:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gaqxW45k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5cQL0Vksz3bZM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gaqxW45k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5cPW1v7pz2ytc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 23:39:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A793616F1;
	Wed, 19 Jul 2023 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507F6C433C8;
	Wed, 19 Jul 2023 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689773980;
	bh=KIb7q+NtNE+KBfEiNJ0Q3nOHxWMm45lA4WVZ9SwBWF8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=gaqxW45kGtoKFnDNNv629brjH/mey+u1zrY+JTYF+Xct1aygG1J4Cf6N5TAdbyf95
	 2UQ3DpMsJY9gZ/ErtakGGWIqjwaqOwsKcm2y3YVSYVrxM+2RWzCuF6bzEjT83PpAcr
	 AGyWDI+pJBXz2XJ1m2wYil5ZnC85al8khQ/W4g+oUVReQT1yoreruC76NRb0RMublg
	 +no2nvv+RqXbaCJv3KQVstHdVnFLcEEYeY1VCIjZ704OwGCykRUyhgj3tGnEgItJBD
	 Kzs/75HMkiwCdVcTz9jVBoTVjf+xmRrTVbvZXW9OTzSwRub4koHl/Aq6fKSbtpIb+H
	 H1gh8r1VAddMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Jul 2023 16:39:23 +0300
Message-Id: <CU66VMG4IKSD.33KF2CEZJ2I1@suppilovahvero>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sean Christopherson" <seanjc@google.com>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Marc Zyngier" <maz@kernel.org>, "Oliver Upton"
 <oliver.upton@linux.dev>, "Huacai Chen" <chenhuacai@kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Anup Patel" <anup@brainfault.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Paul Moore" <paul@paul-moore.com>, "James
 Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
X-Mailer: aerc 0.14.0
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, linux-security-module@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jul 19, 2023 at 2:44 AM EEST, Sean Christopherson wrote:
>  	/* Huge pages aren't expected to be modified without first being zapped=
. */
> -	WARN_ON(pte_huge(range->pte) || range->start + 1 !=3D range->end);
> +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 !=3D range->end);

Not familiar with this code. Just checking whether whether instead
pr_{warn,err}() combined with return false would be a more graceful
option?

BR, Jarkko
