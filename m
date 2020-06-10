Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C31F5353
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:34:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlJs0KfBzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:34:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hkKd1Fv2zDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:50:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iQ9Md8X6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49hkKc4JQ1z9sRW;
 Wed, 10 Jun 2020 20:50:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591786228;
 bh=n+oeHGHJhM/+k40KWsfEX/3c6NEZVP7rB1vLKDHqSBc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iQ9Md8X6Bu29krYrJcdW4OMDBkdprdb9gCVengxkM7GgR5MAhpetRSjcQ0+W8ik+1
 XTPFF04/zPqlI6d1YlQxw6q8mVh10YWtE3gH692HH0HFlW9243qlxqQMyIPLJdXYsz
 cMjuP6oyn1RCDqVTzZk8G3fGucpl/NcJ2BIMDZ0LtFr0lrvl5xeF79eZQyQUkBTvA2
 ZpI8I57HQxQFwQbADJkJVk2aVUSgrToT4rc+lhEpbL9Q1dXPizBqofPdnQnxnCxZqU
 myI8GdQIBPID1VACNCznb2OPFgsPr1DUO2dI1VfHIY56X2p4yMsd1Ycs9zFMYJ4aIL
 oHWIcRBnyyIxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [PATCH 0/6] consolidate PowerPC instruction encoding macros
In-Reply-To: <20200526081523.92463-1-bala24@linux.ibm.com>
References: <20200526081523.92463-1-bala24@linux.ibm.com>
Date: Wed, 10 Jun 2020 20:50:57 +1000
Message-ID: <87lfkvfb3i.fsf@mpe.ellerman.id.au>
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S <bala24@linux.ibm.com> writes:
> ppc-opcode.h have base instruction encoding wrapped with stringify_in_c()
> for raw encoding to have compatibility. But there are redundant macros for
> base instruction encodings in bpf, instruction emulation test infrastructure
> and powerpc selftests.
>
> Currently PPC_INST_* macros are used for encoding instruction opcode and PPC_*
> for raw instuction encoding, this rfc patchset introduces PPC_RAW_* macros for
> base instruction encoding and reuse it from elsewhere. With this change we can
> avoid redundant macro definitions in multiple files and start adding new
> instructions in ppc-opcode.h in future.

Sorry this series collided with the prefixed instruction support and I
didn't have time to resolve the conflicts.

Can you please rebase on top of current mainline and resend.

cheers
