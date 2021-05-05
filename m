Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD6373B5B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 14:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZx450yg7z30Qb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 22:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FZx3k1Ch5z2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 22:34:22 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 145CVBvS001785;
 Wed, 5 May 2021 07:31:11 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 145CVB84001784;
 Wed, 5 May 2021 07:31:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 5 May 2021 07:31:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20210505123111.GN10366@gate.crashing.org>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20200428234046.GP17645@gate.crashing.org>
 <1588121596.7zej1imag0.astroid@bobo.none>
 <20210502175506.GE10366@gate.crashing.org>
 <1620002801.0iaahdk9xn.astroid@bobo.none>
 <20210503151824.GJ10366@gate.crashing.org>
 <875yzyae55.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yzyae55.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 10:15:34PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Mon, May 03, 2021 at 10:51:41AM +1000, Nicholas Piggin wrote:
> >> then ELF ABIv2 is more explanatory about it being an abi change
> >> rather than base elf change, even if it's not the "correct" name.
> >
> > I very much disagree.  "ELF ABIv2" is completely meaningless.
> 
> Except:
> 
> $ readelf -h /bin/true
> ELF Header:
>   Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF64
>   Data:                              2's complement, little endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              DYN (Shared object file)
>   Machine:                           PowerPC64
>   Version:                           0x1
>   Entry point address:               0x1990
>   Start of program headers:          64 (bytes into file)
>   Start of section headers:          66176 (bytes into file)
>   Flags:                             0x2, abiv2
>                                           ^^^^^

Ha :-)

This can also print "abiv1" or even "abiv0", btw:

        case EM_PPC64:
          if (e_flags & EF_PPC64_ABI)
            {
              char abi[] = ", abiv0";

              abi[6] += e_flags & EF_PPC64_ABI;
              strcat (buf, abi);
            }
          break;

This is only in readelf, and the main audience for readelf is the people
who know all details about what means what already.  But, do you have a
suggestion for better output here?


Segher
