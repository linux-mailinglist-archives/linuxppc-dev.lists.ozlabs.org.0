Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618B21C019
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 00:47:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3Spq0Pk5zDrJv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 08:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AcEjwilm; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AcEjwilm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3DNs4VQKzDrN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 23:27:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594387635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8A/1vpEmoSOyHkkH6nhIq0DHvbGeWI2fZCwGb0gKD0U=;
 b=AcEjwilm7DLnOVFr+fqkDAPCLhOrdZ1n+NiWATsh5+cVJXT+MmpLXgiRURdTIvQ0fzLtWg
 ZxQo6TD1cR78xGuhfKvJ/DMa58r4sT/C0K2fWlO5pZw+RADLHJ5gh5QaL3lsD+tMJnicH6
 uJT5vFTbsFlpPsodXtn0szOeAK8K3D0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594387635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8A/1vpEmoSOyHkkH6nhIq0DHvbGeWI2fZCwGb0gKD0U=;
 b=AcEjwilm7DLnOVFr+fqkDAPCLhOrdZ1n+NiWATsh5+cVJXT+MmpLXgiRURdTIvQ0fzLtWg
 ZxQo6TD1cR78xGuhfKvJ/DMa58r4sT/C0K2fWlO5pZw+RADLHJ5gh5QaL3lsD+tMJnicH6
 uJT5vFTbsFlpPsodXtn0szOeAK8K3D0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-iB5ik_0TPn-3lfedhmvmhg-1; Fri, 10 Jul 2020 09:27:10 -0400
X-MC-Unique: iB5ik_0TPn-3lfedhmvmhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447AB1092;
 Fri, 10 Jul 2020 13:27:08 +0000 (UTC)
Received: from carbon (unknown [10.40.208.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAD478A4B;
 Fri, 10 Jul 2020 13:27:00 +0000 (UTC)
Date: Fri, 10 Jul 2020 15:26:58 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: generic DMA bypass flag v4
Message-ID: <20200710152658.31a9391a@carbon>
In-Reply-To: <20200708152449.316476-1-hch@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Sat, 11 Jul 2020 08:45:41 +1000
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, brouer@redhat.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  8 Jul 2020 17:24:44 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Note that as-is this breaks the XSK buffer pool, which unfortunately
> poked directly into DMA internals.  A fix for that is already queued
> up in the netdev tree.
>=20
> Jesper and XDP gang: this should not regress any performance as
> the dma-direct calls are now inlined into the out of line DMA mapping
> calls.  But if you can verify the performance numbers that would be
> greatly appreciated.

=46rom a superficial review of the patches, they look okay to me. I don't
have time to run a performance benchmark (before I go on vacation).

I hoped Bj=C3=B6rn could test/benchmark this(?), given (as mentioned) this
also affect XSK / AF_XDP performance.

--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

