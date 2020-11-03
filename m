Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC372A4F8F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 20:01:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQfJz56dtzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 06:01:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQfGw16xLzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:59:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQfGv5lyhz8tTk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:59:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQfGv3ybjz9sT6; Wed,  4 Nov 2020 05:59:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by ozlabs.org (Postfix) with ESMTP id 4CQfGt67bVz9sPB
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 05:59:50 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0A3IwUW6030768;
 Tue, 3 Nov 2020 12:58:30 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0A3IwTab030767;
 Tue, 3 Nov 2020 12:58:29 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 3 Nov 2020 12:58:29 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
Message-ID: <20201103185829.GM2672@gate.crashing.org>
References: <20201103132915.529337-1-mpe@ellerman.id.au>
 <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
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
Cc: schwab@linux-m68k.org, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 03, 2020 at 03:43:55PM +0100, Christophe Leroy wrote:
> Le 03/11/2020 à 14:29, Michael Ellerman a écrit :
> >For now though let's just not use asm goto with GCC 4.9, to avoid this
> >bug and any other issues we haven't noticed yet. Possibly in future we
> >can find a smaller workaround.
> 
> Is that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670 ?

That was fixed in 4.8.1 (and all 4.9), so probably not.


Segher
