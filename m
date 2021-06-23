Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F563B13A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 08:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8t3z38Sgz3c22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 16:03:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KMvS4/8b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KMvS4/8b; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8t3X66vgz2yWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 16:03:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8t3W1lFmz9sCD;
 Wed, 23 Jun 2021 16:03:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624428183;
 bh=NUxD5IWRTrB16e837MNcOneqkUUtN5EljoXA6mpYpaE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KMvS4/8b4VKbI66mYHHHYcRI/dKgGxZL5gX2zivwwkxMRfDBmgjx+yW4W/gC0lxxE
 bW3bhnqaEya/Ums/FJ952VC/tTWiJilyInK9Q9BZUnWTcmxeON2/uznwkXh+BWWmxP
 trsdmjqIGi0l2cnrASRjGQ75z2V6wyGTfcaQvcZyjvL4I6yasyZpb/j1rz6+CNnwHB
 n5EKWicVw1JvKDdgCy6d7sCaqa+j/woswtVU6iuGVUJLJBxb8OYWscioeyHJIgAVzE
 gzrExBPc0arXpKQyPd5hHudhoipL4d0v4T1FJxnRN1iy8v9f2ONBcLiZHQcCwj4jKi
 9NbuYcIE3WnPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
In-Reply-To: <YNHbSGzdgQh+6F+O@smile.fi.intel.com>
References: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
 <YNHbSGzdgQh+6F+O@smile.fi.intel.com>
Date: Wed, 23 Jun 2021 16:03:02 +1000
Message-ID: <87r1gt15k9.fsf@mpe.ellerman.id.au>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> On Wed, Jun 16, 2021 at 04:43:03PM +0300, Andy Shevchenko wrote:
>> Parse to and export from UUID own type, before dereferencing.
>> This also fixes wrong comment (Little Endian UUID is something else)
>> and should eliminate the direct strict types assignments.
>
> Any comments on this version? Can it be applied?

Yeah I'll grab it.

cheers
