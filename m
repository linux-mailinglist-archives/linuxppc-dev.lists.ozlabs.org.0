Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06185DBBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:45:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WWA+wJgn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aIZnljk+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfyFS3YS8z3dVD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WWA+wJgn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aIZnljk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfyDd34rRz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708523052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjg3ALQw4zFfCtoxrqU3mC8VARBMiLwWXwoSwpKkxVk=;
	b=WWA+wJgnLDUk370kmYH/LehaT5Ve7heAzmR4VSiu2MrpVJh8BmRE2z/UFKzKRiaOfZgGtD
	A/fOipeYFFzCZGG08IJSMpx57l2knMjOJF0GsqISk6o0vLD1LvuCY7T8cIa5CPRlYZkjeH
	oeEW8XEwxGs2SJZzs2Yr9i27QBSchLo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708523053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjg3ALQw4zFfCtoxrqU3mC8VARBMiLwWXwoSwpKkxVk=;
	b=aIZnljk+vCSqxeaIpaz961ukZJJY3VJEN+npldyYvFBM8HGTodESI0NY5l56qx1muyIDw9
	MWebFQR6n933SSo2PVaxbohVeDhFsJPtA/bbHftb7Ng/ErufnyAZqRtZjPmdC0GbeBPiEP
	oBGIvxMspu7ca6QU7lsisLKpF2L06A0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-viBCBzv1MZWeE0zNlD0FTQ-1; Wed, 21 Feb 2024 08:44:09 -0500
X-MC-Unique: viBCBzv1MZWeE0zNlD0FTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1712C867943;
	Wed, 21 Feb 2024 13:44:08 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A5F2166B36;
	Wed, 21 Feb 2024 13:44:06 +0000 (UTC)
Date: Wed, 21 Feb 2024 21:44:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
Message-ID: <ZdX+JMKsQWheE0B0@MiWiFi-R3L-srv>
References: <20240119145241.769622-1-bhe@redhat.com>
 <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
 <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
 <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/21/24 at 11:15am, Hari Bathini wrote:
> Hi Baoquan,
> 
> On 04/02/24 8:56 am, Baoquan He wrote:
> > > > Hope Hari and Pingfan can help have a look, see if
> > > > it's doable. Now, I make it either have both kexec and crash enabled, or
> > > > disable both of them altogether.
> > > 
> > > Sure. I will take a closer look...
> > Thanks a lot. Please feel free to post patches to make that, or I can do
> > it with your support or suggestion.
> 
> Tested your changes and on top of these changes, came up with the below
> changes to get it working for powerpc:
> 
> 
> https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/
> 
> Please take a look.

I added a comment to the patch 1 consulting if the "struct crash_mem" is
appropriate to cover other cases except of kdump memory regions. I am
wondering if its name need be adjusted, or other kind of memory you
mentioned can use other structures or create a new one.

If it's has to be done like that, it's fine. 

