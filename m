Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815381CDD72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:41:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNtN2hSLzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=kuJu9lu9; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJwm0fYTzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:43:35 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id i14so8197112qka.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=HrZSofo3iZFTh2jWDrYHo1noV2+xdcUG6DMvzbqh4qg=;
 b=kuJu9lu9imJ02yqGcj2fHwbhmZM1veTUhrSCepuKecNYH/uPA37AoMyqX/yCHUn5VA
 FZSSXzKY5C3OW5DnkUF3nRZIj5kkoClPt5aobsr+m9VnLbcK7JewiiXWVn8cqNiVj445
 CQ702HdJvr2MxDcU9cYWWzpZT+74rc/pN7N/uKAQz1s7b7p3ra5kdn74AUboxnpB9s27
 n6YkYe2I0N/dIF06LHbxtvrTxZD4Bmkn9XS+qpa02lpiDSubXN09Hnz5hVSG4D7dBsyv
 BXiY51kFI9ww0APazvLGzvsArPoumnWAldY7G/isso99zPnBy0QTgw9HXGXXkbaQ5VFl
 QHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=HrZSofo3iZFTh2jWDrYHo1noV2+xdcUG6DMvzbqh4qg=;
 b=uN3d/YNDfQZz7FpOHseoeGgYHNU9e1iy6+YML4WN/4Ho1LgDBJeMLiC1/J/O3MThtv
 h0UtpI6Xc33Ftmn6bUGp4U66rh/Lb2BAcwMMAYcExECft9hPjqLhSZ/BklpUP+ozFRhv
 MeYHIqLuKE9VChFxeXjHCr3sxev1TMCQFqwljU/qwfwCYZIjuuA+AXpjHvkpkha7gN4h
 v2XKhorbxi153KmsS6BRaEv21C7WkIKZgBna/Y0J4eh0+WCcKSJzmpaYqFcjMJubykJM
 MhDdpcdJFuZ+0LDjPpDCnFbF5DuwFhH+S678TR37CXw6dULuUj658/JanbZ2qYPHbt42
 gKuw==
X-Gm-Message-State: AGi0PubVMRTCJkliDLakQyh+Hvy2bo2DfrVuRIqEzRlW56djWpf6U5zd
 mURXtzBUt+UWNPel3jDOzXqoyA==
X-Google-Smtp-Source: APiQypLZGdZcXwPLwTgije5MzeISj5JWm75i71YFaAFtuioZHStvxhs3C3pSF0EnksEQ6BzGWvKnRw==
X-Received: by 2002:a37:668b:: with SMTP id
 a133mr14285835qkc.488.1589197412193; 
 Mon, 11 May 2020 04:43:32 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id e23sm7670945qkm.63.2020.05.11.04.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 04:43:31 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] powerpc/kvm: silence kmemleak false positives
Date: Mon, 11 May 2020 07:43:30 -0400
Message-Id: <44807D44-98D9-431C-9266-08014C4B47F6@lca.pw>
References: <87y2pybu38.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2pybu38.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (17D50)
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On May 11, 2020, at 7:15 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> There is kmemleak_alloc_phys(), which according to the docs can be used
> for tracking a phys address.
>=20
> Did you try that?

Caitlin, feel free to give your thoughts here.

My understanding is that it seems the doc is a bit misleading. kmemleak_allo=
c_phys() is to allocate kmemleak objects for a physical address range, so  k=
memleak could scan those memory pointers within for possible referencing oth=
er memory. It was only used in memblock so far, but those new memory allocat=
ions here contain no reference to other memory.

In this case, we have already had kmemleak objects for those memory allocati=
on. It is just that other pointers reference those memory by their physical a=
ddress which is a known kmemleak limitation won=E2=80=99t be able to track t=
he the connection. Thus, we always use kmemleak_ignore() to not reporting th=
ose as leaks and don=E2=80=99t scan those because they do not contain other m=
emory reference.=
