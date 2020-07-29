Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B341232591
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH3vl6y2fzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 05:46:43 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=ZshDFbz6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZshDFbz6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH3sv1llBzDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 05:45:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596051903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7z1AY2t0xVMFaqXFaJYLyjBDKoQlP/P9rKVEKHnmX5U=;
 b=ZshDFbz628fHz3n1QB+GNi0ymK0gKmt9cA58WE36Ye0l1drmnejYi5cC98gdPP2WxjuqKm
 Q32cYF+NU3iTw672b1YNCPmN4WmN2RrrrWPY8A4M5RWFQsCf4t65I4CqH6qhxXCB2r+I4Q
 IMSzeyz34UUoktKjz0UISO/Wkozj1gs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596051903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7z1AY2t0xVMFaqXFaJYLyjBDKoQlP/P9rKVEKHnmX5U=;
 b=ZshDFbz628fHz3n1QB+GNi0ymK0gKmt9cA58WE36Ye0l1drmnejYi5cC98gdPP2WxjuqKm
 Q32cYF+NU3iTw672b1YNCPmN4WmN2RrrrWPY8A4M5RWFQsCf4t65I4CqH6qhxXCB2r+I4Q
 IMSzeyz34UUoktKjz0UISO/Wkozj1gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-bjWEZW4vPRGZoxxKoe7oBQ-1; Wed, 29 Jul 2020 15:44:58 -0400
X-MC-Unique: bjWEZW4vPRGZoxxKoe7oBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC351005510;
 Wed, 29 Jul 2020 19:44:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 538925C6C0;
 Wed, 29 Jul 2020 19:44:57 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0326E95A71;
 Wed, 29 Jul 2020 19:44:56 +0000 (UTC)
Date: Wed, 29 Jul 2020 15:44:56 -0400 (EDT)
From: Vladis Dronov <vdronov@redhat.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <584129967.9672326.1596051896801.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200729144949.GF17447@gate.crashing.org>
References: <20200729133741.62789-1-vdronov@redhat.com>
 <20200729144949.GF17447@gate.crashing.org>
Subject: Re: [PATCH] powerpc: fix function annotations to avoid section
 mismatch warnings with gcc-10
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.208.54, 10.4.195.13]
Thread-Topic: powerpc: fix function annotations to avoid section mismatch
 warnings with gcc-10
Thread-Index: L6p0OSsHibJ5uHFDmtRNk3Gpgu4Drg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

----- Original Message -----
> From: "Segher Boessenkool" <segher@kernel.crashing.org>
> To: "Vladis Dronov" <vdronov@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
> "Paul Mackerras" <paulus@samba.org>
> Sent: Wednesday, July 29, 2020 4:49:49 PM
> Subject: Re: [PATCH] powerpc: fix function annotations to avoid section mismatch warnings with gcc-10
> 
> On Wed, Jul 29, 2020 at 03:37:41PM +0200, Vladis Dronov wrote:
> > Certain warnings are emitted for powerpc code when building with a gcc-10
> > toolset:
> > 
> >     WARNING: modpost: vmlinux.o(.text.unlikely+0x377c): Section mismatch in
> >     reference from the function remove_pmd_table() to the function
> >     .meminit.text:split_kernel_mapping()
> >     The function remove_pmd_table() references
> >     the function __meminit split_kernel_mapping().
> >     This is often because remove_pmd_table lacks a __meminit
> >     annotation or the annotation of split_kernel_mapping is wrong.
> > 
> > Add the appropriate __init and __meminit annotations to make modpost not
> > complain. In all the cases there are just a single callsite from another
> > __init or __meminit function:
> > 
> > __meminit remove_pagetable() -> remove_pud_table() -> remove_pmd_table()
> > __init prom_init() -> setup_secure_guest()
> > __init xive_spapr_init() -> xive_spapr_disabled()
> 
> So what changed?  These functions were inlined with older compilers, but
> not anymore?

Yes, exactly. Gcc-10 does not inline them anymore. If this is because of my
build system, this can happen to others also.

The same thing was fixed by Linus in e99332e7b4cd ("gcc-10: mark more functions
__init to avoid section mismatch warnings").

> 
> Segher

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

