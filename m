Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355BE8FE697
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:35:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oEsl7eiT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw3h32THHz2yvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 22:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oEsl7eiT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw3gN3jsDz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 22:34:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717677281;
	bh=Q0C01R8stQPACIN05Xp2WxJuZeUd9lyUWWYpiuOc0io=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oEsl7eiThFrFIbhjFPRoknZn3lcd9zfJh52Jwh28BbLdmGM7ud1eMT4QsMasuTtU1
	 8WVdZmhtNttTQOfEjE+U+UU5qmjCibY3NComOGyhqyJwhGzgJvtXVluKO1Q+E6VR1Y
	 QmzlEa1Phw1f94t+itlcx6BXZGWRhIznjLq/X6lrcW+lKuhSdNLXqxG2duiE/uKVxu
	 wIt93FSpTxyGzbLfhrph/oyWSAfP2ESuutcDSmegZ1AOFCMxoNn01gF8RlOJL+VkHO
	 0CZhnUZHZlzdFln9kDIXI11heYP3wDiWnxsJN9LP3AFAcNkJG6tYjrN4zUNjKIjHUy
	 Yt7t2VXWmqnPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vw3gN3lbXz4wc3;
	Thu,  6 Jun 2024 22:34:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, corbet@lwn.net
Subject: Re: [PATCH v2 0/2] Fix doorbell emulation for v2 API on PPC
In-Reply-To: <yzixdicgdqcten6eglcc4zlhn3sbnqrax3ymzzqvdmxvdh63zx@xymyajel3aoh>
References: <20240605113913.83715-1-gautam@linux.ibm.com>
 <yzixdicgdqcten6eglcc4zlhn3sbnqrax3ymzzqvdmxvdh63zx@xymyajel3aoh>
Date: Thu, 06 Jun 2024 22:34:40 +1000
Message-ID: <87le3ip7vj.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautam Menghani <gautam@linux.ibm.com> writes:
> On Wed, Jun 05, 2024 at 05:09:08PM GMT, Gautam Menghani wrote:
>> Doorbell emulation for KVM on PAPR guests is broken as support for DPDES
>> was not added in initial patch series [1].
>> Add DPDES support and doorbell handling support for V2 API. 
>> 
>> [1] lore.kernel.org/linuxppc-dev/20230914030600.16993-1-jniethe5@gmail.com
>> 
>> Changes in v2:
>> 1. Split DPDES support into its own patch
>> 
>> Gautam Menghani (2):
>>   arch/powerpc/kvm: Add DPDES support in helper library for Guest state
>>     buffer
>>   arch/powerpc/kvm: Fix doorbell emulation for v2 API
>> 
>>  Documentation/arch/powerpc/kvm-nested.rst     | 4 +++-
>>  arch/powerpc/include/asm/guest-state-buffer.h | 3 ++-
>>  arch/powerpc/include/asm/kvm_book3s.h         | 1 +
>>  arch/powerpc/kvm/book3s_hv.c                  | 5 +++++
>>  arch/powerpc/kvm/book3s_hv_nestedv2.c         | 7 +++++++
>>  arch/powerpc/kvm/test-guest-state-buffer.c    | 2 +-
>>  6 files changed, 19 insertions(+), 3 deletions(-)
>> 
>> -- 
>> 2.45.1
>> 
>
>
> Hi Michael,
>
> This patch series is to be backported for all kernels >= 6.7. So the tag
> should be 
> Cc: stable@vger.kernel.org # v6.7+
>
> and not
> Cc: stable@vger.kernel.org # v6.7
>
> Should I send a new version of this series or can you please make this 
> change when pulling in your tree?

I can make the change when applying.

cheers
