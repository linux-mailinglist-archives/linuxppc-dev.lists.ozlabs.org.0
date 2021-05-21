Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738B38CE69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:53:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmy306P6jz3bx4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 05:53:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BxomQi6B;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BxomQi6B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BxomQi6B; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BxomQi6B; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmy2W2jlFz305w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 05:53:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621626781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rd7aBdUBcJU5e73kh0RzNbu6ZJ9O6h0P4KiP1d1uEE0=;
 b=BxomQi6BLEfKh5wOfhQlWGHthKLtGnu1DqFteP5dp7YiERxo3oN+UsEly4XAJEZRNX5H9/
 YNQHyvJKYvL/U/cx0BZraTYMOpzDp/wvkDTqwP/YsVpUxwESFHIzNmKkUQ1AnRa4dmwbZ9
 UNTIMVr9fdmh873j8ReHvQ36aUWpQrk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621626781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rd7aBdUBcJU5e73kh0RzNbu6ZJ9O6h0P4KiP1d1uEE0=;
 b=BxomQi6BLEfKh5wOfhQlWGHthKLtGnu1DqFteP5dp7YiERxo3oN+UsEly4XAJEZRNX5H9/
 YNQHyvJKYvL/U/cx0BZraTYMOpzDp/wvkDTqwP/YsVpUxwESFHIzNmKkUQ1AnRa4dmwbZ9
 UNTIMVr9fdmh873j8ReHvQ36aUWpQrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-xiODTFq5OL6mKm77bkx2OQ-1; Fri, 21 May 2021 15:52:58 -0400
X-MC-Unique: xiODTFq5OL6mKm77bkx2OQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAEEF801817;
 Fri, 21 May 2021 19:52:56 +0000 (UTC)
Received: from oldenburg.str.redhat.com (ovpn-113-228.ams2.redhat.com
 [10.36.113.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D760119718;
 Fri, 21 May 2021 19:52:53 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Matheus Castanho via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: Linux powerpc new system call instruction and ABI
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none>
 <87a6oo4312.fsf@linux.ibm.com>
Date: Fri, 21 May 2021 21:52:51 +0200
In-Reply-To: <87a6oo4312.fsf@linux.ibm.com> (Matheus Castanho via Libc-alpha's
 message of "Fri, 21 May 2021 16:40:30 -0300")
Message-ID: <87k0nr6ezw.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Matheus Castanho <msc@linux.ibm.com>, linux-api@vger.kernel.org,
 musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Matheus Castanho via Libc-alpha:

> From: Nicholas Piggin <npiggin@gmail.com>
> Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes
>
> When using scv on templated ASM syscalls, current code interprets any
> negative return value as error, but the only valid error codes are in
> the range -4095..-1 according to the ABI.
>
> Reviewed-by: Matheus Castanho <msc@linux.ibm.com>

Please reference bug 27892 in the commit message.  I'd also appreciate a
backport to the 2.33 release branch (where you need to add NEWS manually
to add the bug reference).

Thanks,
Florian

