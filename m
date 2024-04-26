Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA508B3170
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 09:34:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r6EVUWWW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQky9239Tz3vhc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 17:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r6EVUWWW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQkxQ0XkKz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 17:34:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08B2561FCB;
	Fri, 26 Apr 2024 07:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A6EC113CD;
	Fri, 26 Apr 2024 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714116839;
	bh=gksl38yx9eZzDHDXbUKTYhZmDGqlaFTVA8MzoHCjPSQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r6EVUWWWwqWuB2/4TPNdaGpUi5w/svatLiUkQPW7jg/Kqfz+v9PjTsqhHX0V5+EAd
	 O9Q7MLhBBw+u+yC3YJdVVaI93yGyVAyg60gYgQw+aYYn1jycUg0XiChWp0Iu1VFKMv
	 DwPywl0dLcmeXRt7ZEBqHGpgzLkfbaLNMsfQI9WfrWSOqgHI+raXZsInlkpmvx5zN2
	 Aw4iSz/F3PrrMtthz0B2wb3NwCnmeHWiHSYEJZOSeSYq9iQITvYdPXRUZEGz3Zp6OT
	 dsVslJOA6lLCpSJkkdCeyvYqDh4fWotWkzTVM/CVN72PQmXal5hJg3KuZB1fRSHKNY
	 lVwcEZNrXTKCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Apr 2024 10:33:40 +0300
Message-Id: <D0TVP8ILJMO0.HERRWR4PA7N6@kernel.org>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Sean Christopherson" <seanjc@google.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.17.0
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>, Marc Zyngier <maz@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Isaku Yamahata <isaku.yamahata@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley
 Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup
 Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu
 Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Apr 25, 2024 at 6:09 PM EEST, Sean Christopherson wrote:
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEM=
ORY_REGION2");

This would work also for casual (but not seasoned) visitor in KVM code
as additionl documentation.

BR, Jarkko
