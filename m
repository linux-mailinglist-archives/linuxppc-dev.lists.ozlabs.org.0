Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C01D6DE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 00:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QHW14qjBzDqYL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 08:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z1XtA+ZW; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QHTW50pvzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 08:52:15 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t7so3443578plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bE/bwCtV/S89QlNR1MerVFx47fg6954LpqGiTJHEXMY=;
 b=Z1XtA+ZWkgvp6bXo0Z9jF1nhsITTl9xulHzuS0+4YnumsAmEFfKe15OlbXfL1Z14mm
 Na4eRY1nPuNYJXpg20WI+mwBrSN1jxggma4EX0euYccqBg0j7DkyBQJwLirgNfCZWgSd
 27PYWkJP7cishtQJIO2TvdwKTMiO/Q/YgeLZqZGU1FKyGOpgudaJnh5RcDHdXrl7sc9c
 Guo6N/j6SG3t3E2Nl09WGqCB6kY78gWy10PBmDPfDDxU6l+1XXXUBkO51gmRqw3KALz/
 SF6g0uobMPFPURs58A3iTFTEigF7JHKwgQmrlrzv/e/zFePGgcQaT4fBafom0tkFHfUr
 iEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bE/bwCtV/S89QlNR1MerVFx47fg6954LpqGiTJHEXMY=;
 b=YgzsTfHsilwBvT/iF0ZUG0bA6NWAGskKppPLOfpygWJNr0VEu1bsWfN6KTEKP8CC7s
 6r6lwAfwL2DeCKRmbyBw8SxbiuZX1gDHGmbcaGbF3Z/inC3B0u+eqrSfmFopO4eRlNiU
 Or9RQIUgGQkZDqIdS4SxydSTahCrNhriJK5Dz9hZzo7pYqPQtb9Ru0zcdaSmpHG8O4hb
 kySgldLkFkBBNsYoX//7AC1cwap+RkelBN09giA2FolqsB9cm9J3wvu+5B8gJPbOK+a5
 Hhp8h1G7XY2xg5c1bFuHliq2nsyvMmZuw26v0zJpMp8uVOn2BaMipQudiyGqouQ/72Wj
 UmbQ==
X-Gm-Message-State: AOAM533rXgKSO7CYtoHOMyqqc+hwkRb2zOYQmsRDYO2DCaAWrVg9jYV3
 lfGEvLqkDou+s5oCXz0qX/E=
X-Google-Smtp-Source: ABdhPJwKKNtgPuy4yKiir3YzoI5BTiaP/vVXwthmJFgGm51HGXTz01vAmAA16QdHi+rX5JlIPxb7nA==
X-Received: by 2002:a17:902:d689:: with SMTP id
 v9mr3871689ply.283.1589755931916; 
 Sun, 17 May 2020 15:52:11 -0700 (PDT)
Received: from localhost ([124.170.14.63])
 by smtp.gmail.com with ESMTPSA id p9sm6180932pgb.19.2020.05.17.15.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 15:52:10 -0700 (PDT)
Date: Mon, 18 May 2020 08:52:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 2/2] powerpc/rtas: Implement reentrant rtas call
To: Allison Randal <allison@lohutok.net>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Axtens <dja@axtens.net>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anshuman Khandual
 <khandual@linux.vnet.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <namit@vmware.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20200516052137.175881-1-leobras.c@gmail.com>
 <20200516052137.175881-3-leobras.c@gmail.com>
 <1589614523.yfijifo1n6.astroid@bobo.none>
In-Reply-To: <1589614523.yfijifo1n6.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1589755794.kmbg5am170.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of May 16, 2020 5:36 pm:
> Excerpts from Leonardo Bras's message of May 16, 2020 3:21 pm:
>> @@ -202,6 +220,7 @@ void __init __nostackprotector initialise_paca(struc=
t paca_struct *new_paca, int
>>  	/* For now -- if we have threads this will be adjusted later */
>>  	new_paca->tcd_ptr =3D &new_paca->tcd;
>>  #endif
>> +	new_paca->reentrant_args =3D NULL;
>>  }
>> =20
>>  /* Put the paca pointer into r13 and SPRG_PACA */
>> @@ -274,6 +293,7 @@ void __init allocate_paca(int cpu)
>>  #ifdef CONFIG_PPC_BOOK3S_64
>>  	paca->slb_shadow_ptr =3D new_slb_shadow(cpu, limit);
>>  #endif
>> +	paca->reentrant_args =3D new_rtas_args(cpu, limit);
>=20
> Good, I think tihs should work as you want now. Can you allocate it like=20
> lppacas? Put it under PSERIES (and in the paca) and check for !HV?

Oh and while there, could you prefix the name with rtas_?

Thanks,
Nick
