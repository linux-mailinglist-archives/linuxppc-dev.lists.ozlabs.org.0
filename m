Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639515326DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 11:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6qJ01zcTz3byY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNkIBPnY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQG6Waka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KNkIBPnY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQG6Waka; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6qHK2c7kz306M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:52:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653385927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxpTtBcAtLU7r3o+c7ZTUOtNOGtPG+TxJcZeMbIa8E4=;
 b=KNkIBPnY/UXvrLg4P5TUDJJAypudUm1yfhcWO/NKxdyDWbEQklJSUqQEGTm/hRkvprVZrg
 8GCj0ScZ8ktycJgDHHNXQLGfBE7H83sNF7wmjsPfJ5mq56Wl+R1FmmIlPDAjOnxoiB8X6q
 vmtcnRaJ/EQo3nC0WNe9RLt3ofCnUFI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653385928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxpTtBcAtLU7r3o+c7ZTUOtNOGtPG+TxJcZeMbIa8E4=;
 b=XQG6Waka4dwMZf2nkp/qEEONf5u8Hft+eT6yLK4JjK53cjTD9UE6hC30mwPoXx4HbEv0HR
 fLSL/jYUrdp00a3xjnY0YAsWE478xDPv6yjabDNT+DD0dvYJh9q/0vE0BlqYB29i7qdMP4
 4UPATI43spgIW/fSHXpawGPUdUGKwpc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-s0IbF0sePq61O3CWu5DCUw-1; Tue, 24 May 2022 05:52:03 -0400
X-MC-Unique: s0IbF0sePq61O3CWu5DCUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46E2F299E763;
 Tue, 24 May 2022 09:52:03 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4BB492C3B;
 Tue, 24 May 2022 09:52:01 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
References: <20220524093828.505575-1-npiggin@gmail.com>
Date: Tue, 24 May 2022 11:52:00 +0200
In-Reply-To: <20220524093828.505575-1-npiggin@gmail.com> (Nicholas Piggin's
 message of "Tue, 24 May 2022 19:38:28 +1000")
Message-ID: <87ee0juukf.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin:

> +2. Facilities
> +-------------
> +The Power ISA uses the term "facility" to describe a class of instructions,
> +registers, interrupts, etc. The presence or absence of a facility indicates
> +whether this class is available to be used, but the specifics depend on the
> +ISA version. For example, if the VSX facility is available, the VSX
> +instructions that can be used differ between the v3.0B and v3.1B ISA
> +verstions.

The 2.07 ISA manual also has categories.  ISA 3.0 made a lot of things
mandatory.  It may make sense to clarify that feature bits for mandatory
aspects of the ISA are still set, to help with backwards compatibility.

Thanks,
Florian

