Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281868228E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 04:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5VR10yGbz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 14:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kpQhUCSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5VQ60cdhz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 14:09:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kpQhUCSX;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P5VQ55Ln7z4x1h;
	Tue, 31 Jan 2023 14:09:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675134557;
	bh=dsmeP4H7IDd2PWzOqULkDKQ9KxgZ3QtNQ4f18Qao/0E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kpQhUCSXUuoMuudxSp1PjDiAbzC5VHUG30psZLY4P5qRrlXafi0rz+4OgTkYCbsFP
	 uLgJS/lOZRSoeEwqpLzv5mxsaDo6oC2b5PYdDIxGVbqW0nB6taDlKBmb5MtnRBF+d8
	 gsuM2o+ZZ1UaRC3/NYsVrrJ/yZ5zgvz6L+GI4W5MURbd2LDnLvH6+sYfSWPQ43ef5p
	 c0UPtD6/FIJrbWUbNmTfIR3NBtV+WT54jvNKYs8GvoJQ+vqxBSM3cUv1KKrzi6K77s
	 R1MJTkmfsZcol18sRaMCqGH4bekYzkgLyym5irjsokXpox7vOljhJLPnUFArl7HOvy
	 6tJ/k1nJ1Wy7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
In-Reply-To: <45dba0a78f7f746effd482186c1c5d41670f51b3.camel@linux.ibm.com>
References: <20230124215424.9068-1-bgray@linux.ibm.com>
 <87sffyq22y.fsf@mpe.ellerman.id.au>
 <45dba0a78f7f746effd482186c1c5d41670f51b3.camel@linux.ibm.com>
Date: Tue, 31 Jan 2023 14:09:13 +1100
Message-ID: <87ilgnflie.fsf@mpe.ellerman.id.au>
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> On Wed, 2023-01-25 at 22:35 +1100, Michael Ellerman wrote:
>> Can't we just fall back to flush_tlb_page(vma, vmaddr)?
>> 
>> I'd guess those CPUs can't flush based on page size anyway.
>> 
>> cheers
>
> Probably. Do they have a fixed page size?

AFAIK yes.

cheers
