Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B319A37E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 04:18:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sVH14QC6zDqS1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:18:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sVDk5Vj9zDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 13:16:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=W4gWmzY+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48sVDj1rJCz9sSM;
 Wed,  1 Apr 2020 13:16:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585707381;
 bh=6H4dJVI9SZD7xHWGgoeySLOGZhVXjnt00eYoMPTKebI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=W4gWmzY+y/WMKE7YTdt0643Yql+sIBSKLoyp1fQhPwJGYPXwwJrnUE3ZOrVpYI1Td
 ur+5K1IzUkvFPwx+VF/iKQbxL2rR/te8JrfODxsWvPnJN+QejX3/V/XmaoylMBtj+A
 +yo2YZO9B2rdynITB+dOFOq4Zkr6H0LKNDB4vmXD5QIeJOmYVCZuJqEg9n1LglsuN7
 E1GHIi+fN0JntV36kZfV/xFMZd3O1Zxkh5FCbU7pF3EL9nv+IkfaBDf3Pw+GAkgyZR
 wiNmuIpT98WgG6yiE8RVaqwUynS6KnW3JuqCDwDYd6bM7Cw4TWJBAXhKPIfKU8AFB0
 3DrD7TWrE18hg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 07/11] powerpc/xmon: Remove PPC403 and PPC405
In-Reply-To: <CAK8P3a2Q5gmcyjo03QoDMNO-xEWXDjhW8ScUsGGRWVKgVXj5_g@mail.gmail.com>
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <38de0c6caceb052a23e039378dc491fe66cea371.1585640942.git.christophe.leroy@c-s.fr>
 <CAK8P3a2Q5gmcyjo03QoDMNO-xEWXDjhW8ScUsGGRWVKgVXj5_g@mail.gmail.com>
Date: Wed, 01 Apr 2020 13:16:30 +1100
Message-ID: <87ftdouf0h.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@arndb.de> writes:
> On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> xmon has special support for PPC403 and PPC405 which were part
>> of 40x platforms.
>>
>> 40x platforms are gone, remove support of PPC403 and PPC405 in xmon.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>  arch/powerpc/xmon/ppc-opc.c | 277 +++++++-----------------------------
>>  arch/powerpc/xmon/ppc.h     |   6 -
>
> These files are from binutils, and may get synchronized with changes there
> in the future. I'd suggest leaving the code in here for now and instead removing
> it from the binutils version first, if they are ready to drop it, too.

Yes those files are almost direct copies of the binutils versions, and
we'd like to keep it that way to ease future synchronisation of changes.

cheers
