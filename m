Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 968EF2CE045
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 22:01:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn7Y6304JzDrGn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 08:01:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=qcai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=b6XdSoXp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SWleDJ1y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn4fY2GhfzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 05:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607021441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6p8rVdh9ezFweEqxvisvZj8ACIgw1zD41n+1vya4EZg=;
 b=b6XdSoXplpflT3nBaIPkAzP+t+hZ8Vm5MkvUMCX6XEQdO2XTZX9DL7hYknwBjDb9c5V2xn
 vBZNOxUwBb9O01KqPDKfmdbbSWUE0LkRqdGrSl6qFLUxiAY8Tr0zPOW+zoM2ZunQPL6Rbx
 hTWyq4zk5JTfkZZ7oaLUjf4MsmXGk5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607021442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6p8rVdh9ezFweEqxvisvZj8ACIgw1zD41n+1vya4EZg=;
 b=SWleDJ1yRSmjUNzglE1NmFe1cArCbXWwi2JQ4XIIA79HmhefYKg9+ks3zsyBX7D/o9k+tf
 wRnEylIip4vPz3LdTajD+hbYqnquxrG7cbUOAtSXEt4mf4eQHK2t6MQOgZrgGWxBSrDBR9
 oo6EBua+Hm4q6jOs3Jw4R8hkQYBcm5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299--Lo5vf_dPXWu2SCV7cZDcg-1; Thu, 03 Dec 2020 13:50:39 -0500
X-MC-Unique: -Lo5vf_dPXWu2SCV7cZDcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F69612A4;
 Thu,  3 Dec 2020 18:50:37 +0000 (UTC)
Received: from ovpn-66-132.rdu2.redhat.com (unknown [10.10.67.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 491B01A8A3;
 Thu,  3 Dec 2020 18:50:36 +0000 (UTC)
Message-ID: <da02e10d6b5a63dc10159d4420def15aa0bc4c19.camel@redhat.com>
Subject: Re: [PATCH 3/7] powerpc/64s: flush L1D after user accesses
From: Qian Cai <qcai@redhat.com>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 03 Dec 2020 13:50:35 -0500
In-Reply-To: <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
References: <20201119231333.361771-1-dja@axtens.net>
 <20201119231333.361771-4-dja@axtens.net>
 <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=qcai@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 04 Dec 2020 07:56:02 +1100
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
Cc: cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-12-03 at 12:17 -0500, Qian Cai wrote:
> []
> > +static inline bool
> > +bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
> > +{
> > +	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
> > +		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
> > +		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
> > +}
> 
> A simple "echo t > /proc/sysrq-trigger" will trigger this warning almost
> endlessly on POWER9 NV.

I have just realized the patch just moved this warning around, so the issue was
pre-existent. Since I have not tested sysrq-t regularly, I am not sure when it
started to break. So far, I have reverted some of those for testing which did
not help, i.e., the sysrq-t issue remains.

16852975f0f  Revert "powerpc/64s: Use early_mmu_has_feature() in set_kuap()"
129e240ead32 Revert "powerpc: Implement user_access_save() and user_access_restore()"
edb0046c842c Revert "powerpc/64s/kuap: Add missing isync to KUAP restore paths"
2d46ee87ce44 Revert "powerpc/64/kuap: Conditionally restore AMR in interrupt exit"
c1e0e805fc57 Revert "powerpc/64s/kuap: Conditionally restore AMR in kuap_restore_amr asm"
7f30b7aaf23a Revert "selftests/powerpc: rfi_flush: disable entry flush if present"
bc9b9967a100 Revert "powerpc/64s: flush L1D on kernel entry"
b77e7b54f5eb Revert "powerpc/64s: flush L1D after user accesses"
22dddf532c64 Revert "powerpc: Only include kup-radix.h for 64-bit Book3S"
2679d155c46a Revert "selftests/powerpc: entry flush test"
87954b9b4243 Revert "selftests/powerpc: refactor entry and rfi_flush tests"
342d82bd4c5d Revert "powerpc/64s: rename pnv|pseries_setup_rfi_flush to _setup_security_mitigations"

