Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C430B1EEDA5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:10:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dKjJ6JkqzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 08:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mentor.com (client-ip=68.232.137.252; helo=esa4.mentor.iphmx.com;
 envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codesourcery.com
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dKfP00z5zDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 08:08:12 +1000 (AEST)
IronPort-SDR: 5rLPFkDpv2tGo3X3D0J3biFlZ1JRlReofRU3lMYFeoKT2oDoaki5kKrt5Waayeitlupz5lPpIF
 Maw9bjJPHK7Jct6XcWJICMG9qPt3GWaeqQEs9IAr+s7O0sLzlOrjlxurnFDl9Uaa6govwxGLHJ
 ePNowvPe/ALxZup+jM+rdrmhSRFFwBPwddndWsaJikS7njqL0S5pJXmCbn+Q31/oW7WOUel//P
 dCLAGVqKwVLU29fRMyuwmq6lepi8upDH7RuzfKwdTMUbFhCdBUdP7zE3t+HlcfOefsJG2Plb0s
 miQ=
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="49597269"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 04 Jun 2020 14:08:09 -0800
IronPort-SDR: 10Lvn9hMbIgp6Wmv7tGgT/Bb+RFvig0/R1k1fveX5H7Yt2roTj6zgGCC1dp89r/XljPZBd6TNV
 Ylfgb2UMBeVoR3WYnwLk6A5YcMdvGzOClszLxWzKYwoHZ31s2/E4yimjtKTnS8vuBk5kl4vy9K
 41mPdkl1eZFrKFmSEkxp1shYieeZTiKGLjQT+TBX3Tkz2E+OQ9inB98+0gnco8Zd+0wNmY9dG5
 9c4hFdi3/PO+MQK8TUxIjjpcOkxbLfry5T4klJZULKuE+xlfW9/xN+eEkrHml9nS1RolhNufrv
 VCo=
Date: Thu, 4 Jun 2020 22:08:02 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
In-Reply-To: <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2006042154060.8237@digraph.polyomino.org.uk>
References: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, eery@paperfox.es,
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?ISO-8859-15?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Jun 2020, Daniel Kolesa wrote:

> The ELFv2 document specifies things like passing of quadruple precision 
> floats. Indeed, VSX is needed there, but that's not a concern if you 
> *don't* use quadruple precision floats.

My understanding is that the registers used for argument passing are all 
ones that exactly correspond to the Vector registers in earlier 
instruction set versions.  In other words, you could *in principle* 
produce an object, or a whole libm shared library, that (a) passes or 
receives _Float128 values in registers, (b) does not use any instructions 
beyond those available with -mcpu=970, (c) would work as intended whether 
executed on a 970 or on POWER8 and (d) when executed on POWER8, would 
fully interoperate with objects receiving or passing _Float128 values and 
compiled for POWER8 to use VSX instructions for that purpose.  GCC may not 
support _Float128 for older processors, but that doesn't prevent you from 
maintaining patches to add such support.  (But if you want to support 
those 64-bit processors that don't have Vector registers at all, you 
indeed can't use binary128 and interoperate with code using VSX for that 
format in POWER8.)

(Cf. how the Arm hard-float ABI variant works even on processors with 
single-precision-only VFP, because such processors still have the 
double-precision loads and stores although not double-precision 
arithmetic.  When working on that ABI support in GCC some years ago, I 
also made sure that GNU vector types corresponding to NEON vector types 
were passed consistently for the hard-float ABI whether or not any vector 
instructions were present - thus, avoiding depending on the machine modes 
for those vector types because GCC could choose a different machine mode 
depending on the instructions available.)

-- 
Joseph S. Myers
joseph@codesourcery.com
