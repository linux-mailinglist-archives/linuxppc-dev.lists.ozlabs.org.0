Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB182B9A86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 19:24:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcSkW3CbHzDqll
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 05:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SMr5y3ef; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMr5y3ef; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcShg1VW4zDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 05:22:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605810160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKsj/vAB3tyYOTY5WM4AqOsn+OP/VuYRxWPQE9QnHUA=;
 b=SMr5y3efZVLZQxvMTbhD/8z+pTKGA6sHP1xWKlizLv8tpvtm7jCuj1AGKOr+ViXvbtgWVo
 T0AkZCijN/hTbgQsYg29O8srmMxi96yfZysJ5GzHuE9YAAesyM8QltMpgFMDHpzhOlWGWR
 ZChRlCXwsuz5/JNPrCq/LbUE47zWjcs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605810160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKsj/vAB3tyYOTY5WM4AqOsn+OP/VuYRxWPQE9QnHUA=;
 b=SMr5y3efZVLZQxvMTbhD/8z+pTKGA6sHP1xWKlizLv8tpvtm7jCuj1AGKOr+ViXvbtgWVo
 T0AkZCijN/hTbgQsYg29O8srmMxi96yfZysJ5GzHuE9YAAesyM8QltMpgFMDHpzhOlWGWR
 ZChRlCXwsuz5/JNPrCq/LbUE47zWjcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-UJ7j9u_7MQucV0NIpAtEiA-1; Thu, 19 Nov 2020 13:22:37 -0500
X-MC-Unique: UJ7j9u_7MQucV0NIpAtEiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C889680EFA8;
 Thu, 19 Nov 2020 18:22:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.164])
 by smtp.corp.redhat.com (Postfix) with SMTP id 078855D9C2;
 Thu, 19 Nov 2020 18:22:26 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 19 Nov 2020 19:22:29 +0100 (CET)
Date: Thu, 19 Nov 2020 19:22:25 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 0/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
Message-ID: <20201119182225.GB5138@redhat.com>
References: <20201119160154.GA5183@redhat.com>
 <d7c3ed05-b7e7-fac0-871f-4c43c1a7e90c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7c3ed05-b7e7-fac0-871f-4c43c1a7e90c@csgroup.eu>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/19, Christophe Leroy wrote:
>
>
> Le 19/11/2020 à 17:01, Oleg Nesterov a écrit :
> >Can we finally fix this problem? ;)
> >
> >My previous attempt was ignored, see
>
> That doesn't seems right.
>
> Michael made some suggestion it seems, can you respond to it ?

I did, see https://lore.kernel.org/lkml/20200611105830.GB12500@redhat.com/

> >Sorry, uncompiled/untested, I don't have a ppc machine.
>
> I compiled with ppc64_defconfig, that seems ok. Still untested.

Thanks.

Oleg.

