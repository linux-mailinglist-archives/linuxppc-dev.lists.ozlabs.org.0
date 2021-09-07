Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA0402C3F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 17:57:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3qds1JY1z2xtT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 01:57:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=csgroupeu.onmicrosoft.com header.i=@csgroupeu.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-csgroupeu-onmicrosoft-com header.b=MD21JzuT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=40.107.9.79;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=csgroupeu.onmicrosoft.com
 header.i=@csgroupeu.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-csgroupeu-onmicrosoft-com header.b=MD21JzuT; 
 dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90079.outbound.protection.outlook.com [40.107.9.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3qd15DCgz2xsQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 01:56:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1m3iBmNRqDSA5BzzQ53i5tAqP7kBIdW/ihRgcfldYOVPq3bNi4WnD9aprm4jfUKMWW2BgoJc5MzsNbllNofVBhql+LoU3mUQILrFCaes5vX3CM4BAPC80tOstHVgdL1ZHQJV5aNZcjJH+IHeNWg+q4VifFHXeiRQeTboZNrLWx7+zkGwKqDLMDtQv4N4DGzZLHgYcGfPNKjeg0NGjmUPZ8U/pUzGesRRJaLI75SbQRuMWSvTZ3pT8OT4QHYRlauBv6/IhB6/zvJ7mq/AqedZ/+DzTmlbgRIlH5rcHF/A5J5FwAlCRzRCJSWidedwWVCuhiHhr/nbFgAfHdKWumn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1JmD07sVUCFruSZxPO0UXdnlEphtIZBqTNFWmee8LQ8=;
 b=cXol4WymK+Ox89HYoKTaRcQ1cAhW4XMWVMC5AoTmEWe3XaOf+6m18y/9FS7NfYNM9b6++KUxanFsHJQQWdi7QoJSBslTTL3IEeIHeBrDmGNlflMLBnn/UYHYoTT4UFKkeMP068/9HJ0ECoeTplbMrJEGbMXu5ng7W5EpAdu9Kitr4mVHYOl1/EhkjQh/MBRnMusDPT4wj6Wd7eG3In1w3gP06vBbeRhukKRnnlXeFgmbARJyMRHG5BWGaZP8+VmO5Sg0UtYXP2YLdhgVcaCg/f2zh0b9+m4w6hiCkp6j6J38k6RaundqmVOI9Qj8N3CuAFDCo0Jm7kn1VRWBAVvTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csgroupeu.onmicrosoft.com; s=selector1-csgroupeu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JmD07sVUCFruSZxPO0UXdnlEphtIZBqTNFWmee8LQ8=;
 b=MD21JzuTaQ6eVX3ekGCS0qczgIkQB8/AaMBgVdGwloW3LfQUWP5siRH9qSrp0fkaLGvKVbEOL1RHuMdz3tHpAHtJD64P9U0VPh3jD6taF+CzSoWAuSFeiKW098aEJxD5rQTjUrvZr38K39f+H67ncTUD+vsFV805ApzOEIUv4h1T223Nyc30pkpPkp9K1iEl26rgNMK5n4F4OKHOSO6uN8m+H5bJ3GkBcXX0Blb+D/D/m5RxVr1AM4k+BPcnSZ7zj+XWikMKPNjDbOu7CQPX3HGX3l5kNPS8qQ36FLPv1L1xNldU2nXMfvDR7qAccGuB+sFen9B6m9Y4ywcbU6PvsA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3130.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Tue, 7 Sep
 2021 15:55:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a96f:bd29:7b7f:62d3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a96f:bd29:7b7f:62d3%9]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 15:55:58 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Weizhao Ouyang <o451686892@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: RE: [PATCH v3] ftrace: Cleanup ftrace_dyn_arch_init()
Thread-Topic: [PATCH v3] ftrace: Cleanup ftrace_dyn_arch_init()
Thread-Index: AQHXo9AGcZMAst5pGUmuiVdX2ZKaD6uYuHhw
Date: Tue, 7 Sep 2021 15:55:58 +0000
Message-ID: <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
References: <20210907100524.1454928-1-o451686892@gmail.com>
In-Reply-To: <20210907100524.1454928-1-o451686892@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_ActionId=38b895cc-cc20-4ae4-8b1f-a365da158b49;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_ContentBits=0;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_Enabled=true;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_Method=Standard;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_Name=Interne;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_SetDate=2021-09-07T15:50:14Z;
 MSIP_Label_f9bcc058-4ca5-480a-b672-6d2445a83388_SiteId=9914def7-b676-4fda-8815-5d49fb3b45c8;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea835ca-1f0c-4abc-8db2-08d97217fc0b
x-ms-traffictypediagnostic: MRZP264MB3130:
x-microsoft-antispam-prvs: <MRZP264MB313038909459552331416B22EDD39@MRZP264MB3130.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QeG9cwjKfwxEX1BYFuOVsmrS+d4sAQEPqGu9OQr+gjkqZveRy0ITiiIlr2HZoDvqXHQIoSlTo11E2tuouG73uzoF8jNAZL6Q/pLorlHvvno28cU1K5xiYAaAffyxWVz9NeEFq0x7jqRPIPV37n8+XmPUxLQzz4R0J3KdE0oqBstdP8rsUG2yz78VqD0g7nUzioTSPCxmhFWJeE3UwXyRPCZJlyhyPxPzxwP7RY2tXCX8sgP3b5iPPjXanhuYr+WrRZx66uklTANSncJWcGbF2A4Ua+VBdoeHCjj8od7MumLDVjWEUt56M7RHQNB3o72rCciiahogODu5S1yznSq51YtoQE/xxSNibsXesv4KRfx7y4+b/8EFzk6SAT6wWG44NL3Sdbg7DyvEQQNoIBuR7i9gCRJ0qZ6yzJ/gBoEN17yxpJTQHPpcQr/326ERXUnURffD6IZaBB13/agb3GA5Kw7QwZM89y7Yq7yh3dfLWWFn706B327cXpKnA3RSAjC2znSl//PL031mcev6BkFXlhvMH8Vd1aH77wY7dbvizcZ1mnlghcneEuYpH7q4q+K/1O+64L0iuzdzCkdJ+5yRQdd5DH5AFgIz5RUJrPYpOXdbRvs23OFUAgbDoRPqO1DF8LVoNeYaAXkKkmU86oLiLlkpgVWptMbQHp3dskXC+AUa8/NN/AavnJRqW2Fz4FDbEBWphTO4GRnPJvhyaPCfMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(366004)(39850400004)(136003)(7416002)(7406005)(110136005)(5660300002)(54906003)(8676002)(38070700005)(478600001)(66476007)(76116006)(66946007)(316002)(55016002)(66446008)(52536014)(64756008)(66556008)(8936002)(71200400001)(4326008)(86362001)(33656002)(26005)(38100700002)(7696005)(6506007)(186003)(9686003)(122000001)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bErSP+u5P1mjJDBt33HtL/ZSjresZXxgDawQe4NFraSl/OWaezZWuTGUyA?=
 =?iso-8859-1?Q?XFaTB6p0u7KynsqB6atrwNyujDnG6LU5E2ae2uUKmN/YvcmfpdoSD4iBy7?=
 =?iso-8859-1?Q?eplTAPmT6SE1q2rSWOTebgpKZmfGNq3oqi9VU5ll3ip5Ui8oe/1JQCT8kx?=
 =?iso-8859-1?Q?a/m5HF+aRRLRNRIV7cN9DXwyMrfq05inuE+Kn/XX42dbJqka4ELgejTWOV?=
 =?iso-8859-1?Q?Y4s+xk8oiCaTKj6bTy1QE8ZetQ0hthEF/W+EWqVO1z78Iu7j9gVKEmYKEy?=
 =?iso-8859-1?Q?aXl0zPAzmBSiwjXaPU1AO79HSSQXw/w0BmRo1d3HkaOSgFSvhZC/eFZ1/B?=
 =?iso-8859-1?Q?ohGuweITDD0pE4UcZS9sBKuY0Jyj4WT5ClqcIeEYPe5POhIi2xyC8TQPWE?=
 =?iso-8859-1?Q?OR+P64+dak3BHA4AeJkISjeuT0/3k1KKy30zcQePjq57NWaDaJFbx1R6EG?=
 =?iso-8859-1?Q?o2zWMLGBuO3JaiirM7hpEM/CtFcStYqwicOGrIZGj9NScLQ4eCCRWc6bAD?=
 =?iso-8859-1?Q?hTkftpBlwjRHlcpPeLSk80AR9ROuQMUQMn2kl2eg0emKLza8C+Skm/U6Us?=
 =?iso-8859-1?Q?dagWpOyaGOSGlIK9B8uecrALOMoaH5gslzy2qday9VIdw6Ffmi4w96ksf5?=
 =?iso-8859-1?Q?EoFDeuJgUeJUsRb2nuztCBfGCVN2dgatBhyxwt8JV+hALGdkKuuAUnxrcN?=
 =?iso-8859-1?Q?/53z3wC1kIUMj8GqrWPOwqTNBKqVajRwkUBNZPvgaSjJuPWr0smO+rjcvR?=
 =?iso-8859-1?Q?M4Ya9eQtA7oCHWLGsLxIm4KPqSBwG5P07cjOFNYzwT+Zis3hvKSdOesKn8?=
 =?iso-8859-1?Q?KIIRUd5dcCdf2t9AcHPTnEz5nBk3/aFQ0TFtQj5hiDQlt+5Ji865FtOCLb?=
 =?iso-8859-1?Q?jDZJDxbqwt3n4V5rwKQkbJNY9hgHZ15NKn7fuKMl4qZR65bI6Qu9wzwGCX?=
 =?iso-8859-1?Q?ziUj8/OZeCfVG9KD6DfuSY+3GVeMYM4sayiGH7qQsF4iCQZSoEfzMARIuO?=
 =?iso-8859-1?Q?B10uOta39c9sweC7crujMth272/WXLjY5OEJeZ34phMm/XCfRiGLbL2fIN?=
 =?iso-8859-1?Q?K4kIgcywSwQMFZODDJf5YhKcmmPvFVBKCppMhHIuO8Q2C1OH7aMjWAJZdc?=
 =?iso-8859-1?Q?j9NUcSNinQnzwzIWZQ1COjx+zogz/nVAp98SW2MoTeMH36QBEGDXSnFsq6?=
 =?iso-8859-1?Q?GUVmz/bMKQguSCkXVEoIbPpXQfUT3S9AtBhNCRIAjC5ikbWDQ3M65FWYlL?=
 =?iso-8859-1?Q?BZKt8L6ZYZ860tkFaLoNeBUoaJ3HKLftfNL5Ug++IYJ3lLoTHWhiyi9I/O?=
 =?iso-8859-1?Q?UvI4bNfHvFi/FzZKeU3OGFggtSwqjDxylnWadsnyIKN88jtjI1TZhE40uo?=
 =?iso-8859-1?Q?MQj0yg9el3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea835ca-1f0c-4abc-8db2-08d97217fc0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 15:55:58.6811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zX+p+QvejYszGeEDdLVCHyAYKhGH5eshAdlUlsI3q8FdNgYX0K3efX5jODDxdDb1gbsZuiKFJoX0qzSbO54KsOWYjO+sQI+IKTsvFSBxDao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3130
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
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Message d'origine-----
> De : Linuxppc-dev <linuxppc-dev-
> bounces+christophe.leroy=3Dcsgroup.eu@lists.ozlabs.org> De la part de Wei=
zhao
> Ouyang
>
> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
> Acked-by: Helge Deller <deller@gmx.de> (parisc)
>
> ---
> Changes in v3:
> -- fix unrecognized opcode on PowerPC
>
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag
>
> ---
>  arch/arm/kernel/ftrace.c          | 5 -----
>  arch/arm64/kernel/ftrace.c        | 5 -----
>  arch/csky/kernel/ftrace.c         | 5 -----
>  arch/ia64/kernel/ftrace.c         | 6 ------
>  arch/microblaze/kernel/ftrace.c   | 5 -----
>  arch/mips/include/asm/ftrace.h    | 2 ++
>  arch/nds32/kernel/ftrace.c        | 5 -----
>  arch/parisc/kernel/ftrace.c       | 5 -----
>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>  arch/riscv/kernel/ftrace.c        | 5 -----
>  arch/s390/kernel/ftrace.c         | 5 -----
>  arch/sh/kernel/ftrace.c           | 5 -----
>  arch/sparc/kernel/ftrace.c        | 5 -----
>  arch/x86/kernel/ftrace.c          | 5 -----
>  include/linux/ftrace.h            | 1 -
>  kernel/trace/ftrace.c             | 5 +++++
>  16 files changed, 11 insertions(+), 62 deletions(-)
>
> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrac=
e.h
> index b463f2aa5a61..ed013e767390 100644
> --- a/arch/mips/include/asm/ftrace.h
> +++ b/arch/mips/include/asm/ftrace.h
> @@ -76,6 +76,8 @@ do {                                                \
>
>
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +

Why ?


>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  {
>       return addr;
> diff --git a/arch/powerpc/include/asm/ftrace.h
> b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..b05c43f13a4d 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -126,6 +126,10 @@ static inline void this_cpu_enable_ftrace(void) { }
>  static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
>  static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
>  #endif /* CONFIG_PPC64 */
> +
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +#endif /* CONFIG_DYNAMIC_FTRACE */

Why ?

>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* _ASM_POWERPC_FTRACE */
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 832e65f06754..f1eca123d89d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char
> *buf, int enable);
>
>  /* defined in arch */
>  extern int ftrace_ip_converted(unsigned long ip);
> -extern int ftrace_dyn_arch_init(void);

Why removing that ?

Have you tried to build kernel/trace/ftrace.o with C=3D2 ? It will likely t=
ell you that the function is not declared and that it should be static

We could eventually consider that in the past, this generic declaration was=
 unrelevant because the definitions where in the arch specific sections.
Now that you are implementing a generic weak version of this function, it w=
ould make sense to have a generic declaration as well.

I really don't see the point in duplicating the declaration of the function=
 in the arch specific headers.

>  extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);

Christophe

CS Group - Document Interne
