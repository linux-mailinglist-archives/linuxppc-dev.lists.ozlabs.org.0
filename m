Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55534A117
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:38:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F69kQ0zrFz3brp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:38:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=aiVnRhdX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=aiVnRhdX; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F69jz5D2mz303J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:38:13 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3718061pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=87Df9w+HLEtQIYbykZK6bC5setLTpy5vdBvKQb+SxG0=;
 b=aiVnRhdXR8vqYfZs7pR9AAdR+ScJHjfTl952RwX/4aJVw7oHFCSUCBgIrXS5rzdA0G
 Od/yPxM+UBMZbP9usp1GQ4peMtXL+AnkFzvWqNVQvLvvSSh7aIIXmu77zSVJ6PSsV6GN
 w3BV/SekzvMkknp+8SOKBVK0jKaYbL9PcwbZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=87Df9w+HLEtQIYbykZK6bC5setLTpy5vdBvKQb+SxG0=;
 b=szI0xhVJ+06YQuEobmbnNraz9UevWQPbbjrIufh2nTDbq6k7ZbeS9Ms8e9DkCFRufK
 BAgtj477SvE8Np4EYmMRtBJS78xYZvCGC5rl/7Em8f1CKJzroILJVv+i7m1mFj8Q+VJJ
 f+wyCv+oHZ6YkIq7e07UvK1M9Zx+bYEiMyfQp21QLDZMVXYr+WOsPWJO/NbTi7lpH4uM
 gj1uf1+X4rcNGEx/Q13c/UT7eQE9SWkGt3gq8RrWGzE/6j5n7RWOUf2jhlooXH4E0qy7
 OiMuBcARgeL5JdLy4kq+9pbkaqD3Ytj+xdIOh7LNrTOa1+fYV9n/PCTJLw0VM20KEmmW
 dkjg==
X-Gm-Message-State: AOAM5304BSqnyj3paRachjRet/rbfRxG2bOaccE4ahP9LlPulowKlEVT
 dqOYeX1A/PosCVbByZDZXAHiFQ==
X-Google-Smtp-Source: ABdhPJyvcXRQyAYpeNoyjsN9TtaOvpteuYOcXzmzRTWnnmi5naQ0BxtrTjUBbMsEaOFtaevNqkz+Bw==
X-Received: by 2002:a17:902:c317:b029:e4:aecd:8539 with SMTP id
 k23-20020a170902c317b02900e4aecd8539mr13673784plx.61.1616737090389; 
 Thu, 25 Mar 2021 22:38:10 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id s200sm7803561pfs.53.2021.03.25.22.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:38:09 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Randy Dunlap <rdunlap@infradead.org>, Wan Jiabing
 <wanjiabing@vivo.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Michal Suchanek <msuchanek@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Pingfan Liu
 <kernelfans@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] arch: powerpc: Remove duplicate includes
In-Reply-To: <20210323062916.295346-1-wanjiabing@vivo.com>
References: <20210323062916.295346-1-wanjiabing@vivo.com>
Date: Fri, 26 Mar 2021 16:38:06 +1100
Message-ID: <87y2ea79vl.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wan Jiabing <wanjiabing@vivo.com> writes:

> mmu-hash.h: asm/bug.h has been included at line 12, so remove 
> the duplicate one at line 21.

Looking at the file I had wondered if this was due to a #ifdef being
removed, but no, the second one was just added in commit 891121e6c02c
("powerpc/mm: Differentiate between hugetlb and THP during page
walk"). How odd!

Anyway, all of these look good to me, and the automated checks at
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210323062916.295346-1-wanjiabing@vivo.com/
have all passed.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
