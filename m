Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF414C2E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 23:19:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486gyt0YvnzDqFG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 09:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mentor.com (client-ip=68.232.129.153; helo=esa1.mentor.iphmx.com;
 envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codesourcery.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Jan 2020 09:18:09 AEDT
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486gwx4DgTzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 09:18:09 +1100 (AEDT)
IronPort-SDR: TUrtB2YQ/xGSHlj7fQMGW6gSnLbKpaIe22p5uAY352NaxZm3X8LZN7L7AOFF5NlGpjIH/NhU8e
 hdHXRb9VNr5ef9HNJK7/AT4htp7T2QXrxVT7j631mHtKFfOj2lJtKoB2TCGsYKbspY1XZj+zf0
 ZMOjpc52ebMUo5lldO6rquzLRPvNNmkpsLiVH/L7PPXidnrYDm9ZZFQfuIyY5Hc27c9PhXerXn
 zzYwUiQzlvknAnaqRa5e8dMAd7PnjOMd4YSGye1g3K6VFggkeCAUs+bj7Glh7mKyI1nJyYMrBp
 M1Y=
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; d="scan'208";a="47197600"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 28 Jan 2020 14:16:55 -0800
IronPort-SDR: AhhLI590DNwEACU9QrL8HRDues2kuCIAx6QoBzjC7lEsIeJCYoq3zAFpwOs12ZCm2pPqRLEIvR
 IfOXzSoK5OBg==
Date: Tue, 28 Jan 2020 22:14:48 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
In-Reply-To: <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
Message-ID: <alpine.DEB.2.21.2001282210470.22424@digraph.polyomino.org.uk>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
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
Cc: libc-alpha@sourceware.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jan 2020, Florian Weimer wrote:

> I don't think we can save LR in a regular register around the system
> call, explicitly in the inline asm statement, because we still have to
> generate proper unwinding information using CFI directives, something
> that you cannot do from within the asm statement.

What other architectures in glibc have done for code sequences for 
syscalls that are problematic for compiler-generated CFI is made the C 
syscall macros call separate functions defined in a .S file (see 
sysdeps/unix/sysv/linux/arm/libc-do-syscall.S, 
sysdeps/unix/sysv/linux/i386/libc-do-syscall.S, 
sysdeps/unix/sysv/linux/mips/mips32/mips-syscall[567].S).  I don't know if 
you can do that in this case and still get the performance benefits of the 
new instruction.

-- 
Joseph S. Myers
joseph@codesourcery.com
