Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52611825D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 09:38:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XD3T2503zDqXq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 19:38:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com;
 envelope-from=romain.dolbeau@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dolbeau.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XD1C5yFxzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 19:36:13 +1100 (AEDT)
Received: by mail-wm1-f53.google.com with SMTP id b11so2127211wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 00:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ORCcYvYGnssHs8J5XVW7rHpgA8o+asMm+cNgjs199II=;
 b=rbK970m1cZmnVGc5noJpyfxbBIltoH2zWoCqDCbx8n3IigBsaJ4q7c0yVgcZXb04PE
 1LdZOLesbDUDMJB6Uyj0h4BFtAYBMiRCPyZQdGWKWvJJpReUrxmVuLRZhqw55Z96ObVO
 EbgRPugzcgNC2xJIErbxwfEeWiACvAFC5Bu48SG0sRfeBE9uG8655k5bM8ZfN5jG1+ZJ
 wNQkboQe+NoyZzJ24tvkQGSBQC4R03fvkjHlY0i0VvbvfVT0HMuqY+vSO4tcau8zy5jz
 9mqO4+9nNBYcHBRn6Qk/bihJ6iQoVdy2pLjzy7w8sZkkb1S693bE+iXrxQQ0KS7H0Hpq
 qvUw==
X-Gm-Message-State: APjAAAUvQuIjOo74lw6uwtQqO/WK/JRfXyB/qfPFC5WbmVUa2NVV8ebl
 8XhirKi1XFzL/bcuY43smL3Q3dQ/eNfXoFsBKBEeEGDZ
X-Google-Smtp-Source: APXvYqx8GLMnIntvUpTA7orcZS8VNX5ep++vtMi41SYh0ivEmfWR/wQzSbqZ+hzUmsrbD663UCgvPoWi8rDRqfnajbM=
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr3687610wmo.48.1575966969208; 
 Tue, 10 Dec 2019 00:36:09 -0800 (PST)
MIME-Version: 1.0
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
In-Reply-To: <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
From: Romain Dolbeau <romain@dolbeau.org>
Date: Tue, 10 Dec 2019 09:35:58 +0100
Message-ID: <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
Subject: Re: Found the commit for: 5.3.7 64-bits kernel doesn't boot on G5
 Quad [regression]
To: linuxppc-dev@lists.ozlabs.org, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: PowerPC List Debian <debian-powerpc@lists.debian.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Le sam. 16 nov. 2019 =C3=A0 17:34, Romain Dolbeau <romain@dolbeau.org> a =
=C3=A9crit :
> So it seems to me that 0034d395f89d9c092bb15adbabdca5283e258b41
> introduced the bug that crashes the PowerMac G5

There's been some commits in that subsystem, so I tried again; as of
6794862a16ef41f753abd75c03a152836e4c8028, the kernel still crashes
when trying to boot my PowerMac G5.

Cordially,

--=20
Romain Dolbeau
