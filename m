Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F16CD948
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 14:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmlzC1Jg1z3cd9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 23:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R3oQSXFG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmlyK2vm5z3cLC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 23:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R3oQSXFG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmlyD4s92z4x7x;
	Wed, 29 Mar 2023 23:20:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680092454;
	bh=g7pJq13gLamVMdRYT2o20Cf0Lqj5XS9R5CmmqtotjLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R3oQSXFGG58OOPn/TbspbRFfN8kSyolg3daz2PcvdgDrAIwzv+wCHfaIZwdsb6QWX
	 C3oUyTaW2HiRbh+65h7IFzWVlv4RO9aoz4RbeDa7tkeqmK8ta8/XPqK+8NamG0W84z
	 9Pi1DTvMlf3e0s2ZiD/g81sj76eO/qdMWZqnMmaDQTcwawPpLFg1EWg/GSNCcpJAC1
	 UQmHAEcGCHrtaU3ZgQqRJjmmw47zySMPaCfabi6v75enoNWl+MyhNR/DD3ZyBgZ6GR
	 QLj9tunOs4OdqCd4cZrteJ6ve7PIuYIPPggW19I6VvFySnhI5EXaQjEWUpNRd35uhM
	 5k0GiPXvPxhSQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 7/8] powerpc/rtas: warn on unsafe argument to
 rtas_call_unlocked()
In-Reply-To: <871qlf6k7m.fsf@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-7-010e4416f13f@linux.ibm.com>
 <e0f8c82707dce0300fc5a2bc5f0a3ab90a83cee0.camel@linux.ibm.com>
 <87mt437jcu.fsf@linux.ibm.com> <871qlf6k7m.fsf@linux.ibm.com>
Date: Wed, 29 Mar 2023 23:20:49 +1100
Message-ID: <87zg7vbvfi.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>
>> aside: does anyone know if the display_status() code is worth keeping?
>> It looks like it is used to drive the 16-character wide physical LCD I
>> remember seeing on P4-era and older machines. Is it a vestige of
>> non-LPAR pseries that should be dropped, or is it perhaps useful for
>> chrp or cell?
>
> Never mind, I see the display-character token and associated properties
> on a P8 LPAR and in a current PAPR.

Or a P10 LPAR even.

The characters written using it are shown on the HMC, somewhere on the
partition info page.

cheers
