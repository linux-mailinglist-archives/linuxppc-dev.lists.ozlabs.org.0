Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEB3729EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:16:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZJhy4yr9z30CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:16:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aRGdb6rm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aRGdb6rm; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZJhW2xFJz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:15:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZJhS5Lf8z9sV5;
 Tue,  4 May 2021 22:15:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620130537;
 bh=uWtdbCI0TNtx0mLD+ufT/ZYFqrfLvco2t5eCGabi+Ls=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aRGdb6rmJlqeBhjJKYH/xQUBheRefJmDz05mp58PuIFHnZnuxYRRf0bOWdHo6E3M5
 +60MYoaIT0QIaZY7EoY/bny2HpzGJduKMIQcdn0+boa52Z1+R81WgJ93rwKQ2E0KWk
 /62tgRVq4igx6Jms/XM/RPxuqD/lrizECAreQq3QN7Sk3kVC3e5nulNjxLlaWfHg8G
 GeoQeT3JieqtLqR2CQgEvDwPUwAgyUL52Ilil6LrfNUrRBbGcIQ8eDAax8JMDlK/za
 Pv/5nkdUCBXhyY5uGg1K6LbcBmtNTTDfWAlIiUMmA0MyLoIyOXWqjETVx8L0xAKs4B
 6kBz3C8iJTRXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big
 endian kernels
In-Reply-To: <20210503151824.GJ10366@gate.crashing.org>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20200428234046.GP17645@gate.crashing.org>
 <1588121596.7zej1imag0.astroid@bobo.none>
 <20210502175506.GE10366@gate.crashing.org>
 <1620002801.0iaahdk9xn.astroid@bobo.none>
 <20210503151824.GJ10366@gate.crashing.org>
Date: Tue, 04 May 2021 22:15:34 +1000
Message-ID: <875yzyae55.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Mon, May 03, 2021 at 10:51:41AM +1000, Nicholas Piggin wrote:
>> Excerpts from Segher Boessenkool's message of May 3, 2021 3:55 am:
>> > On Wed, Apr 29, 2020 at 10:57:16AM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Segher Boessenkool's message of April 29, 2020 9:40 am:
>> >> I blame toolchain for -mabi=elfv2 ! And also some blame on ABI document 
>> >> which is called ELF V2 ABI rather than ELF ABI V2 which would have been 
>> >> unambiguous.
>> > 
>> > At least ELFv2 ABI is correct.  "ELF ABI v2" is not.
>> > 
>> >> I can go through and change all my stuff and config options to ELF_ABI_v2.
>> > 
>> > Please don't.  It is wrong.
>> 
>> Then I'm not sure what the point of your previous mail was, what did I 
>> miss?
>
> I asked if you could make it clearer to people who do not know what this
> is whether they want to use it.  Or that was my intention, anyhow :-/
>
>> > Both the original PowerPC ELF ABI and the
>> > ELFv2 one have versions themselves.  Also, the base ELF standard has a
>> > version, and is set up so there can be incompatible versions even!  Of
>> > course it still is version 1 to this day, but :-)
>> 
>> The point was for people who don't know ELFv2 has a specific meaning for 
>> powerpc,
>
> It does not have *any* meaning outside of Power.  But people who do not
> know what it is can assume the wrong things about it.  It isn't a great
> name because of that :-(
>
> (It's not as bad as the MIPS ABIs -- an older one is called "new" :-) )
>
>> then ELF ABIv2 is more explanatory about it being an abi change
>> rather than base elf change, even if it's not the "correct" name.
>
> I very much disagree.  "ELF ABIv2" is completely meaningless.

Except:

$ readelf -h /bin/true
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           PowerPC64
  Version:                           0x1
  Entry point address:               0x1990
  Start of program headers:          64 (bytes into file)
  Start of section headers:          66176 (bytes into file)
  Flags:                             0x2, abiv2
                                          ^^^^^

:)

cheers
