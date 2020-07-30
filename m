Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 976902335BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 17:41:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHZPk60xKzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 01:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=vdronov@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=OGsGhXCx; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OGsGhXCx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHZGF36LBzDr5k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 01:34:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596123265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghDMhL6A2KNLEilKh/KJ4TUbwSrfsjv+yDVIoZhA6qw=;
 b=OGsGhXCxWAjhXZ+oFNOzbW5cNot8QTcfpvyt9z9fDkD9Ef7qHBEYP1/1EJJ4WVhBVIUgq0
 25UmpqoJ8bCnfRdj0VsLZLQ4726sefiX0j8q3CjEVqt+C7rTz8kOFlq+oNlq0tk5Dqg0Ee
 oWUelarRh8bRiNn5cvmERvA8djSMypM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596123265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghDMhL6A2KNLEilKh/KJ4TUbwSrfsjv+yDVIoZhA6qw=;
 b=OGsGhXCxWAjhXZ+oFNOzbW5cNot8QTcfpvyt9z9fDkD9Ef7qHBEYP1/1EJJ4WVhBVIUgq0
 25UmpqoJ8bCnfRdj0VsLZLQ4726sefiX0j8q3CjEVqt+C7rTz8kOFlq+oNlq0tk5Dqg0Ee
 oWUelarRh8bRiNn5cvmERvA8djSMypM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-_DUX7MZhOA-VCkkh1Qrrpg-1; Thu, 30 Jul 2020 11:34:19 -0400
X-MC-Unique: _DUX7MZhOA-VCkkh1Qrrpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC8D5100CCC3;
 Thu, 30 Jul 2020 15:34:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7795287E00;
 Thu, 30 Jul 2020 15:34:17 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12BC395A72;
 Thu, 30 Jul 2020 15:34:16 +0000 (UTC)
Date: Thu, 30 Jul 2020 11:34:16 -0400 (EDT)
From: Vladis Dronov <vdronov@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <842212692.9780293.1596123256621.JavaMail.zimbra@redhat.com>
In-Reply-To: <87ft995hv8.fsf@mpe.ellerman.id.au>
References: <20200729133741.62789-1-vdronov@redhat.com>
 <20200729144949.GF17447@gate.crashing.org>
 <584129967.9672326.1596051896801.JavaMail.zimbra@redhat.com>
 <20200729224427.GI17447@gate.crashing.org>
 <87ft995hv8.fsf@mpe.ellerman.id.au>
Subject: Re: [PATCH] powerpc: fix function annotations to avoid section
 mismatch warnings with gcc-10
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.208.60, 10.4.195.18]
Thread-Topic: powerpc: fix function annotations to avoid section mismatch
 warnings with gcc-10
Thread-Index: rKp81qyk4KEAfYe/qAP0qUT6DQV0IQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello, Michael,

----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> Subject: Re: [PATCH] powerpc: fix function annotations to avoid section mismatch warnings with gcc-10
> 
...
> >> > So what changed?  These functions were inlined with older compilers, but
> >> > not anymore?
> >> 
> >> Yes, exactly. Gcc-10 does not inline them anymore. If this is because of
> >> my
> >> build system, this can happen to others also.
> >> 
> >> The same thing was fixed by Linus in e99332e7b4cd ("gcc-10: mark more
> >> functions
> >> __init to avoid section mismatch warnings").
> >
> > It sounds like this is part of "-finline-functions was retuned" on
> > <https://gcc.gnu.org/gcc-10/changes.html>?  So everyone should see it
> > (no matter what config or build system), and it is a good thing too :-)
> 
> I haven't seen it in my GCC 10 builds, so there must be some other
> subtlety. Probably it depends on details of the .config.
> 

I've just had this building the latest upstream for the ppc64le with a derivative
of the RHEL-8 config. This can probably be a compiler/linker setting, like -O2
versus -O3.

> cheers

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

