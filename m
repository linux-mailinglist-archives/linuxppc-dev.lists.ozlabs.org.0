Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0F2216BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 23:02:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6VFN08yYzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 07:02:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6VCT0SK0zDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 07:00:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=d63s8WY9; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B6VCR6BX1z9sRK;
 Thu, 16 Jul 2020 07:00:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594846836; bh=XhVOLxVfBnZHiqAzYmWw8Uh1CSzj1P31KTli2xRb354=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d63s8WY9YdmG8OcOJoUzQnG/7jA4CRVQ6QoIe9zm+7/ovknSCXhdnedTo8WTvrXJy
 5Y53uQAvQT7H+VBHknt5fN7ADotqI0eAK20gEa0x75ltvJkNKBsyXLrDFgiQDKqrgI
 XXQaUhkF/mlgFeal+mUmE5Ur41MkJJRwZ6kDSvivWH+5Fu69YLrYuTORmJinRrzW8R
 V1Co8+MIskr8YkWp3XbardgAkbJGapuVVjSChkHkivBK67hEkMlL3zTU3q5dbQtz8V
 p5gSKFPuDTMGTrVK1bBHZ6skdlvd9JolxxAfdkf0WrNLsoMMyHCg++wOiyfMyd1XTk
 58FUc/jjrRYyA==
Date: Thu, 16 Jul 2020 07:00:34 +1000
From: Anton Blanchard <anton@ozlabs.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] pseries: Fix 64 bit logical memory block panic
Message-ID: <20200716070034.344e3d7d@kryten.localdomain>
In-Reply-To: <87d04x3q6m.fsf@linux.ibm.com>
References: <20200715000820.1255764-1-anton@ozlabs.org>
 <87d04x3q6m.fsf@linux.ibm.com>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: nathanl@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

> > Booting with a 4GB LMB size causes us to panic:
> >
> >   qemu-system-ppc64: OS terminated: OS panic:
> >       Memory block size not suitable: 0x0
> >
> > Fix pseries_memory_block_size() to handle 64 bit LMBs.

> We need similar changes at more places?

I agree. I wanted to get a minimal and tested fix (using QEMU) that
could make it into stable, so that the distros will at least boot.

Thanks,
Anton
