Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D407C32F2DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 19:39:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc3V6Q9jz3dG5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 05:39:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dsc395zG3z30NC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 05:39:33 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 125IZHLo027274;
 Fri, 5 Mar 2021 12:35:17 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 125IZGLm027273;
 Fri, 5 Mar 2021 12:35:16 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 5 Mar 2021 12:35:16 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/7] cmdline: Add generic function to build command
 line.
Message-ID: <20210305183516.GY29191@gate.crashing.org>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <d8cf7979ad986de45301b39a757c268d9df19f35.1614705851.git.christophe.leroy@csgroup.eu>
 <20210303172810.GA19713@willie-the-truck>
 <a0cfef11-efba-2e5c-6f58-ed63a2c3bfa0@csgroup.eu>
 <20210303174627.GC19713@willie-the-truck>
 <dc6576ac-44ff-7db4-d718-7565b83f50b8@csgroup.eu>
 <20210303181651.GE19713@willie-the-truck> <87sg59rewl.fsf@mpe.ellerman.id.au>
 <11d7af27-28cb-0eed-0f33-6669cbf7f1bb@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11d7af27-28cb-0eed-0f33-6669cbf7f1bb@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, robh@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 05, 2021 at 01:49:03PM +0100, Christophe Leroy wrote:
> Le 05/03/2021 à 12:58, Michael Ellerman a écrit :
> >prom_init runs as an OF client, with the MMU off (except on some Apple
> >machines), and we don't own the MMU. So there's really nothing we can do :)
> >
> >Though now that I look at it, I don't think we should be doing this
> >level of commandline handling in prom_init. It should just grab the
> >value from firmware and pass it to the kernel proper, and then all the
> >prepend/append/force etc. logic should happen there.
> 
> But then, how do you handle the command line parameters that are needed by 
> prom_init ?
> 
> For instance, prom_init_mem() use 'prom_memory_limit', which comes from the 
> "mem=" option in the command line.

*Reading* it is easy, much easier than modifying it.


Segher
