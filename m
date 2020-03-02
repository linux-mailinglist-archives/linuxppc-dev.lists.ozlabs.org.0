Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695A17546C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 08:29:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WBbj2SQvzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 18:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=bala071985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JGxAPlSw; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W8Z873BLzDqY6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:57:47 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id z9so6980211lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 21:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FOJ8HQIqQfyB/pnPETWbHQBuU50jMgSZlNH+28n2ig4=;
 b=JGxAPlSwrEbTzd0cwJtBEKW4WVXiNlsNvz0IhaxeIPrHbyyDJjiyjd1NF9XFaTzy2L
 5Lo2fVwCSme+lkf/IIpp/JlRtHKgTYVTtVHVlShzQgrRRoODPDvGBIghPjQ3jt79RTWT
 yX21H0zIqM+EYoUu707DPAt8MRLYHNfjErhw1+NZU1cOLKVmYjxLcxAOIt27EbYXsKgk
 YcJUXF4rZpFUykmRrwxPXXUpLXF/eJpR5Ws+qSKZWwHUJaKmCgFn7HqKlgqIRl6fd9DP
 LrzBlSfFgO0bxMY1KLmQR8/MhPr8FOZ1aTdb3IoTvclwIvnrijN8xLPJoSLex2mQQoOC
 +cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FOJ8HQIqQfyB/pnPETWbHQBuU50jMgSZlNH+28n2ig4=;
 b=bHgi1ylmjC9PgRFww1QKYEttLhOA94zgRz90uKzdtGwnsksufeKKnHmZuuDDd19sZD
 EHjVYo2EZpPEkf8FGIu5yrP5UI1c9mOdrLERn0qQ5lD/9fauEx+0OLBcPDuLcVypqcIN
 SOe7opTVONm6gNfgOWy7qt1HYahP7++A1htQS9VFWOYjLCWWnY//03qnOVPV4ay9YlHv
 XfKBG0Ea2OUUD9d9icmE/XHYhsRj48i1oM86V8OD30LDv5WzL/kdLZG7Cz06CrXVo5/T
 crB/Fb7vjnHFplEfiFyiWAFDcCQO23Ic990P2aKY2ao/nCTm7xa8odGcQ97c1m10c/e+
 DYtA==
X-Gm-Message-State: ANhLgQ0biLmPlyKaKbsn0tZ2VfShUL1B30C9n0yNYDF9oSWv2nkZlIhQ
 1BB+WA7tPfrbEjxp7DG6sEsYOejkjflOf2hrjA+LjQ==
X-Google-Smtp-Source: ADFU+vtlzW/LwLRQ2zMOjiKxpTUNqkqQoR1Yp1GNPkAdGcOfrsCiQvJY6ceDUW8VhPaLcktFTFEXo8xiiBtdC/wm0Ds=
X-Received: by 2002:a05:6512:15d:: with SMTP id
 m29mr9568720lfo.158.1583128662151; 
 Sun, 01 Mar 2020 21:57:42 -0800 (PST)
MIME-Version: 1.0
From: Bala murugan <bala071985@gmail.com>
Date: Mon, 2 Mar 2020 11:27:30 +0530
Message-ID: <CAFjzVacDg-NpeJUPB4sQkzGUhaqXSf74-Rxez_haamcfv68qFA@mail.gmail.com>
Subject: Reg: KASLR backporting to 4.9 kernels for ppc platform.
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008a93a1059fd8ddd6"
X-Mailman-Approved-At: Mon, 02 Mar 2020 18:27:25 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000008a93a1059fd8ddd6
Content-Type: text/plain; charset="UTF-8"

Hi,

Any plans to back port KASLR for 4.9 kernel. How feasible is to back port
to 4.9 kernel for PPC platforms.

Regards
S Balamurugan.

--0000000000008a93a1059fd8ddd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>Hi,=C2=A0<div><div><br></div><div>Any plans=
 to back port KASLR for 4.9 kernel. How feasible is to back port=C2=A0 to 4=
.9 kernel for PPC platforms.</div><br></div><div>Regards</div><div>S Balamu=
rugan.</div></div>

--0000000000008a93a1059fd8ddd6--
