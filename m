Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C96758B3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 04:15:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=E0qagBYe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5KCn4PKMz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 12:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=E0qagBYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5KBx16lpz304l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 12:14:31 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-57a8080e4a7so65736367b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1689732867; x=1692324867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9eL+vRLh2IMmmWxtSCYk4DtifazKKWTBnb901S3j94=;
        b=E0qagBYe20SR0SALzjMEgzAAwWZNBuyNfIuFOB5oHd7/unduwTPDowOXpp+9jaIhsk
         yWWws98rOg0AI15RrkDBVlvYl+q+EWOCtTO4U5wc9SPXFO1NrHsi1lJhfbpMLnVvCYSu
         oaogCqHUw7nH2YLUiLkB73e/lfZwIXPUSJs7W+SWDWF5uZgcQ+XMineDaONtZ9cLz3x6
         qFIwAxqXBML/rim1qQxNWhMp2wpGTXV7YkFVf+0lJR5qbVIjM/GxPwfH1ltdJggyZlow
         mW571RQ0nZa7z2F/9ExiiTsk1vBPkwJLlWHYvCs5k2sRgQGq40SZGqPgHZcShBBgy7hi
         TVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689732867; x=1692324867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9eL+vRLh2IMmmWxtSCYk4DtifazKKWTBnb901S3j94=;
        b=EB9G6n8tfIEH+/rn0/0rtOE6RTsVxQvkE5rCTDmlwyYib/2g7wiv8sKEzzExjw1Ed9
         oabGrw0VzM1CHtXE+Kt6vrysLB4kU7F5PSt2ZR1SBcZM4FeJCUbkeCQn4pTuQ2mMHA7n
         ebkOXxt9Rgw1TcGb+t8/sVdFjYOjwBrvh4dNSZfmv/JwE02NQIyZnzB3dDn8kabsORqQ
         kQZeOQLpMqUPwkRcGHFNBKP2XlCXznpI0Zr4eRA+1K9MCjU92llHcPlZCgjgQngbJS3l
         fFsejh3ospgrnogYpQAsdytrFbR6SRNnmg+Vf8HsYyVP+S6ejEGuRcgYo+zAQiUou7if
         4upg==
X-Gm-Message-State: ABy/qLYhYKLN2ILRC76Ao4sjzH7ilmAJ3gydSs15QOA/q3/f5XzWFXS7
	nFhaLe3kdrAUv1DpylSr9KQZH2aLWbUiCIzT/Z0Z
X-Google-Smtp-Source: APBJJlE6HrXGv8FiBWPESZXA4zS7WdaVXKrmS0y2QVal6eHwFQK9KIQhCzYsyt32AHunSvFteTt6TeRzQof/apGmOO8=
X-Received: by 2002:a0d:e843:0:b0:56d:2ad0:cb45 with SMTP id
 r64-20020a0de843000000b0056d2ad0cb45mr17052519ywe.1.1689732867591; Tue, 18
 Jul 2023 19:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-12-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-12-seanjc@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Jul 2023 22:14:16 -0400
Message-ID: <CAHC9VhSUhthtS9W1QkqFd8Y+VHsGVXt1vZenYpqRtr7Gw51B3A@mail.gmail.com>
Subject: Re: [RFC PATCH v11 11/29] security: Export security_inode_init_security_anon()
 for use by KVM
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, l
 inux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 7:48=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  security/security.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/security.c b/security/security.c
> index b720424ca37d..7fc78f0f3622 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1654,6 +1654,7 @@ int security_inode_init_security_anon(struct inode =
*inode,
>         return call_int_hook(inode_init_security_anon, 0, inode, name,
>                              context_inode);
>  }
> +EXPORT_SYMBOL_GPL(security_inode_init_security_anon);
>
>  #ifdef CONFIG_SECURITY_PATH
>  /**
> --
> 2.41.0.255.g8b1d071c50-goog

--
paul-moore.com
