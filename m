Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B233A3DDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 10:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1YVD1Ngbz3c2b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 18:12:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=eRIAU0zr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eRIAU0zr; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1YTl4l9yz306R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 18:11:54 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id k40so7322254lfv.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVfuX7eringV45aszymciC9M23yqzm+XrbU26OAukAs=;
 b=eRIAU0zr7umENvyK9+XECGlz1pvLL13u2t4pVeLebfQhIaiWxQbFjvk+jqX6UjbzUv
 Q6wwZ9e3Nig0u/2hl6ZT03Ax4Q2ZG/oPSX6OYUXZh29dGkRQij2WQErrG8KyyjU41gj+
 CktPYNOhzbN1oHKLbbup75s+H4HuE5+keZKj90GIeonXeOBbjexXX59U+ERX3gn07vht
 wbHj14odE+xiJ7GV1wJoPgO4L714hUxJcm7b1ytzI8fWboJsSm5SQa677PwApiLc3kmn
 GDy+R5nS+EkP2HBZfU4d8aWb+8XbmILF5hsfUuFuu/t+7cvlXLJ/5N1Ya+11WaXqNkVn
 BRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVfuX7eringV45aszymciC9M23yqzm+XrbU26OAukAs=;
 b=OGUnguG4dQ6l6mzwz2DsHyCsWWfUlc6S1P2B5RDuo66rSvi4UtOcuhaW6gPDESJsrD
 BmBOqwlTBq8HdZ89GJISBofGzqYst3LkOH5IxN6CgjSyxUsgbMwDuZL7arcv2/b2pIv3
 i9DXpbUR1MkPoNZIfD7SQ00ySzfyQYso6dw8wQ4dhuBBvk9Dm5HTCniEFOBGcckJF0wZ
 AQ0r7/gf19eJ8IAA0iXmVfN9Bvk2RytsjMfveXCsPP7wW+sCvnCOtDgnmBl9R1HQW1Fj
 KB2Yzn1VxKnD0yG/EWyAEMaUE+k87LfW1S9LH2yf0HVq5gZMiqtrKCKZ97KGfe2e+nDQ
 HQag==
X-Gm-Message-State: AOAM530qB4fXNTAsorJW0MTO7n+y53qGyC39d9tC/PwDumW8q8qY8KZw
 aDJlYQx1BjtpX0ZERNFCcJawV1FebI2SG909vqahvw==
X-Google-Smtp-Source: ABdhPJzQkvm60uXV9+CvbOCRR1sXng4+MCdfWrwi7B0EeHc1seHxuq/0nQSZXtU3+Fsu2yx9Zh2OHp41ji8WxFnzTmw=
X-Received: by 2002:ac2:4a6f:: with SMTP id q15mr1963634lfp.463.1623399105636; 
 Fri, 11 Jun 2021 01:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
 <20210610083549.386085-7-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210610083549.386085-7-aneesh.kumar@linux.ibm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Jun 2021 10:11:19 +0200
Message-ID: <CAG48ez3=gDRSB02aL84-A54jmPTja3BS0imje-PQywgidRuPxA@mail.gmail.com>
Subject: Re: [PATCH 6/6] mm/mremap: hold the rmap lock in write mode when
 moving page table entries.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Linux-MM <linux-mm@kvack.org>, Kalesh Singh <kaleshsingh@google.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 10, 2021 at 10:35 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
> To avoid a race between rmap walk and mremap, mremap does take_rmap_locks().
> The lock was taken to ensure that rmap walk don't miss a page table entry due to
> PTE moves via move_pagetables(). The kernel does further optimization of
> this lock such that if we are going to find the newly added vma after the
> old vma, the rmap lock is not taken. This is because rmap walk would find the
> vmas in the same order and if we don't find the page table attached to
> older vma we would find it with the new vma which we would iterate later.
[...]
> Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
> Fixes: c49dd3401802 ("mm: speedup mremap on 1GB or larger regions")

probably also "Cc: stable@vger.kernel.org"?
