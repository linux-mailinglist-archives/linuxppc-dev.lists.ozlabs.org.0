Return-Path: <linuxppc-dev+bounces-59-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CFF950562
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 14:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjrgZ71mRz2y8r;
	Tue, 13 Aug 2024 22:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjrgZ6b67z2y81
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 22:44:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjrgZ5Pznz4wd0;
	Tue, 13 Aug 2024 22:44:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, Naveen N Rao <naveen@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240716115206.70210-1-gautam@linux.ibm.com>
References: <20240716115206.70210-1-gautam@linux.ibm.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Refactor HFSCR emulation for KVM guests
Message-Id: <172355306298.70508.13351301741599635833.b4-ty@ellerman.id.au>
Date: Tue, 13 Aug 2024 22:44:22 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 16 Jul 2024 17:22:04 +0530, Gautam Menghani wrote:
> Refactor HFSCR emulation for KVM guests when they exit out with
> H_FAC_UNAVAIL to use a switch case instead of checking all "cause"
> values, since the "cause" values are mutually exclusive; and this is
> better expressed with a switch case.
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: Refactor HFSCR emulation for KVM guests
      https://git.kernel.org/powerpc/c/9739ff4887c77a38575c23b12766b0a37c8be13c

cheers

