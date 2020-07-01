Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9B210583
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:54:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xYQY3jfMzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xYGW3TgRzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QVzKMrrX; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49xYGV72bMz8tX8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:47:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49xYGV6NCsz9sTY; Wed,  1 Jul 2020 17:47:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=dyoung@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QVzKMrrX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49xYGV2K4fz9sTT
 for <linuxppc-dev@ozlabs.org>; Wed,  1 Jul 2020 17:47:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593589631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0tbbv2fepFy6ZwkJj/rSA//He2y/6egv4GB/rgFFdc=;
 b=QVzKMrrXm/Fb3CAFPguJZw066pnKM6uTaU1spuyiGoRn7K3Vn0yuPEZfzDmEWj1PIGPRPx
 T+myXSIKHY101PKeqNf9p7mqyn9gOnrDVjtgLdmlP5vHmXOGaW1pMebdZJXPrdJPklNGLF
 chFN2e+ozVSNALyTDuCQlKUtsmyxEgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-EYag6ONJPzizDK3-Oe3Y8g-1; Wed, 01 Jul 2020 03:47:09 -0400
X-MC-Unique: EYag6ONJPzizDK3-Oe3Y8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE60107ACCA;
 Wed,  1 Jul 2020 07:47:07 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-207.pek2.redhat.com
 [10.72.12.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E93B3A7E;
 Wed,  1 Jul 2020 07:47:02 +0000 (UTC)
Date: Wed, 1 Jul 2020 15:46:59 +0800
From: Dave Young <dyoung@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
Message-ID: <20200701074659.GA3878@dhcp-128-65.nay.redhat.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
 <20200629133933.0787f562@ezekiel.suse.cz>
 <7981ae61-26c6-000c-9ee4-382dab3eecab@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7981ae61-26c6-000c-9ee4-382dab3eecab@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/29/20 at 05:26pm, Hari Bathini wrote:
> Hi Petr,
> 
> On 29/06/20 5:09 pm, Petr Tesarik wrote:
> > Hi Hari,
> > 
> > is there any good reason to add two more functions with a very similar
> > name to an existing function? AFAICS all you need is a way to call a
> > PPC64-specific function from within kexec_add_buffer (PATCH 4/11), so
> > you could add something like this:
> > 
> > int __weak arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
> > {
> > 	return 0;
> > }
> > 
> > Call this function from kexec_add_buffer where appropriate and then
> > override it for PPC64 (it roughly corresponds to your
> > kexec_locate_mem_hole_ppc64() from PATCH 4/11).
> > 
> > FWIW it would make it easier for me to follow the resulting code.
> 
> Right, Petr.
> 
> I was trying out a few things before I ended up with what I sent here.
> Bu yeah.. I did realize arch_kexec_locate_mem_hole() would have been better
> after sending out v1. Will take care of that in v2.

Another way is use arch private function to locate mem hole, then set
kbuf->mem, and then call kexec_add_buf, it will skip the common locate
hole function.

But other than that I have some confusion about those excluded ranges.
Replied a question to patch 4.

Thanks
Dave

