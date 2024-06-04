Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBD98FB127
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 13:30:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XZqcErSZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtpLH5Pdrz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 21:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XZqcErSZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtpKc23K3z3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 21:29:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717500596;
	bh=CkXqB/W1Qbp/5OZYxT+hejxuua+z0I9tF5oNHkdf8Nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XZqcErSZTKY9i6Vxk3+j2oeG5ra12SJJxGe1VKv11TltFC+rKfH0usdgvZIOtRR47
	 7Xu0xxtROrz3H5vHpOZJMKyP9nI4A2OrOFkjavTEGVoz+duAOfh3eJMdo1YPjWC72W
	 Mm9MJeKaS87oCf5zS/cDMASiZF6KfTmFyElLCQaLVFa4apDci72Od8AO8o1n5mdh2E
	 PTlixsfc+R0cl8cO3gTK93YVKTUKdAUpnoiN6KZdqsdoMHK82go2ykT+DvPVNmBleu
	 ARldjpaL+Bd/fS1RpSmJ/kRkeAN41KLjs/YA+vFlcRt3maQqSdqfWknqERoga/mSBP
	 oEJqXO0UhrVsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtpKc3tZFz4wc3;
	Tue,  4 Jun 2024 21:29:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Shivaprasad G Bhat
 <sbhat@linux.ibm.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] KVM: PPC: Book3S HV: Add one-reg interface for
 DEXCR register
In-Reply-To: <D1QZRTRK2WWI.20TJKC3RK1K9C@gmail.com>
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741327891.6631.10339033341166150910.stgit@linux.ibm.com>
 <D1QZRTRK2WWI.20TJKC3RK1K9C@gmail.com>
Date: Tue, 04 Jun 2024 21:29:56 +1000
Message-ID: <87a5k12bez.fsf@mail.lhotse>
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
Cc: atrajeev@linux.vnet.ibm.com, corbet@lwn.net, jniethe5@gmail.com, linux-kernel@vger.kernel.org, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Jun 3, 2024 at 9:14 PM AEST, Shivaprasad G Bhat wrote:
>> The patch adds a one-reg register identifier which can be used to
>> read and set the DEXCR for the guest during enter/exit with
>> KVM_REG_PPC_DEXCR. The specific SPR KVM API documentation
>> too updated.
>
> I wonder if the uapi and documentation parts should go in their
> own patch in a ppc kvm uapi topic branch?

I'll put the whole series in the topic/ppc-kvm branch, which I think is
probably sufficient.

cheers
