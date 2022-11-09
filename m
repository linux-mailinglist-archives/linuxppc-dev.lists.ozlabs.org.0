Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF156223EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:21:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Zc473J6z3f7d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:21:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kCD6ZYTI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kCD6ZYTI;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZYV27GMz3f3D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:19:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEGQyZ2oKp+eBAQjhj/lSG+U5ciaQtAHEXtt68GHcPCoD7tspKNIUugv0Dd6ZLpEyQu+KLRUwDJ/f8wZGDNnPTOcvfx4H5/odme3zUiCYY2R2kv/LGFJXcSzK+Fov+w6gzpBU7g2AmppfPdbxRw/erLv1dEM6OMFHh9Ls870wYC4UFtWvmxXAvi+JqY9h4m7GaOLv69FsRIPideu8MyMgAq6q4Q2dumPsGniPKxHG8+x9jVvyI7ruXjRB+cLuEcNDzjhA5Xvp1IaYP39PcPW9WiwZoGEJBGpD8u9YkVSJqMPBkdH/WdsV6XcqpzyEYDaVWiPoH4IxFC5cX0Ru4WZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INWYkVfq0vxtfz3FYMwtJGlKaTnazjFyKzF5/hji/ig=;
 b=ajPFAoIZ+sXTVAgVjP8+i5Bxbf0qh8/r4S+nnTjrJmg5rS8LYlyEAjFb8tkoYKlgjmSlobwLfo2WvYPEGumZf0zMAnDqwuYx4oDdHgc/SQx8YdExHUVxODgAabVYIUDApa8m0PDBMbkch3NI1KP/bS31bkbUvJKTFOxrITX8haME5B6Ebjmzae7FDZ+bBGR4EPJlT6o0OPQgRyhIFCKCOQ3pv8ptpxMG9FNZBTKe7tSZE2LbBCBj5qA112e2pnPQSAcIxkcIJxZVOFbCH3A2h9UJpXn3qxaEaX1Te4VAKxCNIpcUyubKgyxvvNHeQjNoGHhuH24LYBjGWnfzTpqVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INWYkVfq0vxtfz3FYMwtJGlKaTnazjFyKzF5/hji/ig=;
 b=kCD6ZYTI5wSBvxSgJ5j8cGhjoBb9P4kWRX/SxjF7qh1/iLfcLrubM8Zu5V973XpE4g/P6TiGKf5FqVMqKV5oawMBlad3dAGN1UaJKZIxYPF2drCdGcr8/BObnzjbSUIKdE5SJVU0d5eTY4miAjalinaLlXkS3lnkQasBVKvViSw7s+6jQB6mexCr3UdgGaEEnvAsJk1RjzDG2XdY0i5oEdrBvX9R31JFcwJ2wz0cBOmlt/wZp5IVNC7kGqCFJTAQdmbjTUl+CLC0vOsMXEJAwbWk0OrZP6tvSM1EqmjdwUGcq936kLISqFsUyuIyRZFIjmOYWiGCI0jOt9zwoDI7Yg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1703.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Wed, 9 Nov 2022 06:18:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:18:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 7/9] powerpc/tlb: Add local flush for page given
 mm_struct and psize
Thread-Topic: [PATCH v10 7/9] powerpc/tlb: Add local flush for page given
 mm_struct and psize
Thread-Index: AQHY8/b5zeowGZjoskOnhoTvZDxi2q42HleA
Date: Wed, 9 Nov 2022 06:18:51 +0000
Message-ID: <e3e8a201-a2be-e21e-304d-5934e90e40a4@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-8-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-8-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1703:EE_
x-ms-office365-filtering-correlation-id: f6eb03f2-d1a2-4bd2-8cef-08dac21a457d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ct+E50gPAOjRJa3IWF8ke5l4I+89+1Ma13G6gqLs6t/eUW9FKwqd2C/JYm/G4B1ko8ToaAbUe4pTfJkRuaOwQHhVXoNbOqh0cD51QwPHA0cQSJ0IfTcS1sD9uIW9GMzITsHAn8XRtrz3C49NU2sgzLKpIguliE10OpH0b7aeTW+e2QDLvud1H2R+X9DYVsOtz1C7Kg3VSNkVk1q7kgfmg02t0wkDgIE/mq4xCdpDHpMfcWyaVq/EnwUG4HJNHiRiVPlkvZT2sQ5zI2dbPB3A0kbEmBVErMgnWt4krgNEgcMYUwE+c+SQCSbHMLWVn096I5nOMz4oT4gaQ+U2dNCknny9oDNBbiupDnT4FENOFJXQg9QRLqYRSKXrAFgNslUfKrPT4/qHu3HzSKxzdMISvx3lQnWFPygZFZMcfZKjH8W76fnoaukV6QByxrd/76KzCZpnNgGOoEfOmFQnO25EeCyzTH+ZD1lBuLg2WiVz2egdJzVJxBHPQ995Mds20wksv5F/TXujSi4B/xMiQYcWYVb1Yx5kjULsxJAiGzBdEK7srOIoW8b+ZkHiX0+Gs+ol9zVT4lfeWeQG56S8HkCi4959Ilbl91ynPWACE3qHTmEuzgnmidkXTZ2lDn5mXgCi8394o1I5TmzC28KTkpQPDCxqOeR0kjaocM9xLR9LMgcTJkPsbRte+28ZXb5/yxpSPySquMC4a3qoKYgSbdFSBFtemG2Wbcn84mWvBYrYrKNQJG78KxkM/mm4rV3ou+gYm1xngbFuAAycHGdZ4AwkC4yH0KcD1ear9Ym1XiC1lAVYbSN1tjdQbQAuaon3ZEZCM8QDD4FL/BAb2d4wucxwtg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(36756003)(186003)(83380400001)(122000001)(2616005)(31696002)(44832011)(8936002)(41300700001)(4326008)(2906002)(5660300002)(8676002)(86362001)(64756008)(26005)(478600001)(6512007)(31686004)(6486002)(316002)(54906003)(38100700002)(66574015)(110136005)(71200400001)(6506007)(38070700005)(66946007)(66556008)(66476007)(76116006)(66446008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eVgyL3AxNlkrTFFzbWV4NEsxYTE1T3hDZHNkMlVJaTAwWHE0a0UySUl2RUNO?=
 =?utf-8?B?VEVQT2tkbHRVMlJVSzJwbkNxbFNDMkdEMUVPMHBRZFhHWWFuOUE4UGpVTW1H?=
 =?utf-8?B?NFlJNFNrNGpKOU02Tm0yOEMrZEpjeFVQRXVmSCsrZDFhTkZ2QWs1RXJvb2U3?=
 =?utf-8?B?ekZXN1JtZmt0YS9WczY3S0hXaEFXQ0UzenQwdEdKUW5yQkI2UHk2ajNtNGlD?=
 =?utf-8?B?akhkK1R0eWpRSGRUMFBQRW1icTQzZk9JejVNeUw4eWp3VExQOEZINVQyK2t5?=
 =?utf-8?B?UjhrZjcya2lNSFk4OTRkbWExb2xFQnR5QUlGSXpZb2JmYWt6b3ErYlRrZHlU?=
 =?utf-8?B?ME1aUmU3QnJZUFg0VFVqazIybkdqb1ZWYkhUREp5ZVR5VzZJSWgxMWJVaTZO?=
 =?utf-8?B?NndjOGJUVGRmSEUzYmJxcGoxak93QWdMN0IycXc1dDVUai92aVBEVFJUR2du?=
 =?utf-8?B?cnBDYW9BYkQ4bTFNbHI2SUFaV1o0K0w0VFJTdmtKaVNCa2dCNEJvSDZSNVg5?=
 =?utf-8?B?Ym9ONmJRZThxeU1ySVBwNENHb0FEeWErS3NFRmZpR01nanpEQzFaOWF0dmRE?=
 =?utf-8?B?YnNuektVNTc0Sys3OTFNNEtVaHZQSGd1ZHp2VkVGSEwvU21xNTh5YW9pcVBY?=
 =?utf-8?B?RFZHSlI0QTY2SG9tRnNTM1RvU0dMeTlMK0FtYXBjQzRrWWdrclZ0d2NoWXBL?=
 =?utf-8?B?UTdvd2VkQ0k0RHlmdGx0dHZVbHM4dm9NR1RDdHVtL0huYlRzcE1JZGRXYm54?=
 =?utf-8?B?ZXZLSWpjanZod1F0dzN6TDRpRS94QVNjM2NtT1ZIeEppZjVlOG5MUEh6NWpT?=
 =?utf-8?B?aHdrMTVtQisraUFYUzhIZFJVaFFUeXRuU1BFOWx1bXl2cFh4akFxVk1aVFpI?=
 =?utf-8?B?dTlmdDRBUGp0UzNZL3Z0SWJNY3U1eGRoZGJIMGZiRDZhZ1Q5UFBzNkhCaHFr?=
 =?utf-8?B?ZFpxRE9sYW1VUnZXSmpoNk9OczdteWI1d2p5azI0RGdQM2k3dGFWZkFZWGg1?=
 =?utf-8?B?TjRWUnBZR3pCd0pnZjA0L0tnYmhPSUpPNHFOMVpqdGxXY3hwaHh2Q1lwaXhH?=
 =?utf-8?B?SnhydXVxRVZ5Q1N5ZjVaMUV5MXY5K3ZxRm5Wc2RYQWtWQ2pjc0FEekN2Nllu?=
 =?utf-8?B?eTNkQkZ1YWhTeWwvb041TFNTYWtnK3N1SkRBS214ZjQzWjBNOVZPenpzY3Qw?=
 =?utf-8?B?UlBqRjArUGpPVGhhdG1DREw4aU9Delh1NWk4bG5YOHBNNXdsL2RqR3FFbDNh?=
 =?utf-8?B?NTJ1NFpKcm1iMmxrS2dpb28yM1BVRW9idHFEL1FQb3VWVGNNNWJhU1NUUnAv?=
 =?utf-8?B?N2VteWo5UUNVeGNxeEQ3KzVpaStYcS9GY3JmMnZlZ21tNDBLMHJJSUdGNWFM?=
 =?utf-8?B?ZlUzb1NZMWlwSDBocWNZOXFkTmY0MGsvcVNXa1NBZmVacDBUcmloN0tKejY0?=
 =?utf-8?B?eWppblN2MDdOaDdqYjFOK201enRMaFBXajFVVHltYm1yRVZUNmV2cVBDN2ZK?=
 =?utf-8?B?dXFsSVpJVmg2NkgzUmdBS3d3Yk1hNnFCcTJYZFlaQWE5d0J2QU9yeUJUTVZF?=
 =?utf-8?B?cGVmb2RnbENKeE5rV2h5bmJvcjVkWmNUY3pTVE9aNmlDSEEzblM4MzJvWVNH?=
 =?utf-8?B?VHVlQVVaNFYrZ0hhc2wrOEtoMXJoT2RmVkNKWU1ZKzZrRndwdG1yQVgvMEtV?=
 =?utf-8?B?a1BORnVlYXVkKzNNSEZHN2xBK2FyQS9QYXRSdFJrcE5jWjVVT1FjMkNpa1c2?=
 =?utf-8?B?dmJoU29lcjRCc0t1UzhBYzZvQUtteUhYNWptTndNQWZCTGpwY3N1aTN5aFVF?=
 =?utf-8?B?a2M2NzQreUlXL1U2UVlGazVDQmZSeUVjQ2ljRk1zbVMvT3kwWXdLT1JYMHQ5?=
 =?utf-8?B?dWVQMUVKYTBqc0ltdjNTWFJUeXQxNDlnSk95dURQWDQ1c0JJeUpiaXA0REl1?=
 =?utf-8?B?NVdieVRweGdYVVk1RlRZSG0wMWY4WWZSY0J6UnhaWFA0WmxCZ2oxVXpteE52?=
 =?utf-8?B?Y0JQbWpkZ1Y3Ym9Ec1VNRVhLaGtpV1BodWtUOTYyYXp0M3Z1NnVKMmF3MHhu?=
 =?utf-8?B?bVBmK1ArNStJak15Q0lZVDdEUy8zN29QbWkzczNUcE5uRUFGMWhqSFozWHdF?=
 =?utf-8?B?QXpVd2VsUXZTQloxQVE3V2RKb0thMGdvdVpDYTlaRkM2c1gzQTB2R3J5SmxU?=
 =?utf-8?Q?hHZRsHnm9z9bu0jnvYCogq4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F52704830CD6D488603D789CEB513A4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eb03f2-d1a2-4bd2-8cef-08dac21a457d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:18:51.6828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcYx+y4FGkZIfGVcvAROMFn9vUTDYpNurb0bmJlAjtrLrnL5OgbPCjmdwhcmSz75skfpGJsUVB5DJ8v0NCq4vhCudUCrB1Vv2PwakW8uSXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1703
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QWRkcyBhIGxvY2FsIFRMQiBmbHVzaCBvcGVyYXRpb24gdGhhdCB3b3JrcyBnaXZlbiBhbiBtbV9z
dHJ1Y3QsIFZBIHRvDQo+IGZsdXNoLCBhbmQgcGFnZSBzaXplIHJlcHJlc2VudGF0aW9uLiBNb3N0
IGltcGxlbWVudGF0aW9ucyBtaXJyb3IgdGhlDQo+IHN1cnJvdW5kaW5nIGNvZGUuIFRoZSBib29r
M3MvMzIvdGxiZmx1c2guaCBpbXBsZW1lbnRhdGlvbiBpcyBsZWZ0IGFzDQo+IGEgQlVJTERfQlVH
IGJlY2F1c2UgaXQgaXMgbW9yZSBjb21wbGljYXRlZCBhbmQgbm90IHJlcXVpcmVkIGZvcg0KPiBh
bnl0aGluZyBhcyB5ZXQuDQo+IA0KPiBUaGlzIHJlbW92ZXMgdGhlIG5lZWQgdG8gY3JlYXRlIGEg
dm1fYXJlYV9zdHJ1Y3QsIHdoaWNoIHRoZSB0ZW1wb3JhcnkNCj4gcGF0Y2hpbmcgbW0gd29yayBk
b2VzIG5vdCBuZWVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlA
bGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gdjEwOgkqIENoYW5nZSB3YXJuaW5nIHRv
IEJVSUxEX0JVRw0KPiB2OToJKiBSZXBsYWNlIGJvb2szcy8zMi90bGJmbHVzaC5oIGltcGxlbWVu
dGF0aW9uIHdpdGggd2FybmluZw0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
Ym9vazNzLzMyL3RsYmZsdXNoLmggfCA5ICsrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaCB8IDcgKysrKysrKw0KPiAgIGFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ub2hhc2gvdGxiZmx1c2guaCAgICB8IDcgKysrKysrKw0KPiAgIGFyY2gv
cG93ZXJwYy9tbS9ub2hhc2gvdGxiLmMgICAgICAgICAgICAgICAgICB8IDggKysrKysrKysNCj4g
ICA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3RsYmZsdXNoLmggYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3RsYmZsdXNoLmgNCj4gaW5kZXggYmExNzQzYzUyYjU2
Li40YmU1NzI5MDgxMjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvMzIvdGxiZmx1c2guaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzLzMyL3RsYmZsdXNoLmgNCj4gQEAgLTIsNiArMiw4IEBADQo+ICAgI2lmbmRlZiBfQVNNX1BP
V0VSUENfQk9PSzNTXzMyX1RMQkZMVVNIX0gNCj4gICAjZGVmaW5lIF9BU01fUE9XRVJQQ19CT09L
M1NfMzJfVExCRkxVU0hfSA0KPiAgIA0KPiArI2luY2x1ZGUgPGxpbnV4L2J1aWxkX2J1Zy5oPg0K
PiArDQo+ICAgI2RlZmluZSBNTVVfTk9fQ09OVEVYVCAgICAgICgwKQ0KPiAgIC8qDQo+ICAgICog
VExCIGZsdXNoaW5nIGZvciAiY2xhc3NpYyIgaGFzaC1NTVUgMzItYml0IENQVXMsIDZ4eCwgN3h4
LCA3eHh4DQo+IEBAIC03NCw2ICs3NiwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1
c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgew0KPiAgIAlmbHVz
aF90bGJfcGFnZSh2bWEsIHZtYWRkcik7DQo+ICAgfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2VfcHNpemUoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICsJ
CQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdm1hZGRyLCBpbnQgcHNpemUpDQo+ICt7DQo+ICsJQlVJ
TERfQlVHKCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hf
dGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiAgIHsNCj4gICAJZmx1c2hfdGxiX21tKG1t
KTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxi
Zmx1c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0K
PiBpbmRleCBjNTZhMGFlZTgxMjQuLmRkMzkzMTMyNDJiNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0KPiBAQCAtODYsNiArODYsMTMg
QEAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLA0KPiAgIAkJcmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlKHZtYSwgdm1h
ZGRyKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxi
X3BhZ2VfcHNpemUoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICsJCQkJCSAgICAgIHVuc2lnbmVk
IGxvbmcgdm1hZGRyLCBpbnQgcHNpemUpDQo+ICt7DQo+ICsJaWYgKHJhZGl4X2VuYWJsZWQoKSkN
Cj4gKwkJcmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplKG1tLCB2bWFkZHIsIHBzaXpl
KTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfZmx1c2goc3RydWN0IG1t
dV9nYXRoZXIgKnRsYikNCj4gICB7DQo+ICAgCWlmIChyYWRpeF9lbmFibGVkKCkpDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3RsYmZsdXNoLmggYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3RsYmZsdXNoLmgNCj4gaW5kZXggMGNlZjVlNGY4
ZDkyLi5kOThkZTllMzg5NmYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvdGxiZmx1c2guaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9o
YXNoL3RsYmZsdXNoLmgNCj4gQEAgLTQ0LDYgKzQ0LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBs
b2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQg
bG9uDQo+ICAgCWFzbSB2b2xhdGlsZSAoInRsYmllICUwOyBzeW5jIiA6IDogInIiICh2bWFkZHIp
IDogIm1lbW9yeSIpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9m
bHVzaF90bGJfcGFnZV9wc2l6ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gKwkJCQkJICAgICAg
dW5zaWduZWQgbG9uZyB2bWFkZHIsIGludCBwc2l6ZSkNCj4gK3sNCj4gKwlhc20gdm9sYXRpbGUg
KCJ0bGJpZSAlMDsgc3luYyIgOiA6ICJyIiAodm1hZGRyKSA6ICJtZW1vcnkiKTsNCj4gK30NCj4g
Kw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiAgIHsNCj4gICAJc3RhcnQgJj0gUEFH
RV9NQVNLOw0KPiBAQCAtNTcsNiArNjMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxi
X2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZA0KPiAg
IHZvaWQgZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25l
ZCBsb25nIGVuZCk7DQo+ICAgdm9pZCBsb2NhbF9mbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVj
dCAqbW0pOw0KPiAgIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgdm1hZGRyKTsNCj4gK3ZvaWQgbG9jYWxfZmx1c2hfdGxi
X3BhZ2VfcHNpemUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdm1hZGRyLCBp
bnQgcHNpemUpOw0KPiAgIA0KPiAgIHZvaWQgX19sb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2bWFkZHIsDQo+ICAgCQkJICAgIGludCB0c2l6
ZSwgaW50IGluZCk7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoL3RsYi5j
IGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC90bGIuYw0KPiBpbmRleCAyYzE1Yzg2YzcwMTUuLmE5
MDNiMzA4YWNjNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL25vaGFzaC90bGIuYw0K
PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoL3RsYi5jDQo+IEBAIC0xODQsNiArMTg0LDE0
IEBAIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgdm1hZGRyKQ0KPiAgIAkJCSAgICAgICBtbXVfZ2V0X3RzaXplKG1tdV92
aXJ0dWFsX3BzaXplKSwgMCk7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0wobG9jYWxfZmx1c2hf
dGxiX3BhZ2UpOw0KPiArDQo+ICt2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLA0KPiArCQkJCXVuc2lnbmVkIGxvbmcgdm1hZGRyLCBpbnQgcHNpemUp
DQo+ICt7DQo+ICsJX19sb2NhbF9mbHVzaF90bGJfcGFnZShtbSwgdm1hZGRyLCBtbXVfZ2V0X3Rz
aXplKHBzaXplKSwgMCk7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGxvY2FsX2ZsdXNoX3RsYl9w
YWdlX3BzaXplKTsNCj4gKw0KPiAgICNlbmRpZg0KPiAgIA0KPiAgIC8q
