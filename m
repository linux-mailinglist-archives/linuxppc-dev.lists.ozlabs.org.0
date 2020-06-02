Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A891EBD61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:53:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49btlz55vCzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 23:53:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49btjD5CPszDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 23:50:40 +1000 (AEST)
IronPort-SDR: oOwOfpJviC8ijcEg2t+DrTikk/geFk+sgHdE8Jpr+6YsI2B9bJ37C6Bcxwha9+blB5b1i5ykgc
 lkGd3a3Gn7XpK2aclhri+hGiFxL4cf/MPlYxc6a+oPMkd1/NCn8PCBCpWwvpxyVvU72YDp5Q5T
 mPPTlK/QBiiBO32O0d84+BByjQXBa5KSS3QBRxMRG8CktBp8NAug6jwLNY/ZV7qjKQE/8F9Fig
 YSUMe64oRAccSpHRksgJsXeaYhcdWLHkDYIqjnP43x75gdvJzpp4ll31gOexb5Xo5jsciES470
 F6U=
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; d="scan'208";a="49491536"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 02 Jun 2020 05:50:38 -0800
IronPort-SDR: Kl6yM6lCvq0PN0MiwjNFOnwLH0vqHbkT+p3K/eCVY62wlxrCKgeay8aruo6BGVZyuwAd5iCEUv
 EPjsdxC+lIuPjI8mPef4z5Zp+6IvF84A8zV0gwALfvh06ajiw92j/ruMo0g35aXikae2SMnXGK
 XgQvAsNs3owm70SGFNoDNjEmLhBDP8wMy8rgCVenE3EW11d1CL+ORdXs6DkkMWlTbwdE9HhnPO
 A5tHkP1GQURAcFGKJ14m6lMViaGwyMKMUzXhX2A+RbWUONMb5yACwMljhgVSLgTQQdf3mX8miQ
 yR4=
Date: Tue, 2 Jun 2020 13:50:32 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: ppc64le and 32-bit LE userland compatibility
In-Reply-To: <20200602021245.GO31009@gate.crashing.org>
Message-ID: <alpine.DEB.2.21.2006021342440.24059@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <20200602021245.GO31009@gate.crashing.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 1 Jun 2020, Segher Boessenkool wrote:

> > The supported glibc ABIs are listed at 
> > <https://sourceware.org/glibc/wiki/ABIList>.
> 
> powerpcle-linux already does work somewhat, and that should also he
> worth something, official or not ;-)
> 
> (It has worked for very many years already...  That is, I have built it
> a lot, I have no idea about running a full distro that way).

Greg McGary's patches as referenced at 
<https://sourceware.org/legacy-ml/libc-hacker/2006-11/msg00013.html> were 
never merged, and I don't know how big the changes to .S files were or if 
they were ever posted.  Many files were subsequently fixed as part of 
bringing up support for powerpc64le, but without actual 32-bit LE testing 
as part of each release cycle there's not much evidence of correctness for 
LE of code not used for powerpc64le.

-- 
Joseph S. Myers
joseph@codesourcery.com
