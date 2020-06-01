Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F01EB259
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 01:47:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bX0N1RSpzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 09:47:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mentor.com (client-ip=68.232.129.153; helo=esa1.mentor.iphmx.com;
 envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codesourcery.com
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bWyd2n4JzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 09:46:00 +1000 (AEST)
IronPort-SDR: er4cJfmlV3xs8rNIgbO5r/BvW7w1/pCOtBGyXVZxyvYSMA8mrtRe6UAOA6tUZruIILFzhNT3SC
 EZyUg8NelIpN7GRvSi6xJsOv4roP4NOVyZzUO3xKwENMRrXeZyC18MpcR38Rqa84tTV3YydFO3
 Ucwy8HLQnxoM3QrSNWoxN6IFLqtZty9EEMJHOOh4Bn9cLVJwND7B0Xj2ualC/qtmhxFneRVmR+
 CC1r4mlEr92IzAfsAger0GdT6T7Yi7FVcWi7Da1o64bdWbtLAZ0zHP7/eiR6hx/fW1/2wUU8tr
 wyQ=
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; d="scan'208";a="51456614"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 01 Jun 2020 15:45:57 -0800
IronPort-SDR: U8xvQsw8q+AP8rcpT0UOMFPVnnVThZmAAGPNM9seGF+20dWTAXtdNtV+qe56cTrvi5KX9anyNh
 Q8JAj0iS6c1YwAc3gBAjoUn9HMBUnfCSaFXboSBY7iFxlzCnYgqVJXdcpGD+69fSO4hPfdV2pZ
 rNaxYgx8GHVeFYXFLd6JGlGwdVwFWCgQcGi0KbjhFR4wdXwB16VJTa1PauQgmC8thsTNF1Cdxa
 4h/ZsDWbg6CkbUb7PDlR+u7SggN39bXnRA3gNzrL5TEFBcn/C4MI53J0ulGzGcM/AXqngIcvgf
 FJc=
Date: Mon, 1 Jun 2020 23:45:51 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: ppc64le and 32-bit LE userland compatibility
In-Reply-To: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020, Daniel Kolesa wrote:

> Are you sure this would be a new port? Glibc already works in this 
> combination, as it seems to me it'd be best if it was just a variant of 
> the existing 32-bit PowerPC port, sharing most conventions besides 
> endianness with the BE port.

The supported glibc ABIs are listed at 
<https://sourceware.org/glibc/wiki/ABIList>.  This would be a new ABI, 
which should have a new ABI-and-architecture-specific dynamic linker name 
(all new ports are expected to have a unique dynamic linker name for each 
ABI, to support systems using multiarch directory arrangements), new 
symbol versions and avoid legacy features such as 32-bit time or offsets 
or IBM long double.

> 128-bit IEEE long double would not work, since that relies on VSX being 
> present (gcc will explicitly complain if it's not). I'd be all for using 

The minimum supported architecture for powerpc64le (POWER8) has VSX.  My 
understanding was that the suggestion was for 32-bit userspace to run 
under powerpc64le kernels running on POWER8 or later, meaning that such a 
32-bit LE port, and any ABI designed for such a port, can assume VSX is 
available.  Or does VSX not work, at the hardware level, for 32-bit 
POWER8?  (In which case you could pick another ABI for binary128 argument 
passing and return.)

> There is also one more thing while we're at this. The 64-bit big endian 
> Void port uses the ELFv2 ABI, even on glibc. This is not officially 
> supported on glibc as far as I can tell, but it does work out of box, 
> without any patching (things in general match little endian then, i.e. 
> ld64.so.2 etc, but they're big endian). Is there any chance of making 
> that support official?

If you want to support ELFv2 for 64-bit big endian in glibc, again that 
should have a unique dynamic linker name, new symbol versions, only 
binary128 long double, etc. - avoid all the legacy aspects of the existing 
ELFv1 port rather than selectively saying that "ELFv1" itself is the only 
legacy aspect and keeping the others (when it's the others that are 
actually more problematic in glibc).

-- 
Joseph S. Myers
joseph@codesourcery.com
