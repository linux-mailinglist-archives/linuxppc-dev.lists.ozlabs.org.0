Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BC3DC936
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 03:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcjmB3Cxsz30C7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 11:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=cSknRoUD;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YG5vmKaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synopsys.com (client-ip=149.117.73.133;
 helo=smtprelay-out1.synopsys.com; envelope-from=vineet.gupta1@synopsys.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=mail header.b=cSknRoUD; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=YG5vmKaa; 
 dkim-atps=neutral
X-Greylist: delayed 449 seconds by postgrey-1.36 at boromir;
 Sun, 01 Aug 2021 09:20:51 AEST
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcgHR35xxz306n
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 09:20:48 +1000 (AEST)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 379DF40AAB;
 Sat, 31 Jul 2021 23:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1627773196; bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cSknRoUDYnV5K4e9RsktZTB3QGt2oCEb40SBNrfyh9F+EmNso1AAl6mimKoLm4Z9q
 khyQvwqSZMh/b/Bx1hwv6KmrDnrBMAkYlKcvTB6+yI+xCL5FSzLYTByDQnJ2OvadN+
 3F9QsvB9tzuxlD09nUjofDPzIEIr0tmc8Cu9mI0vuYnj2NMrIug8z2eYy+4czpfEXj
 Z3LmxLa5LXEHOkJWlry4xLGnfMHtmXYTKDJbbWD4mMGtv/4vHxsZdh+8/LFn9vS/5M
 Z+6h3mB1Pq6c8L7GYiHzosHPQZDDYwhJii5aBORBdt6MwcDUNT/C6CovEDYJobnFjO
 ynYFu45BOhzmQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 96039A00A0;
 Sat, 31 Jul 2021 23:13:02 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EBF978021F;
 Sat, 31 Jul 2021 23:12:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YG5vmKaa";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpwXj4pwuqtmFIDKSh6+tPV8Wvzx6rPiDM61wQAwVZW+dvzyJzLx7AQnna/76mETD9TZA4AokNwdISek/EiDM6jKa64zVH5l3Xf9jLGzNzkisXj41u5Bz4uVM6ATgRhrLn4hnlX78B7RvK4qfnpjpMEeh2jMvg6PHsU5JAp6wQFeF7tHmMLlJs2JhaoYo6YhOCo6wSl6PbMORKmYdM8Zl8KvrJx/WMnSgy/HiV01FmJKFDhByq7EzrfZCwd8gkWiJukzRFIvd03LxgtQDZbw/uWS35QDiLjJJwhPBIf+K36bmBx2TOPL28+e5i4oJcPbKcEyzHTt6wnTSeJ7m7HBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 b=Ugt3bcB263NQ840znsmCrwSrZCCjnHTSbbMSf3w03NJ1e9IATBiWuP9btT2zJZDKyqL3vMnWjkTBuaLTbdeuxp2lsktJ9kE67lKwT2FUc5kdgrZVcCekXSA/74Og5NkIg9D6g304DIU75OmgQRU3vtOoEGT4LgHjdRCN5+hRoS1/uzWN1cgvNlpw+AeT8cGlhX8C5pXbGDQ8ifs6VEsA0j+zE0dxWvHSvlSB8V4CIj42CCpsRvWUyxI0uGuuwj/r6ut5fHD7TNrWr2clOs3Pze3N3+20xTnP1yC06RrcqmguIJ6MUs92yCaxgzV7sRds1I+eb4QxCzMCUPA6nH5AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 b=YG5vmKaaTr8H8brX5rjKTHUnmj2TIgOVM/BnGwDsLv37PoaFI78mHpo97eW7w0cnAEtfgxQVbwI7la7nLB6605apE4qQrON0rxo+18q6Cy+kEKHeMHuCvyMsiZRoS3jt2urRBeFdIA08oyOzGgFlT5HL4upq6yltkbqR3lpRE4U=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (20.178.54.154) by
 BYAPR12MB4629.namprd12.prod.outlook.com (20.179.59.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25; Sat, 31 Jul 2021 23:12:39 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4373.026; Sat, 31 Jul 2021
 23:12:39 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Thread-Topic: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Thread-Index: AQHXhcxPA6EPe6ekOUigKes8hDjBc6tdt4MA
Date: Sat, 31 Jul 2021 23:12:38 +0000
Message-ID: <1036d104-44c1-b162-2262-973226628be2@synopsys.com>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11f32b68-098f-4b98-4dd5-08d95478b105
x-ms-traffictypediagnostic: BYAPR12MB4629:
x-microsoft-antispam-prvs: <BYAPR12MB4629D5976007C72139678E93B6ED9@BYAPR12MB4629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmFQOtz89sCyiTQut2zG1zFT0qpFyE0WSlhEbGxCJGfkjyhF+USRzUKzqwkodF8ZyRtyeOgj2zP134AurnC+Q+DpgsrlycwmfpeUPMbz93DtP24Oe568AkFxk3jMKKB4ze2zuTS53ReYfN6biZHJYYNvQiEn+dctWFX/I12PgztinH2/ugFnZbNpGNZ+heYU845Bozk739sSSxsa/LtyN+qzf3qpUNot2nTr3PCLBOyiO1zZBXug6kbXnq2FEOZ1oe+Aj/HBStz/mjw2vukJV5L+poZNNkHJFp8lBwpZAaI3kRQIgVyKXE5Q2rwC+Fxgr59Eqenwc7Haggm9MFSyqHSaB616ZNgFFit6Cyem7ebS0dOrwT4x4DPudHskmfx7ARtB98jxRP7JNsr+mjDMuaxsOu7XAdbeXaxA/PQ9fnglLyPn7iU4TrYbVCK+q9Gp16anRP3UkybeF5lUHpVdyset4ZUqgF+AZiT4JzMNXC+IhZeeSWMSRcN2C1+Bw0n5uMi9QjGyYNvdGKE3JfUBcBbWeXZyiEcvfhcMVwyMr1/Ax/yowBS8dC8wrkE4Hpd6YA4xNzje3rfUdWSK6gJrlHk34PIKfYY73g5q9V5meZMdfacvgx7vRYOMlAPRujYRQBBo1LA2th2vp5I5Y9TU9Sr2JwvTYeFH2+3krPTKHCzJqJ86q0BFC0Yr+guESlQdkXaQDVg+msTqnCYqTjQQV17Pv3VTmn68D2B8Ggf9oUbhwtewM51U74tspgcSgAEes0etk5PqoMEoZI07aUPmwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(136003)(346002)(39850400004)(71200400001)(54906003)(2906002)(31686004)(8676002)(110136005)(6512007)(64756008)(76116006)(5660300002)(66556008)(66946007)(478600001)(66446008)(66476007)(38100700002)(316002)(38070700005)(6486002)(4326008)(8936002)(122000001)(7406005)(186003)(53546011)(26005)(6506007)(558084003)(2616005)(31696002)(86362001)(7366002)(36756003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZ0ejc4cXpYMTkxUnBnY0lObXVWQ29JUFc2d0RlMjQvRS8wYndESDNkUEUx?=
 =?utf-8?B?elllWERCbVMxV29SelZjUmNSaXZESU9ER0xsMFFMQ1Rnd00vRTV0ckQyN1Vo?=
 =?utf-8?B?TG9jTlFIcTQxbk12TTBZdE4wTUJIUXZKeGx5blhmUm15NnE1aWVENXdmd0Fr?=
 =?utf-8?B?TEhNbWROcy90aTJHODNkVWl6bWdaajc1eS9VWmpLTWc4S2d1Vm9jOXJGcG9N?=
 =?utf-8?B?NE1kaUhEVDU4SEZFUjlUbE9aN1FBakVSNzNVRm8yaWFJRUF4MHFQK21FSENk?=
 =?utf-8?B?SlRvbkQ0WmptajNtcG1hNlhHZmRpWGNxSk5wWFlJNCthejRTRm0vemxwU1VE?=
 =?utf-8?B?K0xjT0YyYS9DUjg5V1ViWDdJcTZWYldvUUw1Q3F2NTVmUllUNnpVaHFJMlE2?=
 =?utf-8?B?Y2dQWXZqSzZEa1kwYlA1SlpNaEtEenFXT3NXNmYvT3ArVHpMV1p4cS93TGlW?=
 =?utf-8?B?NFJ1bkRnMk5QNzkvOTdtcHlJQ0FCRzlMZ3dnMGdjTlc5Q2JIbDZHbUptdGRI?=
 =?utf-8?B?RDljL1QzNXg4TlBYM0lvNHFjZ21rVGZ1OG5ONlkvR1ZXdytkWDJHTG1JQXVU?=
 =?utf-8?B?dkpySmNWNkRqL05XVUNRbkJyNWpORFFMT2FDV0dyeDI4bEZtRXc0SExMMzJ3?=
 =?utf-8?B?eEJ6N0V6by9GVkt2THM4eTRMcVhLRTJnZy8xWlpSNEN5bXFFMEY4ampYSTlZ?=
 =?utf-8?B?Q0JUNlR5UFN5cnpHWHM3a0V6T1RMcnNWazRqWFkrM0x6RjBLdkZMVklnTDVM?=
 =?utf-8?B?eGFKc2p5QlY2NTlxUFdxSlNrVmJ2QVBlZlN1U2Y1amVoNmhEZUZXZ1ZjT0pZ?=
 =?utf-8?B?Vk9tNTZET1BpWGZaSzFrN2lhQkN5aUNIOEM0UHVZTjI1UUkyQXBvUFhZR3da?=
 =?utf-8?B?cFRqbnZwNk5KUTJadFFINGhiM2JHUVBtMk1ZODNYUkxKYmVTcWNVS1duZWR0?=
 =?utf-8?B?aUh6d2Q4Z1ZxOUpVSHFaYnFmUG1RUWxjN3I4dGdadU53UkFPNGdoTTlMeWox?=
 =?utf-8?B?ekVLVWIzYmpwd3pLSnMwUy8vTk9RbU5VVlBMT0QyZkpDZ25rMDBGM0lZNWdN?=
 =?utf-8?B?ZTZ0YUFYK0RUbGVlUmNuSzc1OWM3Ykl3dXZEaWU1cnJSb3Q0MlVwTGRMdkgx?=
 =?utf-8?B?dkt0cDNFRFhtRWxsRllkQU1qZyt3UFlmMzRKbkpiTHgzd3U1OHgrekJGdm5O?=
 =?utf-8?B?dlZGUU8zbUJYdzFUK1hGRXFOYkRJWG9FNnFmZnVyZUI4RjA2SENoVVRpZ0pk?=
 =?utf-8?B?TVlHYVF4WEhpNjRyUzNxRkI5NWJScWlISUdDWWUwZ1QvaWR3ZmJqVXcrbkNQ?=
 =?utf-8?B?TDBWUzdURE9hR1dweVVKSnArZm1JS0Jqemx3eUIwWktOMUViTzhGUmkyRjdT?=
 =?utf-8?B?VWErdEtpRU8rQmJxck1aU3k0ajRNUkk2ZTBuYkV3TVluOVlnMm1PbEtYR1hi?=
 =?utf-8?B?UFdCZkh6akFEWTUyMlFRZU82VGhxeWZaVTZzNDRpcEFHRzkza2lKWmI5eHNK?=
 =?utf-8?B?R01xeEg4KzA2VnVnaWxkZTlOVDRmTXRYa2lFVFgySUVPbmZMNytzUDY2Zllv?=
 =?utf-8?B?OTd0eWVzdW5BOVVKaWlkUlZTSjcvOFNVWmZpRlhvUkRkWHROd3VTdFhxQW5Q?=
 =?utf-8?B?ejBTNFJTMjI1TTZVWDBSaURVSHhKVk9qOHhzaEwyeHR4anF3Y3N0ZDBqeEpG?=
 =?utf-8?B?aHkrY0VhV2puMUorRFFTT1RDUDBiYWZSSW52Q3dISzJFUldhZFQvanF1NS9Z?=
 =?utf-8?Q?IjB8kzYt4uw+NJgbH4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D343C53D18DD6D43ADCBB013B53C2A98@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f32b68-098f-4b98-4dd5-08d95478b105
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2021 23:12:38.8971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n591pRdiJ+MmbcbSM0oJpTzbEaSomMaacCyu2y3wQloG0Gf8tLeP4Y4IVvlSpPAu7VFslDybhx3kj+vNcxGOYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4629
X-Mailman-Approved-At: Sun, 01 Aug 2021 11:11:54 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Stafford Horne <shorne@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Jeff Dike <jdike@addtoit.com>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNy8zMC8yMSAxMDoyMiBQTSwgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOg0KPiBNYWtlIGFyY2hp
dGVjdHVyZXMgc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQgaW5zdGVhZCBvZg0KPiBoYXZp
bmcgbWFueSBkZWZpbmVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1h
c2FoaXJveUBrZXJuZWwub3JnPg0KPiAtLS0NCj4NCj4gICBhcmNoL2FyYy9LY29uZmlnICAgICAg
ICAgICAgICB8IDQgKy0tLQ0KPiBbc25pcC4uXQ0KDQoNCkFja2VkLWJ5OiBWaW5lZXQgR3VwdGEg
PHZndXB0YUBzeW5vcHN5cy5jb20+wqDCoCAjYXJjaC9hcmMNCg0K
