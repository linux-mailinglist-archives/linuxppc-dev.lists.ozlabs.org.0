Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AEE5C705
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 04:18:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45d7F14j4JzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 12:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45d7CR5fX6zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 12:16:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45d7CR1BCvz9s3Z;
 Tue,  2 Jul 2019 12:16:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: retry when cpu offline races with
 suspend/migration
In-Reply-To: <87blyds8tu.fsf@linux.ibm.com>
References: <20190621060518.29616-1-nathanl@linux.ibm.com>
 <87blyds8tu.fsf@linux.ibm.com>
Date: Tue, 02 Jul 2019 12:16:34 +1000
Message-ID: <87v9wli3jx.fsf@concordia.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, mmc@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, julietk@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Hi Michael,
>
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> The protocol for suspending or migrating an LPAR requires all present
>> processor threads to enter H_JOIN. So if we have threads offline, we
>> have to temporarily bring them up. This can race with administrator
>> actions such as SMT state changes. As of dfd718a2ed1f ("powerpc/rtas:
>> Fix a potential race between CPU-Offline & Migration"),
>
> snowpatch/checkpatch flagged an error in my commit message here:
>
>   ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit
>   <12+ chars of sha1> ("<title line>")' - ie: 'commit dfd718a2ed1f
>   ("powerpc/rtas: Fix a potential race between CPU-Offline &
>   Migration")'
>
> I see this is in your next-test branch though. Should I fix the commit
> message and resend?

No that's fine.

You have a Fixes tag which is formatted correctly and that's what
matters IMO.

Ideally we could control that check to not complain about it being split
across lines when there's a fixes tag as well.

cheers
