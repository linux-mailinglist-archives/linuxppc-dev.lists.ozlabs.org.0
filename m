Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC96F9E25
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 05:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF63g0H4Lz3cF0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 13:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ovOzvT28;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=albertedavies@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ovOzvT28;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF61w3KYXz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 13:18:27 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ab267e3528so27683675ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 May 2023 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683515904; x=1686107904;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n4ldLtDPNZTjKDl/+zxcZOaAgsV9GXeQJZVM2F+Ol9M=;
        b=ovOzvT28zbiuWAYUQYcnmEJd3QanPebOqKi0NsgU1pudZ3GQoK6Ci32zh/wgBh0l8W
         BocnWppPXpebVV1pr5YseEDu3d7x+tCYZXZksIS3d/vNJTIthwwsWS4Wif9/IkpPhzHV
         Jqm8c8ZRStC1UZSR/YW3HQnDW7kSBvkV5mXOZsZ4EOgFeg5yXBRxxZfQXZcuZzW6Scvn
         06+At9TDspXRefEr8qAjwcLOGvK/YZDB1y1pfjNnpXpW2Og7jDFSqkchIhyr2P9aihKn
         XdmsHqGgil+RHfIeBJQmSeBTw2roDHE89m7HKqIln7DQ9mit7vlqEFz00a49R7xWhnx4
         FzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683515904; x=1686107904;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4ldLtDPNZTjKDl/+zxcZOaAgsV9GXeQJZVM2F+Ol9M=;
        b=chlZGdylsfA+0l0+b6w65KinitErV1fx0ljp1aDvQ1bn0b8PL7WziKvzEIxg8PMtqe
         HPefwDDXZvQl2BDt7emLOSJJy6NKvhx1OBV/TOSdtF9jeyIcWOzy2HDyVTj9BxP5ioaF
         M7/JQxdkX6yFN6QJuimvpsIldx6mZ+00kJMW5H7/6gyVDKmgh7iPgBmVimbQSKQCDenp
         Xo6c1yZ7yOvjF5PovExOO2MP5rh93RMeZlru84XpDi6rabBZMJfod0lva7DeSMUZEQru
         EurHVaVm/bFB8ZDnSmG7ErTUdlNjLT8rYIq4JyCodbBH/rbdZ5Yl0//3s7vOWLdg7/ZN
         twTQ==
X-Gm-Message-State: AC+VfDyungltjLUniPvvWtxoPbBc4HpPbRkQwdoCDNwWsxmtKSdw/CD/
	rgUlEQw5yk6BcaAcewOde5k=
X-Google-Smtp-Source: ACHHUZ6mD3BKzq17YJyvUJd7rPp/dXdROmLp9b7APn66A08RZeXS/fWKB3+3ZbAJBpfngwCLXboXLA==
X-Received: by 2002:a17:902:ba86:b0:1aa:86a4:37ed with SMTP id k6-20020a170902ba8600b001aa86a437edmr8026027pls.55.1683515904208;
        Sun, 07 May 2023 20:18:24 -0700 (PDT)
Received: from SJ0PR03MB6240.namprd03.prod.outlook.com ([2603:1036:307:492e::5])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902da8400b001ab05eef2ddsm5943190plx.32.2023.05.07.20.18.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 May 2023 20:18:23 -0700 (PDT)
From: "Albert E. Davies" <albertedavies@gmail.com>
To: "tony.luck@intel.com" <tony.luck@intel.com>
Subject: Re: [PATCH v4 0/2] Copy-on-write poison recovery
Thread-Topic: [PATCH v4 0/2] Copy-on-write poison recovery
Thread-Index: AQHZgVufCUXyCxFMiUqapNFJHLacoQ==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 8 May 2023 03:18:22 +0000
Message-ID: 	<SJ0PR03MB6240434535E7B560E1407C88FE719@SJ0PR03MB6240.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB6240434535E7B560E1407C88FE719SJ0PR03MB6240namp_"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 May 2023 13:19:17 +1000
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "willy@infradead.org" <willy@infradead.org>, "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "glider@google.com" <glider@google.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_SJ0PR03MB6240434535E7B560E1407C88FE719SJ0PR03MB6240namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




Get Outlook for Android<https://aka.ms/AAb9ysg>

--_000_SJ0PR03MB6240434535E7B560E1407C88FE719SJ0PR03MB6240namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
"><br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
</body>
</html>

--_000_SJ0PR03MB6240434535E7B560E1407C88FE719SJ0PR03MB6240namp_--
