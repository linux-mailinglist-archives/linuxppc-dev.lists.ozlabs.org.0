Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB9B4E8F88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 09:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRlS82FBnz3c42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 18:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::616;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRlRd2hqKz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 18:57:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5cvSnR1sCpNkkHDSrpZRPblxQ87FQphwvitNEEevEW45BwSvAV2y+dzCSqF9RD6F1h3EyPFXeGA4Kcx2PNWiw3SyK4p8PK+WF/utuZP4VcqG7wMLWHq0P0sJQHpTVFFk2yDbw5t2xxIJp5XIUt707M6UYlI3obI7D15sP5zWKS88eopWkUFD4avRe2BRFBr7oB7GQAMzYQeedCVlMIZ5rT365e+Xk02jXb+vlThaDnhWFiCrOOCP5Eh8OBAGyTxPYa0Qctt6N+8glWPpBn4JFpHUT3SIDM2Bu2vfytiUtMOK1N38uPEAADY1nJE5CslhTpWgy8UFSmk5vMfeL2Xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UK6JZrCMwAHJtnzST96jT+Yh67oyQW28cLDDwb9uGGg=;
 b=Poxbz6QvSX//iKuGdeRVI4ktkXZZ9OsMitQR+oW4uM9Qud8auSg+n4f7AX+RTyHRh3pdh1c/Moo6Wbq04W1ZD9CpvP2zS5zXawRvh8qzE03GoKaDVcm5u4xb0XDv6kymuSxJgjpef1ioDZvhQmXm1HY3fykySx+RS3G4OsNmQ6JIAV3ayVkO88LWtdWW8Koxb3cIO3k6569dP+cESkUNKmw62Ez6lUOu65ojQJMIBtY97hOGSp+6loUjgyMtzEmZDpIIMlDyWXdN16vvRRkazLS6MEXxYEwXWQFeEFWaq3f5Y9Rbv/P7aMQkGcryZcE3FA/bNTkS7lRK+eKvnREULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1683.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.20; Mon, 28 Mar
 2022 07:57:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 07:57:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: Build regressions/improvements in v5.17-rc7
Thread-Topic: Build regressions/improvements in v5.17-rc7
Thread-Index: AQHYMgnDe6ciq0Rdq0eyDsdRIUSgk6zUjtiA
Date: Mon, 28 Mar 2022 07:57:25 +0000
Message-ID: <a4c0f369-29b3-e1ee-37db-35098db3bc83@csgroup.eu>
References: <CAHk-=wjkkYX8OvTv60+XvQkAK4Pg0QC0Hn-4+n7Q0t1+QWw7Sw@mail.gmail.com>
 <20220307081540.2716107-1-geert@linux-m68k.org>
 <CAMuHMdW=S=BJouptLGw12CbAqeYbBYwnsdrn90C_04n6s4H7bg@mail.gmail.com>
In-Reply-To: <CAMuHMdW=S=BJouptLGw12CbAqeYbBYwnsdrn90C_04n6s4H7bg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e62087d-7a57-4b17-bbef-08da10909944
x-ms-traffictypediagnostic: MR1P264MB1683:EE_
x-microsoft-antispam-prvs: <MR1P264MB1683C243F50CA9C590BFFA15ED1D9@MR1P264MB1683.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZY1ElOHNEK8pWGvI3IHXjXUhno0iQNB81JrGWhlpUQlWFDqtcUkXE2si10vSPgx/G6M+okuxHTZuMJfJRgFCVLBXZSYuF00LWL5nI0YYuw2XIxSLoTZQUQBT8LAb3cj2pYQVrtFuXqptjmqXMjTJftubYOV4/cNE7Ikrp4Demg5zdVkjRJQFNeVs5wfTKbBxS2utTzv8n5bQyUERvC5fUbvXOXCySOMECohzsvvAnearYPLO7pAp8Kl9t4NVZXuBajhA4/jTuNznYoBRZUs2oUMIxLRX5ywZrhaOcLuGV/bRHturkqJtGjQC3nPGnD8F5xfRTw7lV7EUd55aJgW9J+LvGHvNEsggz35kO5uyAqo/qbVnlHc+BIBygf061mku6dp1WXNzsofT2FWRlOu/XXaQcd8ChcXiXd6I6ef4CpYKw1wVezlHzv0qFAU7/a/z6jZRAvoJGpr7sW6xlxt7aDsYl4BopXZLwy6yfeykzE0Me3boh6vXsRpyXJiMkufTdE/1Z9LDJOOmCbzMYfflpBY2JeC9AYrsGF1VdE9PmP6lspOjGDRXZ/w+IN4msRuiGVL9fXwpmWu6o+B49djyUDbgf2seMFI7DqAUhPPAtcS4MOwHNMsAcxeMGb9KUFGRvfZM3V7Y2w75Qx7rU+NfPJ4i9ibVZZRDqRRKO2RlpmMePMaBSr2N6Ipf8FIsTGgqPUL0I9yRbNxSX2qXjFzM2ZJWqFxQmT4lbgr+tk7SGwT/NF1iDKaqEZQRovRpMh3upkycBVgHwq7V0Ccqs33q9qbb4W5r2EueJoHmr1nWn1aWiu1HnEWX2ZHs2V2KQoHvmuAEP0ekmi4C2P+/d0XXDanw9AfIl+5e5iloX8M8kw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(8936002)(6486002)(44832011)(76116006)(66556008)(66946007)(4744005)(5660300002)(66446008)(91956017)(64756008)(71200400001)(38100700002)(8676002)(4326008)(66476007)(122000001)(316002)(2906002)(31696002)(26005)(54906003)(110136005)(186003)(2616005)(508600001)(966005)(86362001)(6506007)(53546011)(36756003)(6512007)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDBtNXNKZ29ZMm5saloycGZFV0gvRVdOd1NGNnVtM0FTVllYeFJyM1lQSkZx?=
 =?utf-8?B?aklHbmVyb1F6cjlrV0Y0bHZ3S2UwTm9Ec0FBOVcvQWd1elpMaGpBWmx5MTVW?=
 =?utf-8?B?RG1udWR2VTJza1NVMktQOUFCelNIN1R2eU5FdFcrTkJrUHMzWENQSlhMdE1Q?=
 =?utf-8?B?bFovV0ZOTlNhdWVxQ3ZEbHBjWjlJY1o2QmFzSlFYUDhEWG1VRmkxNkR2WU5h?=
 =?utf-8?B?S3d4SElYTzg1UkxpT2V2YW1jdExTWjFwM0xSeWpWc0QyMit5RHVEM3h0OGpG?=
 =?utf-8?B?di9tNXpJeXpzcVo4ZWlOS0hha0xoSXpXbXAwOGdWYTdEc2xIdnF4QUVVbnN4?=
 =?utf-8?B?dVAyN2RZdldsR1VqTnVZVDRwRHBzRXI4NzRRN1RLL0FJMmUvYTI0dGI4ME9v?=
 =?utf-8?B?SkkyS0Q1cGtSTjZRdER3RElFSStrcDErVzFOclF4Zkc0OWxIMkpVeVdOd3BB?=
 =?utf-8?B?bC82K1oybTdwc1lLY016NTlVK2NoVDBzeXZPSjdhK3RUdTNCbUgybnI2VExL?=
 =?utf-8?B?N1Rqa01iMnZPSVc4RW9DUEdvTG5iTE8yVk1zaldzc09hUlhGZU5IZHViaVFs?=
 =?utf-8?B?MjI1S01Fa25iV3RsenBpdnhBZlJUb1E2RzZ5Yk1SUEl0M1NaREU5YjFBOUZk?=
 =?utf-8?B?WWpheTBTV1IrUTJaYTlIaUlkYUxoUDFWY3BLU3hEQ3NoYzFUOUlueVZuRUVL?=
 =?utf-8?B?S2J6RnV4bU9LSy93N2NOcEhvUmJMYnRpd3EyUWVLMUYxNjViWlFzSEU3US9V?=
 =?utf-8?B?UzZNOWxEMTRXWGMyelRXQTJLMVlrRzkxQ2xVMW9wNmNvTFRZZzJMalFSOXRQ?=
 =?utf-8?B?UDI2QUwraU1ZdEIwejd6SnBrUzVhbDJlQm1wM2ZTcll3TUpad3NHWGVRb0ZM?=
 =?utf-8?B?L1BOZ0ZaNklmYzZ0N2EwekNPaXlzVkMycGd3M1ZMRmxHSnBxZk5naEhmaHQy?=
 =?utf-8?B?WWRyMGpHOVZpQjF2S1h2VU9IRkdFVU0zT1hhaVVoUXVqYkFDRjl4K2dSQVhL?=
 =?utf-8?B?TXhLRTQ2RkdpOFUrWC8xa0tPdGFGY25XMlpUckxQcGFEeXNYSERZVm5aM1kx?=
 =?utf-8?B?YUd2aE5NTytnOUlBeTNNK1I3K004ZjczbUx4TE5TQnhpYXFBbUx5aEJBbFNm?=
 =?utf-8?B?WEdVNWsyQ3ZEK01CY1hiUzh4WU1nRlBaUWtJWU5ranFRSi8rZGFoZE5wL1N6?=
 =?utf-8?B?Q216YXFZN2p2aXI0MXJhcEcrMTdzbit1Y05aVERjemZYS1VTNHpEcm8wdUpD?=
 =?utf-8?B?cWN0Vm5pdURQWklkcW9EdFZ2d2o3TjN4MFJRUGk0cUVpcnlmVU43d1k5M3N4?=
 =?utf-8?B?ZUZDY05vTUxwZUUxSlk2V2dLYVJTZnI2T0ZsR1hJUHkwN1puVVU0bDhuWlgy?=
 =?utf-8?B?ZERsaElEOWlDZlh1cWdKR1o4cFB5eHZ5U0h3aVZqMWxNWnUvbnE1RVp5Rm5S?=
 =?utf-8?B?c1VwZHIrWG4rYlk2SUx4M3lyY1RFdDJhS25ucGl3aGlPS0cyRWt5TEZ6UXFp?=
 =?utf-8?B?LzdoalNmYUg3RkxodkE1eXQ4YlNnQ0VPQ2xxb1QzU0tqQ25jaEs0WW1sNzNw?=
 =?utf-8?B?aVJwblVYVno3cDkwZVZUUVpkY2YwRnFUV3RYYXB0VGFDRXZ0Z0pwdk44U01C?=
 =?utf-8?B?MVVRaXg5cGFSYUpjZjEyZE1wMTV6OTUyMFNQMzJ1M29ZQXY4elZHaGF0K3Uw?=
 =?utf-8?B?M0Z6QVE5M0hKQ1pDVzlHbzF2VGk4RVpXdkQwaWIvUFZDRWpQSFoxMWxDTG9H?=
 =?utf-8?B?QlVWNzlyWVI1a0k2a0RCb3ZXZHdCUGVxTDJ0ek5sRFFaRFNYT3pnak9PRkFk?=
 =?utf-8?B?N2dCSXRTOGpnSTNjUVV2a1ZCd0xUTnFEM0V1L2VJVy8rbnhZbkFlTEVlUnd0?=
 =?utf-8?B?NmF4MkE0RGVDQkZPeGNGVlZTTEMwclpnVllreU5mdnptQTEvWXg5bDYvcEJP?=
 =?utf-8?B?eUthbHFaOEZkektJZktmVHdUbkxlZjRaOWdvY3VvZnErRTdUWTdvOG9Wcy94?=
 =?utf-8?B?M2VQQW81TXF6amZEdzlaRWZkakFCUDZTY0I1Mlk3N1FKUjY1T1RHZlJuWGtz?=
 =?utf-8?B?c3hESEo4eWdNNUMxOXk4c20ydUJLVXlGa1lvYTR2c1h0ODFhdmNKUU83cWtS?=
 =?utf-8?B?d0EzQ29mQU5nSldmNFg2ZXJ6WDB2TkFGVEp5RXN4QUxBOTN6Q2gwcW42Yk1z?=
 =?utf-8?B?cklZb2pnU05WNXB4U25pRjlPQ09HckJTU255bXh5aE16YnRuOUpRc1lTcVkx?=
 =?utf-8?B?QjJ3bjBWeEF6UzBOYjZlMTRJdEVyT091YTJnUzFFbkNQdzB2eVBqTWpheWk1?=
 =?utf-8?B?dXB4TVh0OG9GL01oaEZFcXl0ZW0xN3hPTHNFSlpzaVhYYTNLK2crUXNLNDI3?=
 =?utf-8?Q?cPoYM4hPDKiJSDqSDRK0T1IQHGlDzEyVKSLr8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E24FEB42B1F02B418A5D839CDC0BF02E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e62087d-7a57-4b17-bbef-08da10909944
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 07:57:25.8162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6ZlQ8oeWRRrmHscgp+mL/DGDslV312ibTLMu0ECH+40z4UHS5oCUZYJDYwKrLbDn0c005Tmjzm+WqojQHDRw3NZgwyXvccT24WfOJ0PLVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1683
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
Cc: sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAzLzIwMjIgw6AgMTA6NTYsIEdlZXJ0IFV5dHRlcmhvZXZlbiBhIMOpY3JpdMKg
Og0KPiBPbiBNb24sIE1hciA3LCAyMDIyIGF0IDEwOjIxIEFNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPj4gSkZZSSwgd2hlbiBjb21wYXJpbmcgdjUu
MTctcmM3WzFdIHRvIHY1LjE3LXJjNlszXSwgdGhlIHN1bW1hcmllcyBhcmU6DQo+PiAgICAtIGJ1
aWxkIGVycm9yczogKzQvLTENCj4gDQo+IA0KPiAgICArIGVycm9yOiBhcmNoL3Bvd2VycGMva3Zt
L2Jvb2szc182NF9lbnRyeS5vOiByZWxvY2F0aW9uIHRydW5jYXRlZCB0bw0KPiBmaXQ6IFJfUFBD
NjRfUkVMMTQgKHN0dWIpIGFnYWluc3Qgc3ltYm9sIGBtYWNoaW5lX2NoZWNrX2NvbW1vbicNCj4g
ZGVmaW5lZCBpbiAudGV4dCBzZWN0aW9uIGluIGFyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF82NC5v
OiAgPT4NCj4gKC50ZXh0KzB4M2U0KQ0KPiANCj4gcG93ZXJwYy1nY2M1L3Bvd2VycGMtYWxseWVz
Y29uZmlnDQo+IA0KDQpBIGZpeCBpcyBhdmFpbGFibGUgYXQgDQpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzg5Y2YyN2JmNDNlZTA3YTBiMjg3
OWI5ZThlMmY1Y2Q2Mzg2YTM2NDUuMTY0ODM2NjMzOC5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Lw0KDQpDaHJpc3RvcGhl
