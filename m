Return-Path: <linuxppc-dev+bounces-3722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD389E1CD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gcy2JRFz2yYs;
	Tue,  3 Dec 2024 23:56:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=99.78.197.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733230562;
	cv=none; b=M25iK9nOiybRVq1n6VqpEptDjK8Ek7C3FQd/gWDL5chgQuLaWELHVM2Be6Z7HQNbZX6abcqUBxYj7umeYlrkDNa4YuoWurgs6k32Hj8zKh2fG3e3KhP32zmC3UPEimIXju1MXDP4aOu6aqLiCJiZ4JrsIncqJxMovTVOQSGgJSYDXuGxGYgqRYI5Zm3+YDZv+Op2vUwBGyLJ9P1RE6TtG5Hz5vwTRscK2E7k7iQm3HGFETrqbzO39vz9JSK4K3CDI1Xa0VxDeIvtuigbBlR9qoPZwkhjy75j1SVfIdiEVipd1eG9Cq/twXwMQkAj6U18yk6yc5Oa+eAB/vd1MpwZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733230562; c=relaxed/relaxed;
	bh=zHt8L2Z6dJwqzsWV71weChOsU9eMWPerfPu1DOoxdJ8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ko3M9V12ukz02N3zfqLNNwjLGe7ZftqYQDfli6alRnqG1yvagnPeE2uB1ZbCzIL1Dj9qGj7IRq0FqH9Rv2SVjOsJlLPvuEicYwesm5jzAORyVgaYhbB7fFdSgHXfSy6u1Hrz3bb78Fx/Yy2Oax+X99GW7YMSKe2fNPFXE3oMmGhk3cy/euF6bpcrT4rXuU3fVE8pZo3MDGecQWjWG7dIhZCFOEra/2VBSTpQIwsTTKRL8ysPyxJ/a4yRstndqLAYfpjrCtIx1kSpL7086zrkMPvWKGAil6horshSuUPqOIa+BUzXZKMaXx9UFeE/MAkCT8IMubTA6ONZKaKlGilhLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=L4e/unjh; dkim-atps=neutral; spf=pass (client-ip=99.78.197.218; helo=smtp-fw-80007.amazon.com; envelope-from=prvs=0605a7a16=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=L4e/unjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=99.78.197.218; helo=smtp-fw-80007.amazon.com; envelope-from=prvs=0605a7a16=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gcw6pv6z2yM6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:55:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733230562; x=1764766562;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=zHt8L2Z6dJwqzsWV71weChOsU9eMWPerfPu1DOoxdJ8=;
  b=L4e/unjhlCvocVtj+zwSGc9JN97dRHTya1WLNX2dTehSZNJrzBpQhvz4
   6CJVOPa+jczjWDhAzYI15i9P/NGC4XpnXgwlTGFNunWDhjmTYAL1RSweE
   oIO6N2+jcYi1JlyptQqwpBCN0nBlBPx1gW5KfvUDHC6C2XidJObR4/EQm
   U=;
X-IronPort-AV: E=Sophos;i="6.12,205,1728950400"; 
   d="scan'208";a="357635905"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 12:55:55 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:25389]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.32.206:2525] with esmtp (Farcaster)
 id 321ae853-bb47-4473-a697-0a3ceab94d46; Tue, 3 Dec 2024 12:55:53 +0000 (UTC)
X-Farcaster-Flow-ID: 321ae853-bb47-4473-a697-0a3ceab94d46
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 3 Dec 2024 12:55:53 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 3 Dec 2024 12:55:53 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Tue, 3 Dec 2024 12:55:53 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
	"hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
	"sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
	"adityag@linux.ibm.com" <adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate machine_kexec_mask_interrupts()
 implementation
Thread-Topic: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Thread-Index: AdtFgq6lXwncie71LkSE+iBNpljfQg==
Date: Tue, 3 Dec 2024 12:55:52 +0000
Message-ID: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.85.143.174]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/2024 1:04 PM, Thomas Gleixner wrote:
>> +
>> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>> +     bool "Clear forwarded VM interrupts during kexec"
>
> This should not be user selectable. Just keep it as:
>
> config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>         bool
>
> which defaults to 'n'. Just add a comment what this is about like it's
> done with the other options in that file which are only selectable.
Question: Should this new configuration option be placed inside or
outside the following section:
```
menu "IRQ subsystem"


endmenu
```
In my patch, I have added the new configuration option at the end of
the file, outside the "IRQ subsystem" section.

