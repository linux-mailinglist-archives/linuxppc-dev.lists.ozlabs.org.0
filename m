Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFED42863
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:07:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P7wZ6Yv4zDr2y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 00:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.53; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="B5BkLt/H"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P7mC2QHTzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 23:59:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL5YOX49NOqB4boHyj+PKa2f+fkPMHlbFJBR2N04Juw=;
 b=B5BkLt/H78P+u/kf41k4gCeNIPeJf2pbaAmAnOUzE59JDsp+4wkXcSuITOb8XuW93j0/1u6DMMEoaEGjklIBQR+obmcN3Xl1v8B9LOX7iHxvU6tJVKbmaPdiW7Or7xvhh7eru+O3QV4XAFqwJaK8LX8z+ZheTuRxOFxVLnWvdlw=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB2910.eurprd04.prod.outlook.com (10.175.23.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 13:59:44 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 13:59:44 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 0/4] Additional fixes on Talitos driver
Thread-Topic: [PATCH v2 0/4] Additional fixes on Talitos driver
Thread-Index: AQHVIGOH8ah5xSLD4UOplfJkXECTiA==
Date: Wed, 12 Jun 2019 13:59:44 +0000
Message-ID: <VI1PR0402MB348583D36921F9DEC4E0DA2698EC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34853CAF031426F4183FE29B98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <0cb7c534-6e48-5284-899c-c0ef85c3c126@c-s.fr>
 <VI1PR0402MB3485AD965F36709F27EFB72698ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <58787543-76d3-e0db-9517-ccd0f6494d85@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cbd460c-601b-4372-a7da-08d6ef3e3932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB2910; 
x-ms-traffictypediagnostic: VI1PR0402MB2910:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <VI1PR0402MB2910B74A57FEAADC494D4E0C98EC0@VI1PR0402MB2910.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(39860400002)(136003)(396003)(199004)(189003)(14454004)(26005)(110136005)(52536014)(7696005)(73956011)(66066001)(86362001)(229853002)(2906002)(186003)(53936002)(6246003)(54906003)(66556008)(44832011)(99286004)(76116006)(446003)(76176011)(476003)(68736007)(53546011)(8936002)(66476007)(66946007)(486006)(7736002)(66446008)(305945005)(102836004)(6506007)(66574012)(256004)(55016002)(14444005)(25786009)(74316002)(966005)(5660300002)(71200400001)(9686003)(81156014)(71190400001)(6116002)(478600001)(6436002)(6306002)(8676002)(81166006)(64756008)(316002)(3846002)(4326008)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2910;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r2q995+14KFssPWnwPBLGAsNTQtHOKqjEa8PS6yxxfxl3Y1TeL73R1C/ksb1Go07rg7xMkDbFAduC38c0f6D2Lzi2rn4Ch1Rrtx4qsUmiCag7ikwtqaoY/6d1GaqegzIgWQiDoKWOKgo8bzG8pLClXTZbhsSyVJF2GGxj0IDc05xa1JDRJowrcwwHaE6wAz7ESIZldIMWew2hy0Io4okmQPVpnCn8XdER2aAD5+XIpppLURbkgrDoRjWwZI1KPFmtKYFKmtVqv+EjG6cgPAkLh8HwUWoObbJqRzOikRVtZxVS4P+4V7Bez2VC6UbcSi2YfxHtqZ3HGTb477oH03dqIVh+XGd1/p1ZP5147KxruX+8Xn9b/l8C/1992jePPmYJqTaUPxDoLgGu1uBr0+t4QRb2RdtMR2WL1HSu7aS1D8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbd460c-601b-4372-a7da-08d6ef3e3932
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 13:59:44.4326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/12/2019 8:52 AM, Christophe Leroy wrote:=0A=
> =0A=
> =0A=
> Le 11/06/2019 =E0 18:30, Horia Geanta a =E9crit=A0:=0A=
>> On 6/11/2019 6:40 PM, Christophe Leroy wrote:=0A=
>>>=0A=
>>>=0A=
>>> Le 11/06/2019 =E0 17:37, Horia Geanta a =E9crit=A0:=0A=
>>>> On 6/11/2019 5:39 PM, Christophe Leroy wrote:=0A=
>>>>> This series is the last set of fixes for the Talitos driver.=0A=
>>>>>=0A=
>>>>> We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and=0A=
>>>>> SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:=0A=
>>>>>=0A=
>>>> I am getting below failures on a sec 3.3.2 (p1020rdb) for hmac(sha384)=
 and=0A=
>>>> hmac(sha512):=0A=
>>>=0A=
>>> Is that new with this series or did you already have it before ?=0A=
>>>=0A=
>> Looks like this happens with or without this series.=0A=
> =0A=
> Found the issue, that's in =0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Db8fbdc2bc4e71b62646031d5df5f08aafe15d5ad=0A=
> =0A=
> CONFIG_CRYPTO_DEV_TALITOS_SEC2 should be CONFIG_CRYPTO_DEV_TALITOS2 inste=
ad.=0A=
> =0A=
> Just sent a patch to fix it.=0A=
> =0A=
Thanks, I've tested it and the hmac failures go away.=0A=
=0A=
However, testing gets stuck.=0A=
Seems there is another issue lurking in the driver.=0A=
=0A=
Used cryptodev-2.6/master with the following on top:=0A=
crypto: testmgr - add some more preemption points=0A=
	https://patchwork.kernel.org/patch/10972337/=0A=
crypto: talitos - fix max key size for sha384 and sha512=0A=
	https://patchwork.kernel.org/patch/10988473/=0A=
=0A=
[...]=0A=
alg: skcipher: skipping comparison tests for ecb-3des-talitos because ecb(d=
es3_ede-generic) is unavailable=0A=
INFO: task cryptomgr_test:314 blocked for more than 120 seconds.=0A=
      Not tainted 5.2.0-rc1-g905bfd415e8a #1=0A=
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.=
=0A=
cryptomgr_test  D    0   314      2 0x00000800=0A=
Call Trace:=0A=
[e78337e0] [00000004] 0x4 (unreliable)=0A=
[e78338a8] [c08a6e5c] __schedule+0x20c/0x4d4=0A=
[e78338f8] [c08a7158] schedule+0x34/0xc8=0A=
[e7833908] [c08aa5ec] schedule_timeout+0x1d4/0x350=0A=
[e7833958] [c08a7be4] wait_for_common+0xa0/0x164=0A=
[e7833998] [c03a7b14] do_ahash_op+0xa4/0xc4=0A=
[e78339b8] [c03aba00] test_ahash_vec_cfg+0x188/0x5e4=0A=
[e7833aa8] [c03ac1c8] test_hash_vs_generic_impl+0x1b0/0x2b4=0A=
[e7833de8] [c03ac498] __alg_test_hash+0x1cc/0x2d0=0A=
[e7833e28] [c03a9fb4] alg_test.part.37+0x8c/0x3ac=0A=
[e7833ef8] [c03a54d0] cryptomgr_test+0x4c/0x54=0A=
[e7833f08] [c006c410] kthread+0xf8/0x124=0A=
[e7833f38] [c001227c] ret_from_kernel_thread+0x14/0x1c=0A=
=0A=
addr2line on c03aba00 points to crypto/testmgr.c:1335=0A=
=0A=
   1327)  if (cfg->finalization_type =3D=3D FINALIZATION_TYPE_DIGEST ||=0A=
   1328)      vec->digest_error) {=0A=
   1329)          /* Just using digest() */=0A=
   1330)          ahash_request_set_callback(req, req_flags, crypto_req_don=
e,=0A=
   1331)                                     &wait);=0A=
   1332)          ahash_request_set_crypt(req, tsgl->sgl, result, vec->psiz=
e);=0A=
   1333)          err =3D do_ahash_op(crypto_ahash_digest, req, &wait, cfg-=
>nosimd);=0A=
   1334)          if (err) {=0A=
-> 1335)                  if (err =3D=3D vec->digest_error)=0A=
   1336)                          return 0;=0A=
   1337)                  pr_err("alg: ahash: %s digest() failed on test ve=
ctor %s; expected_error=3D%d, actual_error=3D%d, cfg=3D\"%s\"\n",=0A=
   1338)                         driver, vec_name, vec->digest_error, err,=
=0A=
   1339)                         cfg->name);=0A=
   1340)                  return err;=0A=
   1341)          }=0A=
   1342)          if (vec->digest_error) {=0A=
   1343)                  pr_err("alg: ahash: %s digest() unexpectedly succ=
eeded on test vector %s; expected_error=3D%d, cfg=3D\"%s\"\n",=0A=
   1344)                         driver, vec_name, vec->digest_error, cfg->=
name);=0A=
   1345)                  return -EINVAL;=0A=
   1346)          }=0A=
   1347)          goto result_ready;=0A=
   1348)  }=0A=
=0A=
Seems that for some reason driver does not receive the interrupt from HW,=
=0A=
thus completion callback does not run.=0A=
=0A=
Tried with or without current patch series, no change in behaviour.=0A=
=0A=
If you cannot reproduce and don't have any idea, I'll try the hard way=0A=
(git bisect).=0A=
=0A=
Thanks,=0A=
Horia=0A=
