Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739C1EBD3E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:43:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49btY94mZpzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 23:43:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mentor.com (client-ip=68.232.137.180; helo=esa3.mentor.iphmx.com;
 envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codesourcery.com
X-Greylist: delayed 64 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Jun 2020 23:41:36 AEST
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49btVm2VjGzDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 23:41:35 +1000 (AEST)
IronPort-SDR: 3EdSmWQZ4axAch8w6Hh0EVgpTCagEy+8WsNBW95cd8pm4KMynLxVxf9q5X3OksYUIYOyAzCEhQ
 DCwI/yKTAnykzd5R7sMBI0SdvV6cVmMvDrKCyhAClp5VYdy4DaFtX0fgidOnte6fnDsMpvUXht
 GpNzbbitQJK565uyXW/zpItxTf6+j60tBoHSTFcyH85KpFfh4ccoAHcu9z9TjYuD5wACSrkjK9
 6C/aBNUAyADtpILmcDi6TI/8TXaOEK6bK4j7lFHOvCBoME9EIDAXcIoZW8PV2PY3iVkZKV2Xz8
 1/o=
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; d="scan'208";a="49421784"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 02 Jun 2020 05:40:29 -0800
IronPort-SDR: XB+pHlUzEJfW0mVPgJEg/y3yWdx9vPyAmlpwaAmE7GtOPhVrPm6J7EVQ3imDvwV2Es0FwXCa3m
 u7u87i1xRI56wQGZKELsTSLqqrkI2I+kWMK9559yXV0jlmWtfwEPgq6C3y6xXwz8gsrLgz4LMr
 5VP7Z8rn2q43gwB0xceUVnzNXiBCR5wOECy9tYaRnjYcqL7lp0TCwe37PPzbU5JI8TJYsTq07K
 Wly8tlLBpXTJM5BnOZ+JO55hgVfNnTDqV+b4xci9MHTCUzUGEHAjFwpklfLE/JyFsF15DqL1Xc
 ros=
Date: Tue, 2 Jun 2020 13:40:23 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: ppc64le and 32-bit LE userland compatibility
In-Reply-To: <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
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

> not be limited to being just userspace under ppc64le, but should be 
> runnable on a native kernel as well, which should not be limited to any 
> particular baseline other than just PowerPC.

This is a fairly unusual approach to bringing up a new ABI.  Since new 
ABIs are more likely to be used on new systems rather than switching ABI 
on an existing installation, and since it can take quite some time for all 
the software support for a new ABI to become widely available in 
distributions, people developing new ABIs are likely to think about what 
new systems are going to be relevant in a few years' time when working out 
the minimum hardware requirements for the new ABI.  (The POWER8 minimum 
for powerpc64le fits in with that, for example.)

> either the AIX/ELFv1 nor the ELFv2 ABIs) If we were to introduce new 
> ports, what would those use? ld64.so.3 for BE/v2? ld.so.2 for LE/32-bit? 

Rather than relying on numbers such as "3" or 2" in a particular place 
being unique across all (architecture, ABI) pairs supported by glibc, 
something more obviously specific to a particular architecture and ABI, 
e.g. ld-linux-powerpc64be-elfv2.so.1, would be better.

-- 
Joseph S. Myers
joseph@codesourcery.com
