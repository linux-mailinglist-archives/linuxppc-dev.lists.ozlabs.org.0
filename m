Return-Path: <linuxppc-dev+bounces-6070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D239A2FFD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 01:59:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsNQD2shyz3050;
	Tue, 11 Feb 2025 11:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739235588;
	cv=none; b=ouRvkdS8IIovYT5BroIK7ZMizdZ2TCedsOfS406W9anwKCQb8mFESwIjnyEqlf60VXCRRHuKTloWx9nTP3p/fERo+OCX+Pa55pYbJ9eUkgdTQkD8SqflRfB3J2nDuY0kjouDdNtdR1f7P98DO5Pf5FQWdvZfbZpbpd2glDub90SH6MEMBvOdOrpk3lOF1p8HmX14NM7rXrDcbB3APplCbAZhIENtN/fC1RGFA+405ldwGQWHSDVXlzusuqAwatSrPlJ8ktQAyoLuMmsaNXtyGIcSrYsHRwokNVkZt4AFzg7Sxc0AQEAHAqR647V1UjIjDMS5MWzJ10NdE7FBOqaQow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739235588; c=relaxed/relaxed;
	bh=tQ1kY4shHPqw7yZi96lRlyOcUbfb9tETUvXdj7UtOVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VesFqB0QCZDqMhFEjGA6Z81T6/N+ZuhrPR8vGmMiRdv+ddNfINRlst7vYpKLNtQA4Y3MbWDHhe/ooEo53khmn0w5nIfjhMWFOWZMQ+lL1YW2xk6RjuW4t17xCTUwE+L2D/AY9/v1Sdq4ujKB1BNg1DK0ckgEG1iF+lOE4cpeeZGmrZ0DtZXlksEkrSuLfCiuqJKtO2lTPIg4mwygYf/+NJy4bBZWCh6iI6bbAFxZDwMJ8qU5EKS7DcO7olK4v7+u64TSSQ2zERaMR7XELYBctFICYKCuljiNR6Wz2qaTWBD0Q6huWDWxIYFUSaG0D/Rtd9RTiIxd4de1DOLbr2Ux1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=baX/QCOx; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=baX/QCOx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsNQC3hbjz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 11:59:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FE44A40C02;
	Tue, 11 Feb 2025 00:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68860C4CED1;
	Tue, 11 Feb 2025 00:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739235584;
	bh=KclDnq0yGU1M84esdrfIpWZm2KXaxbIJOJXRdNM4TVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=baX/QCOxqatyQmLiiwJbPKnXXqi17ksm24/KMF3E42PVYgHxp8UHyslMOHx/CleeI
	 +v8nfmXKDSFs5N/ZCQBxCGPe8GPQI+2dtJFBbvdN/txmjsnDEQ9v5e58ycEj+jULpA
	 tdXj9fX98XgZJpClPK3FcnfvIbruA7A8T6iv6Uqsac+/geicTGhqDS1Is3qnBTVHAs
	 gb/LHHm4EJjJ2y1osY7JMfGsufc+JLt6kaDcGFobRkKdawyQ5La6PEScQS3kdmUWfi
	 t8HRJPLYf6g0KI+jxc4cV9D+sj7EgQkzPmvzwfBDMshVoxQaK2deyXR+4TNxgWxz66
	 cOiutKCeDYFIg==
From: Kees Cook <kees@kernel.org>
To: Eric Biederman <ebiederm@xmission.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	kexec@lists.infradead.org,
	binutils@sourceware.org,
	devel@daynix.com,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v5 0/6] elf: Define note name macros
Date: Mon, 10 Feb 2025 16:58:30 -0800
Message-Id: <173923550723.2947986.17868728802985188618.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
References: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 15 Jan 2025 14:47:57 +0900, Akihiko Odaki wrote:
> elf.h had a comment saying:
> > Notes used in ET_CORE. Architectures export some of the arch register
> > sets using the corresponding note types via the PTRACE_GETREGSET and
> > PTRACE_SETREGSET requests.
> > The note name for these types is "LINUX", except NT_PRFPREG that is
> > named "CORE".
> 
> [...]

I rebased this for changes introduced by commit
680e029fd62f ("proc/kcore: don't walk list on every read")

Applied to for-next/execve, thanks!

[1/6] elf: Define note name macros
      https://git.kernel.org/kees/c/7da8e4ad4df0
[2/6] binfmt_elf: Use note name macros
      https://git.kernel.org/kees/c/2fc4947bbd91
[3/6] powerpc: Use note name macros
      https://git.kernel.org/kees/c/609c8b309156
[4/6] crash: Use note name macros
      https://git.kernel.org/kees/c/0de47f28ec84
[5/6] s390/crash: Use note name macros
      https://git.kernel.org/kees/c/d4a760fb77fd
[6/6] crash: Remove KEXEC_CORE_NOTE_NAME
      https://git.kernel.org/kees/c/7e620b56d958

Take care,

-- 
Kees Cook


