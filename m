Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C8790E17
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 23:07:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=q+3FquAm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rf4921Fjnz3c58
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 07:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=q+3FquAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rf48955hMz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 07:06:47 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Rf47y6CF9z9sl9;
	Sun,  3 Sep 2023 23:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1693775198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cByUbwSlMR7dvpZFyGVaYniTMc0wsKAg0Y/ykzouZbc=;
	b=q+3FquAmQs+a+YouYHo+RtIPgZKKz/Bc0GDnlt98OLZNtTdX8kESFRfNEst5KEOHaHEEdv
	dMdMDChBpz28k1sV5XrizW6Ulj61m5zcub2nay+cQUS4kVkfdfKm2fuhYF2Pjxt4yPL6ra
	UI3elmUwNE4Z70+NGEFbE3Aa69oOfM/HDYwVspuQabGoqzrowimCSGdSEEuk0gPuwt7nV+
	/5UEP5RFYw+148PuzltUv6lrJ4v+b9ZbB1nbBvKWYX7LgUEQi525rBcMBm2UZ14dl8K2Kd
	qdpF55Dfi0aVFAg3clNfJJzckZ19FfgEJaSOEyXs+O0NzYyErjzKgoFmUJ48lw==
Date: Sun, 3 Sep 2023 23:06:35 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230903230635.5751b620@yea>
In-Reply-To: <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
	<f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
	<20230813213855.794b3c8f@yea>
	<57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
	<20230814192748.56525c82@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
	<20230828011758.3b7b9daf@yea>
	<1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
	<20230901004417.631dc019@yea>
	<b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3hmsoyiy3enk3jxw64d9zqyj8gbnfync
X-MBO-RS-ID: 7c174c73231db0a0916
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Sep 2023 07:43:34 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> >> Can you try what happens when you remove the call to kasan_init() at the
> >> start of setup_arch() in arch/powerpc/kernel/setup-common.c  
> > 
> > Ok, so I left the other patches in place + btext_map() instead of btext_unmap() at the end of MMU_init() + Michaels patch and additionally commented-out kasan_init() as stated above. The outcome is rather interesting! Now I deterministically get this output at boot OF console, regardless wheter it's a cold boot or warm boot:  
> 
> Ah, my bad. You also need to remove the call to kasan_late_init() in 
> mem_init() in arch/powerpc/mm/mem.c

Not tragic. Meanwhile I commented-out kasan_late_init() and updated to kernel v6.5.1.

dmesg did not change however, getting the same "BUG: KASAN: stack-out-of-bounds in __kernel_poison_pages+0x6c/0xd0" as last time only on v6.5.1.

Regards,
Erhard
