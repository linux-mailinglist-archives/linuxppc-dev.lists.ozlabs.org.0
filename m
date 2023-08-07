Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EE7735AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 03:08:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OnbGVA8I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKZn04m9rz3cHB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:08:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OnbGVA8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mhzrzaskdjs57f9mg9toibbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKXNf5ZDFz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:20:18 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57320c10635so58794147b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691450416; x=1692055216;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Ut/hDJ+qFMS0sDMssVLi/Qh1tossNoTViyk+Sv5I6I=;
        b=OnbGVA8IPnrsdTREsUm581mRdehgXJT0uL+ALPcn3gfxErJrXCtKmSomsOKaQATGMh
         f0VvgjqMIW5HLukSt/TZqta9FHSpbW8xuPg/WJY9Y8dBtzBXk68FxKvGTf0SBMt/xuPE
         yb72/yaLEWHxd2i86q/oL/iyLDDk998ORMSoUHaZduqRHpQmcSBeRXdyojnyjv3Pm4Gp
         0hyU2N4jgt9pJV3/SHK5m7Gafo6teeA6CAaXNJJ1Z5NngK3Yas1VVpJwsDY8b342oTWb
         +N+E2aHGEdoYFXjyTrvdzsHzrQ8RpCJH9Ba/1//rKN61ZJdF3SLJ42ybI7Ydk3RiGWfT
         qyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691450416; x=1692055216;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ut/hDJ+qFMS0sDMssVLi/Qh1tossNoTViyk+Sv5I6I=;
        b=EtCmSBW4Rv8bmAMw1FWYYtHtx6riaEgH5uJSBjDh6RHtbzr9cKWFfEj3GEZPewEW10
         OriNxyJ4a8eYiA1GCz/YEpkjXpg8F85HwL17jgNKXRji8zTCTgbZK9zdnIZIg4rJJ9F/
         uZ0Ve4ew4Id0LQ2/fNblrn9A5PPco2+86+1thqNyPLi6N3n2CCKAB2dCuZhL4OviVsEQ
         iELbsqqZSwoFqZDxI9Wxet4IY84ydrkPGmrwPFYRN3Zr5DmV4bggjTGsTJrXnLgguwsz
         5Wj9RkDH4Y6dT2t7Z7YqycFYvYkDRMAL9aPZQgN+N/RKsYe8B5podlN9xfoPXH1TeYnQ
         2MCA==
X-Gm-Message-State: AOJu0YwPXsRgUSqjGQJXPOpRcsrCXQYFjz1PrFXnLYV4PyFLf/bkgjU1
	HqmPueciwTKWCqW9v3lwSDGOOfKiGkMzA9h32A==
X-Google-Smtp-Source: AGHT+IGdVk9oJYWbSpXuFj0KYecexGvmGzQrsUIUE7DdG+7VjOx16xy0jF3toasrtnWqbigopnLRYvJP03sO+CW+ag==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a81:af45:0:b0:581:7b58:5e70 with SMTP
 id x5-20020a81af45000000b005817b585e70mr85942ywj.5.1691450416406; Mon, 07 Aug
 2023 16:20:16 -0700 (PDT)
Date: Mon, 07 Aug 2023 23:20:15 +0000
In-Reply-To: <20230718234512.1690985-29-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:11 -0700)
Mime-Version: 1.0
Message-ID: <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Aug 2023 11:05:33 +1000
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Add a selftest to verify the basic functionality of guest_memfd():
>
> + file descriptor created with the guest_memfd() ioctl does not allow
>   read/write/mmap operations
> + file size and block size as returned from fstat are as expected
> + fallocate on the fd checks that offset/length on
>   fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned
>

> <snip>

> +
> +static void test_fallocate(int fd, size_t page_size, size_t total_size)
> +{
> +	int ret;
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
> +	TEST_ASSERT(!ret, "fallocate with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size - 1, page_size);
> +	TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");

This should be

TEST_ASSERT(ret, "fallocate beginning after total_size should fail");

> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size + page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size - 1);
> +	TEST_ASSERT(ret, "fallocate with unaligned size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
> +}

> <snip>
