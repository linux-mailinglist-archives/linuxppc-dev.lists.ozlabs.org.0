Return-Path: <linuxppc-dev+bounces-3359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5AE9D0379
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:08:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqKg3rmXz2yDr;
	Sun, 17 Nov 2024 23:08:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731845319;
	cv=none; b=eXd1SWW1v6iTY6CZVn30Et39TBd4yK/XTHydb7gSesTonBM6gIzRFj96izYJz8t4pwT1kGSBd1JfZpSFCLzpqazvm8VXZ1zk90AfqvGaK0TCs3R3XukDRqOmYnYLm5Za+/DIRP97NxEIDmc2MOSYtOytuK2xLaA2k2+I4FH6cIATlA7MiHzySzvhSJDCGvwB/6TsdfMXlcWRWwak1lolxtftSbNOTaf/6Tj35B6tfPgRL/tJiFOVpawVD7QFcf8xtQCer0OGzQ5GcECg+hUxURW5OaKQZ2e/CZl9mlRrO1vNIEe/3cVcEIKE7NVXp2MhBUvRxjG4gY9cMerOrKtENA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731845319; c=relaxed/relaxed;
	bh=ZxjmofktqP+h19RoqLD80A6n6Rgg6iMYO3CZ43bpgOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GrrS6chkfbhbYZXYRV6XnH0UeVcnVZXhU6mCe2p28bgGwm4hb/7ktJ225RvTH1IW5Qv8r4IIA0h/Y609ccAIc9Ib2cPqraXk4mUbTfeKqy9GiK+Czc2gzpz2nR+EP1gN5BbPfsPbwybDsoXINMeVI9RTF0oIUvHiyiZE9yVpgQiAlMJGlZDZRhns4m0CL970UH8UjosYvhrO3FzuZxsw1e51NxTiWZAZAa53pq/ccsgqOtPfshaI4hPmukjnPLGqPc6Y6vv/XMFjNRNzEn97u1BfiupFoeb3BRpt33xskm2le7NkorJzSRsgrMuWOyIozu4TmQtmMM5ApPyqHZIxmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vyj/UwD4; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vyj/UwD4;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqKf5879z2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:08:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731845315;
	bh=ZxjmofktqP+h19RoqLD80A6n6Rgg6iMYO3CZ43bpgOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vyj/UwD4q1XzhdVaQ8hX5LCKvemZxst/sv3OhOht9p714Z5/TOM8+D+tSCMdfxLN1
	 DN4QDmA0TPqEbdq9Qa7ZKFwittBMlYOyVBDif+o7U39XGOiwpnkDxZddLeOAlBuZth
	 LFElXNFkRMXig/XecEFxqnEdjlpcThQkYVXqXMyi+MHAn+/O1IrNzzWiM+J+4s7Srv
	 0dG1GEGBEqaHVg961dBhgWS9XCnr4oD1B/G9u/7C98Sz8s+wxw6RdUaCHaVknrUNaM
	 dpiyYrXU4G+KeovwuWDpkxepWRC8qiIDfU0906OAr1JULUYyqqQh6E2tEIC3pdWcB9
	 YwlpLtf4KKmvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqKb4j4cz4wbr;
	Sun, 17 Nov 2024 23:08:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU
 before running it to avoid spurious interrupts
In-Reply-To: <20241028090411.34625-1-gautam@linux.ibm.com>
References: <20241028090411.34625-1-gautam@linux.ibm.com>
Date: Sun, 17 Nov 2024 23:08:38 +1100
Message-ID: <87jzd2xdtl.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Gautam Menghani <gautam@linux.ibm.com> writes:
> Running a L2 vCPU (see [1] for terminology) with LPCR_MER bit set and no
> pending interrupts results in that L2 vCPU getting an infinite flood of
> spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets the
> LPCR_MER bit if there are pending interrupts.

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts
      https://git.kernel.org/powerpc/c/a373830f96db288a3eb43a8692b6bcd0bd88dfe1

cheers

