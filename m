Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134776F674
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 02:17:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DSNF3uKl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH5rn0ZKFz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 10:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DSNF3uKl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--afranji.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=37fzlzackdeqglxgtpomuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--afranji.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGz8f4f4vz3brg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 05:16:00 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55c04f5827eso879853a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691090157; x=1691694957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QAbc+4fCOMN1wq3LOwJ4k1bsXl9R1Q+x4bhgj3rFIg=;
        b=DSNF3uKlxbN1/j9sGPdV4RLbiLmTPzUp9Zu3X+X+jI/CXp8qoKO4kiLFxh0eWH4ras
         3UHMbP1YaoUXHaU6RKc0xiD6OqP0/G8GaXsxhmkMXaXcobPCXbuINlBumVapPQ9eL9WI
         SQMF6MIyr2Twu3rQpgN63Ty4xEmvWMdFcq1qk0s/bO53R4WtT4D6mxqEq84CrHbE24tW
         R+R0wb7QBQEWXSd0EQn3phD4GyYVVYig+DH6wM230PxAw/bTqhOS8nPt+LaY5XqmbBEo
         2lNVu9E2Fm9D/OSL8FvXxR34+QmBLtfkxeWiU2TVRkIK5+koZ6XE0PUmvWk9wsqvFkyB
         PpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090157; x=1691694957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QAbc+4fCOMN1wq3LOwJ4k1bsXl9R1Q+x4bhgj3rFIg=;
        b=MPzycm60cyUVZ4V3gsNBMu2I1Mvs7dubH5SOhfLSYFkQLbQdO1BU6sIKHRLbdRBfeF
         nrDQkE5mDc0aI1vRQnlGuF4HEB8bnvHpnkgYXtqquL0wuHn/rBC5ZZnV4DSgeQxd11Im
         z6ro1Z2t1UYvoD/ZPszRhU+P1jQ6Pv0ficZmjhDSLoDyfMgJJbEBPZk9AG+gkNZf6uhA
         ynED3VktYqlIrWsnuFv7zcqWz4MRwZdilr9uN6iW99ACrEToHRArsz9Mhphvs0fvcaeb
         VYeUUhGEGMtKTxpWlGyBzjlpH5/1PC8MHR17V0AI4F2MVMS8fuRrf+ifLdkWs6MmBUbt
         +QdQ==
X-Gm-Message-State: ABy/qLajZhDWRK2Xlll2EGo2fWWHPl7YmU2stCpMy86EgdngCUHFaMlq
	KZ6zSDmNtezd+lBpXYv3mFYormzNgtIr
X-Google-Smtp-Source: APBJJlHtGvcJEMYqDDCqDrlA6FqIV7ZBvnc2RG3ctaXexB6pNXaY+PGUAOnc1N44cMVGOG5WgF6ZzIYHZzSS
X-Received: from afranji.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:47f1])
 (user=afranji job=sendgmr) by 2002:a63:295a:0:b0:563:5065:9d40 with SMTP id
 bu26-20020a63295a000000b0056350659d40mr129290pgb.5.1691090157410; Thu, 03 Aug
 2023 12:15:57 -0700 (PDT)
Date: Thu,  3 Aug 2023 19:15:54 +0000
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230803191554.205599-1-afranji@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ryan Afranji <afranji@google.com>
To: seanjc@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 04 Aug 2023 10:13:42 +1000
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	/* TODO: Support huge pages. */
> +	folio = filemap_grab_folio(file->f_mapping, index);
> +	if (!folio)
> +		return NULL;

In Linux 6.4, filemap_grab_folio() may also return an error value.
Instead of just checking for NULL, "IS_ERR_OR_NULL(folio)" will be needed.
