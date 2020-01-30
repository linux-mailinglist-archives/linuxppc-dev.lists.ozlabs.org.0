Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67214DC02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 14:33:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487hBq2H5czDqS7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 00:33:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.41; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=jqtVhgCK; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10041.outbound.protection.outlook.com [40.107.1.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487h3X577bzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 00:27:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbgLgHEUhNRL420Sfe5Fm4cQ1/y0f2IvQ5gyxmStkhH2sHxb0Yp+/vgTe619qgYE6PnkpS1U5cYS8a3uVnPBksmhpSHKYM/no8CVcTDsy5zcQKGP5cMl147UNPRYUZ8JzdVN8lWLTshbh0WLxJdzTGHdRkJPlx+A/SWCMcPXG7bm9knSDrsEIP/sX3YN8tptg8Ou296mx6o0AKg4VKRc8T6Go19Tk6Ay3pRw2+EjXXuHFc22ib0d06OYEqLm7ZdHpZwOCN31zwHR52M2uCCJYNAH8lPPl7sJUVeWDb7bpEy+rZrpk1hswsqXMr9dLveq7/ey5XSdG4rXpG2sDeMBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBPYUDEg/iavAjaH1nFSrUHB3rwLErtmqOpeJw+eIgY=;
 b=X3Ekle6qNCQk+ufj1DydosF1W4x0XenXA4CgbiIfwt7yJO5eNzF2qhC6rXx6KrqGS+U7g80Whlx+4w0c+8SU3KUKgUhCeY+CISibueKf0zkUHHHgjdK7Oz3a47Cwgt3Y5pMvmVK2npIvWnK46+SdgcBqjTP+mKVLqbiti0umf88govs83sqjFnZiwX7qZsLYtZNVDUqdaE9MfoeTRr57UST93QBKT6RCZtSiQXKtua/P4LS2cbepaKuey1bm+0SO9FlRSzd1GoB7bdxqbLhUtugQx5sk1CqvCQvK7q9Z6hiN7crgc/q+4434fQdHBYMC9ezwMY7UEYgTMixHkqP37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBPYUDEg/iavAjaH1nFSrUHB3rwLErtmqOpeJw+eIgY=;
 b=jqtVhgCK2//rpQw7JbFCOYc5fSliyAfFYBW1AHyok7IistSPVt3M2p9o7vPUfyxCazIKOBujnuRegXTnDLsMgDcgAjgTPbh9/MnASJg59Vwb8QSzI22TeuUGmT3+5IzmGGaSab/PyOKhmbYQ1MIENET2XPvNdB3xSCVqJf41ioM=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3456.eurprd04.prod.outlook.com (52.134.3.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Thu, 30 Jan 2020 13:27:09 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 13:27:09 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>, Andrei Botila
 <andrei.botila@nxp.com>, Stuart Yoder <stuyoder@gmail.com>, Leo Li
 <leoyang.li@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] bus: fsl-mc: add api to retrieve mc version
Thread-Topic: [PATCH] bus: fsl-mc: add api to retrieve mc version
Thread-Index: AQHV13D48TAVZl2sEk63BJbSjUOXCQ==
Date: Thu, 30 Jan 2020 13:27:09 +0000
Message-ID: <VI1PR0402MB3485DB40CE1C1631D920EE7598040@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <1580123761-19536-1-git-send-email-andrei.botila@nxp.com>
 <AM6PR04MB58788A33BCFD161773375C8DEC0B0@AM6PR04MB5878.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b22e23b-29ec-49ee-6bca-08d7a5881bb9
x-ms-traffictypediagnostic: VI1PR0402MB3456:|VI1PR0402MB3456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3456A35CEFC3A56371B732BE98040@VI1PR0402MB3456.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(55016002)(64756008)(66946007)(66446008)(2906002)(9686003)(66476007)(66556008)(316002)(54906003)(52536014)(186003)(5660300002)(26005)(6506007)(53546011)(4326008)(110136005)(7696005)(33656002)(44832011)(76116006)(91956017)(86362001)(966005)(81156014)(81166006)(8676002)(71200400001)(8936002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3456;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OuAzXg0DJCja9X6KID2Rcl6rx/U2etzyzfgtuvaeRXDDF8KbA79hA8xJJlpJi5YgpHLHA4ZsO64ou4Gsh57aZPAhHwQZSvorq5kvquxRyXjZZQqIoxFkTzBVYwrw/2ZqQmYHPq9vMrYZiNg1xzU0NX/v3d35kIWZ59KFm1OyqU62ITYyLyxlhPvbpmVTLFpnOaqD4YlivY0A2+2GFa7YOkMF4rurdPwWmYapOF8+HPJcd8dXI2LQGdK+I0aObwovSdTtTtBUnC5r0nDvnvCP8G8eSZwu3ZM3xwFIpXFWLE5gB0LBc/oqwoNBVV7L+e8kUV28FryN3yNnjYjZZHtet/nnMbxiDtlcYDBQdO/uOiHS9tmhW8fiOdd6Kv2v3yeG/AEcmDJ0ZLxdAX+zp8H9irxtzd918vHQ5MGjUYgOJX7d3S3SjUvCUGCPkO+0b2AK3LXBbqY2YM4itoQZ7n8mUppJnV4aLHKJF9XWyY5VdCfvznsNA0R/4PSiCi7BZJHERs64IQ6jFPYpR+76kz7X9A==
x-ms-exchange-antispam-messagedata: HA6ZiRpGwQ/VoMsxh/rsi0HGC+ogPkNN9y2RuiCARwnro70ITIoTv3j3++PLNfAN99Sk7yqV43e1eUsJY82dkn3w5piRYS62xbScoz/Jpa3XZ2RhEBI6m5c6s/y1Uo7fFTY/CgwOTlalAvETTA6q3A==
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b22e23b-29ec-49ee-6bca-08d7a5881bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 13:27:09.3545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIj/B9sgfpgSqchPB+THrob/zLmI1ZPXF2yU24dEync6K53oBKxx1eW60u8a17gvpDmL+xYDZV8r5TussJE+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3456
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/2020 1:49 PM, Laurentiu Tudor wrote:=0A=
> =0A=
>> -----Original Message-----=0A=
>> From: Andrei Botila <andrei.botila@nxp.com>=0A=
>> Sent: Monday, January 27, 2020 1:16 PM=0A=
>>=0A=
>> Add a new api that returns Management Complex firmware version=0A=
>> and make the required structure public. The api's first user will be=0A=
>> the caam driver for setting prediction resistance bits.=0A=
>>=0A=
>> Signed-off-by: Andrei Botila <andrei.botila@nxp.com>=0A=
> =0A=
> Acked-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
We'll need this patch in the crypto subsystem,=0A=
such that the CAAM HWRNG patch series (currently v7)=0A=
https://patchwork.kernel.org/project/linux-crypto/list/?series=3D233763&arc=
hive=3Dboth&state=3D*=0A=
is updated to work with existing (and future) FSL MC f/w versions.=0A=
=0A=
CAAM HWRNG series has been in review for quite some time=0A=
and AFAICT is in pretty good shape.=0A=
Unfortunately it missed v5.6 merge window. I would like it to go=0A=
in v5.7, but for this we'll need current patch (a dependency)=0A=
to go through (or be cherry-picked into) the crypto tree.=0A=
=0A=
>> ---=0A=
>>  drivers/bus/fsl-mc/fsl-mc-bus.c | 33 +++++++++++++++++----------------=
=0A=
>>  include/linux/fsl/mc.h          | 16 ++++++++++++++++=0A=
>>  2 files changed, 33 insertions(+), 16 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc=
-=0A=
>> bus.c=0A=
>> index a07cc19becdb..330c76181604 100644=0A=
>> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c=0A=
>> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c=0A=
>> @@ -26,6 +26,8 @@=0A=
>>   */=0A=
>>  #define FSL_MC_DEFAULT_DMA_MASK	(~0ULL)=0A=
>>=0A=
>> +static struct fsl_mc_version mc_version;=0A=
>> +=0A=
>>  /**=0A=
>>   * struct fsl_mc - Private data of a "fsl,qoriq-mc" platform device=0A=
>>   * @root_mc_bus_dev: fsl-mc device representing the root DPRC=0A=
>> @@ -54,20 +56,6 @@ struct fsl_mc_addr_translation_range {=0A=
>>  	phys_addr_t start_phys_addr;=0A=
>>  };=0A=
>>=0A=
>> -/**=0A=
>> - * struct mc_version=0A=
>> - * @major: Major version number: incremented on API compatibility chang=
es=0A=
>> - * @minor: Minor version number: incremented on API additions (that are=
=0A=
>> - *		backward compatible); reset when major version is incremented=0A=
>> - * @revision: Internal revision number: incremented on implementation=
=0A=
>> changes=0A=
>> - *		and/or bug fixes that have no impact on API=0A=
>> - */=0A=
>> -struct mc_version {=0A=
>> -	u32 major;=0A=
>> -	u32 minor;=0A=
>> -	u32 revision;=0A=
>> -};=0A=
>> -=0A=
>>  /**=0A=
>>   * fsl_mc_bus_match - device to driver matching callback=0A=
>>   * @dev: the fsl-mc device to match against=0A=
>> @@ -338,7 +326,7 @@ EXPORT_SYMBOL_GPL(fsl_mc_driver_unregister);=0A=
>>   */=0A=
>>  static int mc_get_version(struct fsl_mc_io *mc_io,=0A=
>>  			  u32 cmd_flags,=0A=
>> -			  struct mc_version *mc_ver_info)=0A=
>> +			  struct fsl_mc_version *mc_ver_info)=0A=
>>  {=0A=
>>  	struct fsl_mc_command cmd =3D { 0 };=0A=
>>  	struct dpmng_rsp_get_version *rsp_params;=0A=
>> @@ -363,6 +351,20 @@ static int mc_get_version(struct fsl_mc_io *mc_io,=
=0A=
>>  	return 0;=0A=
>>  }=0A=
>>=0A=
>> +/**=0A=
>> + * fsl_mc_get_version - function to retrieve the MC f/w version=0A=
>> information=0A=
>> + *=0A=
>> + * Return:	mc version when called after fsl-mc-bus probe; NULL otherwis=
e.=0A=
>> + */=0A=
>> +struct fsl_mc_version *fsl_mc_get_version(void)=0A=
>> +{=0A=
>> +	if (mc_version.major)=0A=
>> +		return &mc_version;=0A=
>> +=0A=
>> +	return NULL;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(fsl_mc_get_version);=0A=
>> +=0A=
>>  /**=0A=
>>   * fsl_mc_get_root_dprc - function to traverse to the root dprc=0A=
>>   */=0A=
>> @@ -862,7 +864,6 @@ static int fsl_mc_bus_probe(struct platform_device=
=0A=
>> *pdev)=0A=
>>  	int container_id;=0A=
>>  	phys_addr_t mc_portal_phys_addr;=0A=
>>  	u32 mc_portal_size;=0A=
>> -	struct mc_version mc_version;=0A=
>>  	struct resource res;=0A=
>>=0A=
>>  	mc =3D devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);=0A=
>> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h=0A=
>> index 54d9436600c7..2b5f8366dbe1 100644=0A=
>> --- a/include/linux/fsl/mc.h=0A=
>> +++ b/include/linux/fsl/mc.h=0A=
>> @@ -381,6 +381,22 @@ int __must_check __fsl_mc_driver_register(struct=0A=
>> fsl_mc_driver *fsl_mc_driver,=0A=
>>=0A=
>>  void fsl_mc_driver_unregister(struct fsl_mc_driver *driver);=0A=
>>=0A=
>> +/**=0A=
>> + * struct fsl_mc_version=0A=
>> + * @major: Major version number: incremented on API compatibility chang=
es=0A=
>> + * @minor: Minor version number: incremented on API additions (that are=
=0A=
>> + *		backward compatible); reset when major version is incremented=0A=
>> + * @revision: Internal revision number: incremented on implementation=
=0A=
>> changes=0A=
>> + *		and/or bug fixes that have no impact on API=0A=
>> + */=0A=
>> +struct fsl_mc_version {=0A=
>> +	u32 major;=0A=
>> +	u32 minor;=0A=
>> +	u32 revision;=0A=
>> +};=0A=
>> +=0A=
>> +struct fsl_mc_version *fsl_mc_get_version(void);=0A=
>> +=0A=
>>  int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,=
=0A=
>>  					u16 mc_io_flags,=0A=
>>  					struct fsl_mc_io **new_mc_io);=0A=
>> --=0A=
>> 2.17.1=0A=
> =0A=
> =0A=
> _______________________________________________=0A=
> linux-arm-kernel mailing list=0A=
> linux-arm-kernel@lists.infradead.org=0A=
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel=0A=
> =0A=
