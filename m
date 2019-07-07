Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A32614F9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 15:17:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hTf62P96zDqRM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 23:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hTbW74dtzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2019 23:15:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45hTbV4SGMz9s4Y;
 Sun,  7 Jul 2019 23:15:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH] Replaces long number representation by BIT() macro
In-Reply-To: <20190702164850.GP18316@gate.crashing.org>
References: <20190613180227.29558-1-leonardo@linux.ibm.com>
 <87imskihvd.fsf@concordia.ellerman.id.au>
 <20190702161635.GO18316@gate.crashing.org>
 <20190702164850.GP18316@gate.crashing.org>
Date: Sun, 07 Jul 2019 23:15:34 +1000
Message-ID: <87d0imhtop.fsf@concordia.ellerman.id.au>
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Tue, Jul 02, 2019 at 11:16:35AM -0500, Segher Boessenkool wrote:
>> On Wed, Jul 03, 2019 at 01:19:34AM +1000, Michael Ellerman wrote:
>> > What we could do is switch to the `UL` macro from include/linux/const.h,
>> > rather than using our own ASM_CONST.
>> 
>> You need gas 2.28 or later for that though.
>
> Oh, but apparently I cannot read.  That macro should work fine.

:)

Yeah one day we'll be able to drop them entirely, but not yet.

The official minimum is 2.20:
  https://www.kernel.org/doc/html/latest/process/changes.html


But my "old" toolchain is binutils 2.22, so that's effectively the
minimum for anything I test. I'm not sure many people are actually
testing with 2.20.

cheers
