Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FB925A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:59:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BwX64873zDqlF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:59:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ezw4XWKp"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BwTQ3PqJzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:56:58 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id o13so1267618pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=39/k8iI4wKhtmhee8gWVY7ASF3R5OBsTld60CZUT6Sc=;
 b=ezw4XWKp+t4ah2r4cQe34oQjbF1z9O+w4gszDJ8HrBYxpZq65brA39qI2LiFXF1rAw
 dUH5COYyDWypNDZ6f025q/2G/wxcAf+BZ/NPv3uZpFGjsE0ZX+oaUXaH8yDwBg71WBRn
 fl0Ui1qFS4zPuQhRptEo6Kpe3hcPH2ECmDr3f4vcYQtM3XUag7BFFs8bGBaUurFb7uyS
 w9m3nVVSXDuSJt/8tOYFEBaLWMgzYljvOYKDLuor9AIThqxpQc4yiXzz7A0gJYUULo3X
 YSyibsUagjr+DHCHinTG1Aqla6OqDPI1E/ydiqgCqL7/kUYfkYQ+n3ZPNxAO1rSVbMqB
 67VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=39/k8iI4wKhtmhee8gWVY7ASF3R5OBsTld60CZUT6Sc=;
 b=ROixODmY69j8nq6zI5vZx2BBRKJ6DJN3JlL+DWO9RUSSfztL+hjB1h/PXURcJZySC6
 CsNd7aVFn3moL049ueJPHpTX74U6TKknEZ5CUVruiCmWAtXdFdn+A87gxadGvWU/RlfN
 AjdcyDeuxEl43pE3dPocdATeKPDr6Y/UH29OR/gkUjC1XrLNgi8U7ePCXtMrXTutjMxw
 5XUdd6L+2wmTGx5EZ1QWbIWD9RNLSNMNpDVI7PSijCVTHeU3PRDAOm4zjYijmD8f4+eL
 k7s8rFgir9UHnGP5ESHaV58F3BuRU8VKqf4ZDJGeQexASbBSzGtBRPYaa8dUYotqVIcr
 cEZg==
X-Gm-Message-State: APjAAAX4QEbE3GPC0EP92DEE8VjrRNsbUaxZJ52WK1Gul+L3g6y7ANg8
 z7hX1oIa8QK0kQR2j9eifBQ=
X-Google-Smtp-Source: APXvYqz7lfv4IEui68yrz5NozTdCayhWRB5+5mYZJn2xV/JKreY7cMTYGK1gQV5oqhONQ98sDtyPzg==
X-Received: by 2002:a63:b904:: with SMTP id z4mr19572193pge.388.1566223014873; 
 Mon, 19 Aug 2019 06:56:54 -0700 (PDT)
Received: from localhost (193-116-95-121.tpgi.com.au. [193.116.95.121])
 by smtp.gmail.com with ESMTPSA id v18sm16628116pgl.87.2019.08.19.06.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 06:56:54 -0700 (PDT)
Date: Mon, 19 Aug 2019 23:56:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] powerpc/time: Only set
 CONFIG_ARCH_HAS_SCALED_CPUTIME on PPC64
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <d9ac8da98f53debb4758b98d0227979aca9196f7.1528292284.git.christophe.leroy@c-s.fr>
 <20180607114304.327c4ab5@roar.ozlabs.ibm.com>
 <26969bb5-c01b-0674-5773-027f1851bd44@c-s.fr>
In-Reply-To: <26969bb5-c01b-0674-5773-027f1851bd44@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566222563.zuxi8x5ryi.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 14, 2019 4:31 pm:
> Hi Nick,
>=20
>=20
> Le 07/06/2018 =C3=A0 03:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>> On Wed,  6 Jun 2018 14:21:08 +0000 (UTC)
>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>=20
>>> scaled cputime is only meaningfull when the processor has
>>> SPURR and/or PURR, which means only on PPC64.
>>>
>=20
> [...]
>=20
>>=20
>> I wonder if we could make this depend on PPC_PSERIES or even
>> PPC_SPLPAR as well? (That would be for a later patch)
>=20
> Can we go further on this ?
>=20
> Do we know exactly which configuration support scaled cputime, in=20
> extenso have SPRN_SPURR and/or SPRN_PURR ?
>=20
> Ref https://github.com/linuxppc/issues/issues/171

Unfortunately I don't know enough about the timing stuff and who
uses it. SPURR is available on all configurations (guest, bare metal),
so it could account scaled time there too. I guess better just leave
it for now.

Thanks,
Nick
=
