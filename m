Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8B5B8D1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 18:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSQpY628Xz3br9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 02:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bAF/SEBZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bAF/SEBZ;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSQnv5Lptz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 02:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=il0WJep+KQPBu92Y9mLhLcZYY7YOKzRyf6Y3+Wq3e8M=; b=bAF/SEBZr2JEQCWnIdfDFDwrA+
	Oi2zI/mhulMHVtCavf6PbaY8NAJ5Grd/NyRL8qGip8MGjX3HmrCG1DTPF47kK/BNuumsR5jyXsXny
	K85zEn5CU9jo53yUG8/VH/ejIguSZo5rL0Ibq7IzpNaY8Y6PcDpk8KOKyWu+h8BJrkhQOd0YwG//B
	Hy+45iYvjfWbFB5EHuc5pixJ3S/hw1KfY03Fnxpw0VLg5CzunsaWC/6OYwnAlm9FzTZZM0du/Tk03
	mL6ubKo8L6gGoh11FvOdLZH6XhJcQoaEaBy+sCpE83eS/9HMXttRpgtWZ/QRm3CBAptMlyn3pGSNS
	t0rL5D0A==;
Received: from [2600:1702:3c30:6ca0:3f7c:e43a:b639:6d3a]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYVGl-00COtY-HI; Wed, 14 Sep 2022 16:29:48 +0000
Message-ID: <2d850fa7-7d2a-d4f3-1557-b90a482b0ea0@infradead.org>
Date: Wed, 14 Sep 2022 09:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/9] powerpc/ps3: remove orphan declarations from ps3av.h
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, jk@ozlabs.org,
 arnd@arndb.de, clg@kaod.org, aik@ozlabs.ru, maciej.szmigiero@oracle.com,
 seanjc@google.com, jgg@ziepe.ca, willy@infradead.org, nick.child@ibm.com,
 bsingharora@gmail.com, michael@ellerman.id.au, arnd.bergmann@de.ibm.com,
 paulus@samba.org, benh@kernel.crashing.org, alistair@popple.id.au,
 miltonm@bga.com, Geert.Uytterhoeven@sonycom.com,
 geoffrey.levand@am.sony.com, yu.liu@freescale.com, scottwood@freescale.com,
 hollisb@us.ibm.com, avi@redhat.com, agraf@suse.de
References: <20220913075029.682327-1-cuigaosheng1@huawei.com>
 <20220913075029.682327-9-cuigaosheng1@huawei.com>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20220913075029.682327-9-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gaosheng,

On 9/13/22 00:50, Gaosheng Cui wrote:
> Remove the following orphan declarations from ps3av.h:
> 1. ps3av_dev_open()
> 2. ps3av_dev_close()
> 
> They have been removed since commit 13a5e30cf740 ("[POWERPC] PS3:
> Rework AV settings driver"), so remove them.

I did a test build with this patch applied to v6.0-rc5 and had no errors.

Acked-by: Geoff Levand <geoff@infradead.org>

