Return-Path: <linuxppc-dev+bounces-10008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7481DAEFAAC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 15:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWkWH2KHrz2xHT;
	Tue,  1 Jul 2025 23:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751376811;
	cv=none; b=iNrNTYo74msIiJWzpf0DVc2u+RpAwrARTi3SHEkJcFHcubx1rnvJm2oqinzZ4pDAKi2u4kAJARNFPAqq2a/DMoYGvCE5hoZ6WgdPDExKDqzDBXBNgHwpCmgzqRarNbky0IPsnuhugVRyWxGDn02rZtfLqj9hUASkxrPClB4mAJv1A9x+OkCInd7o6Yo7dMyGaQlvgopNITLsmqvZ3Zt0sy74vfs1soe1w326HreUJIb+Om+4Q2HH2t4AAvhu9qLMwUAQOhjj9DnPpP7e1yYXaykb1tCbRuWduoIjUZrfAqzIEvfxVci99odp/BNW1FDnU9zRkF2RtcnaBiex95ANNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751376811; c=relaxed/relaxed;
	bh=kKAqGLF2XZ1rVNEsWOjeejObiYjjmhQh0+RZKEvfq+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUyBKxPujqP34dXf9Q7S4hrhwdH0gPUS9V22L3/OlW+DNrK6ty8Zjo6JpaU+UqhDZQfTpsDh8jScD/Y+LGELhcvxjpz/9JMs15ElLr3PYj5JaHc72WdqzWlLuA7fpbp+xoWmu78O6ozMVWH5iAOklOD9Q5ibE2HBaR3+X+TOwxGFkgh460JJD+HNhkgzWg2XNrNAD0blMCkXU74JiveKHHdpYf8JWiYsL2o+eWW1iMyRxfymKvwe45L9vJKm7EZks5/6kGxFV/dMNroUuRi4y8pvdNOrz++9MfpwWGUWoeMUdyEVNQCOqj0psz94lZd4z+5jihCLjAmOO8ASOkHKdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=localhost.localdomain; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=localhost.localdomain; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from localhost.localdomain (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWkWG17XZz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 23:33:29 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by localhost.localdomain (8.18.1/8.18.1/Debian-2) with ESMTP id 561DWwgs128265;
	Tue, 1 Jul 2025 08:32:58 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 561DWv95128261;
	Tue, 1 Jul 2025 08:32:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 1 Jul 2025 08:32:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <aGPjibUcPDubyFY1@gate>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Tue, Jul 01, 2025 at 12:49:29PM +0200, Christophe Leroy wrote:
> When building with CONFIG_RELOCATABLE, there is a .interp section
> which contains the name of the expected ELF interpreter:
> 
> Contents of section .interp:
>  c0000000021c1bac 2f757372 2f6c6962 2f6c642e 736f2e31  /usr/lib/ld.so.1
>  c0000000021c1bbc 00                                   .
> 
> That information is useless and even likely wrong. Remove it.

s/ likely//

You cannot run the kernel as some dynamic object (under control of some
interpreter that will load DSOs for you), hehe.

The various bfd/elf*.c (in binutils/ld) have code like

  if (htab->elf.dynamic_sections_created)
    {
      /* Set the contents of the .interp section to the interpreter.  */
      if (bfd_link_executable (info) && !info->nointerp)
        {
          s = bfd_get_linker_section (dynobj, ".interp");
          if (s == NULL)
            abort ();
          s->size = sizeof ELF_DYNAMIC_INTERPRETER;
          s->contents = (unsigned char *) ELF_DYNAMIC_INTERPRETER;
        }
    }

(yes there are about a hundred copies of this code, that could be
improved :-) )

whenever producing dynamic objects, so this code just sets that text and
that's all, no side effect to be worried of.

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

(Maybe this could or should be in generic code though, not architecture
code?)


Segher

