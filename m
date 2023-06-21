Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9B738E0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:03:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WlDhY0OA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmWZV5NCNz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WlDhY0OA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=nadav.amit@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmWYZ3wn7z2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 04:02:24 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-25e820b8bc1so3042428a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687370539; x=1689962539;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghR3ONQ0xCWF/XsVVqlYhvKkezqnfnGRVsn4IWmNqPA=;
        b=WlDhY0OAVtt9U/sOOElyyyzC8WQUo6poFN2oaUUbgXb/+d/IcLxLnp/l+UzGUwpnTP
         qNVRgaSawr/Lks/MVqkXW3vhZ6kxmceUTjHXM6jlyF1GptNr1dqW3DS3mHch/GovOfRj
         eeIG+2GeD7qLThk604Ls1Dm6ulCuVqsz3HJeNzmw20ui3f1km/wN1Lsn8new91sCB9f4
         Y/9gdFH2EtmVLBvhgPnz+wuC+/IaW12lqMa1hMv5oCDcKrdyydt7o/GSHiNNyTmCgyjE
         n6f4GEOsh48n3nZWOX6uYilALlQZViylNfVYvHM7mBlUYr3PiCQJ7ZWpUMc3s5dLxZUE
         OjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370539; x=1689962539;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghR3ONQ0xCWF/XsVVqlYhvKkezqnfnGRVsn4IWmNqPA=;
        b=HMVZQi7VeFXI/GxWmsMOOT9m50z8l9GTcp82NbFxrygss4vKV0z95Hc+jc41CVM3ax
         TxmXT3Fjkn2AjGYqA09w3RqxQt0xI65d/7FWiVdqRQ5y7VczglZyKBwJTxGWcMbJbt4h
         0Sp/7e8WrvQu1eIjm6yugaM4JcR2ErToofNS0FRYCpJpHIug4og33twR0wot+pOwOUf3
         PqRq21UUCxzEMVE5uY49K4TvGe2J3U+TYtGRi+lPxIRDZjAAQpmBTKabzFuthYryi+QC
         cxp3ySpltE9PHYGYK5hA0cnW7NeYea0hQvwWLL5PiDkXn+rLPEQ2DDxsZ6bV5JNbvZR3
         G6Ww==
X-Gm-Message-State: AC+VfDx+R/l5f1l+2pQQdsrgls/QbEKOhBVAR9xopnXJC9OtUPElw5mE
	2634fyGXIhnr/XVD7pwye+M=
X-Google-Smtp-Source: ACHHUZ6mRoAo2s2oCkgP3Wp2nUTJXsXUGVHNcWUvqJUw9GFNXu1TCgqL3BU4dWywAqRpkfH2O6TdSg==
X-Received: by 2002:a17:90b:4c8d:b0:25e:a5b2:8463 with SMTP id my13-20020a17090b4c8d00b0025ea5b28463mr11111864pjb.8.1687370539354;
        Wed, 21 Jun 2023 11:02:19 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id r10-20020a638f4a000000b005439aaf0301sm3329045pgn.64.2023.06.21.11.02.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 11:02:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20230620144618.125703-3-ypodemsk@redhat.com>
Date: Wed, 21 Jun 2023 11:02:05 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <10050BB1-15A4-4E84-B900-B21500B2079B@gmail.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230620144618.125703-3-ypodemsk@redhat.com>
To: Yair Podemsky <ypodemsk@redhat.com>
X-Mailer: Apple Mail (2.3731.600.7)
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
Cc: geert+renesas@glider.be, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linus.walleij@linaro.org, Dave Hansen <dave.hansen@linux.intel.com>, sebastian.reichel@collabora.com, linux-mm <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, Will Deacon <will@kernel.org>, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, ppandit@redhat.com, Ingo Molnar <mingo@redhat.com>, samitolvanen@google.com, Christian Borntraeger <borntraeger@linux.ibm.com>, frederic@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, rmk+kernel@armlinux.org.uk, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>=20
> On Jun 20, 2023, at 7:46 AM, Yair Podemsky <ypodemsk@redhat.com> =
wrote:
>=20
> @@ -1525,7 +1525,7 @@ static void collapse_and_free_pmd(struct =
mm_struct *mm, struct vm_area_struct *v
> 				addr + HPAGE_PMD_SIZE);
> 	mmu_notifier_invalidate_range_start(&range);
> 	pmd =3D pmdp_collapse_flush(vma, addr, pmdp);
> -	tlb_remove_table_sync_one();
> +	tlb_remove_table_sync_one(mm);

Can=E2=80=99t pmdp_collapse_flush() have one additional argument =
=E2=80=9Cfreed_tables=E2=80=9D
that it would propagate, for instance on x86 to flush_tlb_mm_range() ?
Then you would not need tlb_remove_table_sync_one() to issue an =
additional
IPI, no?

It just seems that you might still have 2 IPIs in many cases instead of
one, and unless I am missing something, I don=E2=80=99t see why.

