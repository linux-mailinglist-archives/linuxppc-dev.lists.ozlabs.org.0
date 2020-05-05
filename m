Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2229F1C5F5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 19:52:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GnP71YvXzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:52:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synopsys.com (client-ip=149.117.73.133;
 helo=smtprelay-out1.synopsys.com; envelope-from=vineet.gupta1@synopsys.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=mail header.b=HBRx4yN3; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=p9JFsrHv; 
 dkim-atps=neutral
X-Greylist: delayed 538 seconds by postgrey-1.36 at bilbo;
 Wed, 06 May 2020 03:36:43 AEST
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gn2z280fzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 03:36:40 +1000 (AEST)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A0B6402D1;
 Tue,  5 May 2020 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588699658; bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HBRx4yN3646ilfx9ArFoDOBshzDhAjYIVbV/OY/RoUWfNyX92kLYLPFWBFunuep/r
 18l5Bs/Q2wpg/p7eJU8nSNpgNfiCEBlW1AyOdfoXyo9ZoUiQUC4aamjlfLUswSIiwE
 //xyKisieXnpaJUASTb+aVrzhxuZBF4y0F2rKD79Ree9qhL4SrzRbHK6hpyoZrttlJ
 1iWNn38z6CR4zSkUUowIfcTt1Ibjh7C1a8hWRf0H9JWs8eKnwcD7KP0AOB87JmwizW
 t7+iFv5sIY2pwtFXFiidI7BfHt5LlJqyaWA56tyS8mBAWODu2wtWdzM3zE6Bj8x7Iz
 xe7ijDl976aaA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6C17EA0079;
 Tue,  5 May 2020 17:27:18 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 May 2020 10:27:18 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 5 May 2020 10:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0Yt6etV0jRHwWvDL+cKp0WDbQJ1JO8e25ynTXt+ElqRfhFJlRfdD0vstqxCthSIM5uUY7J+9YP5td8ulrpRBIKSV5y26dysVJJwT8GVtGjVN7ey1X3n7DI3QtCDJXz6/+Ab/1me0vp192D+ABP3kHwT4NNXazEl1y1AoRU8cFIMMOsiboaKdOLFUMMoxRP54+WqDMh/ytP6Smu6ZE0S9Iha5GmD3hnPQwPD9UqF40T0Ui+tZVogh/dNUNU24GPLXiBroIT3AR1msrGUG6FHVdNyAB1THl9Nf7Zs+UH7Vyq/Ki9HQQfKGKef06Y6epiAta+Ua/Ava8h6Qjc5ZSBdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 b=OK9P4eOUoqndm8zrurOCmVimHxuc7n4XCsGae8wbLDmpXTMXvZ9FSzXcxdb0ReDVVrFtMA9u/Zw90K/cIsSYVI0fAwuAs+yLmP3duwxqsKw56OX+bHxU0qbE7k15/jRUkVEMCwmOX4wvWXQTbo/3cHjtRzuXSiQEMq76BpRJMPfdC7j0x72UjHwyWCWMO5Nz/RCXKkDykQTSnfzUAeK5V04VqC/urOv9NvaDA5Ji4xqKBpWkyjEEdrcbJAYXUxrAJEhFEt3j5fa4Yi1xL+flRIDgiljXWAhXxZ8JtVVkFmQgDZEWbXWTb8Zd9CgkTa0Rxmxt5V9CTZnQ+DJb32534w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 b=p9JFsrHvuNuadXetUTaD+aqpN2G5MzQu1dbr44f8T2fTJ6iLj3fMZvRa79X4Fq7eR/V1v1OEzHwETeVwzl8vwXG8C1C3s2JUgFWRV6snln2MOqDv529SoNaycQPY+jHQLiC0USU2zIk+aI/o2HlbK4TF8V8AzQ0j2v8wXAxDUWI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3111.namprd12.prod.outlook.com (2603:10b6:a03:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Tue, 5 May
 2020 17:27:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 17:27:17 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guenter Roeck <linux@roeck-us.net>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Thread-Topic: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Thread-Index: AQHWHiAFM1CeaVL9XUmgz0SxoJ1XgqiWp/EAgAARJQCAAV7ugIABavuAgABFl4A=
Date: Tue, 5 May 2020 17:27:16 +0000
Message-ID: <51b468f8-c05b-a019-f473-429622083045@synopsys.com>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net> <20200503184300.GA154219@roeck-us.net>
 <20200504153901.GM14260@kernel.org>
 <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
In-Reply-To: <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 182c20dc-a1a1-47c5-403e-08d7f1198efd
x-ms-traffictypediagnostic: BYAPR12MB3111:
x-microsoft-antispam-prvs: <BYAPR12MB31114F85832DC9F5C66674F4B6A70@BYAPR12MB3111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBWSFp3WcyoxOR980JbG7R8KdjMJMl1y3GXYDAJCt8RJqreckiOMvbqo0SM5IYkC+TLw7Y6NjsfnXCL0nCEb5setZqmAzIYbJW6+lvZAXJxWUaK2/Q47eZQ5obst/hq8ZWg9zx5NIdZ7W6CEIvdpU6m0kpyhY88dvgVI2ZLbh56U1AJZ1X1v7pNOKFRuMAfgEAApkQnPon7HkgFTGAQT/TA/RSO2YoeUvmJmvuFbFI98jXzRvbIJS74wbtbbG60y3ey9UMpo9miu6oUlyvPWlK3nhqmGYe8gWU4zSUytgLUMFdFznIx3HkdvTy3iHsUr40L2fLJ2pNH1eljyU1s7zXmM57A3OzlEMKfNneo06EHCrQsye9hnYRnOPiNfvJZNHRkl0eU38pM8FrAUZ46ykp7QbYZ7DVJBrGNeG0H/pPWfx3qSVODocMxgKxNiqdU2C1shzJTt0BRZkG6oe9y+K60Xnl7j7Ese9qTe+U8DLsNXuSRtWxBpNyY/kCIJ2LFyb9Txvwfo6fYRe09TMuYZEFGmFpuwPvibWMrn8vH/iJprtbITZ18CGvWKAolMYUgP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(33430700001)(6486002)(186003)(31696002)(478600001)(36756003)(5660300002)(33440700001)(6506007)(86362001)(2616005)(53546011)(7406005)(54906003)(110136005)(2906002)(8936002)(7366002)(7416002)(71200400001)(4326008)(6512007)(8676002)(66946007)(31686004)(316002)(64756008)(66476007)(66556008)(66446008)(76116006)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CMhlvVLP+cglrqi5u7edG/4dU/HCzfZIPPzt5g42qWWGbfJsRgS7OzBTmPYlh7LKaS7eDYruN21f+yR9fs1WhYtLbOfbn7TnTmrsIyhW53vfcRWLImpC6Lz58cqDlaD83xNz8d/rQkpw4NZp0pOQ+KUt8GjMSKJH1vAPGOcLx24it0/AS7fcmu56GrOmxqDYyFqOk8prbnmsFPhb1KPsl8luAqwdGUfG6IlpuUY9dnrJqROBb/eQHnhjqaxLkzqSaxg3mwQBLHoFhJEQSivTq+RtXk9pOx/1TkYelof7De0n3GGjDa69guKZ8L3lTcBLtJRqvCURgYGAJWAao+B8Ks6Xoi/TLe5zX/sAlUuX+nZN0XMPLDL5gLDTw8jk/gs30wsSn/JFqJRRDJV06ajSG9BbvfecRjReXehW6I0vjL4UfLOZmVpsBi4HJacWi1+Rrt6//PWKexytwWb0mJCwfnELA0nas4teKByfPg/qhuR/6sYu8UZK/TgZRmAuRw6tMioQpVs9CDEgSGduGibL0ONZFjI5v/vM+n9kG5kAgHahRY/LK6CEYW46F7QycLFK6856E9k1Q+AhkKhJ0Ek7ikggb4/JqZYGs35DTw3qrXVQT1W+pWCGt8p7NDuwxQPA6sHkNdGm3gNOu0l9EmHHXzdt4NJppGPXBqFQaHnrT2C82/HN1Rn6lx6Nwwmj6E5DTiTreZY1etEWe7wN4iPozynl0QvWvEG/r3A5xvt2EQEqWkEB8ILJ3STxF7TRpaeZCyJjy1c58eHzIx61PdLpFGTJIhqTnGGAcL19fK/XSVdXy+YH205GuyaPc2z3t7CHaJkHIEblJY35rimOXymvtIR85oe95EWgGh96Gswesdg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <71155D187A337740904D5836ABF4A094@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c20dc-a1a1-47c5-403e-08d7f1198efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 17:27:16.6825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4u22c2Mj9VEU4LlLhv0m8STcbjUlVhLCQLh2dPO6aK13u1R4Y7LqNMlPib9qBi1cBmNiKKjJQ4oGiUYL/6EXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
X-OriginatorOrg: synopsys.com
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, "x86@kernel.org" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Greg
 Ungerer <gerg@linux-m68k.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "uclinux-h8-devel@lists.sourceforge.jp"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Nick Hu <nickhu@andestech.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Brian
 Cain <bcain@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNS81LzIwIDY6MTggQU0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDUvNC8yMCA4OjM5
IEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0KPj4gT24gU3VuLCBNYXkgMDMsIDIwMjAgYXQgMTE6
NDM6MDBBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4+PiBPbiBTdW4sIE1heSAwMywg
MjAyMCBhdCAxMDo0MTozOEFNIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4+PiBIaSwN
Cj4+Pj4NCj4+Pj4gT24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MjNQTSArMDMwMCwgTWlr
ZSBSYXBvcG9ydCB3cm90ZToNCj4+Pj4+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXgu
aWJtLmNvbT4NCj4+Pj4+DQo+Pj4+PiBTb21lIGFyY2hpdGVjdHVyZXMgKGUuZy4gQVJDKSBoYXZl
IHRoZSBaT05FX0hJR0hNRU0gem9uZSBiZWxvdyB0aGUNCj4+Pj4+IFpPTkVfTk9STUFMLiBBbGxv
d2luZyBmcmVlX2FyZWFfaW5pdCgpIHBhcnNlIG1heF96b25lX3BmbiBhcnJheSBldmVuIGl0IGlz
DQo+Pj4+PiBzb3J0ZWQgaW4gZGVzY2VuZGluZyBvcmRlciBhbGxvd3MgdXNpbmcgZnJlZV9hcmVh
X2luaXQoKSBvbiBzdWNoDQo+Pj4+PiBhcmNoaXRlY3R1cmVzLg0KPj4+Pj4NCj4+Pj4+IEFkZCB0
b3AgLT4gZG93biB0cmF2ZXJzYWwgb2YgbWF4X3pvbmVfcGZuIGFycmF5IGluIGZyZWVfYXJlYV9p
bml0KCkgYW5kIHVzZQ0KPj4+Pj4gdGhlIGxhdHRlciBpbiBBUkMgbm9kZS96b25lIGluaXRpYWxp
emF0aW9uLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4NCj4+Pj4gVGhpcyBwYXRjaCBjYXVzZXMgbXkgbWljcm9ibGF6ZWVsIHFl
bXUgYm9vdCB0ZXN0IGluIGxpbnV4LW5leHQgdG8gZmFpbC4NCj4+Pj4gUmV2ZXJ0aW5nIGl0IGZp
eGVzIHRoZSBwcm9ibGVtLg0KPj4+Pg0KPj4+IFRoZSBzYW1lIHByb2JsZW0gaXMgc2VlbiB3aXRo
IHMzOTAgZW11bGF0aW9ucy4NCj4+IFllYWgsIHRoaXMgcGF0Y2ggYnJlYWtzIHNvbWUgb3RoZXJz
IGFzIHdlbGwgOigNCj4+DQo+PiBNeSBhc3N1bXB0aW9uIHRoYXQgbWF4X3pvbmVfcGZuIGRlZmlu
ZXMgYXJjaGl0ZWN0dXJhbCBsaW1pdCBmb3IgbWF4aW1hbA0KPj4gUEZOIHRoYXQgY2FuIGJlbG9u
ZyB0byBhIHpvbmUgd2FzIG92ZXItb3B0aW1pc3RpYy4gU2V2ZXJhbCBhcmNoZXMNCj4+IGFjdHVh
bGx5IGRvIHRoYXQsIGJ1dCBvdGhlcnMgZG8NCj4+DQo+PiAJbWF4X3pvbmVfcGZuW1pPTkVfRE1B
XSA9IE1BWF9ETUFfUEZOOw0KPj4gCW1heF96b25lX3BmbltaT05FX05PUk1BTF0gPSBtYXhfcGZu
Ow0KPj4NCj4+IHdoZXJlIE1BWF9ETUFfUEZOIGlzIGJ1aWxkLXRpbWUgY29uc3RyYWluIGFuZCBt
YXhfcGZuIGlzIHJ1biB0aW1lIGxpbWl0DQo+PiBmb3IgdGhlIGN1cnJlbnQgc3lzdGVtLg0KPj4N
Cj4+IFNvLCB3aGVuIG1heF9wZm4gaXMgbG93ZXIgdGhhbiBNQVhfRE1BX1BGTiwgdGhlIGZyZWVf
aW5pdF9hcmVhKCkgd2lsbA0KPj4gY29uc2lkZXIgbWF4X3pvbmVfcGZuIGFzIGRlc2NlbmRpbmcg
YW5kIHdpbGwgd3JvbmdseSBjYWxjdWxhdGUgem9uZQ0KPj4gZXh0ZW50cy4NCj4+DQo+PiBUaGF0
IHNhaWQsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGNyZWF0ZSBhIGdlbmVyaWMgd2F5IHRvIHNwZWNp
YWwgY2FzZQ0KPj4gQVJDLCBJIHN1Z2dlc3QgdG8gc2ltcGx5IHVzZSB0aGUgYmVsb3cgcGF0Y2gg
aW5zdGVhZC4NCj4+DQo+IEFzIGEgcmVtaW5kZXIsIEkgcmVwb3J0ZWQgdGhlIHByb2JsZW0gYWdh
aW5zdCBzMzkwIGFuZCBtaWNyb2JsYXplZWwNCj4gKGludGVyZXN0aW5nbHkgZW5vdWdoLCBtaWNy
b2JsYXplIChiaWcgZW5kaWFuKSB3b3JrcyksIG5vdCBhZ2FpbnN0IGFyYy4NCg0KVW5kZXJzdG9v
ZCBhbmQgbXkgY29tbWVudCB3YXMgdG8gcG9pbnQgdG8gYW55IG90aGVyIHByb2JsZW1zIGluIGZ1
dHVyZS4NCg0KVGh4LA0KLVZpbmVldA0K
