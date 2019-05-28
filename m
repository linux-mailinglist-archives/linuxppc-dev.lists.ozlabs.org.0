Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F962BCC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 03:17:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CbYS0rgFzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 11:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CbWk27thzDqGp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 11:16:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45CbWg518wz9s3Z;
 Tue, 28 May 2019 11:15:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v2] powerpc/power: Expose pfn_is_nosave prototype
In-Reply-To: <20190524104418.17194-1-malat@debian.org>
References: <20190523114736.30268-1-malat@debian.org>
 <20190524104418.17194-1-malat@debian.org>
Date: Tue, 28 May 2019 11:15:56 +1000
Message-ID: <878surqsz7.fsf@concordia.ellerman.id.au>
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-s390@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Mathieu Malaterre <malat@debian.org>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mathieu Malaterre <malat@debian.org> writes:
> The declaration for pfn_is_nosave is only available in
> kernel/power/power.h. Since this function can be override in arch,
> expose it globally. Having a prototype will make sure to avoid warning
> (sometime treated as error with W=1) such as:
>
>   arch/powerpc/kernel/suspend.c:18:5: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]
>
> This moves the declaration into a globally visible header file and add
> missing include to avoid a warning on powerpc. Also remove the
> duplicated prototypes since not required anymore.
>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
> v2: As suggestion by christophe remove duplicates prototypes
>
>  arch/powerpc/kernel/suspend.c | 1 +
>  arch/s390/kernel/entry.h      | 1 -
>  include/linux/suspend.h       | 1 +
>  kernel/power/power.h          | 2 --
>  4 files changed, 2 insertions(+), 3 deletions(-)

Looks fine to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
